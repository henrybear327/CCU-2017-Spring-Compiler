grammar Cactus;

/* parser rules */
program: MAIN LEFTPARENTHESIS RIGHTPARENTHESIS LEFTBRACE
		{
			System.out.println("\t.data");
		} declarations
		{
			System.out.println("\t.text");
			System.out.println("main:");
		} statements[0, 1] RIGHTBRACE;

// declaration
// var name:	.word 0
declarations: INT ID SEMICOLON {System.out.println($ID.text + ":\t.word 0");} declarations | /* epsilon */ ;

// all code goes in statement
statements [int reg, int label] returns [int nreg, int nlabel]:
ret = statement[$reg, $label] ret1 = statements[$ret.nreg, $ret.nlabel]
{
	$nreg = $ret1.nreg;
	$nlabel = $ret1.nlabel;
}
|
{
	$nreg = $reg;
	$nlabel = $label;
} /* epsilon */ ;

// System.out.println("\t");
statement [int reg, int label] returns [int nreg, int nlabel]:
ID ASSIGNMENT ret = arith_expression[$reg]
{
	System.out.println("\tla \$t" + $ret.nreg + ", " + $ID.text);
	System.out.println("\tsw \$t" + $ret.place + ", 0(\$t" + $ret.nreg + ")");

	$nreg = $ret.nreg - 1;
	$nlabel = $label;
} SEMICOLON

| READ ID
{
	System.out.println("\tli \$v0, 5");
	System.out.println("\tsyscall");
	System.out.println("\tla \$t" + $reg + ", n");
	System.out.println("\tsw \$v0, 0(\$t" + $reg + ")");

	$nreg = $reg;
	$nlabel = $label;
} SEMICOLON

| WRITE ret = arith_expression[$reg]
{
	System.out.println("\tmove \$a0, \$t" + $ret.place);
	System.out.println("\tli \$v0, 1");
	System.out.println("\tsyscall");

	$nreg = $reg;
	$nlabel = $label;
} SEMICOLON

| RETURN
{
	System.out.println("\tli \$v0, 10");
	System.out.println("\tsyscall");

	$nreg = $reg;
	$nlabel = $label;
} SEMICOLON

|
{
	System.out.println("L" + ($label) + ":");
}
WHILE LEFTPARENTHESIS ret11 = bool_expression[$reg, $label + 3, $label + 1, $label + 2] RIGHTPARENTHESIS
LEFTBRACE
{
	System.out.println("L" + ($label + 1) + ":");
} ret5 = statements[$reg, $ret11.nlabel] RIGHTBRACE
{
	System.out.println("\tb L" + $label);
	System.out.println("L" + ($label + 2) + ":");

	$nreg = $ret5.nreg;
	$nlabel = $ret5.nlabel;
}

|
IF
LEFTPARENTHESIS ret11 = bool_expression[$reg, $label + 3, $label, $label + 1] RIGHTPARENTHESIS LEFTBRACE
{
	System.out.println("L" + ($label) + ":");
}
ret1 = statements[$reg, $ret11.nlabel] RIGHTBRACE
{
	System.out.println("\tb L" + ($label + 2));
	System.out.println("L" + ($label + 1) + ":");
}
ret2 = else_statement[$ret1.nreg, $ret1.nlabel] FI
{
	System.out.println("L" + ($label + 2)+ ":");
	$nreg = $ret2.nreg;
	$nlabel = $ret2.nlabel;
}
;

else_statement [int reg, int label] returns [int nreg, int nlabel]:
ELSE LEFTBRACE ret = statements[$reg, $label] RIGHTBRACE
{
	$nreg = $ret.nreg;
	$nlabel = $ret.nlabel;
}
|
{
	$nreg = $reg;
	$nlabel = $label;
} /* epsilon */;

bool_expression [int reg, int label, int btrue, int bfalse] returns [int nlabel]:
ret = bool_term[$reg, $label, $btrue, $bfalse] ret1 = bool_expression1[$reg, $ret.nlabel, $btrue, $bfalse]
{
	$nlabel = $ret1.nlabel;
};

