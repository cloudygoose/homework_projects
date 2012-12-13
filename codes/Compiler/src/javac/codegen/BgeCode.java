package javac.codegen;
import javac.quad.*;
import javac.absyn.*;
public class BgeCode extends Asm
{
	public BinaryOp op;
	public Label label;
	public FunFrame currentFrame;
	public Temp dst, rs1, rs2;
	public BgeCode(Temp t0, Temp t1, Label l)
	{
		currentFrame = CodeGen.currentFrame;
		rs1 = t0;
		rs2 = t1;
		label = l;
	}
	public Temp[] getS()
	{
		Temp[] a = new Temp[2];
		a[0] = rs1;
		a[1] = rs2;
		return a;
	}
	public Temp[] getD()
	{
		return null;
	}
	public String toString()
	{
		return "\tbge " + rs1 + ", " + rs2 + ", " + label + "\n";
	}
	public String toCode()
	{
		String ts1, ts2, re;
		re = "";
		if (!rs1.isTemp)
		{
			ts1 = "$t0";
			re += Code.lw0(rs1);
		} else ts1 = rs1.color;
		if (!rs2.isTemp)
		{
			ts2 = "$t1";
			re += Code.lw1(rs2);
		} else ts2 = rs2.color;
		re += "\tbge " + " " + ts1 + ", " + ts2 + ", " + label + "\n";
		return re;
	}
}