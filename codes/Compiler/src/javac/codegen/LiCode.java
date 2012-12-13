package javac.codegen;
import javac.quad.*;
public class LiCode extends Asm
{
	int im;
	Temp temp;
	FunFrame currentFrame;
	public LiCode(Temp t, int ii)
	{
		currentFrame = CodeGen.currentFrame;
		temp = t;
		im = ii;
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
		return "\tli " + temp + ", " + im + "\n"; 
	}
	public String toCode()
	{
/*
		return "\tli $t0, " + im + "\n" + 
			   "\tsw $t0, " + currentFrame.temps.get(temp.num) + "($sp)";
*/
		String td, re;
		re = "";
		if (!temp.isTemp) td = "$t0"; else td = temp.color;
		re += "\tli " + td + ", " + im + "\n";
		if (!temp.isTemp) re += Code.sw0(temp);
		return re;
	}
}