grammar Cactus;

// https://github.com/antlr/antlr4/blob/master/doc/lexer-rules.md

// parser rules
program: MAIN LEFTPARENTHESIS RIGHTPARENTHESIS LEFTBRACE declarations statements RIGHTBRACE;
declarations: INT ID SEMICOLON declarations | /* epsilon */ ;
statements: statement statements | /* epsilon */ ;
statement: ID ASSIGNMENT arith_expression SEMICOLON
		 				| WHILE LEFTPARENTHESIS bool_expression RIGHTPARENTHESIS LEFTBRACE statements RIGHTBRACE
		 				| READ ID SEMICOLON
		 				| WRITE arith_expression SEMICOLON
		 				| RETURN SEMICOLON
		 				| IF LEFTPARENTHESIS bool_expression RIGHTPARENTHESIS LEFTBRACE statements RIGHTBRACE else_statement;
/* common prefix */
else_statement: ELSE LEFTBRACE statements RIGHTBRACE FI
	 							| FI;

/* Left recursion */
bool_expression: bool_term bool_expression1;
bool_expression1: LOGICALOR bool_term bool_expression1
									|  /* epsilon */;

/* Left recursion */
bool_term: bool_factor bool_term1;
bool_term1: LOGICALAND bool_factor bool_term1
		  				| /* epsilon */;

bool_factor: NOT bool_factor
		   				| rel_expression;
rel_expression: arith_expression relation_op arith_expression;
relation_op: ISEQUAL | NOTEQUAL | GREATER | GREATEREQUAL | LESS | LESSEQUAL;

/* Left recursion */
arith_expression: arith_term arith_expression1;
arith_expression1: ADD arith_term arith_expression1
	 									| MINUS arith_term arith_expression1
	 									| /* epsilon */ ;

/* Left recursion */
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

// lexer rules
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
