%{


int pcount = 0;
int ncount = 0;

%}

QUIT ("q")

gerr .*
enum .+("+"|"-")?([0-9])+.+
pnum ("+")?([0-9])+("."[0-9]+)?
nnum ("-")([0-9])+("."[0-9]+)?

%%


{pnum} { printf(" : POSITIVE number"); ++pcount; 	}
{nnum} { printf(" : NEGATIVE number"); ++ncount; 	}
{enum} { printf(" : INVALID number"); 			}
{QUIT} { return 0;					}
{gerr} { printf(" : INVALID number"); 			}

%%

int yywrap(void) {}

int main(void) {
	yylex();
	printf("\nPOSITIVE number count: %d\n", pcount);
	printf("NEGATIVE number count: %d\n", ncount);
	return 0;
}
