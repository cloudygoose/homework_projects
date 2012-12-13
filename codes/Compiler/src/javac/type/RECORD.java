package javac.type;

import java.util.*;

import javac.symbol.Symbol;

public final class RECORD extends Type {

	public static final class RecordField {

		public Type type;
		public Symbol name;
		public int index;

		public RecordField(Type type, Symbol name, int index) {
			this.type = type;
			this.name = name;
			this.index = index;
		}

		public String toString()
		{
			return type.toString() + name.toString();
		}
	}
	
	public List<RecordField> fields;
	public Symbol name;
	
	public Type findSymbol(Symbol s)
	{
		Iterator<RecordField> iter = fields.iterator();
		while (iter.hasNext())
		{
			RecordField tmp = iter.next();
			if (tmp.name.equals(s)) return tmp.type;
		}
		return null;
	}

	public int findSymbolIndex(Symbol s)
	{
		Iterator<RecordField> iter = fields.iterator();
		int now = 0;
		while (iter.hasNext())
		{
			RecordField tmp = iter.next();
			if (tmp.name.equals(s)) return now;
			now++;
		}
		return -1;
	}

	public RECORD(Symbol name) {
		fields = new ArrayList<RecordField>();
		this.name = name;
	}

	@Override
	public boolean equals(Object other) {
		if (other == Type.NULL) return true;
		if (other instanceof RECORD) {
			return name.equals(((RECORD) other).name);
		}
		return false;
	}
	
	public boolean isInt() {
		return false;
	}
	
	@Override
	public boolean isArray() {
		return false;
	}

	public boolean isString() {
		return false;
	}
	
	public boolean isChar() {
		return false;
	}

	@Override
	public boolean isRecord() {
		return true;
	}

	public String toString() {
		return " " + name.toString() + " ";
	}
}
