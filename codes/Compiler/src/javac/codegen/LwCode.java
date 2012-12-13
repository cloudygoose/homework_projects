package javac.codegen;
import javac.quad.*;
public class LwCode extends Asm
{
	Temp rd, rs;
	int offset;
	FunFrame currentFrame;
	public LwCode(Temp dd, int of, Temp rs1)
	{
		currentFrame = CodeGen.currentFrame;
		rd = dd; offset = of; rs = rs1;
	}
	public Temp[] getS()
	{
		Temp[] a = new Temp[1];
		a[0] = rs;
		return a;
	}
	public Temp[] getD()
	{
		Temp[] a = new Temp[1];
		a[0] = rd;
		return a;
	}
	public String toString()
	{
		return "\tlw " + rd + ", " + offset + "(" + rs + ")" + "\n";
	}
	public String toCode()
	{
		if (!liveSet.contains(rd)) return "";
/*
		return "\tlw " + "$t1" + ", " + currentFrame.temps.get(rs.num) + "($sp)\n" +
			   "\tlw " + "$t0" + ", " + offset + "($t1)\n" + 
			   "\tsw " + "$t0" + ", " + currentFrame.temps.get(rd.num) + "($sp)";
*/
		String td, ts;
		String re = "";
		if (!rd.isTemp) {
			td = "$t0";
		} else td = rd.color;
		if (!rs.isTemp) {
			ts = "$t1";
			re += Code.lw1(rs);
		} else ts = rs.color;
		re += "\tlw " + td + ", " + offset + "(" + ts + ")" + "\n";
		if (!rd.isTemp)
			re += Code.sw0(rd);
		return re;
	}
}