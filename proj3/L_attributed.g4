grammar L_attributed;

// https://github.com/antlr/antlr4/blob/master/doc/lexer-rules.md

// parser rules
s: l r;
r: DOT l | /*epsilon*/;
l: b ls;
ls: b ls | /*epsilon*/;
b: DIGIT;

// lexer rules
token: (DIGIT | DOT | WHITESPACE)*;

DIGIT: [0-1];
DOT: '.';
WHITESPACE: [ \t\r\n]+ -> skip;
