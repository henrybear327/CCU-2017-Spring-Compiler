#!/bin/bash

FILENAME='Cactus'
TESTCASEDIR='testcase'
TESTCASE=1

# assign color
RED='\033[0;31m'
GREEN='\033[1;32m'
CYAN='\033[0;36m'
RESET='\033[0m'

# setup path
# https://askubuntu.com/questions/98782/how-to-run-an-alias-in-a-shell-script
export CLASSPATH=".:/usr/local/lib/antlr-4.7-complete.jar:$CLASSPATH"
antlr4='java -jar /usr/local/lib/antlr-4.7-complete.jar'
grun='java org.antlr.v4.gui.TestRig'

# compile code
printf "${CYAN}Compiling... ${RESET}"
# rm *.java
# rm *.class
# rm *.tokens
$antlr4 $FILENAME.g4
javac $FILENAME*.java
printf "${CYAN}Done\n\n${RESET}"

# run
$grun $FILENAME program < $TESTCASEDIR/$TESTCASE.in | diff -y -w - $TESTCASEDIR/$TESTCASE.out
