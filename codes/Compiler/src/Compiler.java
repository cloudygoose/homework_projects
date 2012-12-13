import java.io.FileInputStream;
import java.io.InputStream;
import java.util.*;
import java.lang.Class;

import javac.codegen.*;
import javac.quad.*;
import javac.registers.*;
import javac.env.*;
import javac.absyn.BinaryOp;
import javac.absyn.TranslationUnit;
import javac.parser.*;
import javac.type.*;
import javac.util.AbsynFormatter;
import javac.symbol.*;
import javac.trans.*;

public class Compiler
{

	public static String getString()
	{
		String kk = new String("get");
		return kk;
	}
	
	public static void main(String[] args)
	{
		try {
			String test = "Spill2.java";
			//String test = args[0];
			//ScannerTest.scan(test);
			//System.out.println("ScannerTest passed");
			ParserTest.parse(test);
			System.out.println("PaserTest passed");
			ParserTest parser1 = new ParserTest();
			TranslationUnit tree = parser1.getTree(test);
			SemanticTest.fillGlobalRecordName(tree);
			//System.out.println("global RECORD and FUNCTION in detail");
			SemanticTest.fillGlobalRecordAndFunction(tree);
			//System.out.println("Env global RECORD map:");
			//System.out.println(SemanticTest.global.map);
			//System.out.println("traverse : ");
			SemanticTest.traverse(tree);
			System.out.println("Semantictest passed");

			//Phase 3
			QuadGen.initialize();
			QuadGen.debug = 1;  //FOR DEBUG
			QuadGen.traverse(tree);
			//System.out.println(QuadGen.funFrags);
//			QuadGen.printQuads();
//			System.out.println("PRINT DATAFRAGS:");
//			System.out.println(QuadGen.dataFrags);

			CodeGen.initialize();
			CodeGen.generate();
			System.out.println("Now regAlloc....");
			CodeGen.regAlloc();
			CodeGen.output(test.substring(0, test.length() - 5) + ".s");

			System.exit(0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.exit(1);
		}
	}
}
