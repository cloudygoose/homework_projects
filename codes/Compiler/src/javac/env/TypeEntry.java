package javac.env;
import javac.symbol.*;
import javac.type.*;
public class TypeEntry extends Entry 
{
	public Type type;
	public TypeEntry(String n)
	{
		type = new RECORD(new Symbol(n));
	}
	public String toString()
	{
		return " TypeEntry : " + type.toString() + "\n";
	}
}
