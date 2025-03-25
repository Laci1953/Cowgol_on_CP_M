Examples of Cowgol compilation

Example nr.1. Hexdump (building HEXDUMP.COM from its source file, then using the new executable)
------------------------------------------------------------------------------------------------

c>cowgol -m hexdump.cow
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
0:COWFE     HEXDUMP.COW $CTMP1.$$$
COWFE: 18kB free
  > HEXDUMP.COW
    > stdcow.coh
      > cowgol.coh
        > common.coh
      < cowgol.coh
    < stdcow.coh
      > file.coh
        > commfile.coh
      < file.coh
    < stdcow.coh
      > strings.coh
    < stdcow.coh
      > malloc.coh
    < stdcow.coh
  < HEXDUMP.COW
    > argv.coh
  < HEXDUMP.COW
done: 3kB free
0:COWBE $CTMP1.$$$ $CTMP2.$$$
COWBE: 22kB free
__main
Exit
ExitWithError
AlignUp
get_char
print_char
MemSet
print
print_nl
UIToA
IToA
print_i32
print_i16
print_i8
print_hex_i8
print_hex_i16
print_hex_i32
AToI
MemZero
file_i_init
fill
fcb_i_gbpb
fcb_i_blockin
fcb_i_blockout
fcb_i_changeblock
fcb_i_convert_a_to_error
FCBOpenIn
FCBOpenUp
FCBOpenOut
FCBClose
FCBSeek
FCBPos
FCBExt
fcb_i_nextchar
FCBGetChar
FCBPutChar
FCBPutString
FCBGetBlock
FCBPutBlock
StrCmp
ToLower
StrICmp
StrLen
CopyString
MemCopy
DumpBlocks
CheckMemoryChain
RawAlloc
Alloc
AddFreeBlock
Free
GetFreeMemory
StrDup
FCBPutHex8
FCBPutHex16
FCBPutHex32
print_d32
GetString
ArgvInit
ArgvNext
Hexdump
done: 14kB free
0:COWLINK cowgol.coo $CTMP2.$$$ -o $CTMP1.$$$
COWLINK: 46kB free
Adding input file: cowgol.coo
Adding input file: $CTMP2.$$$
Analysing...
Workspace sizes:
  #0: 231 bytes
  #1: 0 bytes
  #2: 0 bytes
  #3: 0 bytes
Creating output file: $CTMP1.$$$
Copying from input file: cowgol.coo
Copying from input file: $CTMP2.$$$
done: 37kB free
0:COWFIX $CTMP1.$$$ $CTMP2.$$$
0:Z80AS -J -N -OHEXDUMP.OBJ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0

Jump optimizations done: 62
Finished.
ERA $CTMP1.$$$
ERA $CTMP2.$$$
0:LINK -Z -M -Ptext=100H,data,bss -C100H -OHEXDUMP.COM   HEXDUMP.OBJ
Machine type is Z80

HEXDUMP.OBJ     text          100      6A8

TOTAL           Name         Link     Load   Length
                (abs)           0        0        0
                text          100      100      6A8
                bss           7A8      7A8        0
                data          7A8      7A8        0

                                  Symbol Table

__Hbss  bss   07A8  __Hdata data  07A8  __Htext text  07A8  __Lbss  bss   07A8
__Ldata data  07A8  __Ltext text  0100
ERA HEXDUMP.OBJ
ERA $$EXEC.$$$

