package javac.quad;

import javac.trans.*;
import javac.codegen.*;
import java.util.*;

public class Temp {
	public String color;
	public boolean isTemp;
	public ArrayList<Temp> edges;
	public static void addEdge(Temp t1, Temp t2)
	{
		if (t1.equals(t2)) return;
		if (!t1.edges.contains(t2)) t1.edges.add(t2);
		if (!t2.edges.contains(t1)) t2.edges.add(t1);
	}
	public static void removeEdge(Temp t1, Temp t2)
	{
		t1.edges.remove(t2);
		t2.edges.remove(t1);
	}
	public Temp() {
		color = "non";
		isTemp = false;
		edges = new ArrayList<Temp>();
		num = count++;
		if (QuadGen.currentFrame == null)
		{
			System.err.println("Null FunFrame");
			System.exit(1);
		}
		QuadGen.currentFrame.temps.put(num, QuadGen.currentFrame.total());
		QuadGen.currentFrame.localAdd();
		QuadGen.currentFrame.allTemps.add(this);
	}
	//for new temp() in CodeGen
	public Temp(FunFrame currentFrame) {
		color = "non";
		isTemp = false;
		edges = new ArrayList<Temp>();
		num = count++;
		if (currentFrame == null)
		{
			System.err.println("Null FunFrame");
			System.exit(1);
		}
		currentFrame.temps.put(num, currentFrame.total());
		currentFrame.localAdd();
		currentFrame.allTemps.add(this);
	}
	@Override
	public String toString() {
		return "t" + num;
	}
	@Override
	public boolean equals(Object other) {
		return ((toString()).equals(other.toString()));
	}
	@Override
	public int hashCode()
	{
		return num;
	}
	public int num;
	static int count = 0;
}
