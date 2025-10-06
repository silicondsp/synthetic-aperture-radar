all:libblock.a 

zdummy.c:zdummy.s
	java -jar $(CAPSIM)/TOOLS/saxon.jar zdummy.s $(CAPSIM)/TOOLS/blockgen.xsl>zdummy.c
	perl $(CAPSIM)/TOOLS/blockmaint.pl a zdummy.s

zdummy.o:zdummy.c
	cc -c -g  -I$(CAPSIM)/include -I$(CAPSIM)/include/TCL -I../include zdummy.c

libblock.a:zdummy.o 
	ar -r libblock.a zdummy.o 
	ranlib libblock.a
