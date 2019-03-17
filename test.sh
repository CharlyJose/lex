#!/bin/bash

clear

echo -e $'\nLEX FILE: '$'\e[92m'$1$'\033[0m' $'\nSOURCE FILE: '$'\e[92m'$2$'\033[0m'

if [ ! -f $1 ] || [ ! -f $2 ]; then
	echo -e $'\nERROR: \e[91mFile not found\n'
	exit
else
	lex $1
	if [ -f "lex.yy.c" ]; then
		echo $'\n\e[92m-----> C Conversion Succeeded <-----\033[0m\n'
		
		# DELETING previous files
                cp lex.yy.c lex.yy.c2
		
		# COMPILING C
		cc lex.yy.c -lfl

		# check if compilation succeed
		if [ -f "a.out" ]; then
	                echo $'\n\e[92m-----> Compilation Success <-----\033[0m\n'
			./a.out $2 >&2 echo $'\nError'
	                echo $'\n\e[92m-----> Program Ends <-----\033[0m\n'
		else
			echo $'\e[91m\n\n-----> CANNOT COMPILE C File <-----'
			exit
		fi
	fi
fi
