package javac.codegen;
import javac.quad.*;
public class MoveCode extends Asm
{
	Temp rs, rd;
	FunFrame currentFrame;
	public MoveCode(Temp rd1, Temp rs1)
	{
		currentFrame = CodeGen.currentFrame;
		rs = rs1; rd = rd1;
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
		return "\tmove " + rd + ", " + rs + "\n"; 
	}
	public String toCode()
	{
		if (!liveSet.contains(rd)) return "";
		/*
		return "\tlw $t0, " + currentFrame.temps.get(rs.num) + "($sp)\n" + 
			   "\tsw $t0, " + currentFrame.temps.get(rd.num) + "($sp)";
		*/
		if (!rs.isTemp && !rd.isTemp) {
			return "\tlw $t0, " + currentFrame.temps.get(rs.num) + "($sp)\n" + 
			       "\tsw $t0, " + currentFrame.temps.get(rd.num) + "($sp)\n";
		} else
		if (!rs.isTemp && rd.isTemp) {
			return "\tlw " + rd.color + ", " + currentFrame.temps.get(rs.num) + "($sp)\n"; 
		} else
		if (rs.isTemp && !rd.isTemp) {
			return "\tsw " + rs.color + ", " + currentFrame.temps.get(rd.num) + "($sp)\n"; 
		} else {
			//OPT
			if (rs.color == rd.color) return "";
			return "\tmove " + rd.color + ", " + rs.color + "\n";
		}
	}
}