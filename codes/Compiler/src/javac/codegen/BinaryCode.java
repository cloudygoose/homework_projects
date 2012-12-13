package javac.codegen;
import javac.quad.*;
import javac.absyn.*;
public class BinaryCode extends Asm
{
	public BinaryOp op;
	public FunFrame currentFrame;
	public Temp dst, rs1, rs2;
	public BinaryCode(BinaryOp op1, Temp t0, Temp t1, Temp t2)
	{
		currentFrame = CodeGen.currentFrame;
		rs1 = t1;
		rs2 = t2;
		dst = t0;
		op = op1;
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
		Temp[] a = new Temp[1];
		a[0] = dst;
		return a;
	}
	public String getOp()
	{
		if (op == BinaryOp.AND)
			return "and";
		else if (op == BinaryOp.OR)
			return "or";
		else if (op == BinaryOp.PLUS)
			return "add";
		else if (op == BinaryOp.MINUS)
			return "sub";
		else if (op == BinaryOp.MULTIPLY)
			return "mul";
		else if (op == BinaryOp.MODULO)
			return "rem";
		else if (op == BinaryOp.EQ)
			return "seq";
		else if (op == BinaryOp.NEQ)
			return "sne";
		else if (op == BinaryOp.GREATER)
			return "sgt";
		else if (op == BinaryOp.GREATER_EQ)
			return "sge";
		else if (op == BinaryOp.LESS)
			return "slt";
		else if (op == BinaryOp.LESS_EQ)
			return "sle";
		else if (op == BinaryOp.DIVIDE)
			return "div";
		else
			CodeGen.error("Binary mismatch");
		return "";
	}
	public String toString()
	{
		return "\t" + getOp() + " " + dst + ", " + rs1 + ", " + rs2 + "\n";
	}
	public String toCode()
	{
		if (!liveSet.contains(dst)) return "";
/*
		return "\tlw " + "$t1" + ", " + currentFrame.temps.get(rs1.num) + "($sp)\n" +
			   "\tlw " + "$t2" + ", " + currentFrame.temps.get(rs2.num) + "($sp)\n" +
			   "\t" + getOp() + " $t0, $t1, $t2\n" +
			   "\tsw $t0, " + currentFrame.temps.get(dst.num) + "($sp)";
*/
		String ts1, ts2, td, re;
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
		if (!dst.isTemp)
			td = "$t0";
		else td = dst.color;
		re += "\t" + getOp() + " " + td + ", " + ts1 + ", " + ts2 + "\n";
		if (!dst.isTemp)
			re += Code.sw0(dst);
		return re;
	}
}