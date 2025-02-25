The executables, belonging to the Cowgol compiler (COWGOL, COWFE, COWBE, COWLINK, COWFIX).

The executables from HiTech's C toolchain are also included ($EXEC, CPP, P1, CGEN, OPTIM, Z80AS, LINK, LIBR).

These executables are valid for all Z80 CP/M computers provided with 64KB RAM.

Also, the source files for the COWGOL command line processor (cowgol.c) and for COWFIX (cowfix.c and fix.as) are included.

What is COWFIX?

Cowfix is a tool I wrote, used to modify and optimize the output of Cowlink.

Cowlink is the "linker" that binds the "cowgol object code" files produced by Cowbe, into a Z80 assembler file.

The original output from Cowlink has however some issues that must be addressed, before assembling the file.

First, the file contains some "exotic" Z80 assembler syntax, which must be corrected.

Examples:

-push b, pop b used instead the usual push bc, pop bc
-all jump instructions use jr, not jp
-0xnn is used for hexa constants
-dword nnnnnnnnn is used to store 32 bit constants

Also, there are some things to be optimized in the original output from cowlink.

If the -O option is used in the Cowgol command line, COWFIX will made also code optimizations, and will comment-out non-referenced labels and "dead" code. .

Here is the complete list of the optimizations performed by Cowfix:

------------------------------------------
 Eliminate 'ld (ws+nnn), hl' or 'ld (ws+nnn), a' statements,
 if nnn is not used in 'ld hl,(ws+nnn)' statements of the current subroutine, or
    nnn or nnn+1 is not used in 'ld a,(ws+nnn)' statements of the current subroutine
------------------------------------------
When f_xxx is called only with HL or A as parameter,

	call	f_xxx
	ret

replaced by:

	jp	f_xxx
------------------------------------------
 Optimization of jp -> jp -> ... jp -->
e.g:

	jp	aaa
	...
aaa:	jp	bbb
	...
bbb:	jp	ccc
	...
ccc:

replaced by:

	jp	ccc
	...
aaa:	jp	ccc
	...
bbb:	jp	ccc
	...
ccc: 
-------------------------------------------
	ld (ws+nnn),hl
end_fyyy:
	ld hl,(ws+nnn)
	ret

replaced by:	ret
-------------------------------------------
	ld (ws+nnn),a
end_fyyy:
	ld a,(ws+nnn)
	ret

replaced by:	ret
---------------------------------
	jp nz, c01_xxxx
	jp c01_yyyy
c01_xxxx:

replaced by:	jp z, c01_yyyy
---------------------------------
	jp z, c01_xxxx
	jp c01_yyyy
c01_xxxx:

replaced by:	jp nz, c01_yyyy
---------------------------------
	jp z, c01_xxxx
	call fyyy
c01_xxxx:

replaced by:	call nz,fyyy
--------------------------------
	jp nz, c01_xxx
	call fyyy
c01_xxx:

replaced by:	call z,fyyy
--------------------------------
	jp nz, c01_xxx
	ret
c01_xxx:

replaced by:	ret z
--------------------------------
	jp z, c01_xxx
	ret
c01_xxx:

replaced by:	ret nz
--------------------------------
	jp (xx,) c01_ccc
	...
c01_xxx:
	ret

replaced by:

	ret (xx)
	...
c01_xxx:
	ret
-------------------------------

This is important not only to obtain optimal code (smaller & faster) in the executable being built, but also to facilitate the assembler's work.

However, an important disadvantage of using this -O option is the longer time needed by Cowfix to process the file.

On the other hand, if you are not interested in optimizing the code of your executable, or you want to speed-up the compilation time, you may use the simpler variant, without the -O option, for example when compiling Hexdump.cow:

>cowgol hexdump.cow

, which will result in a shorter compile time, with the disadvantage of obtaining a slightly larger and slower executable.

WARNING
-------

For the computers provided with 128KB or 512KB RAM, see the 128_512_KB folder for custom COWFE versions, enabling comilation of larger Cowgol source files.