bool_expression1 [int reg, int label, int btrue, int bfalse] returns [int nlabel]:
LOGICALOR ret = bool_term[$reg, $label, $btrue, $bfalse] ret1 = bool_expression1[$reg, $ret.nlabel, $btrue, $bfalse]
{
	$nlabel = $ret1.nlabel;
}
|  /* epsilon */
{
	System.out.println("\tb L" + $bfalse);
	$nlabel = $label;
};

bool_term [int reg, int label, int btrue, int bfalse] returns [int nlabel]:
ret = bool_factor[$reg, $label, $btrue, $bfalse] ret1 = bool_term1[$reg, $ret.nlabel, $btrue, $bfalse]
{
	$nlabel = $ret1.nlabel;
};

bool_term1 [int reg, int label, int btrue, int bfalse] returns [int nlabel]:
LOGICALAND ret = bool_factor[$reg, $label, $btrue, $bfalse] ret1 = bool_term1[$reg, $ret.nlabel, $btrue, $bfalse]
{
	$nlabel = $ret1.nlabel;
}

| /* epsilon */
{
	$nlabel = $label;
};

bool_factor [int reg, int label, int btrue, int bfalse] returns [int nlabel]:
NOT ret1 = bool_factor[$reg, $label, $bfalse, $btrue]
{
	$nlabel = $ret1.nlabel;
}

| ret = rel_expression[$reg, $label, $btrue, $bfalse]
{
	$nlabel = $ret.nlabel;
}
;

rel_expression [int reg, int label, int btrue, int bfalse] returns [int nlabel]:
ret = arith_expression[$reg] type = relation_op ret1 = arith_expression[$ret.nreg]
{
	if($type.type == 1)
		System.out.print("\tbeq ");
	else if($type.type == 2)
		System.out.print("\tbne ");
	else if($type.type == 3)
		System.out.print("\tbgt ");
	else if($type.type == 4)
		System.out.print("\tbge ");
	else if($type.type == 5)
		System.out.print("\tblt ");
	else
		System.out.print("\tble ");

	System.out.println("\$t" + $ret.place + ", \$t" + $ret1.place + ", L" + ($label + 1));
	System.out.println("\tb L" + $label);

	System.out.println("L" + ($label + 1) + ":");
	System.out.println("\tb L" + $btrue);
	System.out.println("L" + $label + ":");

	$nlabel = $label + 2;
};

relation_op returns [int type]:
ISEQUAL
{
	$type = 1;
}
| NOTEQUAL
{
	$type = 2;
}
| GREATER
{
	$type = 3;
}
| GREATEREQUAL
{
	$type = 4;
}
| LESS
{
	$type = 5;
}
| LESSEQUAL
{
	$type = 6;
}
;























arith_expression [int reg] returns [int nreg, int place] :
ret = arith_term[$reg] ret1 = arith_expression1[$ret.nreg, $ret.place]
{
	$nreg = $ret1.nreg;
	$place = $ret1.nplace;
};

arith_expression1 [int reg, int place] returns [int nreg, int nplace]:
ADD ret = arith_term[$reg]
{
	System.out.println("\tadd \$t" + $place + ", \$t" + $place + ", \$t" + $ret.place);
}
ret11 = arith_expression1[$reg, $place]
{
	$nreg = $ret11.nreg;
	$nplace = $ret11.nplace;
}

| MINUS ret = arith_term[$reg]
{
	System.out.println("\tsub \$t" + $place + ", \$t" + $place + ", \$t" + $ret.place);
}
ret12 = arith_expression1[$reg, $place]
{
	$nreg = $ret12.nreg;
	$nplace = $ret12.nplace;
}

| /* epsilon */
{
	$nreg = $reg;
	$nplace = $place;
};

arith_term [int reg] returns [int nreg, int place]:
ret = arith_factor[$reg] ret1 = arith_term1[$ret.nreg, $ret.place]
{
	$nreg = $ret1.nreg;
	$place = $ret1.nplace;
};

