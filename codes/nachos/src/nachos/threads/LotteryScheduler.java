package nachos.threads;

import java.util.Iterator;

import nachos.machine.Lib;
import nachos.threads.PriorityScheduler.PriorityQueue;
import nachos.threads.PriorityScheduler.ThreadState;

/**
 * A scheduler that chooses threads using a lottery.
 * 
 * <p>
 * A lottery scheduler associates a number of tickets with each thread. When a
 * thread needs to be dequeued, a random lottery is held, among all the tickets
 * of all the threads waiting to be dequeued. The thread that holds the winning
 * ticket is chosen.
 * 
 * <p>
 * Note that a lottery scheduler must be able to handle a lot of tickets
 * (sometimes billions), so it is not acceptable to maintain state for every
 * ticket.
 * 
 * <p>
 * A lottery scheduler must partially solve the priority inversion problem; in
 * particular, tickets must be transferred through locks, and through joins.
 * Unlike a priority scheduler, these tickets add (as opposed to just taking the
 * maximum).
 */
public class LotteryScheduler extends PriorityScheduler {
	/**
	 * Allocate a new lottery scheduler.
	 */
	public LotteryScheduler() {
		
	}
	
	
	/**
	 * Allocate a new lottery thread queue.
	 * 
	 * @param transferPriority
	 *            <tt>true</tt> if this queue should transfer tickets from
	 *            waiting threads to the owning thread.
	 * @return a new lottery thread queue.
	 */
	public ThreadQueue newThreadQueue(boolean transferPriority) {
		return new LotteryQueue(transferPriority);
	}
	protected class LotteryQueue extends PriorityScheduler.PriorityQueue {
		int random;
		public LotteryQueue(boolean transferPriority) {
			super(transferPriority);
		}
		
		protected ThreadState pickNextThread() {
			ThreadState result = null;
			Iterator<KThread> iterator = priorityQueue.iterator();
			if (priorityQueue.isEmpty()) return null;
			int total = 0;
			while (iterator.hasNext()) {
				KThread thread = iterator.next();
				total += getThreadState(thread).getEffectivePriority();
			}
			//if (total == 0) return null;
			//System.out.println(total);
			random = Lib.random(total);
			iterator = priorityQueue.iterator();
			while (iterator.hasNext()) {
				KThread thread = iterator.next();
				if (random < getThreadState(thread).effectivePriority) {
					return getThreadState(thread);
				}
				random -= getThreadState(thread).effectivePriority;
			}
			return result;
		}
	}
	
	protected class LotteryThreadState extends PriorityScheduler.ThreadState {

		public LotteryThreadState(KThread thread) {
			super(thread);
		}
		@Override
		public int getEffectivePriority() {
			effectivePriority = getPriority();
			Iterator<PriorityQueue> iterWaitQueue = relateQueue.iterator();
			while (iterWaitQueue.hasNext()) {
				PriorityQueue priorityQueue = iterWaitQueue.next();
				if (priorityQueue.transferPriority) {
					Iterator<KThread> iterThread = priorityQueue.priorityQueue.iterator();
					while (iterThread.hasNext()) {
						int temp = getThreadState(iterThread.next()).getEffectivePriority();
						effectivePriority += temp;
					}
				}
			}
			Iterator<KThread> iterThread = ((PriorityQueue)thread.joinQueue).priorityQueue.iterator();
			while (iterThread.hasNext()) {
				int temp = getThreadState(iterThread.next()).getEffectivePriority();
				if (temp > effectivePriority) effectivePriority += temp;
			}
			return effectivePriority;
		}
		
	}
}
