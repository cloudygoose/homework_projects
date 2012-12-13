package nachos.vm;

import java.io.EOFException;

import nachos.machine.*;
import java.util.*;
import nachos.machine.Coff;
import nachos.machine.CoffSection;
import nachos.machine.Lib;
import nachos.machine.Machine;
import nachos.machine.OpenFile;
import nachos.machine.Processor;
import nachos.machine.TranslationEntry;
import nachos.threads.Lock;
import nachos.threads.ThreadedKernel;
import nachos.userprog.UThread;
import nachos.userprog.UserKernel;
import nachos.userprog.UserProcess;

/**
 * A <tt>UserProcess</tt> that supports demand-paging.
 */
public class VMProcess extends UserProcess {
	/**
	 * Allocate a new process.
	 */
	public VMProcess() {
		super();
		TLBsave = new TranslationEntry[Machine.processor().getTLBSize()];
		lazyLoadingS = new HashMap<Integer, Integer>();
		lazyLoadingI = new HashMap<Integer, Integer>();
	}
	public static VMProcess newVMProcess() {
		return (VMProcess) Lib.constructObject(Machine.getProcessClassName());
	}
	public boolean execute(String name, String[] args) {
		if (!load(name, args))
			return false;

		UThread uthread = (UThread) new UThread(this).setName(name);
		uthread.fork();
		pidMap.put(new Integer(pid), uthread);
		
		return true;	
	}
	/**
	 * Save the state of this process in preparation for a context switch.
	 * Called by <tt>UThread.saveState()</tt>.
	 */
	public void saveState() {
		boolean status = Machine.interrupt().disable();
		VMKernel.setDirtyFromTLB();
//		super.saveState();
		for (int i = 0;i < Machine.processor().getTLBSize();i++) {
			TLBsave[i] = Machine.processor().readTLBEntry(i);
			Machine.processor().writeTLBEntry(i, new TranslationEntry());
		}
		Machine.interrupt().restore(status);
	}

	private boolean load(String name, String[] args) {
		boolean status = Machine.interrupt().disable();
		swapFileLock.acquire();
		Lib.debug(dbgProcess, "UserProcess.load(\"" + name + "\")");
		OpenFile executable = ThreadedKernel.fileSystem.open(name, false);
		if (executable == null) {
			Lib.debug(dbgProcess, "\topen failed");
			return false;
		}

		try {
			coff = new Coff(executable);
		} catch (EOFException e) {
			executable.close();
			Lib.debug(dbgProcess, "\tcoff load failed");
			return false;
		}

		// make sure the sections are contiguous and start at page 0
		numPages = 0;
		for (int s = 0; s < coff.getNumSections(); s++) {
			CoffSection section = coff.getSection(s);
			Integer readOnly;
			if (section.isReadOnly()) readOnly = 1; else readOnly = 0;
			if (section.getFirstVPN() != numPages) {
				coff.close();
				Lib.debug(dbgProcess, "\tfragmented executable");
				return false;
			}
			for (int i = 0;i < section.getLength();i++)
				readOnlys.add(readOnly);
			numPages += section.getLength();
		}

		// make sure the argv array will fit in one page
		byte[][] argv = new byte[args.length][];
//		Lib.hdebug("argv : " + argv.length);
		int argsSize = 0;
		for (int i = 0; i < args.length; i++) {
			argv[i] = args[i].getBytes();
			// 4 bytes for argv[] pointer; then string plus one for null byte
			argsSize += 4 + argv[i].length + 1;
		}
		if (argsSize > pageSize) {
			coff.close();
			Lib.debug(dbgProcess, "\targuments too long");
			return false;
		}

		// program counter initially points at the program entry point
		initialPC = coff.getEntryPoint();

		// next comes the stack; stack pointer initially points to top of it
		numPages += stackPages;
		for (int i = 0;i < stackPages;i++)
			readOnlys.add(new Integer(0));
		initialSP = numPages * pageSize;

		// and finally reserve 1 page for arguments
		numPages++;
		readOnlys.add(new Integer(0));
		//call virtual memory
		
		pages = VMKernel.getPages(numPages);
		
		//setup the pageTable
		pageTable = new TranslationEntry[numPages];
		for (int i = 0; i < numPages; i++) {
			boolean readOnly = true;
			Lib.assertTrue(!readOnlys.isEmpty());
			if (readOnlys.remove(0).equals(new Integer(0)))
				readOnly = false;
			pageTable[i] = new TranslationEntry(i, pages.get(i), true, readOnly, false, false);
		}
		
		if (!loadSections())
			return false;

		// store arguments in last page
		int entryOffset = (numPages - 1) * pageSize;
	    acquireVp(pages.get(numPages - 1));
		int stringOffset = entryOffset + args.length * 4;

		this.argc = args.length;
		this.argv = entryOffset;
//		Lib.hdebug("argv : " + argv.length);
		swapFileLock.release();
		for (int i = 0; i < argv.length; i++) {
			byte[] stringOffsetBytes = Lib.bytesFromInt(stringOffset);
			Lib.assertTrue(writeVirtualMemory(entryOffset, stringOffsetBytes) == 4);
			entryOffset += 4;
			Lib.assertTrue(writeVirtualMemory(stringOffset, argv[i]) == argv[i].length);
			stringOffset += argv[i].length;
			Lib.assertTrue(writeVirtualMemory(stringOffset, new byte[] { 0 }) == 1);
			stringOffset += 1;
		}
		Machine.interrupt().restore(status);
		return true;
	}


