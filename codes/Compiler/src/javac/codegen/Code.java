package javac.codegen;
import javac.quad.*;
public class Code
{
	public static FunFrame currentFrame;
	//for jal
	public static String lw(Temp temp) {
		return "\tlw " + temp.color + ", " + currentFrame.temps.get(temp.num) + "($sp)\n";
	}
	//for jal
	public static String sw(Temp temp) {
		return "\tsw " + temp.color + ", " + currentFrame.temps.get(temp.num) + "($sp)\n";
	}
	
	public static String lw0(Temp temp) {
		return "\tlw " + "$t0" + ", " + currentFrame.temps.get(temp.num) + "($sp)\n";
	}
	public static String lw1(Temp temp) {
		return "\tlw " + "$t1" + ", " + currentFrame.temps.get(temp.num) + "($sp)\n";
	}
	public static String lb0(Temp temp) {
		return "\tlb " + "$t0" + ", " + currentFrame.temps.get(temp.num) + "($sp)\n";
	}
	public static String sb1(Temp temp) {
		return "\tlb " + "$t1" + ", " + currentFrame.temps.get(temp.num) + "($sp)\n";
	}
	
	public static String sw0(Temp temp) {
		return "\tsw " + "$t0" + ", " + currentFrame.temps.get(temp.num) + "($sp)\n";
	}
	public static String sb0(Temp temp) {
		return "\tsb " + "$t0" + ", " + currentFrame.temps.get(temp.num) + "($sp)\n";
	}
}