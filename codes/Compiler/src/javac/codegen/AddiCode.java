package javac.codegen;
import javac.quad.*;
public class AddiCode extends Asm
{
	public int im;
	public FunFrame currentFrame;
	public Temp rd, rs;
	public AddiCode(Temp d, Temp s, int mm)
	{
		currentFrame = CodeGen.currentFrame;
		rd = d; rs = s; im = mm;
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
		return "\taddi " + rd + ", " + rs + ", " + im + "\n";
	}
	public String toCode()
	{
		if (!liveSet.contains(rd)) return "";
		/*
		return "\tlw " + "$t0" + ", " + currentFrame.temps.get(rs.num) + "($sp)\n" +
 	   		   "\taddi " + "$t0, $t0, " + im + "\n" +
 	   		   "\tsw" + "$t0, " + currentFrame.temps.get(rd.num) + "($sp)";  
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
		re += "\taddi " + td + ", " + ts + ", " + im + "\n";
		if (!rd.isTemp)
			re += Code.sw0(rd);
		return re;
	}
}