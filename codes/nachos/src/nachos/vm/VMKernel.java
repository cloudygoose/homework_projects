package nachos.vm;

import java.util.*;
import nachos.threads.*;
import nachos.machine.*;
import nachos.threads.KThread;
import nachos.threads.Lock;
import nachos.threads.ThreadedKernel;
import nachos.userprog.UserKernel;
import nachos.userprog.UserProcess;

/**
 * A kernel that can support multiple demand-paging user processes.
 */
public class VMKernel extends UserKernel {
	/**
	 * Allocate a new VM kernel.
	 */
	public VMKernel() {
		super();
	}

	/**
	 * Initialize this kernel.
	 */
	public void initialize(String[] args) {
		super.initialize(args);
		TLBLock = new Lock();
		allPageNumber = getPhyMemNumber();
		VPsInMem = new LinkedList<Integer>();
		for (int i = 0;i < VMKernel.getPhyMemNumber();i++) 
			VPsInMem.add(new Integer(i));
		swapFile = Machine.stubFileSystem().open(swapFileName, true);
		availSwap = new Vector<Integer>();
		swapCount = 0;
/*
		byte[] nothing = new byte[Processor.pageSize * 1000];
		swapFile.write(nothing, 0, Processor.pageSize * 1000);
*/
	}

	/**
	 * Test this kernel.
	 */
	public void selfTest() {
		super.selfTest();
	}

	public static void setDirtyFromTLB() {
		for (int i = 0;i < Machine.processor().getTLBSize();i++) {
			TranslationEntry entry = Machine.processor().readTLBEntry(i);
			if (entry.dirty)
				isDirty[entry.ppn] = true;
		}
	}
	
	/**
	 * Start running user programs.
	 */
	public void run() {
		VMProcess process = VMProcess.newVMProcess();
		String shellProgram = Machine.getShellProgramName();
		Lib.assertTrue(process.execute(shellProgram, new String[] {"cat", "12.txt"}));
		KThread.finish();
	}

	/**
	 * Terminate this kernel. Never returns.
	 */
	public void terminate() {
		swapFile.close();
		System.out.println("\ntotal page Change Number : " + pageChangNum);
		Machine.stubFileSystem().remove(swapFileName);
		super.terminate();
	}
	
	
	public static int getAllMemNumber() {
		return allPageNumber;
	}
	
	public static Vector<Integer> getPages(int number) {
		Vector<Integer> g = new Vector<Integer>();
		for (int i = 0;i < number;i++)
		{
			if (availablePages.isEmpty()) {
				g.add(new Integer(allPageNumber));
				coreMap.put(new Integer(allPageNumber), new Integer(allPageNumber));
				allPageNumber++; 
			} else { 
				Integer ll = availablePages.removeFirst();
				g.add(ll);
			}
		}
	//	Lib.hdebug(number + "!!");
		return g;
	}
	public static Vector<Integer> availSwap;
	public static int swapCount;
	public static Lock TLBLock;
	private static int allPageNumber;
	public static LinkedList<Integer> VPsInMem;
	private static final char dbgVM = 'v';
	public static final String swapFileName = "SWAP";
	public static OpenFile swapFile = null;
	public static int pageChangNum = 0;
}
