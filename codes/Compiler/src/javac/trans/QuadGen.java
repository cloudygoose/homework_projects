package javac.trans;
import javac.symbol.*;
import javac.type.Type;
import javac.absyn.*;
import javac.parser.SemanticTest;
import javac.quad.*;
import javac.env.*;
import javac.codegen.*;
import javac.type.*;

import java.util.*;
public class QuadGen
{
	public static int debug;
	public static FunFrame currentFrame;
	public static ArrayList<FunFrame> frames;
	public static FunFrag funFrag;
	public static ArrayList<Quad> quads; 
	public static Stack<Label> goTrue;
	public static Stack<Label> goFalse;
	public static Stack<Label> goBreak;
	public static Stack<Label> goContinue;
	public static HashMap<String, LabelAddress> dataFrags;
	public static HashMap<Symbol, FunFrag> funFrags;
	public static Env global;
	public static void initialize()
	{
		currentFrame = null;
		frames = new ArrayList<FunFrame>();
		quads = null;
		goTrue = new Stack<Label>();
		goFalse = new Stack<Label>();
		goBreak = new Stack<Label>();
		goContinue = new Stack<Label>();		
		dataFrags = new HashMap<String, LabelAddress>();
		funFrags = new HashMap<Symbol, FunFrag>();
		global = SemanticTest.global;
		debug = 0;
	}
	public static void addDebug(String s)
	{
		if (debug == 1)
		{
			quads.add(new Debug(s));
		}
	}
	public static void error(String s)
	{
        System.err.println("Semantic error");
        System.err.println(s);
        System.exit(1);
	}
	public static Temp getTemp(Oprand oprand)
	{
		if (oprand instanceof TempOprand)
		{
			return ((TempOprand)oprand).temp;
		} else
		{
			Temp tmp = new Temp();
			quads.add(new Move(new TempOprand(tmp), oprand));
			return tmp;
		}
	}
	public static void funFill(Expr e, LinkedList<Temp> paraList)
	{
		if (e instanceof BinaryExpr)
		{
			BinaryExpr binary = (BinaryExpr)e;
			if (binary.op == BinaryOp.COMMA)
			{
				funFill(binary.l, paraList);
				Temp t1 = getTemp(transExpr(binary.r));
				paraList.add(t1);
				return;
			}
		} 
		Temp t1 = getTemp(transExpr(e));
		paraList.add(t1);
	}
	public static Oprand transExpr(Expr expr)
	{
		return transExpr(expr, null);
	}
	public static Oprand transExpr(Expr expr, Temp dst)
	{
		if (expr == null) return new Const(0);
		if (expr instanceof BinaryExpr)
		{
			BinaryExpr binary = (BinaryExpr)expr;
			Oprand left, right;
			if (binary.op == BinaryOp.COMMA)
			{
				left = transExpr(binary.l);
				right = transExpr(binary.r);
				return right;
			} else
			if (binary.op == BinaryOp.ASSIGN)
			{
				left = transExpr(binary.l);
				if (left instanceof TempOprand)
				{
					//System.err.println("left TempOprand!!!!!!!!!!!!");
					//System.err.println("Oh Yeah!!!!!!!!!!!!");
					right = transExpr(binary.r, ((TempOprand)left).temp);
					if ((right instanceof TempOprand) && ((TempOprand)right).temp.equals(((TempOprand)left).temp))
						return left;
					//System.err.println("Oh No!!!!!!!!!!!!");
					quads.add(new Move(left, right));						
					if (right instanceof Const) return right;
					return left;
				}
				right = transExpr(binary.r);
				quads.add(new Move(left, right));
				return left;
			} else
			if (binary.op == BinaryOp.OR)
			{
				Label l1 = new Label();
				Label l2 = new Label();
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				left = transExpr(binary.l);
				quads.add(new Branch(l1, left, new Const(0), BinaryOp.NEQ));
//				if (!goTrue.isEmpty())
//					quads.add(new Branch(goTrue.peek(), left, new Const(0), BinaryOp.NEQ));
				right = transExpr(binary.r);
				quads.add(new Move(new TempOprand(tmp), new Const(0)));
				quads.add(new Branch(l2, right, new Const(0), BinaryOp.EQ));				
				quads.add(new LabelQuad(l1));
				quads.add(new Move(new TempOprand(tmp), new Const(1)));
				quads.add(new LabelQuad(l2));
				return new TempOprand(tmp);
			} else
			if (binary.op == BinaryOp.AND)
			{
				Label l1 = new Label();
				Label l2 = new Label();
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				left = transExpr(binary.l);
				quads.add(new Branch(l1, left, new Const(0), BinaryOp.EQ));
//				if (!goTrue.isEmpty())
//					quads.add(new Branch(goTrue.peek(), left, new Const(0), BinaryOp.NEQ));
				right = transExpr(binary.r);
				quads.add(new Move(new TempOprand(tmp), new Const(1)));
				quads.add(new Branch(l2, right, new Const(0), BinaryOp.NEQ));				
				quads.add(new LabelQuad(l1));
				quads.add(new Move(new TempOprand(tmp), new Const(0)));
				quads.add(new LabelQuad(l2));
				return new TempOprand(tmp);
			} else
			if (binary.op == BinaryOp.EQ)
			{
				left = transExpr(binary.l);
				right = transExpr(binary.r);
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				if (binary.l.ty.isString())
				{
					Temp t1 = getTemp(left);
					Temp t2 = getTemp(right);
					Temp[] ca = new Temp[2];
					ca[0] = t1; ca[1] = t2;
					quads.add(new Call(new Label("_strcmp"), ca, tmp));
					quads.add(new BinOp(new TempOprand(tmp), new TempOprand(tmp), new Const(0), BinaryOp.EQ));
				} else
				{
					quads.add(new BinOp(new TempOprand(tmp), left, right, binary.op));
				}
				return new TempOprand(tmp);
			} else
			if (binary.op == BinaryOp.NEQ)
			{
				left = transExpr(binary.l);
				right = transExpr(binary.r);
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				if (binary.l.ty.isString())
				{
					Temp t1 = getTemp(left);
					Temp t2 = getTemp(right);
					Temp[] ca = new Temp[2];
					ca[0] = t1; ca[1] = t2;
					quads.add(new Call(new Label("_strcmp"), ca, tmp));
					quads.add(new BinOp(new TempOprand(tmp), new TempOprand(tmp), new Const(0), BinaryOp.NEQ));
				} else
				{
					quads.add(new BinOp(new TempOprand(tmp), left, right, binary.op));
				}
				return new TempOprand(tmp);
			} else
			if (binary.op == BinaryOp.LESS)
			{
				left = transExpr(binary.l);
				right = transExpr(binary.r);
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				if (binary.l.ty.isString())
				{
					Temp t1 = getTemp(left);
					Temp t2 = getTemp(right);
					Temp[] ca = new Temp[2];
					ca[0] = t1; ca[1] = t2;
					quads.add(new Call(new Label("_strcmp"), ca, tmp));
					quads.add(new BinOp(new TempOprand(tmp), new TempOprand(tmp), new Const(-1), BinaryOp.EQ));
				} else
				{
					quads.add(new BinOp(new TempOprand(tmp), left, right, binary.op));
				}
				return new TempOprand(tmp);
			} else
			if (binary.op == BinaryOp.LESS_EQ)
			{
				left = transExpr(binary.l);
				right = transExpr(binary.r);
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				if (binary.l.ty.isString())
				{
					Temp t1 = getTemp(left);
					Temp t2 = getTemp(right);
					Temp[] ca = new Temp[2];
					ca[0] = t1; ca[1] = t2;
					quads.add(new Call(new Label("_strcmp"), ca, tmp));
					quads.add(new BinOp(new TempOprand(tmp), new TempOprand(tmp), new Const(0), BinaryOp.LESS_EQ));
				} else
				{
					quads.add(new BinOp(new TempOprand(tmp), left, right, binary.op));
				}
				return new TempOprand(tmp);
			} else
			if (binary.op == BinaryOp.GREATER)
			{
				left = transExpr(binary.l);
				right = transExpr(binary.r);
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				if (binary.l.ty.isString())
				{
					Temp t1 = getTemp(left);
					Temp t2 = getTemp(right);
					Temp[] ca = new Temp[2];
					ca[0] = t1; ca[1] = t2;
					quads.add(new Call(new Label("_strcmp"), ca, tmp));
					quads.add(new BinOp(new TempOprand(tmp), new TempOprand(tmp), new Const(1), BinaryOp.EQ));
				} else
				{
					quads.add(new BinOp(new TempOprand(tmp), left, right, binary.op));
				}
				return new TempOprand(tmp);
			} else
			if (binary.op == BinaryOp.GREATER_EQ)
			{
				left = transExpr(binary.l);
				right = transExpr(binary.r);
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				if (binary.l.ty.isString())
				{
					Temp t1 = getTemp(left);
					Temp t2 = getTemp(right);
					Temp[] ca = new Temp[2];
					ca[0] = t1; ca[1] = t2;
					quads.add(new Call(new Label("_strcmp"), ca, tmp));
					quads.add(new BinOp(new TempOprand(tmp), new TempOprand(tmp), new Const(0), BinaryOp.GREATER_EQ));
				} else
				{
					quads.add(new BinOp(new TempOprand(tmp), left, right, binary.op));
				}
				return new TempOprand(tmp);
			} else
			if (binary.op == BinaryOp.PLUS)
			{
				left = transExpr(binary.l);
				right = transExpr(binary.r);
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				if (binary.l.ty.isString() || binary.r.ty.isString())
				{
					
					Temp[] ca = new Temp[2];
					Temp t1;
					Temp t2;
					if (binary.l.ty.isString())
					{
						t1 = getTemp(left); 
					} else
					if (binary.l.ty.isInt())
					{
						t1 = new Temp();
						Temp[] c1 = new Temp[1];
						c1[0] = getTemp(left);
						quads.add(new Call(new Label("_intToString"), c1, t1)); 
					} else
					{
						t1 = new Temp();
						Temp[] c1 = new Temp[1];
						c1[0] = getTemp(left);
						quads.add(new Call(new Label("_charToString"), c1, t1)); 						
					}
					if (binary.r.ty.isString())
					{
						t2 = getTemp(right); 
					} else
					if (binary.r.ty.isInt())
					{
						t2 = new Temp();
						Temp[] c1 = new Temp[1];
						c1[0] = getTemp(right);
						quads.add(new Call(new Label("_intToString"), c1, t2)); 
					} else
					{
						t2 = new Temp();
						Temp[] c1 = new Temp[1];
						c1[0] = getTemp(right);
						quads.add(new Call(new Label("_charToString"), c1, t2)); 						
					}

					ca[0] = t1; ca[1] = t2;
					quads.add(new Call(new Label("_strcat"), ca, tmp));
					return new TempOprand(tmp);
				} else
				{
					quads.add(new BinOp(new TempOprand(tmp), left, right, binary.op));
				}
				return new TempOprand(tmp);
			} else
			if (binary.op == BinaryOp.MINUS || binary.op == BinaryOp.MULTIPLY
				|| binary.op == BinaryOp.DIVIDE || binary.op == BinaryOp.MODULO)
			{
				left = transExpr(binary.l);
				right = transExpr(binary.r);
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				quads.add(new BinOp(new TempOprand(tmp), left, right, binary.op));
				return new TempOprand(tmp);
			} else
			error("Phase 3 BinaryOp unmatch");
		} else
		if (expr instanceof NewRecord)
		{
			NewRecord newRecord = (NewRecord)expr;
			RECORD record = (RECORD)((TypeEntry)global.getEntry(((IdType)newRecord.type).sym)).type; 
			Temp tmp;
			if (dst != null)
				tmp = dst;
			else
				tmp = new Temp();
			Temp t1 = new Temp();
			Temp[] ca = new Temp[1];
			ca[0] = t1;
			quads.add(new Move(new TempOprand(t1), new Const(record.fields.size() * 4)));
			quads.add(new Call(new Label("_malloc"), ca, tmp));
			return new TempOprand(tmp);
		} else
		if (expr instanceof UnaryExpr)
		{
			UnaryExpr unary = (UnaryExpr)expr;
			if (unary.op == UnaryOp.PLUS)
			{
				Oprand oprand = transExpr(unary.expr);
				return oprand;
			} else
			if (unary.op == UnaryOp.MINUS)
			{
				Temp t1 = getTemp(transExpr(unary.expr));
				quads.add(new BinOp(new TempOprand(t1), new Const(0), new TempOprand(t1), BinaryOp.MINUS));
				return new TempOprand(t1);
			} else
			if (unary.op == UnaryOp.NOT)
			{
				Temp t1 = getTemp(transExpr(unary.expr));
				quads.add(new BinOp(new TempOprand(t1), new Const(0), new TempOprand(t1), BinaryOp.EQ));
				return new TempOprand(t1);
			} else
			error("Phase 3 UnaryOp unmatch");
		} else
		if (expr instanceof SubscriptPostfix)
		{
			SubscriptPostfix subs = (SubscriptPostfix)expr;
			Temp t1 = getTemp(transExpr(subs.expr));
			Temp t3 = new Temp();
			quads.add(new Move(new TempOprand(t3), new TempOprand(t1)));
			Temp t2 = getTemp(transExpr(subs.subscript));
			Temp t4 = new Temp();
			quads.add(new Move(new TempOprand(t4), new TempOprand(t2)));
			if (subs.expr.ty.isArray())
				quads.add(new BinOp(new TempOprand(t4), new TempOprand(t4), new Const(4), BinaryOp.MULTIPLY));
			quads.add(new BinOp(new TempOprand(t3), new TempOprand(t3), new TempOprand(t4), BinaryOp.PLUS));
			if (subs.expr.ty.isArray())
				return new Mem(t3, 4);
			Mem nn = new Mem(t3);
			nn.length = 1;
			return nn;
		} else
		if (expr instanceof FunctionCall)
		{
			FunctionCall functionCall = (FunctionCall)expr;
			if (functionCall.args == null)
			{
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				Temp[] ca = new Temp[0];
				quads.add(new Call(new Label(((Id)functionCall.expr).sym.toString()), ca, tmp));
				return new TempOprand(tmp); 
			} else
			{
				LinkedList<Temp> paraList = new LinkedList<Temp>();
				funFill(functionCall.args, paraList);
				Temp[] ca = new Temp[paraList.size()];
				Iterator<Temp> iter = paraList.iterator();
				int xx = 0;
				while (iter.hasNext()) ca[xx++] = iter.next();
				Temp tmp;
				if (dst != null)
					tmp = dst;
				else
					tmp = new Temp();
				if (functionCall.opt) tmp = null;
				quads.add(new Call(new Label(((Id)functionCall.expr).sym.toString()), ca, tmp));
				return new TempOprand(tmp); 
			}
		} else
		if (expr instanceof FieldPostfix)
		{
			FieldPostfix fieldPostfix = (FieldPostfix)expr;
			Temp t1 = getTemp(transExpr(fieldPostfix.expr));
			Symbol sym = fieldPostfix.field;
			if (sym.toString() == "length")
			{
				if (fieldPostfix.expr.ty.isArray())
				{
					return new Mem(t1);
				}
				//It is a string.
				Temp tmp = new Temp();
				Temp[] ca = new Temp[1];
				ca[0] = t1;
				quads.add(new Call(new Label("_strlen"), ca, tmp));
				return new TempOprand(tmp);
			} 
			RECORD record = (RECORD)fieldPostfix.expr.ty;
			int i;
			i = record.findSymbolIndex(sym);
			return new Mem(t1, i * 4);
		} else
		if (expr instanceof Id)
		{
			Id id = (Id)expr;
			Temp t1 = funFrag.map.get(id.sym);
			return new TempOprand(t1);
		} else
		if (expr instanceof Null)
		{
			return new Const(0);
		} else
		if (expr instanceof IntLiteral)
		{
			return new Const(((IntLiteral)expr).i);
		} else
		if (expr instanceof CharLiteral)
		{
			return new Const(((CharLiteral)expr).c);			
		} else
		if (expr instanceof StringLiteral)
		{
			String s = ((StringLiteral)expr).s;
			LabelAddress la = dataFrags.get(s);
			if (la != null) return la;
			la = new LabelAddress(new Label());
			dataFrags.put(s, la);
			return la;
		} else
		if (expr instanceof ParenExpr)
		{
			return transExpr(((ParenExpr)expr).e);
		} else
		if (expr instanceof NewArray)
		{
			Temp t1 = getTemp(transExpr(((NewArray)expr).expr));
			Temp t4 = new Temp();
			Temp t3 = new Temp();
			quads.add(new Move(new TempOprand(t4), new TempOprand(t1)));
			quads.add(new Move(new TempOprand(t3), new TempOprand(t1)));			
			quads.add(new BinOp(new TempOprand(t4), new TempOprand(t4), new Const(4), BinaryOp.MULTIPLY));
			quads.add(new BinOp(new TempOprand(t4), new TempOprand(t4), new Const(4), BinaryOp.PLUS));
			Temp tmp;
			if (dst != null)
				tmp = dst;
			else
				tmp = new Temp();
			Temp[] ca = new Temp[1];
			ca[0] = t4;
			quads.add(new Call(new Label("_malloc"), ca, tmp));
			quads.add(new Move(new Mem(tmp), new TempOprand(t3)));
			return new TempOprand(tmp);
		} else
		{
			System.err.println(expr);
			error("Phase 3" + " Expr unmatch");
		}
		return null;
	}
	