c>hexdump io.h
00000000  76 6f 69 64 20 43 4f 4e  5f 57 72 69 74 65 28 76  |void CON_Write(v|
00000010  6f 69 64 2a 20 62 75 66  2c 20 63 68 61 72 20 6c  |oid* buf, char l|
00000020  65 6e 2c 20 76 6f 69 64  2a 20 53 65 6d 41 64 64  |en, void* SemAdd|
00000030  72 29 3b 0d 0a 76 6f 69  64 20 43 4f 4e 5f 52 65  |r);..void CON_Re|
00000040  61 64 28 76 6f 69 64 2a  20 62 75 66 2c 20 63 68  |ad(void* buf, ch|
00000050  61 72 20 6c 65 6e 2c 20  76 6f 69 64 2a 20 53 65  |ar len, void* Se|
00000060  6d 41 64 64 72 29 3b 0d  0a 76 6f 69 64 20 57 72  |mAddr);..void Wr|
00000070  69 74 65 42 28 76 6f 69  64 2a 20 62 75 66 2c 20  |iteB(void* buf, |
00000080  63 68 61 72 20 6c 65 6e  2c 20 76 6f 69 64 2a 20  |char len, void* |
00000090  53 65 6d 41 64 64 72 29  3b 0d 0a 76 6f 69 64 20  |SemAddr);..void |
000000a0  52 65 61 64 42 28 76 6f  69 64 2a 20 62 75 66 2c  |ReadB(void* buf,|
000000b0  20 63 68 61 72 20 6c 65  6e 2c 20 76 6f 69 64 2a  | char len, void*|
000000c0  20 53 65 6d 41 64 64 72  2c 20 76 6f 69 64 2a 20  | SemAddr, void* |
000000d0  54 69 6d 65 72 2c 20 73  68 6f 72 74 20 54 69 6d  |Timer, short Tim|
000000e0  65 4f 75 74 29 3b 0d 0a  73 68 6f 72 74 20 47 65  |eOut);..short Ge|
000000f0  74 43 6f 75 6e 74 42 28  76 6f 69 64 29 3b 0d 0a  |tCountB(void);..|
00000100  76 6f 69 64 20 52 65 73  65 74 5f 52 57 42 28 76  |void Reset_RWB(v|
00000110  6f 69 64 29 3b 0d 0a 63  68 61 72 20 43 4f 4e 5f  |oid);..char CON_|
00000120  53 74 61 74 75 73 28 76  6f 69 64 29 3b 0d 0a 73  |Status(void);..s|
00000130  68 6f 72 74 20 43 54 52  4c 5f 43 28 76 6f 69 64  |hort CTRL_C(void|
00000140  29 3b 0d 0a 73 68 6f 72  74 20 58 6d 52 65 63 76  |);..short XmRecv|
00000150  28 73 74 72 75 63 74 20  4d 61 69 6c 42 6f 78 2a  |(struct MailBox*|
00000160  20 4d 42 29 3b 0d 0a 73  68 6f 72 74 20 58 6d 53  | MB);..short XmS|
00000170  65 6e 64 28 73 74 72 75  63 74 20 4d 61 69 6c 42  |end(struct MailB|
00000180  6f 78 2a 20 4d 42 29 3b  0d 0a 73 68 6f 72 74 20  |ox* MB);..short |
00000190  4c 50 54 5f 50 72 69 6e  74 28 63 68 61 72 2a 20  |LPT_Print(char* |
000001a0  62 75 66 2c 20 73 68 6f  72 74 20 6c 65 6e 29 3b  |buf, short len);|
000001b0  0d 0a 63 68 61 72 20 50  53 32 5f 53 74 61 74 75  |..char PS2_Statu|
000001c0  73 28 76 6f 69 64 29 3b  0d 0a 0d 0a 1a 1a 1a 1a  |s(void);........|
000001d0  1a 1a 1a 1a 1a 1a 1a 1a  1a 1a 1a 1a 1a 1a 1a 1a  |................|
000001e0  1a 1a 1a 1a 1a 1a 1a 1a  1a 1a 1a 1a 1a 1a 1a 1a  |................|
000001f0  1a 1a 1a 1a 1a 1a 1a 1a  1a 1a 1a 1a 1a 1a 1a 1a  |................|
00000200

Example nr.2. Calling an assembler routine from a Cowgol source file
--------------------------------------------------------------------

c>type rand.as
; Xorshift is a class of pseudorandom number generators discovered
; by George Marsaglia and detailed in his 2003 paper, Xorshift RNGs.
;
; 16-bit xorshift pseudorandom number generator by John Metcalf
; returns   hl = pseudorandom number
; corrupts   a

