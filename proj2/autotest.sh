#!/bin/zsh

# setup path
export CLASSPATH=".:/usr/local/lib/antlr-4.7-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.7-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

# assign color
RED='\033[0;31m'
GREEN='\033[1;32m'
Cyan='\033[0;36m'
RESET='\033[0m'

# assign scoring scheme
score=(5 5 5 5 5 6 6 6 6 6 6 6 6 6 7 7 7)

sum=`expr 0`
# printf "sum = ${sum}\n"

# compile code
printf "${Cyan}Compiling... ${RESET}"
antlr4 Cactus.g4
javac Cactus*.java
printf "${Cyan}Done\n${RESET}"

for testcase in `seq 1 17`;
do
	# echo "Testing on testcase $testcase"

	FOO=`grun Cactus program -tree < testcase/$testcase.in | diff -w - testcase/$testcase.out`
	RET=$?

	if [[ $RET -eq 0 ]]
	then
		printf "${GREEN}Testcase ${testcase} passed${RESET}\n"
		sum=`expr $sum + $score[$testcase]`
	else
		printf "${RED}Testcase ${testcase} failed (-$score[$testcase])\n${RESET}"
		# printf "${RED}The error output is as followed:${RESET}\n\n${FOO}\n"
	fi
done

printf "${LIGHTBLUE}Total score = ${sum}\n${RESET}"
