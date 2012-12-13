package javac.absyn;

import javac.util.Position;

public class ParenExpr extends Expr {
	
	public Expr e;

	public ParenExpr(Position pos, Expr e1) {
		super(pos);
		e = e1;
	}

	@Override
	public void accept(NodeVisitor visitor) {
		e.accept(visitor);
		visitor.visit(this);
	}
}
