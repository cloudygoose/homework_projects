package javac.codegen;
import javac.quad.*;
public class MoveV0ToCode extends Asm
{
	Temp temp;
	FunFrame currentFrame;
	public MoveV0ToCode(Temp t)
	{
		currentFrame = CodeGen.currentFrame;
		temp = t;
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
		return "\tmove " + temp + ", $v0" + "\n"; 
	}
	public String toCode()
	{
		//return "\tsw $v0, " + currentFrame.temps.get(temp.num) + "($sp)";
		if (!temp.isTemp)
			return "\tsw $v0, " + currentFrame.temps.get(temp.num) + "($sp)\n";
		else
			return "\tmove " + temp.color + ", $v0" + "\n";			
	}
}