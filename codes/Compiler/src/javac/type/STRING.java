package javac.type;

public final class STRING extends Type {

	private static STRING instance = null;

	public static synchronized STRING getInstance() {
		if (instance == null) {
			instance = new STRING();
		}
		return instance;
	}

	private STRING() {
	}

	@Override
	public boolean equals(Object other) {
		if (other == Type.NULL) return true;
		return other instanceof STRING;
	}
	
	public boolean isInt() {
		return false;
	}
	@Override
	public boolean isArray() {
		return false;
	}

	@Override
	public boolean isRecord() {
		return false;
	}
	
	public boolean isString() {
		return true;
	}
	
	public boolean isChar() {
		return false;
	}

	public String toString() {
		return " String ";
	}
}
