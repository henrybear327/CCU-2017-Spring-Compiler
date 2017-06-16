grammar Cactus;

//Parser rules
program: MAIN OP CP OB
		{System.out.println("\t" + ".data");}
		declarations
		{
			System.out.println("\t" + ".text");
			System.out.println("main:");
		}
		s = statements[0, 1] CB;
declarations: type ll declarations | /* eplison */;
type: INT;
ll: ll COMMA ID
	{System.out.println($ID.text + ":" + "\t" + ".word 0");}
	| ID
	{System.out.println($ID.text + ":" + "\t" + ".word 0");}
	SE;
statements[int sreg, int slabel] returns [int snreg, int snlabel]: s = statement[$sreg, $slabel] s2 = statements[$s.snreg, $s.snlabel]
{
	$snreg = $s2.snreg;
	$snlabel = $s2.snlabel;
}
| /* epsilon */
{
	$snreg = $sreg;
	$snlabel = $slabel;
};
statement [int sreg, int slabel] returns [int snreg, int snlabel]: ID ASSIGN e = arith_expression[$sreg]
{
	System.out.println("\tla" + "  " + "\$t" + $e.enreg + ", " + $ID.text);
	System.out.println("\tsw" + "  " + "\$t" + $e.eplace + ", " + "0(" + "\$t" + $e.enreg + ")");
	$snreg = $e.enreg - 1;
	$snlabel = $slabel;
}
SE
| {System.out.println("L" + $slabel + ":");}
WHILE OP b = bool_expression[$sreg,$slabel + 3,$slabel + 1,$slabel + 2] CP OB
{
	System.out.println("L" + ($slabel + 1) + ":");
	}
	s = statements[$b.bnreg, $b.bnlabel] CB
	{
		System.out.println("\tb" + "  " + "L" + $slabel);
		System.out.println("L" + ($slabel + 2) + ":");
		$snreg = $s.snreg;
		$snlabel = $s.snlabel;
	}
	| READ ID SE
	{
		System.out.println("\tli  \$v0, 5");
		System.out.println("\tsyscall");
		System.out.println("\tla" + "  " + "\$t" + $sreg + ", " + $ID.text);
		System.out.println("\tsw" + "  " + "\$v0" + ", " + "0(" + "\$t" + $sreg + ")");
		$snreg = $sreg;
		$snlabel = $slabel;
	}
	| WRITE e = arith_expression[$sreg] SE
	{
		System.out.println("\tmove" + "  " + "\$a0" + ", " + "\$t" + ($e.enreg-1));
		System.out.println("\tli  \$v0, 1");
		System.out.println("\tsyscall");
		$snreg = $e.enreg - 1;
		$snlabel = $slabel;
	}
	| RETURN SE
	{
		System.out.println("\tli  \$v0, 10");
		System.out.println("\tsyscall");
		$snreg = $sreg;
		$snlabel = $slabel;
	}
