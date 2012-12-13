package javac.codegen;
import javac.quad.*;
import javac.registers.*;
import java.util.*;
public class Asm
{
	public String s;
	public int num; //in BasicBlock
	public BasicBlock block;
	public HashSet<Temp> liveSet;
	public Asm(String s1)
	{
		s = s1;
	}
	public void setBlock(BasicBlock b)
	{
		block = b;
	}
	public Asm()
	{
		block = null;
	}
	public String toString()
	{
		return s + "\n";
	}
	public String toCode()
	{
		return toString();
	}
	public Temp[] getS()
	{
		return null;
	}
	public Temp[] getD()
	{
		return null;
	}
}