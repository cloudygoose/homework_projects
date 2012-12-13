package javac.trans;
import javac.quad.*;
import javac.symbol.*;
import java.util.*;

public class FunFrag
{
	HashMap<Symbol, Temp> map;
	public FunFrag()
	{
		map = new HashMap<Symbol, Temp>();
	}
	public String toString()
	{
		return map.toString();
	}
}