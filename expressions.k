module EXPRESSIONS // required for main syntax module
imports BOOL

    syntax Fruit ::= Blueberry() | Banana()
    syntax Bool ::= isBlue(Fruit) [function]
    syntax Bool ::= isYellow(Fruit) [function]
            | isBlueOrYellow(Fruit) [function]


    syntax Expr ::= "expr"
endmodule