The Bowling game is a good example of using code stored in HiTech libraries.

It must be compiled, on 128KB/512KB RAM computers, using the following command line:

>cowgol -o -lcowgol bowling.cow

The '-lcowgol' option instructs the LINK linker, at the final stage when building the executable, to include the cowgol.lib in its command line.

In the bowling.cow source file, the following lines are used:

include "libbasic.coh";
include "libconio.coh";
include "libstr.coh";
include "libfp.coh";
include "libbios.coh";

For example, the libstr.coh contains the following fragment:

sub StrLen(s: [uint8]): (size: uint16) is
# HL = s
@asm "jp __StrLen";
end sub;

In the HiTech cowgol.lib, one of the object files is string.obj, containing the routine __StrLen:

;	StrLen(s: [uint8]): (size: uint16)
__StrLen::
	ex de,hl	;DE=string pointer
	ld hl,0		;HL=size
loop1:
	ld a,(de)
	or a		;return size if 0
	ret z
	inc de		;increment pointer
	inc hl		;increment size
	jr loop1

, which returns in registers HL the string length.

The advantage of using such an approach is the fact that the cowgol source file is smaller, given the fact that some of the routines used in the source file contain only 'jumps' to the real code, already assembled and stored in the cowgol.lib file as object code.

This leads to shorter compilation times.