	/*
	 * swap the vp into memory is necessory
	 */
	public void tryToRead(int a, byte[] b, int c, int d) {
		VMKernel.swapFile.read(a, b, c, d);
	}
	public void acquireVp(Integer vp) {
		Lib.assertTrue(Machine.interrupt().disabled());
		Integer lazyIndexS = lazyLoadingS.get(vp);
		Integer lazyIndexI = lazyLoadingI.get(vp);
		if (isVPInMemory(vp)) {
			if (lazyIndexS != null) {
				CoffSection section = coff.getSection(lazyIndexS.intValue());
				section.loadPage(lazyIndexI.intValue(), VMKernel.coreMap.get(vp));
				VMKernel.isDirty[VMKernel.coreMap.get(vp)] = true;
				lazyLoadingS.remove(vp);
			}
			return;
		}
		VMKernel.setDirtyFromTLB();
		byte[] memory = Machine.processor().getMemory();
		Integer victim = VMKernel.VPsInMem.removeFirst();
		VMKernel.VPsInMem.add(vp);
		byte[] newP = new byte[Processor.pageSize];
		//Lib.assertTrue(VMKernel.swapFile.read(getCorePos(vp), newP, 0, Processor.pageSize) == Processor.pageSize);
		if (lazyIndexS == null)
			VMKernel.swapFile.read(getCorePos(vp), newP, 0, Processor.pageSize);
		VMKernel.pageChangNum++;
		//swap the core map
		Integer vpp = VMKernel.coreMap.get(vp);
		Integer vicp = VMKernel.coreMap.get(victim);
		//invalidate the victim
		for (int i = 0;i < Machine.processor().getTLBSize();i++) {
			TranslationEntry entry = Machine.processor().readTLBEntry(i);
			if (entry.ppn == vicp) 
				Machine.processor().writeTLBEntry(i, new TranslationEntry());
		}
		VMKernel.coreMap.put(vp, vicp);
/*
		Integer newVic;
		if (VMKernel.availSwap.isEmpty())
			newVic = null;
		else
			newVic = VMKernel.availSwap.remove(0);
		if (newVic == null) newVic = new Integer(++VMKernel.swapCount);
*/		
		VMKernel.coreMap.put(victim, victim);
		//swap the pages physically
		if (VMKernel.isDirty[vicp]) {
			Lib.assertTrue(VMKernel.swapFile.write(getCorePos(victim), memory, vicp * Processor.pageSize, Processor.pageSize) == Processor.pageSize);
			VMKernel.pageChangNum++;
			VMKernel.isDirty[vicp] = false;
		}
		if (lazyIndexS != null)
		{
			CoffSection section = coff.getSection(lazyIndexS.intValue());
			section.loadPage(lazyIndexI.intValue(), VMKernel.coreMap.get(vp));
			VMKernel.isDirty[VMKernel.coreMap.get(vp)] = true;
			lazyLoadingS.remove(vp);
		} else
			System.arraycopy(newP, 0, memory, getCorePos(vp), Processor.pageSize);
		VMKernel.pageChangNum++;
	}

