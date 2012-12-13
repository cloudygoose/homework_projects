package javac.registers;
import java.util.*;

import javac.codegen.*;
import javac.quad.*;

public class BasicBlock
{
	public static int count = 0;
	public int basicCount;
	public int num;
	public ArrayList<Asm> asmList;
	public HashSet<Temp> useSet;
	public HashSet<Temp> defSet;
	public HashSet<Temp> inSet;
	public HashSet<Temp> outSet;
	public ArrayList<BasicBlock> gotoList;
	public void setUse()
	{
		Iterator<Asm> iter = asmList.iterator();
		while (iter.hasNext())
		{
			Asm asm = iter.next();
			Temp[] a = asm.getS();
			if (a == null) continue;
			for (int i = 0;i < a.length;i++)
			{
				Temp temp = a[i]; 
				if (useSet.contains(temp)) continue;
				boolean use = true;
				for (int j = 0;j < asm.num;j++)
					if (asmList.get(j).getD() != null && (asmList.get(j).getD())[0].equals(temp))
					{
						use = false;
						break;
					}
				if (use) useSet.add(temp);
			}
		}
	}
	public void setDef()
	{
		Iterator<Asm> iter = asmList.iterator();
		while (iter.hasNext())
		{
			Asm asm = iter.next();
			if (asm.getD() == null) continue;
			Temp temp = (asm.getD())[0]; 
			if (defSet.contains(temp)) continue;
			boolean def = true;
			for (int i = 0;i <= asm.num;i++)
			{
				Temp[] b = asmList.get(i).getS();
				if (b == null) continue;
				for (int j = 0;j < b.length;j++)
					if (b[j].equals(temp))
					{
						def = false;
						break;
					}
			}
			if (def) defSet.add(temp);
		}
	}
	public BasicBlock()
	{
		inSet = new HashSet<Temp>();
		outSet = new HashSet<Temp>();
		useSet = new HashSet<Temp>();
		defSet = new HashSet<Temp>();
		gotoList = new ArrayList<BasicBlock>();
		basicCount = 0;
		asmList = new ArrayList<Asm>();
		num = count++;
	}
	public void add(Asm asm)
	{
		asm.num = basicCount++;
		asmList.add(asm);
	}
	public String toString()
	{
		return "BasicBlock " + num;
	}
	public Label startLabel()
	{
		if (asmList.get(0) instanceof LabelCode)
			return ((LabelCode)asmList.get(0)).label;
		else return null;
	}
	public void computeLivenessAndEdges()
	{
		HashSet<Temp> nowLive = (HashSet<Temp>)outSet.clone();
		for (int i = asmList.size() - 1;i >= 0;i--)
		{
			Asm asm = asmList.get(i);
			asm.liveSet = (HashSet<Temp>)nowLive.clone();
			if (asm.getD() != null)
			{
				Temp dst = asm.getD()[0];
				Iterator<Temp> iter = asm.liveSet.iterator();
				while (iter.hasNext())
					Temp.addEdge(dst, iter.next());
					
			}
			if (asm.getD() != null)
				for (int j = 0;j < asm.getD().length;j++)
					nowLive.remove(asm.getD()[j]);
			if (asm.getS() != null)
				for (int j = 0;j < asm.getS().length;j++)
					nowLive.add(asm.getS()[j]);
		}
	}
	public Asm lastAsm()
	{
		return asmList.get(asmList.size() - 1);
	}
}