; generates 16-bit pseudorandom numbers with a period of 65535
; using the xorshift method:

; hl ^= hl << 7
; hl ^= hl >> 9
; hl ^= hl << 8

; some alternative shift triplets which also perform well are:
; 6, 7, 13; 7, 9, 13; 9, 7, 13.

	psect	text

	GLOBAL	_xrnd, _xrndseed

_xrnd:
	ld	hl,1		; seed must not be 0
	ld	a,h
	rra
	ld	a,l
	rra
	xor	h
	ld	h,a
	ld	a,l
	rra
	ld	a,h
	rra
	xor	l
	ld	l,a
	xor	h
	ld	h,a
	ld	(_xrnd+1),hl
	res	7,h		;make-it positive...
	ret

_xrndseed:
	ld	a,r
  	ld	l,a
	ld	a,r
	ld	h,a
  	or	l		; HL must be not NULL
  	jr	nz,1f
	inc	hl
1:
	ld	(_xrnd+1),hl
	ret

c>
c>type testas.cow
sub Test() is
@asm "call _xrndseed";
end sub;

c>
c>cowgol testas.cow rand.as
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
TESTAS.COW
0:COWFE     TESTAS.COW $CTMP1.$$$
COWFE: 18kB free
  > TESTAS.COW
done: 18kB free
0:COWBE $CTMP1.$$$ $CTMP2.$$$
COWBE: 22kB free
__main
Test
done: 22kB free
0:COWLINK cowgol.coo $CTMP2.$$$ -o $CTMP1.$$$
COWLINK: 46kB free
Adding input file: cowgol.coo
Adding input file: $CTMP2.$$$
Analysing...
Workspace sizes:
  #0: 0 bytes
  #1: 0 bytes
  #2: 0 bytes
  #3: 0 bytes
Creating output file: $CTMP1.$$$
Copying from input file: cowgol.coo
Copying from input file: $CTMP2.$$$
done: 43kB free
0:COWFIX $CTMP1.$$$ $CTMP2.$$$
0:Z80AS -J -N -OTESTAS.OBJ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0
Finished.
RAND.AS
0:Z80AS -J -ORAND.OBJ RAND.AS
Z80AS Macro-Assembler V4.8

Errors: 0
Finished.
ERA $CTMP1.$$$
ERA $CTMP2.$$$
0:LINK -Z -Ptext=100H,data,bss -C100H -OTESTAS.COM   TESTAS.OBJ RAND.OBJ
ERA $$EXEC.$$$

c>

Example nr.3. An application made from Cowgol, C & assembler
------------------------------------------------------------

################################
#        Cowgol program        #
#                              #
# Sorting 1000 random integers #
# stored in a vector allocated #
# using Cowgol's Alloc         #
#                              #
# calls:                       #
#  assembler routine xrndseed  #
#  assembler routine xrnd      #
#  C routine mergeSort         #
#                              #
# Ladislau Szilagyi, Nov. 2023 #
################################

Source files:

- dynmsort.cow
- merges.c
- rand.as

Fragment of "dynmsort.cow":

...
RandSeed();
Unsorted := Alloc(2000) as intstring;
PopulateArray(Unsorted);
PrintArray(Unsorted);
MergeSort();
PrintArray(Unsorted); # now is sorted !
Exit();

Compilation:

c>cowgol -Llibc -O dynmsort.cow merges.c rand.as
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
DYNMSORT.COW
0:COWFE     DYNMSORT.COW $CTMP1.$$$
COWFE: 18kB free
  > DYNMSORT.COW
    > cowgolc.coh
      > common.coh
    < cowgolc.coh
  < DYNMSORT.COW
    > strings.coh
  < DYNMSORT.COW
    > malloc.coh
  < DYNMSORT.COW
