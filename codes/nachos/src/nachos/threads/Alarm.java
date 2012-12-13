package nachos.threads;

import nachos.machine.*;
import java.util.*;
/**
 * Uses the hardware timer to provide preemption, and to allow threads to sleep
 * until a certain time.
 */
public class Alarm {
	/**
	 * Allocate a new Alarm. Set the machine's timer interrupt handler to this
	 * alarm's callback.
	 * 
	 * <p>
	 * <b>Note</b>: Nachos will not function correctly with more than one alarm.
	 */
	public Alarm() {
		waitUntilQueue = new PriorityQueue<WaitUntilThread>();
		Machine.timer().setInterruptHandler(new Runnable() {
			public void run() {
				timerInterrupt();
			}
		});
	}

	/**
	 * The timer interrupt handler. This is called by the machine's timer
	 * periodically (approximately every 500 clock ticks). Causes the current
	 * thread to yield, forcing a context switch if there is another thread that
	 * should be run.
	 */
	public void timerInterrupt() {
		//Lib.hdebug("timerInterrupt!!");
		if (!waitUntilQueue.isEmpty())
		{
			//Lib.hdebug("first waiting: " + waitUntilQueue.getFirst().wakeTime);
			boolean intStatus = Machine.interrupt().disable();
			while (waitUntilQueue.peek().wakeTime < Machine.timer().getTime())
			{
				waitUntilQueue.peek().thread.ready();
				waitUntilQueue.poll();
				if (waitUntilQueue.isEmpty()) break;
			}
			Machine.interrupt().restore(intStatus);
		}
		KThread.yield();
	}

	/**
	 * Put the current thread to sleep for at least <i>x</i> ticks, waking it up
	 * in the timer interrupt handler. The thread must be woken up (placed in
	 * the scheduler ready set) during the first timer interrupt where
	 * 
	 * <p>
	 * <blockquote> (current time) >= (WaitUntil called time)+(x) </blockquote>
	 * 
	 * @param x
	 *            the minimum number of clock ticks to wait.
	 * 
	 * @see nachos.machine.Timer#getTime()
	 */
	public void waitUntil(long x) {
		// for now, cheat just to get something working (busy waiting is bad)
		Machine.interrupt().disable();
		long wakeTime = Machine.timer().getTime() + x;
		WaitUntilThread wut = new WaitUntilThread(wakeTime, KThread.currentThread());
		waitUntilQueue.add(wut);
		KThread.sleep();
	}
	private class WaitUntilThread implements Comparable {
		public long wakeTime;
		public KThread thread;
		public WaitUntilThread(long w, KThread t) {
			wakeTime = w;
			thread = t;
		}
		public int compareTo(Object _threadWait) {
			if (wakeTime - ((WaitUntilThread)_threadWait).wakeTime >= 0)
				return 1;
			else return -1;
		}
	}

	private PriorityQueue<WaitUntilThread> waitUntilQueue; 
}
