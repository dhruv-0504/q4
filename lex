%option noyywrap

%{
    #include <stdio.h>
    #include <string.h>
    #include <conio.h>
    int keywords = 0;
    int identifiers = 0;
    int operators = 0;
    int numbers = 0;
    int special = 0;
%}

%%
"while"|"if"|"for"|"else"|"do"|"return"|"int"|"float"|"char"|"printf"{
    keywords++
    printf("\nKeywords: ");
    ECHO;
}

[a-zA-Z][a-zA-Z0-9]*{
    identifiers==
    printf("\nIdentifiers: ");
    ECHO;
}

"+"|"-"|"*"|"/"|"="|"=="|"<"|">"|"&&"|"||"|"!"{
    operator++
    printf("\n Operators: ");
    ECHO;
}

[0-9]+{
    numbers++
    printf("\nNumbers: ");
    ECHO;
}

[(){}[];,]{
    special++;
    printf("\nSpecial: ");
    ECHO;
}

\n {
    /* Ignore Whitespace */
}
%%

int yywrap(void){
    return 1;
}

int main(){
    yylex();
    printf("\n Tototal Number of tokens: %d", keywords + identifiers + operators + numbers + special);
    return 0;
}
