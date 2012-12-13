package nachos.threads;

import nachos.machine.Lib;
import java.util.*;

/**
 * A <i>communicator</i> allows threads to synchronously exchange 32-bit
 * messages. Multiple threads can be waiting to <i>speak</i>, and multiple
 * threads can be waiting to <i>listen</i>. But there should never be a time
 * when both a speaker and a listener are waiting, because the two threads can
 * be paired off at this point.
 */
public class Communicator {
	/**
	 * Allocate a new communicator.
	 */
	public Communicator() {
		lock = new Lock();
		speakers = new LinkedList<Condition>();
		listeners = new LinkedList<Condition>();
		numbers = new LinkedList<Integer>();
	}

	/**
	 * Wait for a thread to listen through this communicator, and then transfer
	 * <i>word</i> to the listener.
	 * 
	 * <p>
	 * Does not return until this thread is paired up with a listening thread.
	 * Exactly one listener should receive <i>word</i>.
	 * 
	 * @param word
	 *            the integer to transfer.
	 */
	public void speak(int word) {
		lock.acquire();
		numbers.add(new Integer(word));
		if (!listeners.isEmpty()) {
			//Lib.hdebug("speaker wake " + word);
			Condition c = new Condition(lock);
			speakers.add(c);
			listeners.removeFirst().wake();
			c.sleep();
		}
		else {
			Condition c = new Condition(lock);
			speakers.add(c);
			//Lib.hdebug("speaker sleep" + word);
			c.sleep();
		}
		lock.release();
	}

	/**
	 * Wait for a thread to speak through this communicator, and then return the
	 * <i>word</i> that thread passed to <tt>speak()</tt>.
	 * 
	 * @return the integer transferred.
	 */
	public int listen() {
		lock.acquire();
		if (!numbers.isEmpty()) {
			speakers.removeFirst().wake();
			int ll = numbers.removeFirst();
			//Lib.hdebug("listen " + ll);
			lock.release();
			return ll;
		}
		Condition c = new Condition(lock);
		while (numbers.isEmpty())
		{
			listeners.add(c);
			//Lib.hdebug("listen sleeping");
			c.sleep();
		}
		int ll = numbers.removeFirst();
		speakers.removeFirst().wake();
		lock.release();
		//Lib.hdebug("listen " + ll);
		return ll;
	}
	
	private Lock lock;
	public LinkedList<Condition> listeners;
	public LinkedList<Condition> speakers;
	public LinkedList<Integer> numbers;
}
