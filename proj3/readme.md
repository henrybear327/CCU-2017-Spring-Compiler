# Test token

`antlr4 Cactus.g4 && javac Cactus*.java && grun Cactus token -tree < in_integer_floating`

# Test grammer

`antlr4 Cactus.g4 && javac Cactus*.java && grun Cactus s -gui < in_integer_floating`

# Test S-attributed

`antlr4 S_attributed.g4 && javac S_attributed*.java && grun S_attributed s < in_integer_floating`

# Test L-attributed

`antlr4 L_attributed.g4 && javac L_attributed*.java && grun L_attributed s < in_integer_floating`

# Testing command

`python3 tester.py; grun S_attributed s; grun L_attributed s;`
