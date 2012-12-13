package javac.codegen;
import javac.quad.*;
import javac.registers.BasicBlock;

import java.util.*;

public class FunFrame
{
	public int argregs;
	public int savedregs;
	public int emptyregs;
	public int raregs;
	public int localregs;
	public String name;
	public ArrayList<Temp> argTemps;
	public ArrayList<Asm> codes;
	public ArrayList<Quad> quads;
	public ArrayList<BasicBlock> blocks;
	public ArrayList<Temp> allTemps;
	public HashMap<Integer, Integer> temps;
	public FunFrame(String n)
	{
		allTemps = new ArrayList<Temp>();
		blocks = new ArrayList<BasicBlock>();
		name = n;
		codes = new ArrayList<Asm>();
		argTemps = new ArrayList<Temp>();
		temps = new HashMap<Integer, Integer>();
		quads = new ArrayList<Quad>();
		argregs = 20;
		savedregs = 8;
		emptyregs = 0;
		raregs = 1;
		localregs = 0;
	}
	public void localAdd()
	{
		localregs++;
	}
	public int total()
	{
		return (argregs + savedregs + emptyregs + raregs + localregs) * 4;
	}
	public int ra()
	{
		return (argregs + savedregs) * 4;
	}
	public void add(Asm asm)
	{
		codes.add(asm);
	}
	public BasicBlock getBlock(Label label)
	{
		Iterator<BasicBlock> iter = blocks.iterator();
		while (iter.hasNext())
		{
			BasicBlock block = iter.next();
			if (block.startLabel() != null && block.startLabel().equals(label))
				return block;
		}
		System.err.println("no block match the label");
		System.exit(1);
		return null;
	}
	public String toString()
	{
		String s = "";
		Iterator<Quad> iter = quads.iterator();
		while (iter.hasNext())
		{
			s = s + iter.next() + "\n";
		}
		return s;
	}
}