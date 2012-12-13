package javac.codegen;

import javac.absyn.BinaryOp;
import javac.quad.*;
import javac.registers.RegAlloc;
import javac.trans.*;
import javac.registers.*;

import java.io.*;
import java.util.*;

public class CodeGen
{
	public static int colorNum = 16;
	public static FunFrame currentFrame;
	public static ArrayList<FunFrame> frames;
	public static HashMap<String, Integer> funArgs = new HashMap<String, Integer>();
	public static void initialize()
	{	
		frames = QuadGen.frames;
	}
	public static void regAlloc()
	{
		try
		{
			PrintWriter outt = new PrintWriter("blocks.txt");
			PrintWriter outt2 = new PrintWriter("graphs.txt");
			Iterator<FunFrame> iter = frames.iterator();
			while (iter.hasNext())
			{
				FunFrame frame = iter.next();
				RegAlloc.initialize(frame);
				RegAlloc.setBlockGoto(frame);
				Iterator<BasicBlock> iter2 = frame.blocks.iterator();
				while (iter2.hasNext())
				{
					BasicBlock b = iter2.next();
					b.setDef();
					b.setUse();
				}
				RegAlloc.computeInAndOut(frame);
				iter2 = frame.blocks.iterator();
				while (iter2.hasNext())
					iter2.next().computeLivenessAndEdges();
				
				Graph.setColor(frame, colorNum);
				//OUTPUT to blocks.txt
				outt.println("Frame : " + frame.name);
				outt.println("All temps : "+ frame.allTemps);
				outt2.println("Frame : " + frame.name);
				outt2.println("All temps : ");
				for (int i = 0;i < frame.allTemps.size();i++)
				{
					outt2.print(frame.allTemps.get(i) + " : " + frame.allTemps.get(i).color + " \t\t");
					if (i % 5 == 0 && i != 0) outt2.println();
				}
				outt2.println();
				outt2.println("Edges : ");
				iter2 = frame.blocks.iterator();
				while (iter2.hasNext())
				{
					BasicBlock block = iter2.next();
					outt.println(block.toString() + " :");
					Iterator<Asm> iter3 = block.asmList.iterator();
					while (iter3.hasNext())
					{
						Asm asm = iter3.next();
						outt.println(asm.toString() + " : " + asm.num + " live : " + asm.liveSet);
					}
					outt.println("useSet : ");
					outt.println(block.useSet);
					outt.println("defSet : ");
					outt.println(block.defSet);
					outt.println("gotoList : ");
					outt.println(block.gotoList);
					outt.println("inSet : ");
					outt.println(block.inSet);
					outt.println("outSet : ");
					outt.println(block.outSet);
					for (int i = 0;i < frame.allTemps.size();i++)
					{
						outt2.println(frame.allTemps.get(i) + ":");
						outt2.println(frame.allTemps.get(i).edges);
					}
				}
			}
			outt.close();
			outt2.close();
		}
        catch (Exception e)   
        {  
            e.printStackTrace();  
        }  
	}
	public static void output(String tt)
	{
		try
		{
			PrintWriter outt = new PrintWriter(tt);
			outt.println("\t.text");
			outt.println("\t.align 2");
			outt.println("\t.globl main");
			Iterator<FunFrame> iter2 = frames.iterator();
			while (iter2.hasNext())
			{
				Code.currentFrame = iter2.next();
				Iterator<Asm> iter = Code.currentFrame.codes.iterator();
				while (iter.hasNext())
				{
					Asm a = iter.next();
					outt.print(a.toCode());
				}
			}
			outt.close();
			outt = new PrintWriter("gene.txt");
			outt.println("\t.text");
			outt.println("\t.align 2");
			outt.println("\t.globl main");
			iter2 = frames.iterator();
			while (iter2.hasNext())
			{	
				Code.currentFrame = iter2.next();
				Iterator<Asm> iter = Code.currentFrame.codes.iterator();
				while (iter.hasNext())
					outt.print(iter.next().toString());
			}
			outt.close();
		}
        catch (Exception e)   
        {  
            e.printStackTrace();  
        }  
	}
	public static void error(String s)
	{
        System.err.println("CodeGen error");
        System.err.println(s);
        System.exit(1);
	}
	public static void loadNative()
	{
		Scanner in = new Scanner(new BufferedInputStream(CodeGen.class.getResourceAsStream("native.eee")));
		while (in.hasNext())
		{
			add(in.nextLine());
		}
		in.close();
	}
	public static void add(String s)
	{
		currentFrame.add(new Asm(s));
	}
	public static void add(Asm a)
	{
		currentFrame.add(a);
	}
	public static Temp toTemp(Temp t1)
	{
		return t1;
	}
	public static Temp toTemp(Oprand op)
	{
		if (op instanceof Mem)
		{
			Mem mem = (Mem)op;
			Temp t1 = toTemp(new TempOprand(mem.base));
			Temp t0 = new Temp(currentFrame);
			if (mem.length == 1)
				add(new LbCode(t0, mem.offset, t1));
			else
				add(new LwCode(t0, mem.offset, t1));
			return t0;
		} else
		if (op instanceof TempOprand)
		{
			return ((TempOprand)op).temp;
		} else
		if (op instanceof Const)
		{
			Const con = (Const)op;
			Temp t0 = new Temp(currentFrame);
			add(new LiCode(t0, con.value));
			return t0;
		} else
		if (op instanceof LabelAddress)
		{
			LabelAddress add = (LabelAddress)op;
			Temp t0 = new Temp(currentFrame);
			add(new LaCode(t0, add.label));
			return t0;
		} else
		error("Oprand mismarch");
		return new Temp();
	}
	public static void goQuad(Quad quad)
	{
		if (quad instanceof BinOp)
		{
			//save result to t3
			BinOp binary = (BinOp)quad;	
			if (binary.left instanceof TempOprand 
				&& binary.right instanceof Const && (binary.op == BinaryOp.PLUS))
			{
				if (binary.dst instanceof TempOprand)
					add(new AddiCode(((TempOprand)binary.dst).temp, 
									((TempOprand)binary.left).temp,
									((Const)binary.right).value));
				else
				{
					Temp t3 = new Temp(currentFrame);
					add(new AddiCode(t3, 
							((TempOprand)binary.left).temp,
							((Const)binary.right).value));
					Mem mem = (Mem)binary.dst;
					Temp t4 = toTemp(mem.base);
					if (mem.length == 4)
						add(new SwCode(t3, mem.offset, t4));
					else
						add(new SbCode(t3, mem.offset, t4));
				}
				return;
			}
			
			if (binary.left instanceof TempOprand 
					&& binary.right instanceof Const && (binary.op == BinaryOp.MULTIPLY) 
					&& ((Const)binary.right).value == 4
					&& binary.dst instanceof TempOprand)
				{
					TempOprand ll = (TempOprand)binary.dst;
					TempOprand rr = (TempOprand)binary.left;
					if (ll.temp.equals(rr))
					{
						add(new Li2Code(ll.temp));
						return;
					}
				}

			Temp t1 = toTemp(binary.left);		//fake
			Temp t2 = toTemp(binary.right);	//fake
			if (binary.dst instanceof TempOprand)
			{
				add(new BinaryCode(binary.op, ((TempOprand)binary.dst).temp, t1, t2));
				return;
			}
			Temp t3 = new Temp(currentFrame);
			add(new BinaryCode(binary.op, t3, t1, t2));
			//store t3
			if (binary.dst instanceof Mem)
			{
				Mem mem = (Mem)binary.dst;
				Temp t4 = toTemp(mem.base);
				if (mem.length == 4)
					add(new SwCode(t3, mem.offset, t4));
				else
					add(new SbCode(t3, mem.offset, t4));
			} else
			if (binary.dst instanceof TempOprand)
			{
				TempOprand tempOp = (TempOprand)binary.dst;
				add(new MoveCode(tempOp.temp, t3));				
			} else
			error("Binary.dts mismatch");
		} else
		if (quad instanceof Branch)
		{
			Branch branch = (Branch)quad;
			Temp t1 = toTemp(branch.left);
			if (branch.op == BinaryOp.GREATER_EQ)
			{
				Temp t2 = toTemp(branch.right);
				add(new BgeCode(t1, t2, branch.label));
				return;
			}
			if (branch.op == BinaryOp.NEQ)
				add(new BnezCode(t1,  branch.label));
			else
				add(new BeqzCode(t1,  branch.label));
		} else
		if (quad instanceof Call)
		{
			Call call = (Call)quad;
			for (int i = 0;i < funArgs.get(call.function.toString());i++)
				add(new SwSpCode(call.params[i], i * 4));
			add(new JalCode(call.function));
			if (call.result != null) add(new MoveV0ToCode(call.result));
		} else
		if (quad instanceof Debug)
		{
			Debug debug = (Debug)quad;
			add("\t#" + debug.toString());
		} else
		if (quad instanceof Jump)
		{
			Jump jump = (Jump)quad;
			add(new JCode(jump.label));
		} else
		if (quad instanceof LabelQuad)
		{
			add(new LabelCode(((LabelQuad)quad).label));
		} else
		if (quad instanceof Move)
		{
			Move move = (Move)quad;
			if (move.src instanceof Const && move.dst instanceof TempOprand) {
				add(new LiCode(((TempOprand)move.dst).temp, ((Const)move.src).value));
				return;
			}
			Temp t0 = toTemp(move.src);
			if (move.dst instanceof Mem)
			{
				Mem mem = (Mem)move.dst;
				if (mem.length == 4)
					add(new SwCode(t0, mem.offset, mem.base));
				else
					add(new SbCode(t0, mem.offset, mem.base));
			} else
			if (move.dst instanceof TempOprand)
			{
				add(new MoveCode(((TempOprand)move.dst).temp, t0));
			}
		} else
		if (quad instanceof Return)
		{
			Return ret = (Return)quad;
			Temp t0 = toTemp(ret.value);
			add(new MoveV0FromCode(t0));
			add("\tlw $ra, " + currentFrame.ra() + "($sp)");
			//add("\taddi $sp, $sp, " + currentFrame.total());
			add(new AddiSpCode());
			add(new JrCode());
		} else
		error("Phase 4 CodeGen: Quad mismatch  :   " + quad);
	}
	public static void generate()
	{
		try 
		{
			Iterator<FunFrame> iter1 = QuadGen.frames.iterator();
			while (iter1.hasNext())
			{
				currentFrame = iter1.next();	
				System.out.println(currentFrame.name + " argTemps:");
				System.out.println(currentFrame.argTemps);
				Iterator<Quad> iter2 = currentFrame.quads.iterator();
				//set the label
				goQuad(iter2.next());
				//add("\taddi $sp, $sp, -" + currentFrame.total()); 
				add(new SubiSpCode());
				add("\tsw $ra, " + currentFrame.ra() + "($sp)");
				Iterator<Temp> iter3 = currentFrame.argTemps.iterator();
				int count = 0;
				while (iter3.hasNext())
				{
					//add("\tlw $t1, " + (currentFrame.total() + count * 4) + "($sp)");
					Temp t0 = new Temp(currentFrame);
					add(new InLdCode(t0, count));
					count = count + 1;
					add(new MoveCode(iter3.next(), t0));
				}
				while (iter2.hasNext())
					goQuad(iter2.next());			
				add("\tlw $ra, " + currentFrame.ra() + "($sp)");
				add(new AddiSpCode()); //addi sp
				add(new JrCode());
			}
			FunFrame nat = new FunFrame("native");
			
			currentFrame = nat;
			add(new LabelCode(new Label("native")));
			frames.add(nat);
			loadNative();
			add("");
			add("\t.data");
			Iterator<String> iter3 = QuadGen.dataFrags.keySet().iterator();
			while (iter3.hasNext())
			{
				String s = iter3.next();
				add(QuadGen.dataFrags.get(s).label + ":");
				add("\t.asciiz " + "\"" + s + "\"");
			}
		}
        catch (Exception e)   
        {  
            e.printStackTrace();  
        }  
	}
}