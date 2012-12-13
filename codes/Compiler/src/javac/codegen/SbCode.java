package javac.codegen;
import javac.quad.*;
public class SbCode extends Asm
{
	Temp rd, rs;
	int offset;
	FunFrame currentFrame;
	public SbCode(Temp rs1, int of, Temp dd)
	{
		currentFrame = CodeGen.currentFrame;
		rs = dd; offset = of; rd = rs1;
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
		return "\tsb " + rs + ", " + offset + "(" + rd + ")" + "\n";
	}
	public String toCode()
	{
/*
		return "\tlw " + "$t0" + ", " + currentFrame.temps.get(rs.num) + "($sp)\n" +
			   "\tlw " + "$t1" + ", " + currentFrame.temps.get(rd.num) + "($sp)\n" + 
			   "\tsb " + "$t0" + ", " + offset + "($t1)";
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
		re += "\tsb" + ts + ", " + offset + "(" + td + ")\n";
		return re;
	}
}