done: 10kB free
0:COWBE $CTMP1.$$$ DYNMSORT.COO
COWBE: 22kB free
__main
Exit
ExitWithError
AlignUp
get_char
print_char
MemSet
print
print_nl
UIToA
IToA
print_i32
print_i16
print_i8
print_hex_i8
print_hex_i16
print_hex_i32
AToI
MemZero
StrCmp
ToLower
StrICmp
StrLen
CopyString
MemCopy
DumpBlocks
CheckMemoryChain
RawAlloc
Alloc
AddFreeBlock
Free
GetFreeMemory
StrDup
random
PrintArray
PopulateArray
RandSeed
MergeSort
done: 17kB free
MERGES.C
0:CPP -DCPM -DHI_TECH_C -Dz80 -I MERGES.C $CTMP1.$$$
0:P1 $CTMP1.$$$ $CTMP2.$$$ $CTMP3.$$$
0:CGEN $CTMP2.$$$ $CTMP1.$$$
0:OPTIM $CTMP1.$$$ $CTMP2.$$$
0:Z80AS -J -N -oMERGES.OBJ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0

Jump optimizations done: 6
Finished.
RAND.AS
0:Z80AS -J -ORAND.OBJ RAND.AS
Z80AS Macro-Assembler V4.8

Errors: 0
Finished.
ERA $CTMP1.$$$
ERA $CTMP2.$$$
0:COWLINK COWGOL.COO DYNMSORT.COO -o $CTMP1.$$$
COWLINK: 46kB free
Adding input file: COWGOL.COO
Adding input file: DYNMSORT.COO
Analysing...
Workspace sizes:
  #0: 58 bytes
  #1: 0 bytes
  #2: 0 bytes
  #3: 0 bytes
Creating output file: $CTMP1.$$$
Copying from input file: COWGOL.COO
Copying from input file: DYNMSORT.COO
done: 39kB free
ERA DYNMSORT.COO
0:COWFIX $CTMP1.$$$ $CTMP2.$$$
0:Z80AS -J -N -ODYNMSORT.OBJ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0

Jump optimizations done: 32
Finished.
0:LINK -Z -Ptext=100H,data,bss -C100H -ODYNMSORT.COM DYNMSORT.OBJ   MERGES.OBJ RAND.OBJ LIBC.LIB
ERA $CTMP1.$$$
ERA $CTMP2.$$$
ERA $$EXEC.$$$

c>dynmsort

Array:
4024,17041,24148,23086,1352,31064,26418,29453,759,12875,22464,27867,6683,18384,10375,22834,4690,13327,26070,8081,11642,25202,1119,25034,19656,13468,23457,12068,18298,15687,5768,29601,4912,32373,21399,17243,748,25238,11138,23991,12852,2080,13356,7997,31997,32380,7260,30533,31407,5177,13757,25352,7291,2731,23300,12648,28522,...

Sorting...

Array:
3,48,99,128,132,191,258,264,337,345,392,493,501,514,534,589,643,648,659,748,759,767,798,820,827,841,854,929,966,970,1053,1073,1082,1099,1119,1176,1190,1239,1330,1342,1352,1362,1392,1426,1440,1469,1563,1574,1681,1742,1745,1754,1760,1765,1808,1820,1855,1865,1915,2077,2080,2131,2150,2206,2226,2299,2302,2329,2372,2401,2454,
...
2934,3034,3334,3369,3479,3718,3906,3994,4428,4834,5052,5166,5269,5515,5556,27074,27423,27516,27580,27746,27759,27978,28064,29236,29475,29604,30556,30984,31163,31335,31347,31440,31704,31831,31852,31973,32612,
c>

Example nr.4.
-------------
Compiling a Cowgol source file (testmem.cow) with optimization option (-O), 
adding a cowgol object file (alloc.coo) in the list of files to be used in COWLINK, 
and adding an object file (xrnd.obj) in the list of files linked by LINK into the executable.

D>cowgol -o alloc.coo testmem.cow xrnd.obj
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
0:COWFE     TESTMEM.COW $CTMP1.$$$
COWFE: 19kB free main memory
448kB free extended memory
  > TESTMEM.COW
