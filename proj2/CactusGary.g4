grammar CactusGary;

// Lexer Rules
token:(WS|COMMENT|ELSE|FI|IF|INT|MAIN|RETURN|WHILE|READ|WRITE|ID|INT_CONST|ADD|SUB|MUL|DIV|MOD|EQ|NEQ|GT|GTEQ|LESS|LESSEQ|AND|OR|NOT|ASSIGN|LEFT_PAR|RIGHT_PAR|LEFT_BRA|RIGHT_BRA|SEMI)*;

WS  : [ \t\r\n]+ -> skip ;
COMMENT : '/*'.*?'*/' -> channel(HIDDEN);
MAIN    : 'main';

ELSE    : 'else';
FI  : 'fi';
IF  : 'if';
INT : 'int';
RETURN  : 'return';
WHILE   : 'while';
READ    : 'read';
WRITE   : 'write';

ADD : '+';
SUB : '-';
MUL : '*';
DIV : '/';
MOD : '%';
EQ  : '==';
NEQ : '!=';
GT  : '>';
GTEQ    : '>=';
LESS    : '<';
LESSEQ  : '<=';
AND : '&&';
OR  : '||';
NOT : '!';
ASSIGN  : '=';
LEFT_PAR    : '(';
RIGHT_PAR   : ')';
LEFT_BRA    : '{';
RIGHT_BRA   : '}';
SEMI    : ';';

INT_CONST   : [0-9]+;
ID  : [A-Za-z_][A-Za-z0-9_]*;

// Parser Rules
program: MAIN LEFT_PAR RIGHT_PAR LEFT_BRA declarations statements RIGHT_BRA;

declarations: INT ID SEMI declarations|;

statements: statement statements |;

statement: ID ASSIGN arith_expression SEMI |
 IF LEFT_PAR bool_expression RIGHT_PAR LEFT_BRA statements RIGHT_BRA else_statement FI|
 WHILE LEFT_PAR bool_expression RIGHT_PAR LEFT_BRA statements RIGHT_BRA |
 READ ID SEMI |
 WRITE arith_expression SEMI |
 RETURN SEMI;

else_statement: ELSE LEFT_BRA statements RIGHT_BRA |;

bool_expression: bool_term bool_expression1;
bool_expression1: OR bool_term bool_expression1 |;

bool_term: bool_factor bool_term1;
bool_term1: AND bool_factor bool_term1 |;

bool_factor: NOT bool_factor | rel_expression;

rel_expression: arith_expression relation_op arith_expression;

relation_op: EQ | NEQ | GT | GTEQ | LESS | LESSEQ;

arith_expression: arith_term arith_expression1;
arith_expression1: ADD arith_term arith_expression1 | SUB arith_term arith_expression1 |;

arith_term: arith_factor arith_term1;
arith_term1: MUL arith_factor arith_term1 | DIV arith_factor arith_term1 | MOD arith_factor arith_term1 |;

arith_factor: SUB arith_factor | primary_expression;

primary_expression: INT_CONST | ID | LEFT_PAR arith_expression RIGHT_PAR;
