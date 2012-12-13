package javac.registers;
import javac.codegen.*;
import javac.quad.*;
import java.util.*;
public class RegAlloc
{
	static FunFrame currentFrame;
	static BasicBlock currentBlock;
	static ArrayList<BasicBlock> blocks;
	public static void initialize(FunFrame frame)
	{
		currentFrame = frame;
		BasicBlock.count = 0;
		blocks = currentFrame.blocks;
		currentBlock = null;
		Iterator<Asm> iter = currentFrame.codes.iterator();
		while (iter.hasNext())
		{
			Asm asm = iter.next();
			if (asm instanceof LabelCode)
			{
				if (currentBlock == null || (!currentBlock.asmList.isEmpty()))
				{
					currentBlock = new BasicBlock();
					blocks.add(currentBlock);
				}
				currentBlock.add(asm);
				asm.setBlock(currentBlock);
			} else
			if (asm instanceof BeqzCode || asm instanceof BnezCode || asm instanceof JCode || asm instanceof JrCode || asm instanceof BgeCode)
			{
				currentBlock.add(asm);
				asm.setBlock(currentBlock);
				if (iter.hasNext())
				{
					currentBlock = new BasicBlock();
					blocks.add(currentBlock);
				}
			} else
			{
				currentBlock.add(asm);
				asm.setBlock(currentBlock);
			}
		}
	}
	public static void setBlockGoto(FunFrame frame)
	{
		currentFrame = frame;
		for (int i = 0;i < blocks.size();i++)
		{
			BasicBlock block = blocks.get(i);
			Asm asm = block.lastAsm();
			Label label = null;
			if (asm instanceof JrCode)
				continue;
			if (!(asm instanceof JCode))
			{
				if (block.num < blocks.size() - 1)
					block.gotoList.add(blocks.get(block.num + 1));
			} else label = ((JCode)asm).label;
			if (asm instanceof BeqzCode) label = ((BeqzCode)asm).label;
			if (asm instanceof BnezCode) label = ((BnezCode)asm).label;
			if (asm instanceof BgeCode) label = ((BgeCode)asm).label;
		 	if (label != null) block.gotoList.add(frame.getBlock(label));
		}
	}
	public static void computeInAndOut(FunFrame frame)
	{
		currentFrame = frame;
		boolean change = true;
		while (change)
		{
			change = false;
			for (int i = 0;i < frame.blocks.size();i++)
			{
				BasicBlock block = frame.blocks.get(i);
				block.outSet.clear();
				for (int j = 0;j < block.gotoList.size();j++)
					block.outSet.addAll(block.gotoList.get(j).inSet);
				HashSet<Temp> newIn;
				newIn = Sets.setUnion(block.useSet, Sets.setMinus(block.outSet, block.defSet));
				//System.out.println(block + "useSet : " + block.useSet);
				//System.out.println("newIn : " + newIn);				
				if (!newIn.equals(block.inSet))
				{
					change = true;
					block.inSet = newIn;
				}
			}
		}
	}
	public RegAlloc()
	{
		currentFrame = null;
	}
}