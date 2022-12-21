module EXPRESSIONS // required for main syntax module
imports BOOL-SYNTAX
imports UNSIGNED-INT-SYNTAX
    syntax UserInt ::= r"[1-9][0-9]*" [token]
    // syntax Expr ::= "expr"
    syntax Imm ::= Int
    syntax PlaceHolder ::= Imm

    syntax Expr ::= PlaceHolder
                > "-" PlaceHolder
                > "(" Expr ")" [bracket]
                > left:
                    Expr "*" Expr [function]
                > left:
                    Expr "+" Expr [function]
                |   Expr "-" Expr [function]

endmodule