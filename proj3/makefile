clean:
	-rm *.class
	-rm *.java
	-rm *.tokens

token:
	antlr4 Cactus.g4 && javac Cactus*.java && grun Cactus token -tree < in_integer_floating

grammer:
	antlr4 Cactus.g4 && javac Cactus*.java && grun Cactus s -gui < in_integer_floating
