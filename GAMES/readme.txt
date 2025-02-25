Some games, rewritten in the Cowgol language

Because they are too large to be compiled using the original Cowgol compiler, they must be compiled only on 128/512 KB Z80 computers.

To compile startrek:

>cowgol -o misc.coo string.coo seqfile.coo startrek.cow

To compile bowling:

>cowgol -o -lcowgol bowling.cow
