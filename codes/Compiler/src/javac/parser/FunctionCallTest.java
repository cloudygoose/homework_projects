package javac.parser;
import java.util.*;
import javac.env.*;
import javac.absyn.*;
import javac.type.*;
public class FunctionCallTest
{
	public static void test(Iterator<Type> iter, Expr e, Env local)
	{
		if (!iter.hasNext())
			SemanticTest.error("Phase 3-3 wrong functioncall");
		if (e instanceof BinaryExpr)
		{
			BinaryExpr binary = (BinaryExpr)e;
			if (binary.op == BinaryOp.COMMA)
			{
				test(iter, binary.l, local);
				SemanticTest.fillExprType(binary.r, local);
				if (!iter.hasNext())
					SemanticTest.error("Phase 3-3 wrong functioncall");
				if (!iter.next().equals(binary.r.ty))
					SemanticTest.error("Phase 3-3 type mismatch in functioncall");				
				return;
			}
		}
		SemanticTest.fillExprType(e, local);
		if (!iter.next().equals(e.ty))
			SemanticTest.error("Phase 3-3 type mismatch in functioncall");				
	}
}