	/**
	 * Restore the state of this process after a context switch. Called by
	 * <tt>UThread.restoreState()</tt>.
	 */
	public void restoreState() {
		boolean status = Machine.interrupt().disable();
//		super.restoreState();
		for (int i = 0;i < Machine.processor().getTLBSize();i++) {
			if (TLBsave[i] == null)
				Machine.processor().writeTLBEntry(i, new TranslationEntry());
			else
			{
				if (pages.size() > 0) { 
					int vp = pages.get(TLBsave[i].vpn);
					if (VMKernel.VPsInMem.contains(new Integer(vp))) 
						TLBsave[i].ppn = VMKernel.coreMap.get(vp); 
					else TLBsave[i] = new TranslationEntry();
				} else TLBsave[i] = new TranslationEntry();
				Machine.processor().writeTLBEntry(i, TLBsave[i]);
			}
		}
		Machine.interrupt().restore(status);
	}

	/**
	 * Release any resources allocated by <tt>loadSections()</tt>.
	 */
	protected void unloadSections() {
		super.unloadSections();
	}

	protected void putTLBEntry(int addr) {
		swapFileLock.acquire();
		int vp = pages.get(Processor.pageFromAddress(addr));
		acquireVp(vp);
		TranslationEntry newEntry = pageTable[Processor.pageFromAddress(addr)];
//		Lib.hdebug("addr : " + addr + " index : " + Processor.pageFromAddress(addr));
		newEntry.ppn = VMKernel.coreMap.get(vp);
		int TLBsize = Machine.processor().getTLBSize();
//		int victim = Lib.random(TLBsize);
//		Lib.hdebug("current thread : " + UserKernel.currentProcess().getPid() + " victim : " + victim);
		TranslationEntry entry = Machine.processor().readTLBEntry(kk % TLBsize);
		if (entry.dirty)
			VMKernel.isDirty[entry.ppn] = true;
		Machine.processor().writeTLBEntry((kk++) % TLBsize, newEntry);
		swapFileLock.release();
	}
	/**
	 * Handle a user exception. Called by <tt>UserKernel.exceptionHandler()</tt>
	 * . The <i>cause</i> argument identifies which exception occurred; see the
	 * <tt>Processor.exceptionZZZ</tt> constants.
	 * 
	 * @param cause
	 *            the user exception that occurred.
	 */
	public void handleException(int cause) {
		Processor processor = Machine.processor();
		boolean status = Machine.interrupt().disable();
		switch (cause) {
		case Processor.exceptionTLBMiss:
			putTLBEntry(Machine.processor().readRegister(Processor.regBadVAddr));
			//Lib.hdebug(Machine.processor().readRegister(Processor.regBadVAddr) + "  TLB mis!!" + "pageTableSize : " + pageTable.length);
			break;
		default:
			super.handleException(cause);
			break;
		}
		Machine.interrupt().restore(status);
	}

	public boolean isVPInMemory(Integer vp) {
		//return VMKernel.coreMap.get(vp) < VMKernel.getPhyMemNumber();
		//boolean kk = VMKernel.coreMap.get(vp) < VMKernel.getPhyMemNumber();
		//Lib.hdebug("core : " + VMKernel.coreMap.get(vp) + " " + vp + " !! " + kk + " vs " + VMKernel.VPsInMem.contains(vp));
		return VMKernel.VPsInMem.contains(vp);
		//return kk;
	}

	public int getCorePos(Integer vp) {
		return VMKernel.coreMap.get(vp) * Processor.pageSize;
	}
	
	protected boolean loadSections() {
		// load sections
		for (int s = 0; s < coff.getNumSections(); s++) {
			CoffSection section = coff.getSection(s);

			Lib.debug(dbgProcess, "\tinitializing " + section.getName()
					+ " section (" + section.getLength() + " pages)");

			for (int i = 0; i < section.getLength(); i++) {
				int vpn = section.getFirstVPN() + i;
				
				lazyLoadingI.put(pages.get(vpn), new Integer(i));
				lazyLoadingS.put(pages.get(vpn), new Integer(s));
				//acquireVp(pages.get(vpn));
				//VMKernel.isDirty[VMKernel.coreMap.get(pages.get(vpn))] = true;
				//section.loadPage(i, VMKernel.coreMap.get(pages.get(vpn)));
			}
		}

		return true;
	}
	private HashMap<Integer, Integer> lazyLoadingS;
	private HashMap<Integer, Integer> lazyLoadingI;
	private TranslationEntry TLBsave[];
	private static final int pageSize = Processor.pageSize;
	private static final char dbgProcess = 'a';
	private static final char dbgVM = 'v';
	private static int kk = 0;
}
