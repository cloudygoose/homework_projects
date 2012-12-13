package javac.codegen;
import javac.quad.*;
public class JCode extends Asm
{
	public Label label;
	public JCode(Label l1)
	{
		label = l1;
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
		return "\tj " + label + "\n";
	}
 	public String toCode()
 	{
 		return toString();
 	}
}