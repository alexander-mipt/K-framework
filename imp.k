module IMP-SYNTAX
    imports DOMAINS

    syntax AExp ::= Int | Id
            | "(" AExp ")"    [bracket]
            | AExp "/" AExp   [left, strict]
            > AExp "+" AExp   [left, strict]

    syntax BExp ::= 
            "(" BExp ")" [bracket]
            | Bool
            | AExp "<=" AExp  [seqstrict]
            | "!" BExp        [strict]
            > BExp "&&" BExp  [left, strict(1)]


    syntax Block ::= "{" "}"
            | "{" Stmt "}"

    syntax Stmt ::= Block
            | Id "=" AExp ";" [strict(2)]
            | "if" "(" BExp ")"
               Block "else" Block [strict(1)]
            | "while" "(" BExp ")" Block
            > Stmt Stmt   [left]

    syntax Ids ::= List{Id, ","}
    syntax Pgm ::= "int" Ids ";" Stmt
    syntax KResult ::= Int | Bool

endmodule

module IMP
    import IMP-SYNTAX

    configuration <k> $PGM:Pgm </k>
endmodule
