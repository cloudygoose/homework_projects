package javac.codegen;
import javac.quad.*;
public class BeqzCode extends Asm
{
	Temp temp;
	public Label label;
	FunFrame currentFrame;
	public BeqzCode(Temp t, Label l)
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
		return "\tbeqz " + temp + ", " + label + "\n"; 
	}
	public String toCode()
	{
		/*
		return "\tlw $t0, " + currentFrame.temps.get(temp.num) + "($sp)\n" + 
			   "\tbeqz $t0, " + label;		 
		 */
		String ts, re;
		re = "";
		if (!temp.isTemp) {
			ts = "$t1";
			re += Code.lw1(temp);
		} else ts = temp.color;
		re += "\tbeqz " + ts + ", " + label + "\n";
		return re;
	}
}