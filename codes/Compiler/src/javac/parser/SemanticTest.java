package javac.parser;
import javac.codegen.*;
import javac.absyn.*;
import javac.env.*;
import java.util.*;
import javac.symbol.*;
import java.lang.*;
import javac.type.*;
public class SemanticTest
{
	public static Env global = new Env();
	public static Type funReturnType = null;
	public static void error(String s)
	{
        System.err.println("Semantic error");
        System.err.println(s);
        System.exit(1);
	}
	public static void fillExprType(Expr e, Env local)
	{
		//pre-declared for later use
		Entry entry;
		NewArray newArray;
		Type type;
		SubscriptPostfix subs;
		BinaryExpr binary;
		FunctionCall funCall;
		FieldPostfix fieldPost;
		UnaryExpr unary;
		NewRecord newRec;
		ParenExpr parenExpr;
		//primary
		if (e instanceof Id)
		{
			entry = local.getEntry(((Id)e).sym);
			if (entry == null)
				error("Phase 3-3 no such ID " + ((Id)e).sym + " : in functionstmt");
			if (entry instanceof VariableEntry)
			{
				e.lvalue = 1;
				e.ty = ((VariableEntry)entry).type;
			} else
			e.ty = RECORD.NULL;
		} else
		if (e instanceof Null) e.ty = Type.NULL; else
		if (e instanceof IntLiteral) e.ty = INT.getInstance(); else
		if (e instanceof CharLiteral) e.ty = CHAR.getInstance(); else
		if (e instanceof StringLiteral)	e.ty = STRING.getInstance(); else
		if (e instanceof NewArray)
		{
			newArray = (NewArray)e;
			fillExprType(newArray.expr, local);
			if (!newArray.expr.ty.equals(INT.getInstance()))
				error("Phase 3-3 INT expected : in newarray");
			type = newArray.type.toType(local);
			if (type == null)
				error("Phase 3-3 no such type : in newarray");
			e.ty = new ARRAY(type);
		} else
		//postfix
		if (e instanceof SubscriptPostfix)
		{
			subs = (SubscriptPostfix)e;
			fillExprType(subs.expr, local);
			if (!subs.expr.ty.isArray() && !subs.expr.ty.isString())
				error("Phase 3-3 Array or String expected : in subsriptpostfix");
			fillExprType(subs.subscript, local);
			if (!subs.subscript.ty.equals(INT.getInstance()))
				error("Phase 3-3 INT expected : in subscriptpostfix");
			if (subs.expr.ty instanceof ARRAY)
				e.ty = ((ARRAY)subs.expr.ty).elementType;
			else e.ty = CHAR.getInstance();
			e.lvalue = subs.expr.lvalue & 1;
		} else
		if (e instanceof FunctionCall)
		{
			funCall = (FunctionCall)e;
			if (!(funCall.expr instanceof Id))
				error("Phase 3-3 not a function : in FunctionCall");
			entry = local.getEntry(((Id)funCall.expr).sym); 
			if (entry == null || (!(entry instanceof FunctionEntry)))
				error("Phase 3-3 no such function : in FunctionCall");
			if (funCall.args == null)
				if (!((FunctionEntry)entry).arr.isEmpty())
					error("Phase 3-3 arg(s) expected : in FunctionCall");			
			if (funCall.args != null)
			{
				if (((FunctionEntry)entry).arr.isEmpty())
					error("Phase 3-3 RPARN expected : in FunctionCall");			
				Iterator<Type> fIter = ((FunctionEntry)entry).arr.iterator();
				FunctionCallTest.test(fIter, funCall.args, local);
				if (fIter.hasNext())
					error("Phase 3-3 more arg expected : in FunctionCall");
			}
			e.ty = ((FunctionEntry)entry).returnType;
		} else
		if (e instanceof FieldPostfix)
		{
			fieldPost = (FieldPostfix)e;
			fillExprType(fieldPost.expr, local);
			e.lvalue = 1;
			if (fieldPost.expr.ty.isString() && (fieldPost.field.toString() == "length"))
				{ e.lvalue = 0; e.ty = INT.getInstance(); return; } else	
			if (fieldPost.expr.ty.isArray() && (fieldPost.field.toString() == "length"))
				{ e.lvalue = 0; e.ty = INT.getInstance(); return; } else	
			if (!fieldPost.expr.ty.isRecord())
				error("Phase 3-3 RECORD expected : in FieldPostfix");
			Type fieldType = ((RECORD)fieldPost.expr.ty).findSymbol(fieldPost.field);
			if (fieldType == null)
				error("Phase 3-3 no such field : in Fieldpostfix");
			e.ty = fieldType;	
		} else
		//unary_expr
		if (e instanceof UnaryExpr)
		{
			unary = (UnaryExpr)e;
			fillExprType(unary.expr, local);
			if (!unary.expr.ty.isInt())
				error("Phase 3-3 INT expected : in unaryexpr");
			e.ty = INT.getInstance();
		} else
		if (e instanceof NewRecord)
		{
			newRec = (NewRecord)e;
			e.ty = newRec.type.toType(local);
			if (e.ty == null)
				error("Phase 3-3 no such type : in newrecord");
		} else
		//mult_expr additive_expr relational_expr equality_expr
		//logical_and_expr logical_or_expr
		//assignment_expr expr
		if (e instanceof BinaryExpr)
		{
			// / * % -
			binary = (BinaryExpr)e;
			fillExprType(binary.l, local);
			fillExprType(binary.r, local);
			Type left = binary.l.ty;
			Type right = binary.r.ty;
			if (binary.op == BinaryOp.DIVIDE || binary.op == BinaryOp.MODULO || binary.op == BinaryOp.MULTIPLY || binary.op == BinaryOp.MINUS)
			{
				if (!(left.isInt() && right.isInt()))
					error("Phase 3-3 INT expected : in BinaryExpr");
				e.ty = INT.getInstance();
				return;
			}
			// +
			if (binary.op == BinaryOp.PLUS)
			{
				int ll = 2, rr = 2;
				if (left.isString()) ll = 3;
				if (left.isArray() || left.isRecord() || left.isNull()) ll = 4;
				if (right.isString()) rr = 3;
				if (right.isArray() || right.isRecord() || right.isNull()) rr = 4;
				int maxx = ll;
				if (rr > ll) maxx = rr;
				if (maxx == 4) 
					error("Phase 3-3 Illeagal Type for BinaryPLUS");
				if (maxx <= 2) e.ty = INT.getInstance(); else
				if (maxx == 3) e.ty = STRING.getInstance();
				return;
			} 
			// < <= > >=
			if (binary.op == BinaryOp.LESS || binary.op == BinaryOp.LESS_EQ || binary.op == BinaryOp.GREATER || binary.op == BinaryOp.GREATER_EQ)
			{
				e.ty = INT.getInstance();
				if (left.isInt() && right.isInt()) return;
				if (left.isChar() && right.isChar()) return;
				if (left.isString() && right.isString()) return;
				error("Phase 3-3 Illeagal type : in Binary1");
			}
			// == !=
			if (binary.op == BinaryOp.EQ || binary.op == BinaryOp.NEQ)
			{
				e.ty = INT.getInstance();				
				if (left.isInt() && right.isInt()) return;
				if (left.isChar() && right.isChar()) return;
				if (left.isString() && right.isString()) return;
				if (left.isArray() && right.isArray() && left.equals(right)) return;
				if (left.isRecord() && right.isRecord() && left.equals(right)) return;
				error("Phase 3-3 Illeagal type : in Binary2 Op:==");
			}
			// || &&
			if (binary.op == BinaryOp.AND || binary.op == BinaryOp.OR)
			{
				if ((!left.isInt()) || (!right.isInt()))
				{
					error("Phase 3-3 Illeagal type : in Binary3");
				}
				e.ty = INT.getInstance();
				return;
			}
			// =
			if (binary.op == BinaryOp.ASSIGN)
			{
				if (binary.l.lvalue == 0)
					error("Phase 3-3 lvalue expected : in binaryexpr");
				if (!left.equals(right))
					error("Phase 3-3 Type mismatch : in binaryexpr left : " + left + " right : " + right);
				e.ty = left;
				//e.lvalue = binary.l.lvalue;
				return;
			}
			// ,
			if (binary.op == BinaryOp.COMMA)
			{
				e.ty = right;
				return;
			}
		} else
		if (e instanceof ParenExpr)
		{
			parenExpr = (ParenExpr)e;
			fillExprType(parenExpr.e, local);
			parenExpr.ty = parenExpr.e.ty;
		} else
		error("phase 3-3 Expr Type unfound");
	}
	public static void stmtCheck(Stmt s, Env local, boolean inLoop)
	{
		if (s instanceof ExprStmt)
		{
			fillExprType(((ExprStmt)s).expr, local);
			//FOR TEST
			//System.out.println("  expr type:" + ((ExprStmt)s).expr.ty);
		} else
		if (s instanceof ContinueStmt)
		{
			if (!inLoop)
				error("Continue out loop");
		} else
		if (s instanceof BreakStmt)
		{
			if (!inLoop)
				error("Break out loop");
		} else
		if (s instanceof ReturnStmt)
		{
			ReturnStmt re = (ReturnStmt)s;
			fillExprType(re.expr, local);
			if (!funReturnType.equals(re.expr.ty))
				error("Phase 3-3 returntype mismatch");
		} else
		if (s instanceof ForStmt)
		{
			ForStmt f = (ForStmt)s;
			if (f.init != null)
				fillExprType(f.init, local);
			if (f.cond != null)
			{
				fillExprType(f.cond, local);
				if (!f.cond.ty.isInt())
					error("Phase 3-3 INT expected : in forstmt");
			}
			if (f.step != null)
				fillExprType(f.step, local);
			stmtCheck(f.body, local, true);
		} else
		if (s instanceof WhileStmt)
		{
			WhileStmt w = (WhileStmt)s;
			fillExprType(w.cond, local);
			if (!w.cond.ty.isInt())
				error("Phase 3-3 INT expected : in whilestmt");
			stmtCheck(w.body, local, true);
		} else
		if (s instanceof IfStmt)
		{
			IfStmt i = (IfStmt)s;
			fillExprType(i.cond, local);
			if (!i.cond.ty.isInt())
				error("Phase 3-3 INT expected : in ifstmt");
			stmtCheck(i.thenPart, local, inLoop);
			if (i.elsePart != null)
				stmtCheck(i.elsePart, local, inLoop);
		} else
		if (s instanceof CompoundStmt)
		{
			CompoundStmt com = (CompoundStmt)s;
			Iterator<Stmt> sIter = com.stmts.statements.iterator();
			while (sIter.hasNext())
				stmtCheck(sIter.next(), local, inLoop);
		} else
		error("Phase 3-3 Stmt Type unfound");
	}
	public static void fillGlobalRecordName(TranslationUnit t)
	{
		Iterator<ExternalDecl> iter = (t.externalDeclarations).iterator();
		//We will also find if there's MAIN
		int haveMain = 0;
		while (iter.hasNext())
		{
			ExternalDecl tmp = iter.next();
			if (tmp instanceof FunctionDef)
			{
				if (((FunctionDef)tmp).head.functionName.toString() == "main")
					haveMain = 1;
			} else
			if (tmp instanceof RecordDef)
			{
				if (global.getEntry(((RecordDef)tmp).name) != null)
				{
					error("Phase2-1 Two same name Record definition");
				}
				global.putEntry(((RecordDef)tmp).name, new TypeEntry(((RecordDef)tmp).name.toString()));
			}
		}
		if (haveMain == 0) error("Phase2-1 No main method");
	}

