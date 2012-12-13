package javac.registers;
import javac.quad.*;
import java.util.*;
public class GraphEdge extends GraphElement
{
	public GraphNode node1;
	public GraphNode node2;
	public GraphEdge(GraphNode n1, GraphNode n2)
	{
		node1 = n1;
		node2 = n2;
	}
}