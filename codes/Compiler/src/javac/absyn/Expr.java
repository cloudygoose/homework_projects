package javac.absyn;

import javac.type.Type;
import javac.util.Position;

public abstract class Expr extends Node {
	
	public Type ty;
	public int lvalue;
	public Expr(Position pos) {
		super(pos);
		lvalue = 0;
	}
}
