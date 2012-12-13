//Should be sll
package javac.codegen;
import javac.quad.*;
public class Li2Code extends Asm
{
	public FunFrame currentFrame;
	public Temp temp;
	public Li2Code(Temp s)
	{
		currentFrame = CodeGen.currentFrame;
		temp = s;
	}
	public Temp[] getS()
	{
		Temp[] a = new Temp[1];
		a[0] = temp;
		return a;
	}
	public Temp[] getD()
	{
		Temp[] a = new Temp[1];
		a[0] = temp;
		return a;
	}
	public String toString()
	{
		return "\tsll " + temp + ", " + temp + ", 2\n";
	}
	public String toCode()
	{
		if (!liveSet.contains(temp)) return "";
		/*
		return "\tlw " + "$t0" + ", " + currentFrame.temps.get(rs.num) + "($sp)\n" +
 	   		   "\taddi " + "$t0, $t0, " + im + "\n" +
 	   		   "\tsw" + "$t0, " + currentFrame.temps.get(rd.num) + "($sp)";  
		*/
		String ts;
		String re = "";
		if (!temp.isTemp) {
			ts = "$t0";
			re += Code.lw0(temp);
		} else ts = temp.color;
		re += "\tsll " + ts + ", " + ts + ", 2\n";
		if (!temp.isTemp)
			re += Code.sw0(temp);
		return re;
	}
}