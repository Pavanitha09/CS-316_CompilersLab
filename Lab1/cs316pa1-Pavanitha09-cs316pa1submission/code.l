%{
#include <math.h>
%}
DIGIT [0-9]
PROGRAM "PROGRAM"
BEGIN "BEGIN"
END "END"
FUNCTION "FUNCTION"
READ "READ"
WRITE "WRITE"
IF "IF"
ELSE "ELSE"
ENDIF "ENDIF"
WHILE "WHILE"
ENDWHILE "ENDWHILE"
BREAK "BREAK"
CONTINUE "CONTINUE"
RETURN "RETURN"
INT "INT"
VOID "VOID"
STRING "STRING"
FLOAT "FLOAT"
COLONEQUALS ":="
PLUS "+"
MINUS "-"
MULTIPLICATION "*"
DIVISION "/"
EQUAL "="
NOTEQUAL "!="
LESSTHAN "<"
GREATERTHAN ">"
LEFTBRACKET "("
RIGHTBRACKET ")"
SEMICOLON ";"
COMA ","
LESSTHANEQUALTO "<="
GREATERTHANEQUALTO ">="
ID [a-zA-Z][a-zA-Z0-9]*
%%
{DIGIT}+ {
fprintf(yyout,"Token Type: INTLITERAL\nValue: %s\n", yytext);
}

{DIGIT}+"."{DIGIT}* {
fprintf(yyout,"Token Type: FLOATLITERAL\nValue: %s\n", yytext);
}

{COLONEQUALS}|{PLUS}|{MINUS}|{MULTIPLICATION}|{EQUAL}|{NOTEQUAL}|{LESSTHAN}|{GREATERTHAN}|{LEFTBRACKET}|{RIGHTBRACKET}|{SEMICOLON}|{COMA}|{LESSTHANEQUALTO}|{GREATERTHANEQUALTO}|{DIVISION} {
fprintf(yyout,"Token Type: OPERATOR\nValue: %s\n",yytext);
}

"//".*\n {}
 
\"(\\.|[^"\\])*\" {
fprintf(yyout,"Token Type: STRINGLITERAL\nValue: %s\n", yytext);
}

{PROGRAM}|{BEGIN}|{END}|{FUNCTION}|{READ}|{WRITE}|{IF}|{ELSE}|{ENDIF}|{WHILE}|{ENDWHILE}|{BREAK}|{CONTINUE}|{RETURN}|{INT}|{VOID}|{STRING}|{FLOAT} {
fprintf(yyout,"Token Type: KEYWORD\nValue: %s\n", yytext);
}

{ID} {
fprintf(yyout,"Token Type: IDENTIFIER\nValue: %s\n", yytext);
}

[ \n\t]+ {}
. {}

%%

int yywrap(){}
int main(int argc, char *argv[])
{
FILE *f1, *f2;
f1 = fopen(argv[1],"r");
f2 = fopen(argv[2],"w");
yyin = f1;
yyout = f2;
yylex();
return 0;

}
