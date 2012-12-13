package javac.registers;
import java.util.*;
import javac.codegen.*;
import javac.quad.*;
public class Graph
{
	public static ArrayList<Temp> allTemps;
	public static ArrayList<GraphNode> waitLine = null;
	public static ArrayList<GraphElement> deleteLine = null;
	public static GraphNode getNextNode(int limit)
	{
		for (int i = 0;i < waitLine.size();i++)
			if (waitLine.get(i).degree() < limit) return waitLine.get(i);
		return null;
	}
	public static void setColor(FunFrame frame, int limit)
	{
		allTemps = frame.allTemps;
		waitLine = new ArrayList<GraphNode>();
		deleteLine = new ArrayList<GraphElement>();
		for (int i = 0;i < frame.allTemps.size();i++)
			waitLine.add(new GraphNode(allTemps.get(i)));
		ArrayList<String> avi = new ArrayList<String>();
		avi.add("$t2");
		avi.add("$t3");
		avi.add("$t4");
		avi.add("$t5");
		avi.add("$t6");
		avi.add("$t7");
		avi.add("$t8");
		avi.add("$t9");

		avi.add("$s0");
		avi.add("$s1");
		avi.add("$s2");
		avi.add("$s3");
		avi.add("$s4");
		avi.add("$s5");
		avi.add("$s6");
		avi.add("$s7");
		System.err.println(waitLine);
		while (waitLine.size() > 0)
		{
			GraphNode node = getNextNode(limit);
			if (node == null) {		
				node = waitLine.get(waitLine.size() - 1);
//				for (int i = 1;i < waitLine.size();i++)
//					if (waitLine.get(i).degree() > node.degree()) node = waitLine.get(i);
			}
			waitLine.remove(node);
			deleteLine.add(node);
			deleteLine.addAll(node.getEdges());
			node.deleteAllEdges();
		}
		
		for (int i = deleteLine.size() - 1;i >= 0;i--)
		{
			if (deleteLine.get(i) instanceof GraphNode)
			{
				GraphNode node = (GraphNode)(deleteLine.get(i));
				ArrayList<String> ss = (ArrayList<String>)(avi.clone());
				if (node.degree() > limit - 1) continue;
				ss.removeAll(node.getNeighbourColors());
				if (!ss.isEmpty())
				{
					node.temp.isTemp = true;
					node.temp.color = ss.iterator().next();
				}
			} else
			{
				GraphEdge edge = (GraphEdge)(deleteLine.get(i));
				GraphNode.addEdge(edge.node1, edge.node2);
			}
		}
	}
}