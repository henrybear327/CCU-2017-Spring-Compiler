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
statements [int reg, int label] : statement[$reg, $label] statements[0, 1] | /* epsilon */ ;

// System.out.println("\t");
statement [int reg, int label] /*returns [int nreg, int nlabel]*/:
			ID ASSIGNMENT ret = arith_expression[$reg]
			{
				System.out.println("\tla \$t" + $ret.nreg + ", " + $ID.text);
				System.out.println("\tsw \$t" + $ret.place + ", 0(\$t" + $ret.nreg + ")");
			}
			/* $nreg = $ret.nreg - 1; */
			/* $nlabel = $label; */
			SEMICOLON

			| WHILE LEFTPARENTHESIS bool_expression RIGHTPARENTHESIS LEFTBRACE statements[0, 1] RIGHTBRACE

			| READ ID SEMICOLON
			  {
			  	System.out.println("\tli \$v0, 5");
				System.out.println("\tsyscall");
				System.out.println("\tla \$t" + $reg + ", n");
				System.out.println("\tsw \$v0, 0(\$t" + $reg + ")");
			  }

			| WRITE arith_expression[$reg] SEMICOLON // not done

			| RETURN
			  {
			  	System.out.println("\tli \$v0, 10");
				System.out.println("\tsyscall");
			  }
			  SEMICOLON

			| IF LEFTPARENTHESIS bool_expression RIGHTPARENTHESIS LEFTBRACE statements[0, 1] RIGHTBRACE else_statement FI;

else_statement: ELSE LEFTBRACE statements[0, 1] RIGHTBRACE

				| /* epsilon */;

bool_expression: bool_term bool_expression1;

bool_expression1: LOGICALOR bool_term bool_expression1

				  |  /* epsilon */;

bool_term: bool_factor bool_term1;

bool_term1: LOGICALAND bool_factor bool_term1

			| /* epsilon */;

bool_factor: NOT bool_factor

			 | rel_expression;

rel_expression: arith_expression[0] relation_op arith_expression[1]; // not done

relation_op: ISEQUAL | NOTEQUAL | GREATER | GREATEREQUAL | LESS | LESSEQUAL;























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