done: 16kB free main memory
441kB free extended memory
0:COWBE $CTMP1.$$$ TESTMEM.COO
COWBE: 23kB free
__main
ArgvInit
ArgvNext
exit
print_char
print
print_nl
itoa
print_total_free
xrnd
print_alloc
find_end_block
walk
print_freelist
done: 21kB free
0:COWLINK COWGOL.COO ALLOC.COO TESTMEM.COO -o $CTMP1.$$$
COWLINK: 46kB free
Adding input file: COWGOL.COO
Adding input file: ALLOC.COO
Adding input file: TESTMEM.COO
Analysing...
Workspace sizes:
  #0: 200 bytes
Creating output file: $CTMP1.$$$
Copying from input file: COWGOL.COO
Copying from input file: ALLOC.COO
Copying from input file: TESTMEM.COO
done: 41kB free
0:COWFIX $CTMP1.$$$ $CTMP2.$$$ -O
ERA $CTMP1.$$$
0:Z80AS -J -N -OTESTMEM.OBJ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0

Jump optimizations done: 57
Finished.
ERA $CTMP2.$$$
0:LINK -Z -Ptext=100H,data,bss -C100H -OTESTMEM.COM TESTMEM.OBJ   XRND.OBJ
ERA $$EXEC.$$$

D>

Example nr.5 Compiling STARTREK using the .coo libraries
--------------------------------------------------------

D>cowgol -o misc.coo string.coo seqfile.coo startrek.cow
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
STARTREK.COW
0:COWFE     STARTREK.COW $CTMP1.$$$
COWFE: 18kB free main memory
448kB free extended memory
  > STARTREK.COW
    > misc.coh
  < STARTREK.COW
    > string.coh
  < STARTREK.COW
    > seqfile.coh
  < STARTREK.COW
done: 0kB free main memory
413kB free extended memory
0:COWBE $CTMP1.$$$ STARTREK.COO
COWBE: 23kB free
__main
fgets
showfile
get_c
get_map
put_map
get_quad
put_quad
TO_FIXED
FROM_FIXED
TO_FIXED00
FROM_FIXED00
get_rand
rand8
input
yesno
input_f00
input_int
print100
get_dev_name
quadrant_name
isqrt
abs16
abs32
square00
distance_to
cint100
find_space
fs_empty_pl_k
fs_empty_pl_b
fs_empty_pl
inoperable
wipe_klingon
repair_damage
klingons_shoot
klingons_move
intro
initialize
place_ship
new_quadrant
damage_control
shield_control
man_energy
get_status
s_range_scan
complete_man
course_control
put1bcd
putbcd
l_range_scan
no_klingon
phaser_control
torpedo_hit
photon_tor
galactic_rec
status_report
estimate2
estimate1
compute_vector
torpedo_data
nav_data
dirdist_calc
galaxy_map
lib_computer
new_game
end_of_game
resign
end_of_time
ship_destroyed
won_game
done: 12kB free
XRND.AS
0:Z80AS -J -OXRND.OBJ XRND.AS
Z80AS Macro-Assembler V4.8

Errors: 0
Finished.
0:COWLINK COWGOL.COO MISC.COO STRING.COO SEQFILE.COO STARTREK.COO -o $CTMP1.$$$
COWLINK: 46kB free
Adding input file: COWGOL.COO
Adding input file: MISC.COO
Adding input file: STRING.COO
Adding input file: SEQFILE.COO
Adding input file: STARTREK.COO
Analysing...
Workspace sizes:
  #0: 855 bytes
Creating output file: $CTMP1.$$$
Copying from input file: COWGOL.COO
Copying from input file: MISC.COO
Copying from input file: STRING.COO
Copying from input file: SEQFILE.COO
Copying from input file: STARTREK.COO
done: 29kB free
0:COWFIX $CTMP1.$$$ $CTMP2.$$$ -O
ERA $CTMP1.$$$
0:LINK -Z -Ptext=100H,data,bss -C100H -OSTARTREK.COM STARTREK.OBJ   XRND.OBJ
ERA $$EXEC.$$$

