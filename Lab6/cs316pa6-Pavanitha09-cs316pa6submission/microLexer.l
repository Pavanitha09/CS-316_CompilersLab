%{
#include <math.h>

#include<cstdio>
#include<string.h>
#include<bits/stdc++.h>
#include<iostream>
#include <utility>
#include<vector>
using namespace std;
#include "microParser.hpp"




struct temporary {
  char* iden;
  int line_number;
};

int lines_cnt = 1;

%}
DIGIT [0-9]
COLON ":"
PLUS "+"
MINUS "-"
MULTIPLICATION "*"
DIVISION "/"
EQUAL "="
NOT "!"
LESSTHAN "<"
GREATERTHAN ">"
LEFTBRACKET "("
RIGHTBRACKET ")"
SEMICOLON ";"
COMA ","
ID [a-zA-Z][a-zA-Z0-9]*
%%
{DIGIT}+ {
	yylval.v = strdup(yytext);
	return INTLITERAL;
}

{DIGIT}+"."{DIGIT}* {
	yylval.v = strdup(yytext);
	return FLOATLITERAL;
}

{COLON}|{PLUS}|{MINUS}|{MULTIPLICATION}|{EQUAL}|{NOT}|{LESSTHAN}|{GREATERTHAN}|{LEFTBRACKET}|{RIGHTBRACKET}|{SEMICOLON}|{COMA}|{DIVISION} {
	return *yytext;
}

"//".*\n {
	lines_cnt++;
}
 
\"(\\.|[^"\\])*\" {
	yylval.s = new pair<string,int>;
	(yylval.s)->first = strdup(yytext);
	(yylval.s)->second = lines_cnt;
	
	return STRINGLITERAL;
}

PROGRAM {return PROGRAM;}

BEGIN {return _BEGIN;}

END {return END;}

STRING {return STRING;}

FLOAT {
	yylval.v = strdup(yytext);
	return FLOAT;}

INT {
	yylval.v = strdup(yytext);
	
	return INT;}

VOID {return VOID;}

FUNCTION {return FUNCTION;}

READ {return READ;}

WRITE {return WRITE;}

RETURN {return RETURN;}

IF {return IF;}

ENDIF {return ENDIF;}

ELSE {return ELSE;}

WHILE {return WHILE;}

ENDWHILE {return ENDWHILE;}

CONTINUE {return CONTINUE;}

BREAK {return BREAK;}


{ID} {
	yylval.s = new pair<string,int>;
	(yylval.s)->first = strdup(yytext);
	(yylval.s)->second = lines_cnt;
	return IDENTIFIER;
}


[ \t\r]+ {}

\n {
	lines_cnt++;
}
. {}

%%

int yywrap(){

	return 1;
}
