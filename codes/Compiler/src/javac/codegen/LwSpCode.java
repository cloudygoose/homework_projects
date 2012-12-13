package javac.codegen;
import javac.quad.*;
public class LwSpCode extends Asm
{
	Temp rd;
	int offset;
	FunFrame currentFrame;
	public LwSpCode(Temp dd, int of)
	{
		currentFrame = CodeGen.currentFrame;
		rd = dd; offset = of;
	}
	public Temp[] getS()
	{
		return null;
	}
	public Temp[] getD()
	{
		Temp[] a = new Temp[1];
		a[0] = rd;
		return a;
	}
	public String toString()
	{
		return "\tlw " + rd + ", " + offset + "($sp)" + "\n";
	}
	public String toCode()
	{
/*
		return "\tlw " + "$t0" + ", " + offset + "($sp)\n" + 
			   "\tsw " + "$t0" + ", " + currentFrame.temps.get(rd.num) + "($sp)";
*/
		String td;
		String re = "";
		if (!rd.isTemp) td = "$t0"; else td = rd.color;
		re += "\tlw " + td + ", " + offset + "($sp)\n";
		if (!rd.isTemp) re += Code.sw0(rd);
		return re;
	}
}