package javac.codegen;

import javac.quad.Temp;

public class AddiSpCode extends Asm
{
	public FunFrame currentFrame;
	public AddiSpCode()
	{
		currentFrame = CodeGen.currentFrame;
	}
	public Temp[] getS()
	{
		return null;
	}
	public Temp[] getD()
	{
		return null;
	}
	public String toString()
	{
		return "\taddi $sp, $sp, " + currentFrame.total() + "\n";		
	}
	public String toCode()
	{
		return toString();
	}
}