	public static void transStmt(Stmt stmt)
	{
		if (stmt == null)
		{
			return;
		}
		if (stmt instanceof CompoundStmt)
		{
			Iterator<Stmt> iter = ((CompoundStmt)stmt).stmts.statements.iterator();
			while (iter.hasNext())
				transStmt(iter.next());
		} else
		if (stmt instanceof ExprStmt)
		{
			if (((ExprStmt)stmt).getExpr() instanceof FunctionCall)	{
				((FunctionCall)((ExprStmt)stmt).getExpr()).opt = true;
			}
			transExpr(((ExprStmt)stmt).getExpr());
		} else 
		if (stmt instanceof IfStmt)
		{
			addDebug("IF");			
			IfStmt ifStmt = (IfStmt)stmt;
			Label l2 = new Label();
			Label l3 = new Label();
			
//			goTrue.add(l1);
//			goFalse.add(l2);
			Oprand e = transExpr(ifStmt.cond);			
//			goTrue.pop();
//			goFalse.pop();

			quads.add(new Branch(l2, e, new Const(0), BinaryOp.EQ));
//			quads.add(new LabelQuad(l1));
			transStmt(ifStmt.thenPart);
			quads.add(new Jump(l3));
			quads.add(new LabelQuad(l2));
			transStmt(ifStmt.elsePart);
			quads.add(new LabelQuad(l3));			
		} else
		if (stmt instanceof WhileStmt)
		{
			addDebug("WHILE");
			WhileStmt whileStmt = (WhileStmt)stmt;
			Label l1 = new Label();
			Label l2 = new Label();
			Label l3 = new Label();
			
			goContinue.add(l1);
			goBreak.add(l3);
			
			quads.add(new LabelQuad(l1));
//			goTrue.add(l2);
//			goFalse.add(l3);
			Oprand e = transExpr(whileStmt.cond);
//			goTrue.pop();
//			goFalse.pop();
			quads.add(new Branch(l3, e, new Const(0), BinaryOp.EQ));
			quads.add(new LabelQuad(l2));
			transStmt(whileStmt.body);
			quads.add(new Jump(l1));
			quads.add(new LabelQuad(l3));
			
			goContinue.pop();
			goBreak.pop();
		} else
		if (stmt instanceof ForStmt)
		{
			addDebug("FOR");
			ForStmt forStmt = (ForStmt)stmt;
			Label l1 = new Label();
			Label l2 = new Label();
			Label l3 = new Label();
			
			goContinue.add(l1);
			goBreak.add(l3);
			
			transExpr(forStmt.init);
			quads.add(new LabelQuad(l1));
			if (forStmt.cond instanceof BinaryExpr)
			{
				BinaryExpr binary = (BinaryExpr)forStmt.cond;
				if (binary.op == BinaryOp.LESS)
				{
					quads.add(new Branch(l3, transExpr(binary.l), transExpr(binary.r), BinaryOp.GREATER_EQ));
				} else
				{
					Oprand e =  transExpr(forStmt.cond);
					quads.add(new Branch(l3, e, new Const(0), BinaryOp.EQ));
				}
			}
			quads.add(new LabelQuad(l2));
			transStmt(forStmt.body);
			transExpr(forStmt.step);
			quads.add(new Jump(l1));
			quads.add(new LabelQuad(l3));			
			goContinue.pop();
			goBreak.pop();
		}else
		if (stmt instanceof ReturnStmt)
		{
			Oprand e = transExpr(((ReturnStmt)stmt).expr);
			quads.add(new Return(e));
		}else
		if (stmt instanceof BreakStmt)
		{
			quads.add(new Jump(goBreak.peek()));
		}else
		if (stmt instanceof ContinueStmt)
		{
			quads.add(new Jump(goContinue.peek()));
		}else
		{
	        error("Phase 3 Stmt unmatch");
		}
	}
	public static void transFunction(FunctionDef fun)
	{
		currentFrame = new FunFrame(fun.toString());
		frames.add(currentFrame);
		quads = currentFrame.quads;
		FunctionHead head;
		Symbol s;
		//add FunLabel
		quads.add(new LabelQuad(new Label(fun.head.toString())));
		head = fun.head;
		funFrag = new FunFrag();
		funFrags.put(head.functionName, funFrag);
		//put parm to Frag
		Iterator<ParameterDecl> iter2 = head.parameterList.parameterDeclarations.iterator();
		while (iter2.hasNext())
		{
			s = iter2.next().name;
			Temp tt = new Temp();
			currentFrame.argTemps.add(tt);
			funFrag.map.put(s, tt);
		}
		//put varDec to Frag
		if (fun.vardec != null)
		{
			Iterator<VariableDecl> iter3 = fun.vardec.variableDeclarations.iterator();
			while (iter3.hasNext())
			{
				Iterator<Symbol> iter4 = iter3.next().ids.ids.iterator();
				while (iter4.hasNext())
				{
					s = iter4.next();
					funFrag.map.put(s, new Temp());
				}
			}
		}
		//start trans Stmts
		if (fun.stmts != null)
		{
			Iterator<Stmt> iter3 = fun.stmts.statements.iterator();
			while (iter3.hasNext())
			{
				transStmt(iter3.next());
			}
		}
	}
	public static void traverse(TranslationUnit tree)
	{
		System.out.println("START intermediate");
		FunctionDef fun;
		Iterator<ExternalDecl> iter = (tree.externalDeclarations).iterator();
		while (iter.hasNext())
		{
			ExternalDecl tmp = iter.next();
			if (tmp instanceof FunctionDef)
			{
				fun = (FunctionDef)tmp;
				if (fun.toString() == "main") transFunction(fun);
			}
		}
		iter = (tree.externalDeclarations).iterator();
		while (iter.hasNext())
		{
			ExternalDecl tmp = iter.next();
			if (tmp instanceof FunctionDef)
			{
				fun = (FunctionDef)tmp;
				if (fun.toString() != "main") transFunction(fun);
			}
		}
	}
	public static void printQuads()
	{
		if (!goTrue.isEmpty() ||
			!goFalse.isEmpty() ||
			!goContinue.isEmpty() ||
			!goBreak.isEmpty())
			{
				System.err.println("Stack error");
				System.exit(1);
			}
		Iterator<FunFrame> iter = frames.iterator();
		while (iter.hasNext())
		{
			FunFrame now = iter.next();
			System.out.print(now);
			System.out.println("localregs: " + now.localregs);
			System.out.println();
		}
	}
}