package javac.codegen;
import javac.quad.*;
public class LaCode extends Asm
{
	Temp temp;
	Label label;
	FunFrame currentFrame;
	public LaCode(Temp dd, Label l1)
	{
		currentFrame = CodeGen.currentFrame;
		temp = dd; label = l1;
	}
	public Temp[] getS()
	{
		return null;
	}
	public Temp[] getD()
	{
		Temp[] a = new Temp[1];
		a[0] = temp;
		return a;
	}
	public String toString()
	{
		return "\tla " + temp + ", " + label.toString() + "\n";
	}
	public String toCode()
	{
/*
		return "\tla " + "$t0, " + label.toString() + "\n" +
     		   "\tsw " + "$t0" + ", " + currentFrame.temps.get(temp.num) + "($sp)";
*/
		String ts, re;
		re = "";
		if (!temp.isTemp) ts = "$t0"; else ts = temp.color;
		re += "\tla " + ts + ", " + label.toString() + "\n";
		if (!temp.isTemp) re += Code.sw0(temp);
		return re;
	}
}