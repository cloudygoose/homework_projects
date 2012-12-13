package javac.codegen;
import javac.quad.*;
public class MoveV0FromCode extends Asm
{
	Temp temp;
	FunFrame currentFrame;
	public MoveV0FromCode(Temp t)
	{
		currentFrame = CodeGen.currentFrame;
		temp = t;
	}
	public Temp[] getS()
	{
		Temp[] a = new Temp[1];
		a[0] = temp;
		return a;
	}
	public Temp[] getD()
	{
		return null;
	}
	public String toString()
	{
		return "\tmove $v0, " + temp + "\n"; 
	}
	public String toCode()
	{
		//return "\tlw $v0, " + currentFrame.temps.get(temp.num) + "($sp)";
		if (!temp.isTemp)
			return "\tlw $v0, " + currentFrame.temps.get(temp.num) + "($sp)\n";
		else
			return "\tmove $v0, " + temp.color + "\n";
	}
}