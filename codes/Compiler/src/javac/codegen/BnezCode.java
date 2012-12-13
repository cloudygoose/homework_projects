package javac.codegen;
import javac.quad.*;
public class BnezCode extends Asm
{
	Temp temp;
	public Label label;
	FunFrame currentFrame;
	public BnezCode(Temp t, Label l)
	{
		currentFrame = CodeGen.currentFrame;
		temp = t;
		label = l;
	}
	public Temp[] getS()
	{
		Temp[] a = new Temp[1];
		a[0] = temp;
		return a;
	}
	public Temp[] getD()
	{
		return null;
	}
	public String toString()
	{
		return "\tbnez " + temp + ", " + label; 
	}
	public String toCode()
	{
/*
		return "\tlw $t0, " + currentFrame.temps.get(temp.num) + "($sp)\n" + 
			   "\tbnez $t0, " + label;
*/
		String ts, re;
		re = "";
		if (!temp.isTemp) {
			ts = "$t1";
			re += Code.lw1(temp);
		} else ts = temp.color;
		re += "\tbnez " + ts + ", " + label + "\n";
		return re;		
	}
}