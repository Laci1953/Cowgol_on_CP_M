The executables, belonging to the Cowgol compiler.

You will need also the executables from HiTech's C toolchain.

What is Cowfix?

Cowfix is a tool used to modify and optimize the output of Cowlink.

The original output from Cowlink has some issues that must be addressed, before assembling the file.

First, the file contains some "exotic" Z80 assembler syntax, which must be corrected.

Examples:

-push b, pop b used instead the usual push bc, pop bc
-all jump instructions use jr, not jp
-0xnn is used for hexa constants
-dword nnnnnnnnn is used to store 32 bit constants

Second, there are some things to be optimized in the original output from cowlink.

It contains a lot of "dead" labels (labels that are not referred in any statement).

Also, there are a lot of useless "ld (ws+nnn),hl" or "ld (ws+nnn),a" statements (the problem is that the data stored is never used...).

Also, there are a lot of inefficient fragments of code, type:

	...
	call	routine
	ret

instead of:

	...
	jp	routine

Cowfix addresses all these issues, obtaining a smaller and more efficient assembler source file, as output, ready to be assembled.

