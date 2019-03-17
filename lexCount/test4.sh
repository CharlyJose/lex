#!/bin/bash

lex count4.l
cc lex.yy.c -lfl
./a.out 

