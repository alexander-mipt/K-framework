requires "functions.k"
requires "expressions.k"
module LANG-SYNTAX // by default: main yntax module
imports FUNCTIONS
imports EXPRESSIONS
endmodule

module LANG // by default: main semantic module
	imports LANG-SYNTAX
	imports INT

	//rule -I => neg I
	// rule ToInt(I) => {I}

	rule I1 + I2 => I1 +Int I2
	rule - I => 0 -Int I
	rule I1 - I2 => I1 -Int I2
	rule I1 * I2 => I1 *Int I2

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