arith_term1 [int reg, int place] returns [int nreg, int nplace]:
MULTIPLY ret = arith_factor[$reg]
{
	System.out.println("\tmul \$t" + $place + ", \$t" + $place + ", \$t" + $ret.place);
}
ret13 = arith_term1[$reg, $place]
{
	$nreg = $ret13.nreg;
	$nplace = $ret13.nplace;
}

| DIVIDE ret = arith_factor[$reg]
{
	System.out.println("\tdiv \$t" + $place + ", \$t" + $place + ", \$t" + $ret.place);
}
ret14 = arith_term1[$reg, $place]
{
	$nreg = $ret14.nreg;
	$nplace = $ret14.nplace;
}

| PERCENTAGE ret = arith_factor[$reg]
{
	System.out.println("\trem \$t" + $place + ", \$t" + $place + ", \$t" + $ret.place);
}
ret15 = arith_term1[$reg, $place]
{
	$nreg = $ret15.nreg;
	$nplace = $ret15.nplace;
}

| /* epsilon */
{
	$nreg = $reg;
	$nplace = $place;
};

arith_factor [int reg] returns [int nreg, int place]:
	MINUS ret = arith_factor[$reg]
	{
		System.out.println("\tneg \$t" + $ret.place + ", \$t" + $ret.place);
		$nreg = $ret.nreg;
		$place = $ret.place;
	}

	| ret1 = primary_expression[$reg]
	{
		$nreg = $ret1.nreg;
		$place = $ret1.place;
	}
	;

primary_expression [int reg] returns [int nreg, int place]:
	CONST
	{
		System.out.println("\tli \$t" + $reg + ", " + $CONST.text);
		$place = $reg; // which register the const value is stored
		$nreg = $reg + 1; // increment the next available register number
	}

	| ID
	{
		System.out.println("\tla \$t" + $reg + ", " + $ID.text);
		System.out.println("\tlw \$t" + $reg + ", 0(\$t" + $reg + ")");
		$place = $reg; // which register the const value is stored
		$nreg = $reg + 1; // increment the next available register number
	}

	| LEFTPARENTHESIS ret = arith_expression[$reg]
	{
		$place = $ret.place; // which register the const value is stored
		$nreg = $ret.nreg; // increment the next available register number
	}
	  RIGHTPARENTHESIS;




/* lexer rules */
token: (ELSE | FI | IF | INT | MAIN | RETURN | WHILE | READ | WRITE | CONST |
		COMMENT | WHITESPACE | SEMICOLON | ID |
		ADD | MINUS | MULTIPLY | DIVIDE | PERCENTAGE |
		ISEQUAL | NOTEQUAL | GREATER | GREATEREQUAL | LESS | LESSEQUAL |
		LOGICALAND | LOGICALOR |
		NOT | ASSIGNMENT |
		LEFTBRACE | RIGHTBRACE | LEFTPARENTHESIS | RIGHTPARENTHESIS)*;

ELSE: 'else';
FI: 'fi';
IF: 'if';
INT: 'int';
MAIN: 'main';
RETURN: 'return';
WHILE: 'while';
READ: 'read';
WRITE: 'write';
CONST: DIGIT+;
fragment DIGIT: [0-9];
SEMICOLON: ';';
ID: LETTER(LETTER | '0'..'9')*;
fragment LETTER: [a-zA-Z_];
WHITESPACE: [ \t\r\n]+ -> skip;
COMMENT: '/*' .*? '*/' -> skip;
ADD: '+';
MINUS: '-';
MULTIPLY: '*';
DIVIDE: '/';
PERCENTAGE: '%';
ISEQUAL: '==';
NOTEQUAL: '!=';
GREATER: '>';
GREATEREQUAL: '>=';
LESS: '<';
LESSEQUAL: '<=';
LOGICALAND: '&&';
LOGICALOR: '||';
NOT: '!';
ASSIGNMENT: '=';
LEFTBRACE: '{';
RIGHTBRACE: '}';
LEFTPARENTHESIS: '(';
RIGHTPARENTHESIS: ')';
