package javac.registers;
import javac.quad.*;
import java.util.*;
public class GraphNode extends GraphElement
{
	public Temp temp;
	public GraphNode(Temp t)
	{
		temp = t;
	}
	public static void addEdge(GraphNode n1, GraphNode n2)
	{
		Temp.addEdge(n1.temp, n2.temp);
	}
	public ArrayList<String> getNeighbourColors()
	{
		ArrayList<String> now = new ArrayList<String>();
		for (int i = 0;i < temp.edges.size();i++)
			if (temp.edges.get(i).isTemp)
				now.add(temp.edges.get(i).color);
		return now;
	}
	public ArrayList<GraphEdge> getEdges()
	{
		ArrayList<GraphEdge> arr = new ArrayList<GraphEdge>();
		for (int i = 0;i < temp.edges.size();i++)
			arr.add(new GraphEdge(new GraphNode(temp), new GraphNode(temp.edges.get(i))));
		return arr;
	}
	public void deleteAllEdges()
	{
		ArrayList<GraphEdge> arr = getEdges();
		for (int i= 0;i < arr.size();i++)
			Temp.removeEdge(arr.get(i).node1.temp, arr.get(i).node2.temp);
		temp.edges.clear();
	}
	public int degree()
	{
		return temp.edges.size();
	}
	@Override
	public boolean equals(Object o)
	{
		return temp.equals(((GraphNode)o).temp);
	}
	public String toString()
	{
		return temp.toString();
	}
}