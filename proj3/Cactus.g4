grammar Cactus;

// https://github.com/antlr/antlr4/blob/master/doc/lexer-rules.md

// parser rules


// lexer rules
token: (DIGIT | dot | WHITESPACE)*;

DIGIT: [0-1];
dot: '.';
WHITESPACE: [ \t\r\n]+ -> skip;
