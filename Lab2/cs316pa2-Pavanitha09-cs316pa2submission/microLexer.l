%{
#include <math.h>
#include "microParser.tab.h"
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
	return INTLITERAL;
}

{DIGIT}+"."{DIGIT}* {
	return FLOATLITERAL;
}

{COLON}|{PLUS}|{MINUS}|{MULTIPLICATION}|{EQUAL}|{NOT}|{LESSTHAN}|{GREATERTHAN}|{LEFTBRACKET}|{RIGHTBRACKET}|{SEMICOLON}|{COMA}|{DIVISION} {
	return *yytext;
}

"//".*\n {}
 
\"(\\.|[^"\\])*\" {
	return STRINGLITERAL;
}

PROGRAM {return PROGRAM;}

BEGIN {return _BEGIN;}

END {return END;}

STRING {return STRING;}

FLOAT {return FLOAT;}

INT {return INT;}

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
	return IDENTIFIER;
}


[ \n\t]+ {}
. {}

%%

int yywrap(){

	return 1;
}
