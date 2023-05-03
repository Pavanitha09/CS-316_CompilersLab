compiler:main.c microParser.y microLexer.l
	bison -d microParser.y
	flex microLexer.l
	gcc lex.yy.c microParser.tab.c main.c
clean: 
	rm -f lex.yy.c microParser.tab.c microParser.tab.h

dev:
	@echo "Manche Pavanitha"
	@echo "200010027@iitdh.ac.in"
