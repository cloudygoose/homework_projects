package nachos.userprog;

import nachos.machine.*;
import nachos.threads.*;

import java.util.*;
import nachos.vm.*;
import java.io.EOFException;

/**
 * Encapsulates the state of a user process that is not contained in its user
 * thread (or threads). This includes its address translation state, a file
 * table, and information about the program being executed.
 * 
 * <p>
 * This class is extended by other classes to support additional functionality
 * (such as additional syscalls).
 * 
 * @see nachos.vm.VMProcess
 * @see nachos.network.NetProcess
 */
public class UserProcess {
	/**
	 * Allocate a new process.
	 */
	public UserProcess() {
		exitNormal = true;
		existing++;
		pid = nextPid++;
		hasExited = false;
		exitStatus = -1;
		openedMy = new HashSet<Integer>();
		readOnlys = new Vector<Integer>();
		childPids = new HashSet<Integer>();
		fatherPid = -1;
/*
 * 		moved to load()
		pageTable = new TranslationEntry[numPhysPages];
		for (int i = 0; i < numPhysPages; i++)
			pageTable[i] = new TranslationEntry(i, i, true, false, false, false);
*/
	}

	/**
	 * Allocate and return a new process of the correct class. The class name is
	 * specified by the <tt>nachos.conf</tt> key
	 * <tt>Kernel.processClassName</tt>.
	 * 
	 * @return a new process of the correct class.
	 */
	public static UserProcess newUserProcess() {
		return (UserProcess) Lib.constructObject(Machine.getProcessClassName());
	}

