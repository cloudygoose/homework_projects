package javac.parser;
import java.lang.*;

%%

%unicode
%line
%column
%cup
%implements Symbols

%{
    private StringBuffer str = new StringBuffer();
    private int commentCount = 0;
    
    private void err(String message) {
        System.err.println(String.format("Scanning error in line %d, column %d: %s", yyline + 1, yycolumn + 1, message));
    }
    
    private java_cup.runtime.Symbol tok(int kind) {
        return new java_cup.runtime.Symbol(kind, yyline, yycolumn);
    }
    
    private java_cup.runtime.Symbol tok(int kind, Object value) {
        return new java_cup.runtime.Symbol(kind, yyline, yycolumn, value);
    }
%}

%eofval{
    {
    	if (commentCount != 0) err("Illegal comment");  
        return tok(EOF, null);
    }
%eofval}

LineTerm = \n|\r|\r\n
Identifier = [_a-zA-Z][_a-zA-Z0-9]*
DecInteger = [0-9]+
Whitespace = {LineTerm}|[ \t\f]
StringChar = [^\r\n\t\"\\]
SingleChar = [^\r\n\t\'\\]

%state YYSTRING
%state YYCHAR
%state YYCOMMENT
%state YYLINECOMMENT

%%

<YYINITIAL> {
    "//"    { yybegin(YYLINECOMMENT); }
    "/*"	{ yybegin(YYCOMMENT); commentCount += 1; }
    
    "new"	{ return tok(NEW); }
    
    "int"		{ return tok(INT); }
    "char"		{ return tok(CHAR); }
    "string"	{ return tok(STRING); }
    "record"	{ return tok(RECORD); }
    
    
    "if"    	{ return tok(IF); }
    "else"		{ return tok(ELSE); }
    "continue"	{ return tok(CONTINUE); }
    "for"		{ return tok(FOR); }
    "while"		{ return tok(WHILE); }
    "return"	{ return tok(RETURN); }
    "break"		{ return tok(BREAK); } 
    "native"    { return tok(NATIVE); }
    "null"	{ return tok(NULL); }
    
    ","		{ return tok(COMMA); }
    "."		{ return tok(DOT); }
    
    "["{Whitespace}*"]"   	{ return tok(LRBRACKET); }
    "["						{ return tok(LBRACKET); }
    "]"						{ return tok(RBRACKET); }
    "("						{ return tok(LPAREN); }
    ")"						{ return tok(RPAREN); }
    "{"						{ return tok(LBRACE); }
    "}"						{ return tok(RBRACE); }
    ";"                     { return tok(SEMICOLON); }
    
    "<="    { return tok(LESS_EQ); }
    ">"		{ return tok(GREATER); }
    "<"		{ return tok(LESS); }
    ">="	{ return tok(GREATER_EQ); }
    "=="	{ return tok(EQ); }
    "!="	{ return tok(NEQ); }
   
    "="     { return tok(ASSIGN); }
    "+"		{ return tok(PLUS); }
    "-"		{ return tok(MINUS); }
    "*"		{ return tok(MULTIPLY); }
    "/"		{ return tok(DIVIDE); }
    "%"		{ return tok(MODULO); }
    
    "!"		{ return tok(NOT); }
    "&&"	{ return tok(AND); }
    "||"	{ return tok(OR); }
    
    \"		{ yybegin(YYSTRING);  str.setLength(0); }
    \'		{ yybegin(YYCHAR); }
    
    {Identifier}    { return tok(ID, yytext()); }
    {DecInteger}    { return tok(INTEGER, Integer.valueOf(yytext())); }
    {Whitespace}    {}
    
    [^]    { err("Illegal character " + yytext()); }
}

<YYLINECOMMENT> {
    {LineTerm}    { yybegin(YYINITIAL); }
    [^]           {}
}

<YYCOMMENT> {
	"/*"	{ commentCount = commentCount + 1; }
	"*/"	{ commentCount = commentCount - 1; if (commentCount == 0) yybegin(YYINITIAL); }
	[^]		{}	
}

<YYSTRING> {
	\"							{ yybegin(YYINITIAL); return tok(STRING_LITERAL, str.toString()); }

	{StringChar}+				{ str.append( yytext() ); }

	/* escape sequences */
	"\\t"						{ str.append( '\t' ); }
	"\\n"						{ str.append( '\n' ); }
	"\\r"						{ str.append( '\r' ); }
	"\\\""						{ str.append( '\"' ); }
	"\\'"						{ str.append( '\'' ); }
	"\\\\"						{ str.append( '\\' ); }
	\\[:digit:]{3}				{ char val = (char) Integer.parseInt(yytext().substring(1)); str.append( val ); }

	/* error cases */
	\\.							{ err("Illegal escape sequence \""+yytext()+"\""); }
	{LineTerm}					{ err("Unterminated string at end of line"); }
}

<YYCHAR> {
	{SingleChar}\'				{ yybegin(YYINITIAL); return tok(CHARACTER, new Character(yytext().charAt(0))); }

	/* escape sequences */
	"\\t"\'						{ yybegin(YYINITIAL); return tok(CHARACTER, new Character('\t'));}
	"\\n"\'						{ yybegin(YYINITIAL); return tok(CHARACTER, new Character('\n'));}
	"\\r"\'						{ yybegin(YYINITIAL); return tok(CHARACTER, new Character('\r'));}
	"\\\""\'					{ yybegin(YYINITIAL); return tok(CHARACTER, new Character('\"'));}
	"\\'"\'						{ yybegin(YYINITIAL); return tok(CHARACTER, new Character('\''));}
	"\\\\"\'					{ yybegin(YYINITIAL); return tok(CHARACTER, new Character('\\')); }
	\\[:digit:]{3}\'			{ yybegin(YYINITIAL); return tok(CHARACTER, new Character((char)Integer.parseInt(yytext().substring(1,4)))); }

	\\.							{ err("Illegal escape sequence \""+yytext()+"\""); }
	{LineTerm}					{ err("Unterminated character literal at end of line"); }
}