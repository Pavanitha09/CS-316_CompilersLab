#include<stdio.h>
#include<stdlib.h>

extern FILE* yyin;
int yylex(); 
int yyparse();

void yyerror(const char* msg){
	printf("Not accepted\n");
}

int main(int argc, char* argv[]) {
	if(argc > 1)
	{
		FILE *f;
		f = fopen(argv[1], "r");
		if(f)
		{
			yyin = f;
		}
	}
 // int state = yyparse();
 if(yyparse() == 0)
 {
 	printf("Accepted\n");
 }
}

