package javac.quad;

public class Label {
	String name;
	public Label() {
		name = "_L" + count++;
	}
	
	public Label(String s) {
		name = s;
	}
	
	public String toString() {
		return name;
	}
	public boolean equals(Label other)
	{
		return name == other.name;
	}
	static int count = 0;
}
