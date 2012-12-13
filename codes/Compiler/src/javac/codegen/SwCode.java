package javac.codegen;
import javac.quad.*;
public class SwCode extends Asm
{
	Temp rd, rs;
	int offset;
	FunFrame currentFrame;
	public SwCode(Temp rs1, int of, Temp dd)
	{
		currentFrame = CodeGen.currentFrame;
		rs = rs1; offset = of; rd = dd;
	}
	public Temp[] getS()
	{
		Temp[] a = new Temp[2];
		a[0] = rd; a[1] = rs;
		return a;
	}
	public Temp[] getD()
	{
		return null;
	}
	public String toString()
	{
		return "\tsw " + rs + ", " + offset + "(" + rd + ")" + "\n";
	}
	public String toCode()
	{
/*
		return "\tlw " + "$t0" + ", " + currentFrame.temps.get(rs.num) + "($sp)\n" +
			   "\tlw " + "$t1" + ", " + currentFrame.temps.get(rd.num) + "($sp)\n" + 
			   "\tsw " + "$t0" + ", " + offset + "($t1)";
*/
		String ts, td;
		String re = "";
		if (!rs.isTemp) {
			ts = "$t0";
			re += Code.lw0(rs);
		} else ts = rs.color;
		if (!rd.isTemp) {
			td = "$t1";
			re += Code.lw1(rd);
		} else td = rd.color;
		re += "\tsw " + ts + ", " + offset + "(" + td + ")\n";
		return re;
	}
}