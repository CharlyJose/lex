%{

int line_number=1;

%}


letter 		[a-zA-Z]
digit 		[0-9]
alpha 		[a-zA-Z0-9_]
whitespace 	[ \t\n]
c_start_comment	"/*"
c_end_comment	"*/"
s_start_comment	"//"
comment		({c_start_comment}+({alpha}?|{whitespace}?)*{c_end_comment}+)



int_type 	("int"|"INT")
float_type 	("float"|"FLOAT")
char_type	("char"|"CHAR")
double_type	("double"|"DOUBLE")

if		("if"|"IF")

for_loop	("for"|"FOR")
while_loop	("while"|"WHILE")




%%
{comment}		{ printf("%3d %40s : COMMENT"				, line_number++, yytext	);	}
{int_type}		{ printf("%3d %40s : INTEGER TYPE"			, line_number++, yytext	);	}
{float_type}	{ printf("%3d %40s : FLOATING POINT TYPE"	, line_number++, yytext	);	}
{char_type}		{ printf("%3d %40s : CHARACTER TYPE"		, line_number++, yytext	);	}
{double_type}	{ printf("%3d %40s : DOUBLE TYPE"			, line_number++, yytext	);	}

{if}			{ printf("%3d %40s : IF CONDITIONAL"		, line_number++, yytext	);	}
{for_loop}		{ printf("%3d %40s : FOR LOOP"				, line_number++, yytext	);	}
{while_loop}	{ printf("%3d %40s : WHILE LOOP"			, line_number++, yytext	);	}


%%


int yywrap() {}

int main(int argc, char* argv[]) {
	extern FILE *yyin;
	yyin = fopen(argv[1], "r");
	yylex();
	return 0;
}
