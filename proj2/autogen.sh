#!/bin/zsh

# setup path
export CLASSPATH=".:/usr/local/lib/antlr-4.7-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.7-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

# assign color
RED='\033[0;31m'
GREEN='\033[1;32m'
CYAN='\033[0;36m'
RESET='\033[0m'

FILENAME='CactusGary'

# compile code
printf "${CYAN}Compiling... ${RESET}"
rm *.java
rm *.class
rm *.tokens
antlr4 $FILENAME.g4
javac $FILENAME*.java
printf "${CYAN}Done\n\n${RESET}"

for testcase in `seq 1 17`;
do
    FOO=`grun $FILENAME program -tree < testcase/$testcase.in > testcase/$testcase.out`
    RET=$?

    if [[ $RET -eq 0 ]]
    then
        printf "${GREEN}Testcase ${testcase} answer generated${RESET}\n"
    else
        printf "${RED}Testcase ${testcase} answer failed to generate\n${RESET}"
    fi
done
