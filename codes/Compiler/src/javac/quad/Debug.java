package javac.quad;

public class Debug extends Quad {
	public String name;
	public Debug() {
		name = "_DEBUG " + count++;
	}
	
	public Debug(String s) {
		name = s + "   :: DEBUG";
	}
	
	public String toString() {
		return name;
	}
	
	static int count = 0;
}
