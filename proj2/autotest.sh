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

FILENAME='Cactus'
# FILENAME='CactusGary'

# assign scoring scheme
score=(5 5 5 5 5 6 6 6 6 6 6 6 6 6 7 7 7)

# compile code
printf "${CYAN}Compiling ${FILENAME}... ${RESET}"
rm *.java
rm *.class
rm *.tokens
antlr4 $FILENAME.g4
javac $FILENAME*.java
printf "${CYAN}Done\n\n${RESET}"

# Perform testing

# The $# variable will tell you the number of input arguments the script was passed.
# if [ $# -eq 0 ]
#   then
#     echo "No arguments supplied"
# fi

# The -z switch will test if the expansion of "$1" is a null string or not.
# If it is a null string then the body is executed.
if [ -z "$1" ]
  then
    # echo "No argument supplied"
	sum=`expr 0`
	# printf "sum = ${sum}\n"

	for testcase in `seq 1 17`;
	do
		# echo "Testing on testcase $testcase"

		FOO=`grun $FILENAME program -tree < testcase/$testcase.in | diff -w - testcase/$testcase.out`
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

	printf "\n${CYAN}Total score = ${sum}\n${RESET}"
else
	FOO=`grun $FILENAME program -tree < testcase/$1.in | diff -w - testcase/$1.out`
	RET=$?

	if [[ $RET -eq 0 ]]
	then
		printf "${GREEN}Testcase ${1} passed${RESET}\n"
	else
		printf "${RED}Testcase ${1} failed\n${RESET}"
		printf "${RED}The error output is as followed:${RESET}\n\n${FOO}\n"
	fi
fi