	/**
	 * Execute the specified program with the specified arguments. Attempts to
	 * load the program, and then forks a thread to run it.
	 * 
	 * @param name
	 *            the name of the file containin)g the executable.
	 * @param args
	 *            the arguments to pass to the executable.
	 * @return <tt>true</tt> if the program was successfully executed.
	 */
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
	}

	/**
	 * Restore the state of this process after a context switch. Called by
	 * <tt>UThread.restoreState()</tt>.
	 */
	public void restoreState() {
		Machine.processor().setPageTable(pageTable);
	}

	/**
	 * Read a null-terminated string from this process's virtual memory. Read at
	 * most <tt>maxLength + 1</tt> bytes from the specified address, search for
	 * the null terminator, and convert it to a <tt>java.lang.String</tt>,
	 * without including the null terminator. If no null terminator is found,
	 * returns <tt>null</tt>.
	 * 
	 * @param vaddr
	 *            the starting virtual address of the null-terminated string.
	 * @param maxLength
	 *            the maximum number of characters in the string, not including
	 *            the null terminator.
	 * @return the string read, or <tt>null</tt> if no null terminator was
	 *         found.
	 */
	public String readVirtualMemoryString(int vaddr, int maxLength) {
		Lib.assertTrue(maxLength >= 0);

		byte[] bytes = new byte[maxLength + 1];

		int bytesRead = readVirtualMemory(vaddr, bytes);

		for (int length = 0; length < bytesRead; length++) {
			if (bytes[length] == 0)
				return new String(bytes, 0, length);
		}

		return null;
	}

	/**
	 * Transfer data from this process's virtual memory to all of the specified
	 * array. Same as <tt>readVirtualMemory(vaddr, data, 0, data.length)</tt>.
	 * 
	 * @param vaddr
	 *            the first byte of virtual memory to read.
	 * @param data
	 *            the array where the data will be stored.
	 * @return the number of bytes successfully transferred.
	 */
	public int readVirtualMemory(int vaddr, byte[] data) {
		return readVirtualMemory(vaddr, data, 0, data.length);
	}

	/**
	 * Transfer data from this process's virtual memory to the specified array.
	 * This method handles address translation details. This method must
	 * <i>not</i> destroy the current process if an error occurs, but instead
	 * should return the number of bytes successfully copied (or zero if no data
	 * could be copied).
	 * 
	 * @param vaddr
	 *            the first byte of virtual memory to read.
	 * @param data
	 *            the array where the data will be stored.
	 * @param offset
	 *            the first byte to write in the array.
	 * @param length
	 *            the number of bytes to transfer from virtual memory to the
	 *            array.
	 * @return the number of bytes successfully transferred.
	 */
	public int readVirtualMemory(int vaddr, byte[] data, int offset, int length) {
		swapFileLock.acquire();
		Lib.assertTrue(offset >= 0 && length >= 0
				&& offset + length <= data.length);
		byte[] memory = Machine.processor().getMemory();
		/*
		// for now, just assume that virtual addresses equal physical addresses
		if (vaddr < 0 || vaddr >= memory.length)
			return 0;

		int amount = Math.min(length, memory.length - vaddr);
		//Lib.hdebug("vaddr " + vaddr + " offset : " + offset + " ammount : " + amount);
		System.arraycopy(memory, vaddr, data, offset, amount);
		*/
		
		
		int amount = 0;
		if (vaddr < 0 || vaddr >= (pages.size() * Processor.pageSize))
			return 0;
		for (int i = 0;i < pages.size();i++) {
			if (Processor.pageSize <= vaddr) {
				vaddr -= Processor.pageSize;
				continue;
			}
			if (Machine.processor().hasTLB()) {
				VMProcess kk = (VMProcess)this;
				kk.acquireVp(pages.get(i));
			}
			int wantToRead = Math.min(length, Processor.pageSize - vaddr);
//			Lib.hdebug("pageSize : " + Processor.pageSize + " i : "  + i + " p : " + pages.get(i)  + " :: " + pages.get(i) * Processor.pageSize + "start");
			System.arraycopy(memory, UserKernel.coreMap.get(pages.get(i)) * Processor.pageSize + vaddr, data, offset + amount, wantToRead);
			vaddr = 0;
			length -= wantToRead;
			amount += wantToRead;
			if (length == 0) break;
		}
		swapFileLock.release();
		return amount;
	}

	/**
	 * Transfer all data from the specified array to this process's virtual
	 * memory. Same as <tt>writeVirtualMemory(vaddr, data, 0, data.length)</tt>.
	 * 
	 * @param vaddr
	 *            the first byte of virtual memory to write.
	 * @param data
	 *            the array containing the data to transfer.
	 * @return the number of bytes successfully transferred.
	 */
	public int writeVirtualMemory(int vaddr, byte[] data) {
		return writeVirtualMemory(vaddr, data, 0, data.length);
	}

	/**
	 * Transfer data from the specified array to this process's virtual memory.
	 * This method handles address translation details. This method must
	 * <i>not</i> destroy the current process if an error occurs, but instead
	 * should return the number of bytes successfully copied (or zero if no data
	 * could be copied).
	 * 
	 * @param vaddr
	 *            the first byte of virtual memory to write.
	 * @param data
	 *            the array containing the data to transfer.
	 * @param offset
	 *            the first byte to transfer from the array.
	 * @param length
	 *            the number of bytes to transfer from the array to virtual
	 *            memory.
	 * @return the number of bytes successfully transferred.
	 */
	public int writeVirtualMemory(int vaddr, byte[] data, int offset, int length) {
		Lib.assertTrue(offset >= 0 && length >= 0
				&& offset + length <= data.length);
		swapFileLock.acquire();
		byte[] memory = Machine.processor().getMemory();
/*
		// for now, just assume that virtual addresses equal physical addresses
		if (vaddr < 0 || vaddr >= memory.length)
			return 0;

		int amount = Math.min(length, memory.length - vaddr);
		System.arraycopy(data, offset, memory, vaddr, amount);

		return amount;
*/		
		int amount = 0;
//		Lib.hdebug(pages.size() + "pagesize");
		if (vaddr < 0 || vaddr >= (pages.size() * Processor.pageSize))
			return 0;
		for (int i = 0;i < pages.size();i++) {
			if (Processor.pageSize <= vaddr) {
				vaddr -= Processor.pageSize;
				continue;
			}
			if (Machine.processor().hasTLB()) {
				VMProcess kk = (VMProcess)this;
				kk.acquireVp(pages.get(i));
			}
			int wantToWrite = Math.min(length, Processor.pageSize - vaddr);
			UserKernel.isDirty[UserKernel.coreMap.get(pages.get(i))] = true;
			System.arraycopy(data, offset, memory, UserKernel.coreMap.get(pages.get(i)) * Processor.pageSize + vaddr, wantToWrite);
			vaddr = 0;
			length -= wantToWrite;
			offset += wantToWrite;
			amount += wantToWrite;
			if (length == 0) break;
		}
		swapFileLock.release();
		return amount;
	}

	/**
	 * Load the executable with the specified name into this process, and
	 * prepare to pass it the specified arguments. Opens the executable, reads
	 * its header information, and copies sections and arguments into this
	 * process's virtual memory.
	 * 
	 * @param name
	 *            the name of the file containing the executable.
	 * @param args
	 *            the arguments to pass to the executable.
	 * @return <tt>true</tt> if the executable was successfully loaded.
	 */
	private boolean load(String name, String[] args) {
		boolean status = Machine.interrupt().disable();
		Lib.debug(dbgProcess, "UserProcess.load(\"" + name + "\")");
		//Lib.hdebug("numPages : " + numPages);
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
		pages = UserKernel.getPages(numPages);

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
		int stringOffset = entryOffset + args.length * 4;

		this.argc = args.length;
		this.argv = entryOffset;
//		Lib.hdebug("argv : " + argv.length);

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

	/**
	 * Allocates memory for this process, and loads the COFF sections into
	 * memory. If this returns successfully, the process will definitely be run
	 * (this is the last step in process initialization that can fail).
	 * 
	 * @return <tt>true</tt> if the sections were successfully loaded.
	 */
	protected boolean loadSections() {
		if (numPages > Machine.processor().getNumPhysPages()) {
			coff.close();
			Lib.debug(dbgProcess, "\tinsufficient physical memory");
			return false;
		}

		// load sections
		for (int s = 0; s < coff.getNumSections(); s++) {
			CoffSection section = coff.getSection(s);

			Lib.debug(dbgProcess, "\tinitializing " + section.getName()
					+ " section (" + section.getLength() + " pages)");

			for (int i = 0; i < section.getLength(); i++) {
				int vpn = section.getFirstVPN() + i;

				// for now, just assume virtual addresses=physical addresses
				// changed
				section.loadPage(i, pages.get(vpn));
			}
		}

		return true;
	}

	/**
	 * Release any resources allocated by <tt>loadSections()</tt>.
	 */
	protected void unloadSections() {
		UserKernel.returnPages(pages);
	}

	/**
	 * Initialize the processor's registers in preparation for running the
	 * program loaded into this process. Set the PC register to point at the
	 * start function, set the stack pointer register to point at the top of the
	 * stack, set the A0 and A1 registers to argc and argv, respectively, and
	 * initialize all other registers to 0.
	 */
	public void initRegisters() {
		Processor processor = Machine.processor();

		// by default, everything's 0
		for (int i = 0; i < Processor.numUserRegisters; i++)
			processor.writeRegister(i, 0);

		// initialize PC and SP according
		processor.writeRegister(Processor.regPC, initialPC);
		processor.writeRegister(Processor.regSP, initialSP);

		// initialize the first two argument registers to argc and argv
		processor.writeRegister(Processor.regA0, argc);
		processor.writeRegister(Processor.regA1, argv);
	}

	/**
	 * Handle the halt() system call.
	 */
	private int handleHalt() {
		if (pid != mainPid) return -1;
		Machine.halt();

		Lib.assertNotReached("Machine.halt() did not halt machine!");
		return 0;
	}

	private int handleWrite(int fd, int buffer, int size) {
		if (fd == 0) {
			return -1;
		}
		OpenFile file = null;
		if (fd == 1) {
			file = UserKernel.console.openForWriting();
		} else {
			file = openFiles.get(new Integer(fd));
			if (file == null) return -1;
		}
		byte[] readB = new byte[size];
		readVirtualMemory(buffer, readB, 0, size);
		int succ = file.write(readB, 0, size);
		if (succ == -1) return -1;
		if (fd == 1)
			file.close();
		return succ;
	}
	
	private int handleRead(int fd, int buffer, int count) {
		OpenFile file;
		if (fd == 1)
			return -1;
		if (fd == 0)
			file = UserKernel.console.openForReading();
		else
			file = openFiles.get(new Integer(fd));
		//Lib.hdebug("fd : " + fd + " buffer : " + buffer + " count : " + count);
		if (file == null) return -1;
		byte[] buf = new byte[count];
		int has = file.read(buf, 0, count);
		if (has == -1) return -1;
		int has2 = writeVirtualMemory(buffer, buf, 0, has);
		if (has2 != has) return -1;
		if (fd == 0)
			file.close();
		return has;
	}
	
	private int handleExit(int status) {
		unloadSections();
		Iterator<Integer> iter = openedMy.iterator();
		while (iter.hasNext())
			openFiles.get(iter.next()).close();
		hasExited = true;
		exitStatus = status;
		iter = childPids.iterator();
		while (iter.hasNext()) {
			pidMap.get(iter.next()).process.removeFatherPid();
		}
		coff.close();
		if (--existing == 0) {
			UserKernel.kernel.terminate();
		}
		UThread.finish();
		return status;
	}

	private Integer getNewFd() {
		Integer fd = 2;
		while (openFiles.get(fd) != null) fd++;
		return fd;
	}
	
	private int handleOpen(int name) {
		boolean status = Machine.interrupt().disable();
		String fileName = readVirtualMemoryString(name, 300);		
		if (fileName == null) return -1;
		OpenFile file = ThreadedKernel.fileSystem.open(fileName, false);
		if (file == null) return -1;
		Integer fd = getNewFd();
		openFiles.put(fd, file);
		openedMy.add(fd);
		Machine.interrupt().restore(status);
		return fd;
	}
	
	private int handleClose(int fd) {
		boolean status = Machine.interrupt().disable();
		OpenFile file = openFiles.get(new Integer(fd));
		if (file == null) return -1;
		file.close();
		openFiles.remove(new Integer(fd));
		openedMy.remove(new Integer(fd));
		Machine.interrupt().restore(status);
		return 0;
	}
	
	private int handleCreate(int name) {
		boolean status = Machine.interrupt().disable();
		String fileName = readVirtualMemoryString(name, 300);		
		if (fileName == null) return -1;
		OpenFile file = ThreadedKernel.fileSystem.open(fileName, true);
		//Lib.assertTrue(file != null, "handleSysCallOpen : fail to open file " + fileName);
		if (file == null) return -1;
		Integer fd = getNewFd();
		openFiles.put(fd, file);
		openedMy.add(fd);
		Machine.interrupt().restore(status);
		return fd;
	}
	
	private int handleUnlink(int name) {
		boolean status = Machine.interrupt().disable();
		String fileName = readVirtualMemoryString(name, 300);		
		if (fileName == null) return -1;
		boolean result = UserKernel.fileSystem.remove(fileName);
		Machine.interrupt().restore(status);
		if (result) return 0; else return -1;
	}
	
	private int handleExec(int file, int argc, int argv) {
		boolean status = Machine.interrupt().disable();
		UserProcess process = UserProcess.newUserProcess();
		String fileName = readVirtualMemoryString(file, 300);
//		Lib.hdebug(fileName);
		String[] args = new String[argc];
		for (int i = 0;i < argc;i++) {
			byte[] buf = new byte[4];
			if (readVirtualMemory(argv, buf) != 4) return -1;
			int addr = Lib.bytesToInt(buf, 0);
			args[i] = readVirtualMemoryString(addr, 300);
			if (args[i] == null) return -1;
			argv += 4;
		}
//		Lib.assertTrue(process.execute(fileName, new String[] {"cat", "13.txt"}));
		if (process.execute(fileName, args) == false) {
			Machine.interrupt().restore(status);
			return -1;
		}
		childPids.add(process.getPid());
		Machine.interrupt().restore(status);
		return process.getPid();
	}

	private int handleJoin(int pid, int statusAddr) {
		if (!childPids.contains(new Integer(pid)))
			return -1;
		UThread child = pidMap.get(new Integer(pid));
		child.join();
		Lib.assertTrue(child.process.hasExited);
		int st = child.process.exitStatus;
		byte[] buf = Lib.bytesFromInt(st);
		int hass = writeVirtualMemory(statusAddr, buf);
		if (hass != 4) return -1;
		readVirtualMemory(statusAddr, buf);
		int kk = Lib.bytesToShort(buf, 0);
		if (child.process.exitNormal == true)
			return 1;
		else {
			return 0;
		}
	}
	
	protected static final int syscallHalt = 0, syscallExit = 1, syscallExec = 2,
			syscallJoin = 3, syscallCreate = 4, syscallOpen = 5,
			syscallRead = 6, syscallWrite = 7, syscallClose = 8,
			syscallUnlink = 9;

	/**
	 * Handle a syscall exception. Called by <tt>handleException()</tt>. The
	 * <i>syscall</i> argument identifies which syscall the user executed:
	 * 
	 * <table>
	 * <tr>
	 * <td>syscall#</td>
	 * <td>syscall prototype</td>
	 * </tr>
	 * <tr>
	 * <td>0</td>
	 * <td><tt>void halt();</tt></td>
	 * </tr>
	 * <tr>
	 * <td>1</td>
	 * <td><tt>void exit(int status);</tt></td>
	 * </tr>
	 * <tr>
	 * <td>2</td>
	 * <td><tt>int  exec(char *name, int argc, char **argv);
     * 								</tt></td>
	 * </tr>
	 * <tr>
	 * <td>3</td>
	 * <td><tt>int  join(int pid, int *status);</tt></td>
	 * </tr>
	 * <tr>
	 * <td>4</td>
	 * <td><tt>int  creat(char *name);</tt></td>
	 * </tr>
	 * <tr>
	 * <td>5</td>
	 * <td><tt>int  open(char *name);</tt></td>
	 * </tr>
	 * <tr>
	 * <td>6</td>
	 * <td><tt>int  read(int fd, char *buffer, int size);
     *								</tt></td>
	 * </tr>
	 * <tr>
	 * <td>7</td>
	 * <td><tt>int  write(int fd, char *buffer, int size);
     *								</tt></td>
	 * </tr>
	 * <tr>
	 * <td>8</td>
	 * <td><tt>int  close(int fd);</tt></td>
	 * </tr>
	 * <tr>
	 * <td>9</td>
	 * <td><tt>int  unlink(char *name);</tt></td>
	 * </tr>
	 * </table>
	 * 
	 * @param syscall
	 *            the syscall number.
	 * @param a0
	 *            the first syscall argument.
	 * @param a1
	 *            the second syscall argument.
	 * @param a2
	 *            the third syscall argument.
	 * @param a3
	 *            the fourth syscall argument.
	 * @return the value to be returned to the user.
	 */
	public int handleSyscall(int syscall, int a0, int a1, int a2, int a3) {
		switch (syscall) {
		case syscallHalt:
			return handleHalt();
		case syscallWrite:
			return handleWrite(a0, a1, a2);
		case syscallOpen:
			return handleOpen(a0);
		case syscallExit:
			return handleExit(a0);
		case syscallRead:
			return handleRead(a0, a1, a2);
		case syscallClose:
			return handleClose(a0);
		case syscallCreate:
			return handleCreate(a0);
		case syscallUnlink:
			return handleUnlink(a0);
		case syscallExec:
			return handleExec(a0, a1, a2);
		case syscallJoin:
			return handleJoin(a0, a1);
		default:
			Lib.debug(dbgProcess, "Unknown syscall " + syscall + " a0: " + a0 + " a1: " + a1 + " a2: " + a2);
			//Lib.assertNotReached("Unknown system call!");
			exitNormal = false;
			handleExit(-1);
		}
		return 0;
	}
/*
	public void addUnlinkCount(String fileName) {
		Integer file = UserKernel.unlinkCounts.get(fileName);
		if (file==null) { file = 0; }
		file = file + 1;
		UserKernel.unlinkCounts.put(fileName, file);
	}
	public void subUnlinkCount(String fileName) {
		Integer file = UserKernel.unlinkCounts.get(fileName);
		Lib.assertTrue(file != null);
		file = file - 1;
		UserKernel.unlinkCounts.put(fileName, file);
		if (file == 0 )
	}
*/
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

		switch (cause) {
		case Processor.exceptionSyscall:
			int result = handleSyscall(processor.readRegister(Processor.regV0),
					processor.readRegister(Processor.regA0), processor
							.readRegister(Processor.regA1), processor
							.readRegister(Processor.regA2), processor
							.readRegister(Processor.regA3));
			processor.writeRegister(Processor.regV0, result);
			processor.advancePC();
			break;
		
		default:
			Lib.debug(dbgProcess, "Unexpected exce4ption: "
					+ Processor.exceptionNames[cause]);
			
			exitNormal = false;
			handleExit(-1);
//			Lib.assertNotReached("Unexpected exception");
		}
	}
	public void acquireVp(Integer vp) {
	
	}
	public int getPid() {
		return pid; 
	}

	public void setFatherPid(int p) {
		fatherPid = p;
	}

	public void removeFatherPid() {
		fatherPid = -1;
	}
	
	/** The program being run by this process. */
	protected Coff coff;

	/** This process's page table. */
	protected TranslationEntry[] pageTable;
	/** The number of contiguous pages occupied by the program. */
	protected int numPages;

	/** The number of pages in the program's stack. */
	protected final int stackPages = Config.getInteger("Processor.numStackPages", 8);

	protected int initialPC;

	protected int initialSP;
	protected int argc;

	protected int argv;
	protected int pid;
	private boolean hasExited;
	private int exitStatus;
	private boolean exitNormal;
	private int fatherPid;
	private HashSet<Integer> childPids;
	private static HashMap<Integer, OpenFile> openFiles  = new HashMap<Integer, OpenFile>();
	private HashSet<Integer> openedMy;
	protected Vector<Integer> pages;

	protected Vector<Integer> readOnlys;
	private static final int pageSize = Processor.pageSize;
	private static final char dbgProcess = 'a';
	private static int nextPid = 0;
	private static final int mainPid = 0;
	protected static HashMap<Integer, UThread> pidMap = new HashMap<Integer, UThread>();
	public static int existing = 0;
	public static Lock swapFileLock = new Lock();
}
