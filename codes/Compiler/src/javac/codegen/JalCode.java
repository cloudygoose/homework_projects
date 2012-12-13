package javac.codegen;
import java.util.Iterator;

import javac.quad.*;
public class JalCode extends Asm
{
	public Label label;
	public JalCode(Label l)
	{
		label = l;
	}
	public Temp[] getS()
	{
		return null;
	}
	public Temp[] getD()
	{
		return null;
	}
	public String toString()
	{
		return "\tjal " + label + "\n"; 
	}
	public String toCode()
	{
		//return toString();			
		//System.err.println(toString() + liveSet);
		String re = "";
		Iterator<Temp> iter = liveSet.iterator();
		while (iter.hasNext())
		{
		//	System.err.println(toString() + liveSet);
			Temp temp = iter.next();
			if (temp.isTemp) re += Code.sw(temp);
		}
		
		re += toString();
		
		iter = liveSet.iterator();
		while (iter.hasNext())
		{
			Temp temp = iter.next();
			if (temp.isTemp) re += Code.lw(temp);
		}
		return re;
	}
}