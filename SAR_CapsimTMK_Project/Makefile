#
#       Makefile for updated custom capsim blocks. 
#
# 	Note: Use this make file after you have created and
#	added blocks to the custom block library: libblock.a using
#	the "precapsim block1 block2 ... " command.
#
#	In otherwords, use this Makefile if you update the blocks in this
#	directory, not if you just created a new one. Use precapsim to
#	add the new block to the library, then use make after any further
#	changes to the block.
#
# 
# 	Written by Sasan H. Ardalan.
#



all: capsim 

capsim: BLOCKS/libblock.a SUBS/libsub.a   
	cd BLOCKS; perl $(CAPSIM)/TOOLS/blockmaint.pl g
	gcc -c -I$(CAPSIM)/include -I$(CAPSIM)/include/TCL BLOCKS/krn_blocklib.c 
	bash $(CAPSIM)/TOOLS/precapsim_linux.sh '-l' 



BLOCKS/libblock.a:   
	cd BLOCKS; perl $(CAPSIM)/TOOLS/blockmake.pl *.s; make -f blocks.mak

SUBS/libsub.a:
	cd SUBS ; make

clean:
	touch	libblock.a
	rm libblock.a
	cd SUBS; touch libsub.a  ; rm libsub.a
	touch BLOCKS/blockdatabase.dat
	rm BLOCKS/blockdatabase.dat
	cp $(CAPSIM)/BLOCKS/blockdatabase.dat BLOCKS/.
	chmod +w BLOCKS/blockdatabase.dat

