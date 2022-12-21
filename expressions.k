module EXPRESSIONS // required for main syntax module
imports BOOL-SYNTAX
imports UNSIGNED-INT-SYNTAX
imports DOMAINS-SYNTAX

  syntax Id ::= "main" [token]


syntax Stmt ::= "var" Exps ";"
                | "function" Id "(" Ids ")" Block

  syntax Ids  ::= List{Id,","}           [klabel(Exps)]
  syntax Exps ::= List{Exp,","}          [klabel(Exps), strict]  // automatically hybrid now
  syntax Exps ::= Ids
  syntax Val
  syntax Vals ::= List{Val,","}          [klabel(Exps)]
  syntax Bottom
  syntax Bottoms ::= List{Bottom,","}    [klabel(Exps)]
  syntax Ids ::= Bottoms

  
  syntax Exp ::= Int | Bool | Id
               | "(" Exp ")"             [bracket]
               | "++" Exp
            //    > Exp "[" Exps "]"        [strict]
            //    > Exp "(" Exps ")"        [strict]
               | "-" Exp                 [strict]
               | "sizeOf" "(" Exp ")"    [strict]
               | "read" "(" ")"
               > left:
                 Exp "*" Exp             [strict, left]
               | Exp "/" Exp             [strict, left]
               | Exp "%" Exp             [strict, left]
               > left:
                 Exp "+" Exp             [strict, left]
               | Exp "-" Exp             [strict, left]
               > non-assoc:
                 Exp "<" Exp             [strict, non-assoc]
               | Exp "<=" Exp            [strict, non-assoc]
               | Exp ">" Exp             [strict, non-assoc]
               | Exp ">=" Exp            [strict, non-assoc]
               | Exp "==" Exp            [strict, non-assoc]
               | Exp "!=" Exp            [strict, non-assoc]
               > "!" Exp                 [strict]
               > left:
                 Exp "&&" Exp            [strict(1), left]
               | Exp "||" Exp            [strict(1), left]
               > "spawn" Block
               > Exp "=" Exp             [strict(2), right]


  syntax Block ::= "{" "}"
                | "{" Stmt "}"

  syntax Stmt ::= Block
                | Exp ";"                               [strict]
                | "if" "(" Exp ")" Block "else" Block   [avoid, strict(1)]
                | "if" "(" Exp ")" Block                [macro]
                | "while" "(" Exp ")" Block
                | "for" "(" Stmt Exp ";" Exp ")" Block  [macro]
                | "return" Exp ";"                      [strict]
                | "return" ";"                          [macro]
                | "print" "(" Exps ")" ";"              [strict]

  syntax Stmt ::= Stmt Stmt                          [right]


  rule if (E) S => if (E) S else {}
  rule for(Start Cond; Step) {S} => {Start while (Cond) {S Step;}}
  rule for(Start Cond; Step) {} => {Start while (Cond) {Step;}}
  rule var E1:Exp, E2:Exp, Es:Exps; => var E1; var E2, Es;
  rule var X:Id = E; => var X; X = E;



endmodule