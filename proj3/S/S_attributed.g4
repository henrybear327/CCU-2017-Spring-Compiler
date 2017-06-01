grammar S_attributed;

// https://github.com/antlr/antlr4/blob/master/doc/lexer-rules.md

// parser rules
s: ret_l = l ret_r = r {System.out.println($ret_l.val + $ret_r.val / $ret_r.base);};

r returns [double base, double val]:
    DOT ret_l = l {$base = $ret_l.base; $val = $ret_l.val;}
    | /*epsilon*/ {$base = 1; $val = 0;};

l returns [double base, double val]:
    ret_b = b ret_ls1 = ls {$base = $ret_ls1.base; $val = $ret_b.val * $base + $ret_ls1.val; $base *= 2;};

ls returns [double base, double val]:
    ret_b = b ret_ls1 = ls {$base = $ret_ls1.base; $val = $ret_b.val * $base + $ret_ls1.val; $base *= 2;}
    | /*epsilon*/ {$base = 1; $val = 0;};

b returns [double val] :
    ZERO {$val = 0.0;}
    | ONE {$val = 1.0;};

// lexer rules
token: (ZERO | ONE | DOT | WHITESPACE)*;

ZERO: '0';
ONE: '1';
DOT: '.';
WHITESPACE: [ \t\r\n]+ -> skip;
