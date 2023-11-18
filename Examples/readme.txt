Examples of Cowgol compilation

1. Hexdump (building HEXDUMP.COM from its source file, then using the new executable)

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

2. Calling an assembler routine from a Cowgol source file

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

3. building an executable containing 2 cowgol files and an assembler file 
(testing external and calling assembler routine)

c>cowgol one.cow two.cow rand.as
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
ONE.COW
0:COWFE     ONE.COW $CTMP1.$$$
COWFE: 18kB free
  > ONE.COW
done: 18kB free
0:COWBE $CTMP1.$$$ ONE.COO
COWBE: 22kB free
__main
done: 21kB free
TWO.COW
0:COWFE     TWO.COW $CTMP1.$$$
COWFE: 18kB free
  > TWO.COW
done: 17kB free
0:COWBE $CTMP1.$$$ TWO.COO
COWBE: 22kB free
__main
External
done: 21kB free
RAND.AS
0:Z80AS -J -ORAND.OBJ RAND.AS
Z80AS Macro-Assembler V4.8

Errors: 0
Finished.
ERA $CTMP1.$$$
ERA $CTMP2.$$$
0:COWLINK COWGOL.COO ONE.COO TWO.COO -o $CTMP1.$$$
COWLINK: 46kB free
Adding input file: COWGOL.COO
Adding input file: ONE.COO
Adding input file: TWO.COO
Analysing...
Workspace sizes:
  #0: 1 bytes
  #1: 0 bytes
  #2: 0 bytes
  #3: 0 bytes
Creating output file: $CTMP1.$$$
Copying from input file: COWGOL.COO
Copying from input file: ONE.COO
Copying from input file: TWO.COO
done: 42kB free
ERA ONE.COO
ERA TWO.COO
0:COWFIX $CTMP1.$$$ $CTMP2.$$$
0:Z80AS -J -N -O$CTMP1.$$$ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0
Finished.
0:LINK -Z -Ptext=100H,data,bss -C100H -OONE.COM $CTMP1.$$$   RAND.OBJ
ERA $CTMP1.$$$
ERA $CTMP2.$$$
ERA RAND.OBJ
ERA TWO.COO
ERA $$EXEC.$$$

c>

4. An application made from Gowgol, C & assembler

- msort.cow
- merges.c
- rand.as

>cowgol -lc msort.cow merges.c rand.as
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
MSORT.COW
0:COWFE     MSORT.COW $CTMP1.$$$
COWFE: 18kB free
  > MSORT.COW
done: 16kB free
0:COWBE $CTMP1.$$$ MSORT.COO
COWBE: 22kB free
__main
print_char
print
UIToA
print_i16
random
done: 20kB free
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
0:COWLINK COWGOL.COO MSORT.COO -o $CTMP1.$$$
COWLINK: 46kB free
Adding input file: COWGOL.COO
Adding input file: MSORT.COO
Analysing...
Workspace sizes:
  #0: 2040 bytes
  #1: 0 bytes
  #2: 0 bytes
  #3: 0 bytes
Creating output file: $CTMP1.$$$
Copying from input file: COWGOL.COO
Copying from input file: MSORT.COO
done: 42kB free
ERA MSORT.COO
0:COWFIX $CTMP1.$$$ $CTMP2.$$$
0:Z80AS -J -N -O$CTMP1.$$$ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0

Jump optimizations done: 18
Finished.
0:LINK -Z -Ptext=100H,data,bss -C100H -OMSORT.COM $CTMP1.$$$   MERGES.OBJ RAND.OBJ LIBC.LIB
ERA $CTMP1.$$$
ERA $CTMP2.$$$
ERA $$EXEC.$$$

c>msort

Unsorted array:
9354,7162,28553,30556,10608,10552,5922,26465,7626,3830,31116,27859,21585,5103,14685,406,14835,21267,25790,22755,24183,8389,26148,10846,6428,23,6546,27322,22241,21618,10564,2561,20164,32466,3737,31288,27915,6143,25355,24248,31737,15674,2602,14885,6577,20497,26045,6944,28261,22411,20546,19258,18193,14838,21911,18008,18221,21637,22606,20017,3290,3050,11221,13429,31986,13744,11206,27298,1215,2386,25154,8291,31467,9004,822,25210,18965,13813,23826,27704,28672,18488,17938,31285,25989,12566,29003,13793,1603,30672,16607,9992,14873,13442,3576,29056,27096,8090,8691,18207,29627,556,12838,5942,31856,22034,8829,12211,15944,7941,5771,12642,25186,6219,26837,5652,18010,17455,5574,19389,25207,17051,4892,20306,1889,3514,722,3303,26392,17965,21893,6414,24385,510,163
...
Sorted array:
23,43,63,136,139,141,214,219,222,326,384,406,430,508,510,510,556,606,722,727,822,838,844,861,959,988,991,1009,1027,1051,1057,1083,1115,1131,1153,1215,1230,1239,1390,1405,1415,1418,1447,1488,1522,1592,1603,1681,1696,1706,1717,1733,1738,1792,1819,1889,1921,2052,2074,2085,2137,2151,2152,2234,2297,2317,2326,2350,2360,2386,2413,2481,2488,2496,2498,2530,2536,2545,2561,2602,2651,2659,2673,2683,2752,2783,2799,2803,2807,2817,2851,2862,2987,3050,3169,3262,3290,3296,3303,3327,3330,3396,3409,3428,3449,3512,3514,3535,3566,3576,3693,3713,3737,3763,3781,3830,3834,3883,3886,
...
,25047,25064,25166,25435,508,510,844,1230,1592,2085,2326,2413,2783,2987,4925,5308,5701,5710,5864,5957,6149,6450,6700,6724,7018,7362,7547,8216,8343,25708,25739,25880,26067,26218,26544,26924,26989,27218,27406,27441,27667,27853,28139,28533,28586,28717,28723,29298,29416,29618,29679,30018,30887,30923,31323,31641,32513,32615,32619,32641,
c>
