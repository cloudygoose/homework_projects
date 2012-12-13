package javac.codegen;
import javac.quad.*;
public class InLdCode extends Asm
{
	Temp temp;
	int count;
	FunFrame currentFrame;
	public InLdCode(Temp t, int cc)
	{
		temp = t;
		count = cc;
		currentFrame = CodeGen.currentFrame;
	}
	public Temp[] getS()
	{
		return null;
	}
	public Temp[] getD()
	{
		Temp[] a = new Temp[1];
		a[0] = temp;
		return a;
	}
	public String toString()
	{
		return "\tlw " + temp + ", " + (currentFrame.total() + count * 4) + "($sp)" + "\n";
	}
	public String toCode()
	{
/*		
		return "\tlw $t0, " + (currentFrame.total() + count * 4) + "($sp)\n" +
			   "\tsw $t0, " + currentFrame.temps.get(temp.num) + "($sp)";
*/
		String re, ts;
		re = "";
		if (!temp.isTemp) ts = "$t0"; else ts = temp.color;
		re += "\tlw " + ts + ", " + (currentFrame.total() + count * 4) + "($sp)\n";
		if (!temp.isTemp)
			re += Code.sw0(temp);
		return re;
	}
}