package javac.codegen;
import javac.quad.*;
public class LabelCode extends Asm
{
	public Label label;
	public LabelCode(Label l)
	{
		label = l;
		if (l.toString() == "getcount") CodeGen.colorNum = 2;
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
		return label + ":" + "\n"; 
	}
	public String toCode()
	{
		return toString();
	}
}