grammar Cactus;

// parser rules
token: (ELSE | FI | IF | INT | MAIN | RETURN | WHILE | READ | WRITE | CONST |
		COMMENT | WHITESPACE | SEMICOLON | ID |
		ADD | MINUS | STAR | FORWARDSLASH | PERCENTAGE |
		ISEQUAL | NOTEQUAL | GREATER | GREATEREQUAL | LESS | LESSEQUAL |
		LOGICALAND | LOGICALOR |
		NOT | EQUAL |
		LEFTPARENTHESIS | RIGHTPARENTHESIS | LEFTBRACE | RIGHTBRACE)*;

// lexer rules
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
STAR: '*';
FORWARDSLASH: '/';
PERCENTAGE: '%';
ISEQUAL: '=';
NOTEQUAL: '!=';
GREATER: '>';
GREATEREQUAL: '>=';
LESS: '<';
LESSEQUAL: '<=';
LOGICALAND: '&&';
LOGICALOR: '||';
NOT: '!';
EQUAL: '=';
LEFTPARENTHESIS: '{';
RIGHTPARENTHESIS: '}';
LEFTBRACE: '(';
RIGHTBRACE: ')';
