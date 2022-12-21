requires "functions.k"
requires "expressions.k"
module LANG-SYNTAX // by default: main yntax module
	
module LANG-SEMANTICS // by default: main semantic module
	imports LANG-SYNTAX
	rule func => expr
  



/*
syntax Int ::= r"[1-9][0-9]*" [token]

	syntax BinExpr ::= "t"
				> "(" BinExpr ")" [bracket]
				> "!" Int [function]
				> left:
					BinExpr "+" BinExpr [function]
				|	BinExpr "-" BinExpr [function]


//rule ! B => notBool B
//rule A && B => A andBool B
//rule A ^ B => A xorBool B
//rule A || B => A orBool B
rule A + B => A add B
rule A - B => A sub B
rule ! A => neg A
*/
endmodule
