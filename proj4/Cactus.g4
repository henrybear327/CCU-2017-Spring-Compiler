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

// Deal with system call first
statement [int nreg, int nlabel]: ID ASSIGNMENT arith_expression SEMICOLON

			| WHILE LEFTPARENTHESIS bool_expression RIGHTPARENTHESIS LEFTBRACE statements[0, 1] RIGHTBRACE

			| READ ID SEMICOLON
			  {
			  	System.out.println("\tli \$v0, 5");
				System.out.println("\tsyscall");
				System.out.println("\tla \$t" + $nreg + ", n");
				System.out.println("\tsw \$v0, 0(\$t" + $nreg + ")");
			  }

			| WRITE arith_expression SEMICOLON

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

rel_expression: arith_expression relation_op arith_expression;

relation_op: ISEQUAL | NOTEQUAL | GREATER | GREATEREQUAL | LESS | LESSEQUAL;

arith_expression: arith_term arith_expression1;

arith_expression1: ADD arith_term arith_expression1

					| MINUS arith_term arith_expression1

					| /* epsilon */ ;

arith_term: arith_factor arith_term1;

arith_term1: MULTIPLY arith_factor arith_term1

			| DIVIDE arith_factor arith_term1

	 		| PERCENTAGE arith_factor arith_term1

			| /* epsilon */ ;

arith_factor: MINUS arith_factor

			  | primary_expression;

primary_expression: CONST

					| ID

					| LEFTPARENTHESIS arith_expression RIGHTPARENTHESIS;




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
