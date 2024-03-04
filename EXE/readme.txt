The executables, belonging to the Cowgol compiler.

You will need also the executables from HiTech's C toolchain.

What is Cowfix?

Cowfix is a tool I wrote, used to modify and optimize the output of Cowlink.

The original output from Cowlink has some issues that must be addressed, before assembling the file.

First, the file contains some "exotic" Z80 assembler syntax, which must be corrected.

Examples:

-push b, pop b used instead the usual push bc, pop bc
-all jump instructions use jr, not jp
-0xnn is used for hexa constants
-dword nnnnnnnnn is used to store 32 bit constants

Second, there are some things to be optimized in the original output from cowlink.

Here is the complete list of the optimizations performed by Cowfix:

 Non-used labels, dropped.
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
	jp (x,)c01_xxxx 
	...
c01_xxxx:
	ret

replaced by:

	ret (x)
	...
c01_xxxx:
	ret

--------------------------------

The source file of Cowfix is included (cowfix.c, to be compiled only on 128/512 KB RAM Z80 computers, using https://github.com/Laci1953/HiTech-C-compiler-enhanced)
