grammar L_attributed;

// parser rules
s: ret_l = l[1] ret_r = r[0] {System.out.println($ret_l.val + $ret_r.val);};

r [int side] returns [double val]:
    DOT ret_l = l[$side] {$val = $ret_l.val;}
    | /*epsilon*/ {$val = 0;};

l [int side] returns [double base, double val]:
    ret_b = b ret_ls1 = ls[$ret_b.val, $side] {$base = $ret_ls1.base * 2; 
											   $val = $side == 1 ? 
											   		$ret_b.val * $base / 2 + $ret_ls1.val : 
											   		$ret_b.val / 2 + $ret_ls1.val / 2;};

ls [double orig_val, int side] returns [double base, double val]:
    ret_b = b ret_ls1 = ls[$ret_b.val, $side] {$base = $ret_ls1.base * 2; 
											   $val = $side == 1 ? 
											   		$ret_b.val * $base / 2 + $ret_ls1.val : 
											   		$ret_b.val / 2 + $ret_ls1.val / 2;}
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
