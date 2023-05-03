compiler:main.cpp microParser.ypp microLexer.l
	bison -d -o microParser.cpp microParser.ypp
	flex -o lex.yy.cpp microLexer.l
	g++ lex.yy.cpp microParser.cpp main.cpp -o compiler
clean: 
	rm -f lex.yy.cpp microParser.cpp microParser.hpp compiler

dev:
	@echo "Manche Pavanitha"
	@echo "200010027@iitdh.ac.in"