	public static void fillGlobalRecordAndFunction(TranslationUnit t)
	{
		Iterator<ExternalDecl> iter = (t.externalDeclarations).iterator();
		while (iter.hasNext())
		{
			ExternalDecl tmp = iter.next();
			if (tmp instanceof FunctionDef)
			{
				FunctionDef fun = (FunctionDef)tmp;
				Symbol nn = fun.head.functionName;
				//remember size
				CodeGen.funArgs.put(nn.toString(), fun.head.parameterList.parameterDeclarations.size());
				if (global.getEntry(nn) != null) 
					error("Phase2-2 Two same name function : " + nn);
				FunctionEntry now = new FunctionEntry(nn.toString());
				if (fun.head.type.toType(global) == null)
					error("Phase2-2 wrong return type : functiondef");
				now.returnType = fun.head.type.toType(global);
				Iterator<ParameterDecl> iter3 = fun.head.parameterList.parameterDeclarations.iterator();
				while (iter3.hasNext())
				{
					ParameterDecl para = iter3.next();
					if (para.type.toType(global) == null) 
						error("Phase2-2 no such RECORD type : in functiondef");
					now.arr.add(para.type.toType(global));
				}
				global.putEntry(nn, now);
				//for TEST
				//System.out.println(now);
			} else
			if (tmp instanceof PrototypeDecl)
			{
				FunctionHead he = ((PrototypeDecl)tmp).head;
				Symbol nn = he.functionName;
				CodeGen.funArgs.put(nn.toString(), he.parameterList.parameterDeclarations.size());
				if (global.getEntry(nn) != null) 
					error("Phase2-2 Two same name function");
				FunctionEntry now = new FunctionEntry(nn.toString());
				if (he.type.toType(global) == null)
					error("Phase2-2 wrong return type : functiondef");
				now.returnType = he.type.toType(global);
				Iterator<ParameterDecl> iter3 = he.parameterList.parameterDeclarations.iterator();
				while (iter3.hasNext())
				{
					ParameterDecl para = iter3.next();
					if (para.type.toType(global) == null) 
						error("Phase 2-2 no such RECORD type : in prototypedecl");
					if (global.getEntry(para.name) != null)
						error("Phase 2-2 same name in global : in prototypedecl");
					now.arr.add(para.type.toType(global));
				}
				global.putEntry(nn, now);
				//for TEST
				//System.out.println(now);
			} else
			if (tmp instanceof RecordDef)
			{
				RECORD now = (RECORD)((TypeEntry)(global.getEntry(((RecordDef)tmp).name))).type;				
				Iterator<VariableDecl> iter1 = ((RecordDef)tmp).fields.variableDeclarations.iterator();
				int adder = 0;
				while (iter1.hasNext())
				{
					VariableDecl decl = iter1.next();
					Iterator<Symbol> iter2 = decl.ids.ids.iterator();
					Type type = decl.type.toType(global);
					if (type == null)
						error("Phase2-2 no such RECORD type : in record def");
					while (iter2.hasNext())
					{
						Symbol n = iter2.next();
						if (now.findSymbol(n) != null) 
							error("Phase2-2 same name field in record");
						now.fields.add(new RECORD.RecordField(type, n, adder++));
					}
				}
				//for TEST
				//System.out.println(" RECORD " + now.name + " : ");
				//System.out.println(now.fields);
			} 
		}	
	}