| IF OP b = bool_expression[$sreg,$slabel + 3,$slabel,$slabel + 1] CP OB
{
		System.out.println("L" + $slabel + ":");
} s = statements[$b.bnreg, $b.bnlabel] CB b2 = else_statement[$s.snreg, $s.snlabel, $slabel + 2, $slabel + 1]
{
		$snreg = $b2.bnreg;
		$snlabel = $b2.bnlabel;
}FI;
else_statement[int sreg, int slabel, int lnext, int bfalse] returns [int bnreg, int bnlabel]: ELSE
{
	System.out.println("\tb" + "  " + "L" + $lnext);
	System.out.println("L" + $bfalse + ":");
} OB s = statements[$sreg, $slabel] CB
{
	System.out.println("L" + $lnext + ":");
	$bnreg = $s.snreg;
	$bnlabel = $s.snlabel;
}
| /* epsilon */
{
	System.out.println("\tb" + "  " + "L" + $lnext);
	System.out.println("L" + $bfalse + ":");
	System.out.println("L" + $lnext + ":");
	$bnreg = $sreg;
	$bnlabel = $slabel;
};
arith_expression[int ereg] returns [int enreg, int eplace]: e = arith_term[$ereg] e2 = arith_expression1[$e.enreg]
{
  $enreg = $e2.enreg;
	  $eplace = $e2.eplace;
};
arith_expression1[int ereg] returns [int enreg, int eplace]: ADD e = arith_term[$ereg]
{
  System.out.println("\tadd" + "  " + "\$t" + ($ereg-1) + ", " + "\$t" + ($ereg-1) + ", " + "\$t" + $e.eplace);
}
e2 = arith_expression1[$e.enreg-1]
{
  $enreg = $e2.enreg;
	  $eplace = $e2.eplace;
}
	| SUB e3 = arith_term[$ereg]
	{
	  System.out.println("\tsub" + "  " + "\$t" + ($ereg-1) + ", " + "\$t" + ($ereg-1) + ", " + "\$t" + $e3.eplace);
	}
	e4 = arith_expression1[$e3.enreg-1]
	{
  $enreg = $e4.enreg;
	  $eplace = $e4.eplace;
}
	| /* epsilon */
	{
  $enreg = $ereg;
	  $eplace = $ereg - 1;
};
arith_term[int ereg] returns [int enreg, int eplace]: e = arith_factor[$ereg] e2 = arith_term1[$e.enreg]
{
$enreg = $e2.enreg;
$eplace = $e2.eplace;
};
arith_term1[int ereg] returns [int enreg, int eplace]: MUL e = arith_factor[$ereg]
{
System.out.println("\tmul" + "  " + "\$t" + ($ereg-1) + ", " + "\$t" + ($ereg-1) + ", " + "\$t" + $e.eplace);
}
e2 = arith_term1[$e.enreg - 1]
{
$enreg = $e2.enreg;
$eplace = $e2.eplace;
}
| DIV e3 = arith_factor[$ereg]
{
	System.out.println("\tdiv" + "  " + "\$t" + ($ereg-1) + ", " + "\$t" + $e3.eplace);
	System.out.println("\tmflo" + "  " + "\$t" + ($ereg-1));
}
e4 = arith_term1[$e3.enreg - 1]
{
	$enreg = $e4.enreg;
$eplace = $e4.eplace;
}
| MOD e5 = arith_factor[$ereg]
{
System.out.println("\tdiv" + "  " + "\$t" + ($ereg-1) + ", " + "\$t" + $e5.eplace);
	System.out.println("\tmfhi" + "  " + "\$t" + ($ereg-1));
}
e6 = arith_term1[$e5.enreg - 1]
{
$enreg = $e6.enreg;
$eplace = $e6.eplace;
}
| /* epsilon */
{
$enreg = $ereg;
$eplace = $ereg - 1;
};
arith_factor[int ereg] returns [int enreg, int eplace]: SUB e = arith_factor[$ereg]
{
System.out.println("\tneg" + "  " + "\$t" + $e.eplace + ", " + "\$t" + $e.eplace);
$enreg = $e.enreg;
$eplace = $e.eplace;
}
| e2 = primary_expression[$ereg]
{
$enreg = $e2.enreg;
  $eplace = $e2.eplace;
};
primary_expression[int ereg] returns [int enreg, int eplace]: CONST
  {
  	System.out.println("\tli" + "  " + "\$t" + $ereg + ", " + $CONST.text);
  	$eplace = $ereg;
  	$enreg = $ereg + 1;
  }
  | ID
  {
  	System.out.println("\tla" + "  " + "\$t" + $ereg + ", " + $ID.text);
  	System.out.println("\tlw" + "  " + "\$t" + $ereg + ", " + "0(" + "\$t" + $ereg + ")");
  	$eplace = $ereg;
	$enreg = $ereg + 1;
  }
  | OP e = arith_expression[$ereg] CP
  {
  	$enreg = $e.enreg;
  	$eplace = $e.eplace;
  };
bool_expression [int breg, int blabel, int btrue, int bfalse] returns [int bnreg, int bnlabel]: b = bool_term[$breg, $blabel + 1, $btrue, $blabel] b2 = bool_expression1[$b.bnreg, $b.bnlabel, $btrue, $bfalse, $blabel]
		{
			$bnreg = $b2.bnreg;
			$bnlabel = $b2.bnlabel;
		};
bool_expression1 [int breg, int blabel, int btrue, int bfalse, int lnext] returns [int bnreg, int bnlabel]: OR
		{
			System.out.println("L" + $lnext + ":");
		}
		b = bool_term[$breg, $blabel + 1, $btrue, $blabel] b2 = bool_expression1[$b.bnreg, $b.bnlabel, $btrue, $bfalse, $blabel]
		{
  			$bnreg = $b2.bnreg;
			$bnlabel = $b2.bnlabel;
  		}
		|  /* epsilon */
		{
			System.out.println("L" + $lnext + ":");
			System.out.println("\tb" + "  " + "L" + $bfalse);
			$bnreg = $breg;
			$bnlabel = $blabel;
		};
bool_term [int breg, int blabel, int btrue, int bfalse] returns [int bnreg, int bnlabel]: b = bool_factor[$breg, $blabel + 1, $blabel, $bfalse] b2 = bool_term1[$b.bnreg, $b.bnlabel, $btrue, $bfalse, $blabel]
{
	$bnreg = $b2.bnreg;
	$bnlabel = $b2.bnlabel;
};
bool_term1 [int breg, int blabel, int btrue, int bfalse, int lnext] returns [int bnreg, int bnlabel]: AND
  {
  	System.out.println("L" + $lnext + ":");
  }
  b = bool_factor[$breg, $blabel + 1, $blabel, $bfalse] b2 = bool_term1[$b.bnreg, $b.bnlabel, $btrue, $bfalse, $blabel]
  {
  	$bnreg = $b2.bnreg;
	$bnlabel = $b2.bnlabel;
  }
	  | /* epsilon */
	  {
	  	System.out.println("L" + $lnext + ":");
	System.out.println("\tb" + "  " + "L" + $btrue);
	  	$bnreg = $breg;
	$bnlabel = $blabel;
	  };
