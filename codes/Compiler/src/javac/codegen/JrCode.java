package javac.codegen;
import javac.quad.*;
public class JrCode extends Asm
{
	public JrCode() {
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
		return "\tjr $ra" + "\n";
	}
 	public String toCode()
 	{
 		return toString();
 	}
}