D>

Example nr.6 Compiling using cowgol.lib
---------------------------------------

I>type t.cow
include "libconio.coh";

print("hello!");

I>cowgol -o -lcowgol t.cow
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
0:COWFE     T.COW $CTMP1.$$$
COWFE: 22kB free
  > T.COW
    > libconio.coh
  < T.COW
done: 20kB free
0:COWBE $CTMP1.$$$ T.COO
COWBE: 26kB free
__main
get_char
get_str
print_char
print
print_i8
print_i16
print_hex_i8
print_hex_i16
done: 25kB free
0:COWLINK COWGOL.COO T.COO -o $CTMP1.$$$
COWLINK: 48kB free
Adding input file: COWGOL.COO
Adding input file: T.COO
Analysing...
Workspace sizes:
  #0: 2 bytes
Creating output file: $CTMP1.$$$
Copying from input file: COWGOL.COO
Copying from input file: T.COO
done: 46kB free
0:COWFIX $CTMP1.$$$ $CTMP2.$$$ -O
ERA $CTMP1.$$$
0:Z80AS -J -N -OT.OBJ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0
Finished.
ERA $CTMP2.$$$
0:LINK -Z -Ptext=100H,data,bss -C100H -OT.COM T.OBJ   COWGOL.LIB
ERA $$EXEC.$$$

I>t
hello!
I>

Example nr.7 Compiling using misc.coo
-------------------------------------

I>type t.cow
include "misc.coh";

print("hello!");

I>cowgol -o t.cow misc.coo
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
0:COWFE     T.COW $CTMP1.$$$
COWFE: 22kB free
  > T.COW
    > misc.coh
  < T.COW
done: 18kB free
0:COWBE $CTMP1.$$$ T.COO
COWBE: 26kB free
__main
done: 23kB free
0:COWLINK COWGOL.COO T.COO MISC.COO -o $CTMP1.$$$
COWLINK: 48kB free
Adding input file: COWGOL.COO
Adding input file: T.COO
Adding input file: MISC.COO
Analysing...
Workspace sizes:
  #0: 13 bytes
Creating output file: $CTMP1.$$$
Copying from input file: COWGOL.COO
Copying from input file: T.COO
Copying from input file: MISC.COO
done: 42kB free
0:COWFIX $CTMP1.$$$ $CTMP2.$$$ -O
ERA $CTMP1.$$$
0:Z80AS -J -N -OMISC.OBJ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0

Jump optimizations done: 2
Finished.
ERA $CTMP2.$$$
0:LINK -Z -Ptext=100H,data,bss -C100H -OMISC.COM MISC.OBJ
ERA $$EXEC.$$$

I>t
hello!
I>

Example nr.8 A recursive Cowgol subroutine
------------------------------------------

Of course, we are cheating, by using @asm :)

Here is the source file: (fact.cow)
------------------------
include "misc.coh";

var fp: int16;

sub factorial(n: int16): (ret: int16) is
	var tmp: int16;

	if n == 1 then
		ret := 1;
	else
		# ret := n * factorial(n - 1);
		@asm "ld hl,(", n, ")";
		@asm "push hl";
		n := n - 1;
		@asm "ld hl,(", n, ")";
		@asm "ld ix,(", fp, ")";
		@asm "ld de, 1f";
		@asm "push de";
		@asm "jp (ix)";
		@asm "1:";
		@asm "ld (", tmp, "),hl"; #tmp = factorial(n-1)
		@asm "pop hl";
		@asm "ld (", n, "),hl";
		ret := n * tmp;
	end if;
end sub;

#setup pointer to factorial
@asm "ld hl,", factorial;
@asm "ld (", fp, "),hl";

print_i16(factorial(5));
--------------------------

To compile:
>cowgol -o -x misc.coo fact.cow

It works!

C>fact
120
C>