bool_factor [int breg, int blabel, int btrue, int bfalse] returns [int bnreg, int bnlabel]: NOT b = bool_factor[$breg, $blabel, $bfalse, $btrue]
	{
	  $bnreg = $b.bnreg;
	  $bnlabel = $b.bnlabel;
	}
		| b2 = rel_expression[$breg, $blabel, $btrue, $bfalse]
		{
			$bnreg = $b2.bnreg;
		$bnlabel = $b2.bnlabel;
		}
		|OP b3 = bool_expression[$breg, $blabel, $btrue, $bfalse] CP
		{
			$bnreg = $b3.bnreg;
		$bnlabel = $b3.bnlabel;
		}
		| TT
		{
			System.out.println("L" + $btrue + ":");
			$bnreg = $breg;
		$bnlabel = $blabel;
		}
		| FF
		{
			System.out.println("L" + $bfalse + ":");
			$bnreg = $breg;
		$bnlabel = $blabel;
		};
rel_expression [int breg, int blabel, int btrue, int bfalse] returns [int bnreg, int bnlabel]: e = arith_expression[$breg] o = relation_op e2 = arith_expression[$e.enreg]
	{
		if($o.opcode == 1){
			System.out.println("\tbeq" + "  " + "\$t" + $e.eplace + ", " + "\$t" + $e2.eplace + ", "+ "L" + $btrue);
			System.out.println("\tb" + "  "+ "L" + bfalse);
		}
		else if($o.opcode == 2){
			System.out.println("\tbne" + "  " + "\$t" + $e.eplace + ", " + "\$t" + $e2.eplace + ", "+ "L" + $btrue);
			System.out.println("\tb" + "  "+ "L" + bfalse);
		}
		else if($o.opcode == 3){
			System.out.println("\tbgt" + "  " + "\$t" + $e.eplace + ", " + "\$t" + $e2.eplace + ", "+ "L" + $btrue);
			System.out.println("\tb" + "  "+ "L" + bfalse);
		}
		else if($o.opcode == 4){
			System.out.println("\tbge" + "  " + "\$t" + $e.eplace + ", " + "\$t" + $e2.eplace + ", "+ "L" + $btrue);
			System.out.println("\tb" + "  "+ "L" + bfalse);
		}
		else if($o.opcode == 5){
			System.out.println("\tblt" + "  " + "\$t" + $e.eplace + ", " + "\$t" + $e2.eplace + ", "+ "L" + $btrue);
			System.out.println("\tb" + "  " + "L" + bfalse);
		}
		else if($o.opcode == 6){
			System.out.println("\tble" + "  " + "\$t" + $e.eplace + ", " + "\$t" + $e2.eplace + ", "+ "L" + $btrue);
			System.out.println("\tb" + "  " + "L" + bfalse);
		}
		$bnreg = $e2.enreg - 2;
		$bnlabel = $blabel;
	};
relation_op returns[int opcode]:EQ { $opcode = 1; }
	| NEQ { $opcode = 2; }
	| HI { $opcode = 3; }
	| GE { $opcode = 4; }
	| LT { $opcode = 5; }
	| LS { $opcode = 6; };
//Lexer rules
//token: (ELSE | IF | FI | MAIN |INT | RETURN | WHILE | READ | WRITE | ID | CONST | ADD | SUB | MUL | DIV | MOD | EQ | NEQ | HI | GE | LT | LS | AND | OR | ASSIGN | OB | CB | OP | CP | SE | COMMA | WHITESPACE | TABS | NEWLINE | NOT | COMMENT)*;


ELSE: 'else';
IF: 'if';
FI: 'fi';
INT: 'int';
MAIN: 'main';
RETURN: 'return';
WHILE: 'while';
READ: 'read';
WRITE: 'write';
TT:'true';
FF:'false';
CONST: [0-9]+;
ID: ([a-z]|[0-9]|[A-Z]|'_')([a-z]|[0-9]|[A-Z]|'_')*;
ADD: '+';
SUB: '-';
MUL: '*';
DIV: '/';
MOD: '%';
EQ: '==';
NEQ: '!=';
HI: '>';
GE: '>=';
LT: '<';
LS: '<=';
AND: '&&';
OR: '||';
ASSIGN: '=';
OB: '{';
CB: '}';
OP: '(';
CP: ')';
SE: ';';
COMMA:',';
WHITESPACE: ' ' -> skip;
TABS: '	' -> skip;
NEWLINE: ('\n'|'\t'|'\r') -> skip;
NOT: '!';
COMMENT: '/*'.*?'*/' -> skip;
