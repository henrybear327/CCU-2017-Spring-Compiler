#!/bin/bash

TESTCASEDIR='testcase'
# TESTCASEDIR='testcaseFI'

if [ $# -eq 0 ]
  then
    echo "Usage: ./autotest filename [testcase number]"
	echo "./autotest Cactus      -> For testing Cactus.g4 using all testcases"
	# echo "./autotest Cactus -FI   -> For testing Cactus.g4 using testcase 17"
	echo "./autotest Cactus 17   -> For testing Cactus.g4 using testcase 17"
	exit 1
fi

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

# wrong
# if [ -z "$3" ] && [ "$3" == "-FI" ]
# then
# 	TESTCASEDIR='testcaseFI'
# 	printf "${CYAN}Testing using alternative answers\n${RESET}"
# else
# 	TESTCASEDIR='testcase'
# 	printf "${CYAN}Testing using TA's answers\n${RESET}"
# fi

# assign scoring scheme
score=(0 5 5 5 5 5 6 6 6 6 6 6 6 6 6 7 7 7)

# compile code
printf "${CYAN}Compiling ${1}... ${RESET}"
# rm *.java
# rm *.class
# rm *.tokens
$antlr4 $1.g4
javac $1*.java
printf "${CYAN}Done\n\n${RESET}"

# Perform testing

# The $# variable will tell you the number of input arguments the script was passed.
# if [ $# -eq 0 ]
#   then
#     echo "No arguments supplied"
# fi

# The -z switch will test if the expansion of "$1" is a null string or not.
# If it is a null string then the body is executed.
if [ -z "$2" ]
  then
    # echo "No argument supplied"
	printf "${CYAN}Testing ${1} on all testcases\n${RESET}"

	sum=`expr 0`
	# printf "sum = ${sum}\n"

	for testcase in `seq 1 17`;
	do
		# echo "Testing on testcase $testcase"

		FOO=`$grun $1 program -tree < $TESTCASEDIR/$testcase.in | diff -w - $TESTCASEDIR/$testcase.out`
		RET=$?

		if [[ $RET -eq 0 ]]
		then
			printf "${GREEN}Testcase ${testcase} passed${RESET}\n"
			sum=`expr $sum + ${score[$testcase]}`
		else
			printf "${RED}Testcase ${testcase} failed (-${score[$testcase]})\n${RESET}"
			# printf "${RED}The error output is as followed:${RESET}\n\n${FOO}\n"
		fi
	done

	printf "\n${CYAN}Total score = ${sum}\n${RESET}"
else
	printf "${CYAN}Testing ${1} on testcase ${2}\n${RESET}"

	FOO=`$grun $1 program -tree < $TESTCASEDIR/$2.in | diff -w - $TESTCASEDIR/$2.out`
	RET=$?

	if [[ $RET -eq 0 ]]
	then
		printf "${GREEN}Testcase ${2} passed${RESET}\n"
	else
		printf "${RED}Testcase ${2} failed\n${RESET}"
		printf "${RED}The error output is as followed:${RESET}\n\n${FOO}\n"
	fi
fi