	public static void traverse(TranslationUnit t)
	{
		Iterator<ExternalDecl> iter = (t.externalDeclarations).iterator();
		while (iter.hasNext())
		{
			ExternalDecl tmp = iter.next();
			if (tmp instanceof FunctionDef)
			{
				//for TEST
				//System.out.println("entering function");
				Env local = global.clone();
				//add functionhead to local
				FunctionDef fun = (FunctionDef)tmp;
				funReturnType =
					fun.head.type.toType(local);
				if (fun.head.parameterList.parameterDeclarations != null)
				{
					Iterator<ParameterDecl> iter3 = fun.head.parameterList.parameterDeclarations.iterator();
					while (iter3.hasNext())
					{
						ParameterDecl para = iter3.next();
						Symbol nn = para.name;
						Entry eee = local.getEntry(nn);
						if ((eee != null)) 
							error("Phase 2-3 two same variable namee : in functiondef " + fun.head);
						local.putEntry(nn, new VariableEntry(nn, para.type.toType(local)));
					}
				}
				//add variabledecl to local
				if (fun.vardec != null)
				{
					Iterator<VariableDecl> iter4 = fun.vardec.variableDeclarations.iterator();
					while (iter4.hasNext())
					{
						VariableDecl varDecl = iter4.next();
						if (varDecl.type.toType(local) == null)
							error("Phase 2-3 no such RECORD type : in functionvardecl");
						Iterator<Symbol> iter5 = varDecl.ids.ids.iterator();
						while (iter5.hasNext())
						{
							Symbol nn = iter5.next();
							if (local.getEntry(nn) != null)
								error("Phase 2-3 two same variable name : in functionvardecl");
							local.putEntry(nn, new VariableEntry(nn, varDecl.type.toType(local)));
						}
					}
				}
				//traverse Stmts
				if (fun.stmts == null)
					error("Phase 2-3 no stmts in functiondef");
				Iterator<Stmt> sIter = fun.stmts.statements.iterator();
				while (sIter.hasNext())
				{
					Stmt stmt = sIter.next();
					stmtCheck(stmt, local, false);
					//TO DO
				}
				//for TEST
				//System.out.println("leaving function");
				//FOR TEST
				//System.out.println("local : ");
				//System.out.println(local);
			}
		}
	}
}
