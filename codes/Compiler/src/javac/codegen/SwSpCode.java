package javac.codegen;
import javac.quad.*;
public class SwSpCode extends Asm
{
	Temp rs;
	int offset;
	FunFrame currentFrame;
	public SwSpCode(Temp rs1,int of)
	{
		currentFrame = CodeGen.currentFrame;
		rs = rs1; offset = of;
	}
	public Temp[] getS()
	{
		Temp[] a = new Temp[1];
		a[0] = rs;
		return a;
	}
	public Temp[] getD()
	{
		return null;
	}
	public String toString()
	{
		return "\tsw " + rs + ", " + offset + "($sp)" + "\n";
	}
	public String toCode()
	{
/*
		return "\tlw " + "$t0" + ", " + currentFrame.temps.get(rs.num) + "($sp)\n" +
			   "\tsw " + "$t0" + ", " + offset + "($sp)";
*/
		String ts, re;
		re = "";
		if (!rs.isTemp) {
			ts = "$t0";
			re += Code.lw0(rs);
		} else ts = rs.color;
		re += "\tsw " + ts + ", " + offset + "($sp)" + "\n";
		return re;
	}
}