include w.mac

	psect text

	global f9_print
	global f9_print_vp
	global f82_SimpleError
	global f17_print_i8
	global f40_Free
	global f75_InternalAll;c
	global f247_AllocLabel
	global f34_MemCopy
	global f72_AllocNewTyp;
	global f78_InternalStr;up
	global f78_ExternalStr;up
	global f80_StartError
	global f81_EndError
	global f53_FCBClose
	global f27_ArgvInit
	global f73_FreeType
	global f28_ArgvNext
	global f16_print_i16
	global f10_print_nl
	global f83_LexerAddInc;udePath
	global f62_FCBPutChar
	global f52_FCBOpenOut
	global f71_FreeSymbol
	global f76_StrDupBrace;
	global f4_ExitWithErro;
	global f41_GetFreeMemo;y
	global f77_StrDupArray;d
	global f88_LexerReadTo;en
	global f70_AllocNewSym;ol
	global f8_MemSet
	global f32_StrLen
	global f29_StrCmp
	global f87_LexerInclud;File
	global f75_ExternalAl
	global print_hex_i16

	ld sp, TOPSTACK
	call f2___main
	ld hl,0		;!!!
	ld (80H),hl	;!!!
	rst 0


	; ExitWithError workspace at ws+1434 length ws+0 OK
f4_ExitWithErro: 
	ld hl,1		;!!!
	ld (80H),hl	;!!!
	rst 0 


	; AlignUp workspace at ws+1458 length ws+4 OK
f5_AlignUp:
;!!!	ld (ws+1458), hl
;!!!	ld (ws+1460), hl
;!!!	ld hl, (ws+1460)
	ret


	; print_char workspace at ws+1457 length ws+1 OK
f7_print_char:
	ld (ws+1457), a
	cp 10
	jp nz, c01_0005
	ld e, 13 
	ld c, 2 
	call 5 
c01_0005:
	ld a, ( ws+1457 ) 
	ld e, a 
	ld c, 2 
;!!!	call 5
	jp 5 	;!!!
;!!!	ret


	; MemSet workspace at ws+1458 length ws+7 OK
f8_MemSet:
			;HL=len
	pop bc		;ret addr
	pop af		;A=byte
	pop de		;DE=buf
	push bc		;ret addr
	ex de,hl	;HL=buf,DE=len
	ld c,a		;C=byte
loopm:
	ld a,e
	or d
	ret z		;return if len=0
	ld (hl),c
	inc hl
	dec de
	jr loopm

	;HL = vp string
f9_print_vp:
	ld	de,buf2
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_GetString
	ld	hl,buf2
			;continue...	
	; print workspace at ws+1454 length ws+3 OK
f9_print:
	ld (ws+1454), hl
c01_000d:
	ld hl, (ws+1454)
	ld a,(hl)
	ld (ws+1456), a
	or a
	ret z	;!!!
;	jp nz, c01_0013
;	ret
;c01_0013:
	ld a, (ws+1456)
	call f7_print_char
	ld hl, (ws+1454)
	inc hl
	ld (ws+1454), hl
	jp c01_000d


	; print_nl workspace at ws+1432 length ws+0 OK
f10_print_nl:
	ld a,10
;!!!	call f7_print_char
	jp f7_print_char	;!!!
;!!!	ret


	; print_i16 workspace at ws+1432 length ws+2 OK
f16_print_i16:
	ex	de,hl		;DE = value
	ld	hl,ws+1438	;HL=buffer
	call	Bn2Dec
	ld	hl,ws+1438
	jp f9_print
;
;	Converts 16bit value to ASCII
;
;	DE = value
;	HL = output buffer
;
Bn2Dec:
	ld	(bufptr),hl	;save pointer to buffer	
	ld	(buffer),hl
	ex	de,hl
	xor	a
	ld	(curlen),a
cnvert:	
	ld	e,0
	ld	b,16
	or	a
dvloop:
	rl	l
	rl	h
	rl	e
	ld	a,e
	sub	10
	ccf
	jr	nc,deccnt
	ld	e,a
deccnt:
	djnz	dvloop
	rl	l
	rl	h
chins:
	ld	a,e
	add	a,'0'
	call	insert
	ld	a,h
	or	l
	jr	nz,cnvert
;
;	buffer contains: len,chars
;	convert-it to string
;
	ld	hl,(buffer)
	ld	c,(hl)
	ld	b,0
	ld	d,h
	ld	e,l
	inc	hl
	ldir
	xor	a
	ld	(de),a
	ret
;
insert:
	push	hl
	push	af
	ld	hl,(bufptr)
	ld	d,h
	ld	e,l
	inc	de
	ld	(bufptr),de
	ld	a,(curlen)
	or	a
	jr	z,exitmr
	ld	c,a
	ld	b,0
	lddr
exitmr:
	ld	a,(curlen)
	inc	a
	ld	(curlen),a
	ld	(hl),a
	ex	de,hl
	pop	af
	ld	(hl),a
	pop	hl
	ret
;
	psect	bss
;
buffer:	defs	2
bufptr:	defs	2
curlen:	defs	1
;
	psect	text
;
	; print_i8 workspace at ws+1380 length ws+1 OK
f17_print_i8:
				;A = value
	ld	e,a
	ld	d,0		;DE = value
	ld	hl,ws+1438	;HL=buffer
	call	Bn2Dec
	ld	hl,ws+1438
	jp f9_print


	; print_hex_i8 workspace at ws+1387 length ws+3 OK
f18_print_hex_i: 
				;A = value
	call	Bin2Hex
	push	bc
	call	f7_print_char
	pop	bc
	ld	a,c
	jp	f7_print_char

print_hex_i16:
				;HL=value
	push	hl
	ld	a,h
	call	f18_print_hex_i
	pop	hl
	ld	a,l
	jp	f18_print_hex_i
;
;------------------------------------------------------------
;	Bin2Hex
;
;	A = byte
;
;	returns BC = hexa representation of A
;		A = high nibble in hexa (ready to be stored/printed)
;------------------------------------------------------------
Bin2Hex:
	ld	c,a		;C = byte
	and	0FH		;A = low nibble
	call	nibble2hex	;B = hexa
	ld	a,c		;A = byte
	ld	c,b		;C = low nibble in hexa
	and	0F0H		;A = (high nibble, 0000)
	rrca
	rrca
	rrca
	rrca			;A = high nibble
				;falls through, will return A = B = high nibble in hexa
;
;	A = bin
;	returns A = B = hexa
;
nibble2hex:			;A = bin
	add     a,090h
        daa
        adc     a,040h
        daa			;A = hexa
	ld	b,a
	ret
;

	; ArgvInit workspace at ws+1298 length ws+0 OK
f27_ArgvInit:
	ld de,129
	ld (ws+4), de
	ld b,0
	ld a, (128)
	ld l,a
	ld h,b
	add hl,de
	ld a,b
	ld (hl),a
	ret


	; ArgvNext workspace at ws+1298 length ws+3 OK
f28_ArgvNext:
	ld hl, (ws+4)
	ld a,h
	or l
	jp nz, c01_005f
	ld hl, (ws+4)
	ld (ws+1298), hl
	jp end_f28_ArgvNex;
c01_005f:
c01_0060:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+1300), a
	cp 32
	jp z, c01_0066
	jp c01_0061
c01_0066:
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp c01_0060
c01_0061:
	ld hl, (ws+4)
	ld (ws+1298), hl
c01_0067:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+1300), a
	cp 32
	jp z, c01_0070
	ld a, (ws+1300)
	cp 10
	jp z, c01_0070
	ld a, (ws+1300)
	or a
	jp nz, c01_0071
c01_0070:
	jp c01_0068
c01_0071:
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp c01_0067
c01_0068:
	xor a
	ld hl, (ws+4)
	ld (hl),a
	ld a, (ws+1300)
	cp 32
	jp nz, c01_0078
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp c01_0074
c01_0078:
	ld bc,0
	ld (ws+4), bc
c01_0074:
end_f28_ArgvNex: 
	ld hl, (ws+1298)
	ret


	; StrCmp workspace at ws+1395 length ws+5 OK
f29_StrCmp:
	ex de,hl	;DE=str1
	pop bc		;ret addr
	pop hl		;HL=str2
	push bc
			;compare strings [HL] and [DE]
			;return 0 if equal, else 1
loop:
	ld a,(de)
	cp (hl)
	jr nz,noteq
	or a		;equal if 0
	ret z
	inc hl
	inc de
	jr loop
noteq:	ld a,1
	ret		

	; ToLower workspace at ws+1321 length ws+2 OK
f30_ToLower:
	cp 'A'		;less than A, return-it
	ret c
	cp 'Z'+1	;more than Z, return-it
	ret nc
	or 20H		;to lower case
	ret

	; StrLen workspace at ws+1412 length ws+7 OK
f32_StrLen:
	ex de,hl	;DE=string pointer
	ld hl,0		;HL=size
loop1:
	ld a,(de)
	or a		;return size if 0
	ret z
	inc de		;increment pointer
	inc hl		;increment size
	jr loop1

;	push	src
;	push 	size
;	ld 	hl,dest
;	call 	MemCopy
;
	; MemCopy workspace at ws+1400 length ws+6 OK
f34_MemCopy:
	ex de,hl	;DE=dest
	pop hl		;HL=ret addr
	pop bc		;BC=size
	ex (sp),hl	;HL=source, ret addr on stack
	ld a,b
	or c
	ret z		;return if size = 0
	ldir		;(HL) ---> (DE) BC bytes
	ret

	; RawAlloc workspace at ws+1434 length ws+24 OK
f37_RawAlloc:
	ld (ws+1434), hl
	inc hl
	inc hl
	call f5_AlignUp
	ld (ws+1440), hl
	ld de,4
	and a
	sbc hl,de
	jp nc, c01_00c3
	ld de,4
	ld (ws+1440), de
c01_00c3:
	ld de, (ws+1440)
	ld hl,7
	add hl,de
	ld a,l
	and 248
	ld l,a
	ld a,h
	and 255
	ld h,a
	ld (ws+1440), hl
	ld hl, (ws+6)
	ld (ws+1442), hl
	ld bc,0
	ld (ws+1444), bc
	ld (ws+1446), bc
	ld (ws+1448), bc
	ld hl,65535
	ld (ws+1450), hl
c01_00c4:
	ld hl, (ws+1442)
	ld a,h
	or l
	jp z, c01_00c9
	ld hl, (ws+1442)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1452), hl
	ld de, (ws+1440)
	and a
	sbc hl,de
	jp c, c01_00d0
	ld hl, (ws+1452)
	ld de, (ws+1450)
	and a
	sbc hl,de
	jp nc, c01_00d0
	ld hl, (ws+1442)
	ld (ws+1446), hl
	ld hl, (ws+1452)
	ld (ws+1450), hl
	ld hl, (ws+1444)
	ld (ws+1448), hl
	ld de, (ws+1450)
	ld hl, (ws+1440)
	and a
	sbc hl,de
	jp nz, c01_00d6
	jp c01_00c9
c01_00d6:
c01_00d0:
	ld hl, (ws+1442)
	ld (ws+1444), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1442), hl
	jp c01_00c4
c01_00c9:
	ld hl, (ws+1446)
	ld a,h
	or l
	jp nz, c01_00db
	ld bc,0
	ld (ws+1436), bc
	jp end_f37_RawAllo;
c01_00db:
	ld hl, (ws+1450)
	ld de, (ws+1440)
	and a
	sbc hl,de
	ld (ws+1454), hl
	ld de,4
	and a
	sbc hl,de
	jp nc, c01_00e0
	ld hl, (ws+1448)
	ld a,h
	or l
	jp z, c01_00e5
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1448)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00e1
c01_00e5:
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+6), hl
c01_00e1:
	ld hl, (ws+1450)
	ld (ws+1440), hl
	jp c01_00dc
c01_00e0:
	ld de, (ws+1454)
	ld hl, (ws+1446)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1446)
	ld h,d
	ld l,e
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ld (ws+1446), hl
c01_00dc:
	ld hl, (ws+1446)
	ld (ws+1456), hl
	ld de, (ws+1440)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1456)
	inc hl
	inc hl
	ld (ws+1436), hl
	push hl
	ld d,0
	push de
	ld hl, (ws+1440)
	dec hl
	dec hl
	call f8_MemSet
end_f37_RawAllo: 
	ld hl, (ws+1436)
	ret


	; AddFreeBlock workspace at ws+1440 length ws+8 OK
f39_AddFreeBloc: 
	ld (ws+1442), hl
	pop bc
	pop hl
	ld (ws+1440), hl
	push bc
	push hl
	ld h,170
	push hl
	ld hl, (ws+1442)
	call f8_MemSet
	ld hl, (ws+1440)
	ld (ws+1444), hl
	ld de, (ws+1442)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+6)
	ld (ws+1446), hl
	ld hl, (ws+1444)
	ld de, (ws+1446)
	and a
	sbc hl,de
	jp nc, c01_00ef
	ld de, (ws+1444)
	ld h,d
	ld l,e
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1446)
	and a
	sbc hl,de
	jp nz, c01_00f4
	ld de, (ws+1442)
	ld hl, (ws+1446)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1444)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1444)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00f0
c01_00f4:
	ld de, (ws+1446)
	ld hl, (ws+1444)
	ld (hl),e
	inc hl
	ld (hl),d
c01_00f0:
	ld hl, (ws+1444)
	ld (ws+6), hl
;!!!	jp c01_00eb
	ret	;!!!
c01_00ef:
c01_00f5:
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz, c01_00fb
	ld de, (ws+1444)
	ld hl, (ws+1446)
	ld (hl),e
	inc hl
	ld (hl),d
	ld bc,0
	ld h,d
	ld l,e
	ld (hl),c
	inc hl
	ld (hl),b
	jp c01_00f6
c01_00fb:
	ld bc, (ws+1444)
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld h,b
	ld l,c
	and a
	sbc hl,de
	jp nc, c01_0100
	ld de, (ws+1444)
	ld hl, (ws+1442)
	add hl,de
	ex de,hl
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	and a
	sbc hl,de
	jp nz, c01_0105
	ld de, (ws+1442)
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1444)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1444)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_0101
c01_0105:
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1444)
	ld (hl),e
	inc hl
	ld (hl),d
c01_0101:
	ld de, (ws+1444)
	ld hl, (ws+1446)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00f6
c01_0100:
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1446), hl
	jp c01_00f5
c01_00f6:
	ld de, (ws+1446)
	ld h,d
	ld l,e
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1444)
	and a
	sbc hl,de
;!!!	jp nz, c01_010a
	ret nz	;!!!
	ld hl, (ws+1446)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1444)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1446)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1444)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1446)
	ld (hl),e
	inc hl
	ld (hl),d
;!!!c01_010a:
;!!!c01_00eb:
	ret


	; Free workspace at ws+1436 length ws+4 OK
f40_Free:
	ld (ws+1436), hl
	ld a,h
	or l
;!!!	jp z, c01_010f
	ret z	;!!!
	ld hl, (ws+1436)
	dec hl
	dec hl
	ld (ws+1438), hl
	push hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f39_AddFreeBloc;
;!!!c01_010f:
	ret


	; GetFreeMemory workspace at ws+1296 length ws+4 OK
f41_GetFreeMemo:  
	ld bc,0
	ld (ws+1296), bc
	ld hl, (ws+6)
	ld (ws+1298), hl
c01_0110:
	ld hl, (ws+1298)
	ld a,h
	or l
	jp z, c01_0115
	ld de, (ws+1296)
	ld hl, (ws+1298)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ld (ws+1296), hl
	ld hl, (ws+1298)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1298), hl
	jp c01_0110
c01_0115:
	ld hl, (ws+1296)
	ret


	; fill workspace at ws+1348 length ws+8 OK
f44_fill:
	ld (ws+1352), a
	pop bc
	pop hl
	ld (ws+1350), hl
	pop hl
	ld (ws+1348), hl
	push bc
c01_0116:
	ld hl, (ws+1350)
	ld a,(hl)
	ld (ws+1355), a
	cp 32
	jp c, c01_011d
	ld a, (ws+1355)
	cp 46
	jp nz, c01_011e
c01_011d:
	ld a,32
	ld (ws+1355), a
	jp c01_0118
c01_011e:
	ld a, (ws+1355)
	cp 42
	jp nz, c01_0123
	ld a,63
	ld (ws+1355), a
	jp c01_0118
c01_0123:
	ld hl, (ws+1350)
	inc hl
	ld (ws+1350), hl
c01_0118:
	ld a, (ws+1355)
	cp 97
	jp c, c01_012a
	ld b,122
	ld a, (ws+1355)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_012a
	ld a, (ws+1355)
	add 224
	ld (ws+1355), a
c01_012a:
	ld a, (ws+1355)
	ld hl, (ws+1348)
	ld (hl),a
	inc hl
	ld (ws+1348), hl
	ld a, (ws+1352)
	dec a
	ld (ws+1352), a
	or a
	jp nz, c01_0130
	jp c01_0117
c01_0130:
	jp c01_0116
c01_0117:
	ld hl, (ws+1350)
;!!!	ld (ws+1353), hl
;!!!	ld hl, (ws+1353)
	ret


	; file_i_init workspace at ws+1339 length ws+9
f43_file_i_init:
	ld (ws+1341), hl
	pop bc
	pop hl
	ld (ws+1339), hl
	push bc
	ld hl, (ws+1339)
	push hl
	ld d,0
	push de
	ld hl,166
	call f8_MemSet
	ld hl, (ws+1339)
	inc hl
	inc hl
	inc hl
	push hl
	ld b,32
	push bc
	ld hl,11
	call f8_MemSet
	ld hl, (ws+1339)
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, (ws+1341)
	push hl
	ld a,8
	call f44_fill
	ld (ws+1341), hl
c01_0131:
	ld hl, (ws+1341)
	ld a,(hl)
	ld (ws+1345), a
	cp 32
	jp c, c01_0138
	ld a, (ws+1345)
	cp 46
	jp nz, c01_0139
c01_0138:
	jp c01_0132
c01_0139:
	ld hl, (ws+1341)
	inc hl
	ld (ws+1341), hl
	jp c01_0131
c01_0132:
	ld a, (ws+1345)
	cp 46
	jp nz, c01_013f
	ld de, (ws+1339)
	ld hl,11
	add hl,de
	push hl
	ld hl, (ws+1341)
	inc hl
	push hl
	ld a,3
	call f44_fill
	ld (ws+1341), hl
c01_013f:
	ld ix, (ws+1339)
	ld (ix+35), 255
	ld (ix+36), 255
	ld a,127
	push ix
	pop hl
	ld (hl),a
	ret


	; fcb_i_gbpb workspace at ws+1427 length ws+7 OK
f45_fcb_i_gbpb:
	ld (ws+1429), a
	pop bc
	pop hl
	ld (ws+1427), hl
	push bc
	inc hl
	inc hl
	ld (ws+1430), hl
	ld hl, (ws+1427)
	ld de,38
	add hl,de
	ld (ws+1432), hl
	ld c, 26 
	ld de, ( ws+1432 ) 
	call 5 
	ld a, ( ws+1429 ) 
	ld c, a 
	ld de, ( ws+1430 ) 
;!!!	call 5 
;!!!	ret
	jp 5	;!!!

	; fcb_i_blockin workspace at ws+1425 length ws+2 OK
f46_fcb_i_block:  
	ld (ws+1425), hl
	ld de,38
	add hl,de
	push hl
	ld d,0
	push de
	ld hl,128
	call f8_MemSet
	ld hl, (ws+1425)
	push hl
	ld a,33
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+1425)
	inc hl
	ld (hl),a
	ret


	; fcb_i_blockout workspace at ws+1425 length ws+2 OK
f47_fcb_i_block:   
	ld (ws+1425), hl
	inc hl
	ld a,(hl)
	or a
;!!!	jp z, c01_0144
	ret z	;!!!
	ld hl, (ws+1425)
	push hl
	ld a,34
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+1425)
	inc hl
	ld (hl),a
;!!!c01_0144:
	ret


	; fcb_i_changeblock workspace at ws+1421 length ws+4 OK
f48_fcb_i_chang:      
	ld (ws+1423), hl
	pop bc
	pop hl
	ld (ws+1421), hl
	push bc
	ld de, (ws+1423)
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	and a
	sbc hl,de
;!!!	jp z, c01_0149
	ret z	;!!!
	ld hl, (ws+1421)
	call f47_fcb_i_block;ut
	ld hl, (ws+1423)
	ld ix, (ws+1421)
	ld (ix+35), l
	ld (ix+36), h
	push ix
	pop hl
;!!!	call f46_fcb_i_block;n
	jp f46_fcb_i_block;n	;!!!
;!!!c01_0149:
;!!!	ret


	; fcb_i_convert_a_to_error workspace at ws+1341 length ws+0 OK
f49_fcb_i_conve:             
	cp 0ffh 
	ld a, 0 
	ret nz 
	inc a 
	ret


	; FCBOpenIn workspace at ws+1332 length ws+7 OK
f50_FCBOpenIn:
	ld (ws+1334), hl
	pop bc
	pop hl
	ld (ws+1332), hl
	push bc
	push hl
	ld hl, (ws+1334)
	call f43_file_i_init
	ld hl, (ws+1332)
	inc hl
	inc hl
	ld (ws+1337), hl
	ld c, 15 
	ld de, ( ws+1337 ) 
	call 5 
	call f49_fcb_i_conve;t_a_to_error 
;!!!	ld ( ws+1336 ), a 
;!!!	ld a, (ws+1336)
	ret


	; FCBOpenOut workspace at ws+1297 length ws+7 OK
f52_FCBOpenOut:
	ld (ws+1299), hl
	pop bc
	pop hl
	ld (ws+1297), hl
	push bc
	push hl
	ld hl, (ws+1299)
	call f43_file_i_init
	ld hl, (ws+1297)
	inc hl
	inc hl
	ld (ws+1302), hl
	ld c, 19 
	ld de, ( ws+1302 ) 
	call 5 
	ld c, 22 
	ld de, ( ws+1302 ) 
	call 5 
	call f49_fcb_i_conve;t_a_to_error 
;!!!	ld ( ws+1301 ), a 
;!!!	ld a, (ws+1301)
	ret


	; FCBClose workspace at ws+1336 length ws+5 OK
f53_FCBClose:
	ld (ws+1336), hl
	call f47_fcb_i_block;ut
	ld hl, (ws+1336)
	inc hl
	inc hl
	ld (ws+1339), hl
	ld c, 16 
	ld de, ( ws+1339 ) 
	call 5 
	call f49_fcb_i_conve;t_a_to_error 
;!!!	ld ( ws+1338 ), a 
;!!!	ld a, (ws+1338)
	ret


	; FCBSeek workspace at ws+1332 length ws+9 OK
f54_FCBSeek:
	ld (ws+1334), hl
	exx
	ld (ws+1336), hl
	exx
	pop bc
	pop hl
	ld (ws+1332), hl
	push bc
	ld de, (ws+1334)
	exx
	ld de, (ws+1336)
	exx
	ld hl,65535
	exx
	ld hl,65535
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+1334), hl
	exx
	ld (ws+1336), hl
	exx
	ld hl, (ws+1334)
	exx
	ld hl, (ws+1336)
	exx
	ld a,7
	call f469__lsr4
	ld (ws+1338), hl
	ld a, (ws+1334)
	and 127
	ld (ws+1340), a
	ld hl, (ws+1332)
	push hl
	ld hl, (ws+1338)
	call f48_fcb_i_chang;block
	ld a, (ws+1340)
	ld hl, (ws+1332)
	ld (hl),a
	ret


	; FCBPos workspace at ws+1336 length ws+6 OK
f55_FCBPos:
	ld (ws+1336), hl
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	exx
	ld hl,0
	exx
	ld a,7
	call f470__asl4
	ex de,hl
	exx
	ex de,hl
	exx
	ld hl, (ws+1336)
	ld a,(hl)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	call f482__or4
	ex de,hl
	exx
	ex de,hl
	exx
	ld hl,1
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+1338), hl
	exx
	ld (ws+1340), hl
	exx
	ld hl, (ws+1338)
	exx
	ld hl, (ws+1340)
	exx
	ret


	; fcb_i_nextchar workspace at ws+1419 length ws+2 OK
f60_fcb_i_nextc:   
	ld (ws+1419), hl
	ld a,(hl)
	inc a
	ld (hl),a
	ld a,(hl)
	cp 128
;!!!	jp nz, c01_014e
	ret nz	;!!!
	ld hl, (ws+1419)
	push hl
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	inc hl
	call f48_fcb_i_chang;block
	xor a
	ld hl, (ws+1419)
	ld (hl),a
;!!!c01_014e:
	ret


	; FCBGetChar workspace at ws+1326 length ws+3 OK
f61_FCBGetChar:
	ld (ws+1326), hl
	call f60_fcb_i_nextc;ar
	ld hl, (ws+1326)
	ld de,38
	add hl,de
	ex de,hl
	ld hl, (ws+1326)
	ld a,(hl)
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
;!!!	ld (ws+1328), a
;!!!	ld a, (ws+1328)
	ret


	; FCBPutChar workspace at ws+1416 length ws+3 OK
f62_FCBPutChar:
	ld (ws+1418), a
	pop bc
	pop hl
	ld (ws+1416), hl
	push bc
	call f60_fcb_i_nextc;ar
	ld a, (ws+1418)
	push af
	ld hl, (ws+1416)
	ld de,38
	add hl,de
	ex de,hl
	ld hl, (ws+1416)
	ld a,(hl)
	ld l,a
	ld h,0
	add hl,de
	pop af
	ld (hl),a
	ld a,1
	ld hl, (ws+1416)
	inc hl
	ld (hl),a
	ret

	; StrDupBraced workspace at ws+1388 length ws+12 OK
f76_StrDupBrace: 
	ld (ws+1388), hl	;str
	call f32_StrLen
	ld (ws+1394), hl	;len
	inc hl
	inc hl
	inc hl
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl	;HL = vp
	push	hl		;vp on stack
	ld	de,buf1		;move '[' to buf1
	ld	a,'['
	ld	(de),a
	inc	de
				;append str
	ld	hl,(ws+1388)	;str
	ld	bc,(ws+1394)	;len
	ldir
	ld	a,']'		;append ']'
	ld	(de),a
	inc	de
	xor	a		;ending zero
	ld	(de),a
	pop	hl		;HL = vp
	push	hl
	ld	de,buf1
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;HL = vp
	ret
;	call f75_InternalAll;c
;	ld (ws+1390), hl
;	ld (ws+1398), hl
;	ld a,91
;	ld (hl),a
;	inc hl
;	ld (ws+1398), hl
;	ld hl, (ws+1388)
;	push hl
;	ld hl, (ws+1394)
;	push hl
;	ld hl, (ws+1398)
;	call f34_MemCopy
;	ld de, (ws+1398)
;	ld hl, (ws+1394)
;	add hl,de
;	ld (ws+1398), hl
;	ld a,93
;	ld (hl),a
;	inc hl
;	ld (ws+1398), hl
;	xor a
;	ld (hl),a
;	ld hl, (ws+1390)
	ret


	; StrDupArrayed workspace at ws+1369 length ws+14 OK
f77_StrDupArray:  
;	ld (ws+1371), hl	;i not used !!!
	pop bc
	pop hl
	ld (ws+1369), hl	;str
	push bc
	call f32_StrLen
	ld (ws+1377), hl	;len
	inc hl
	inc hl
	inc hl
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl	;HL = vp
	push	hl		;vp on stack
	ld	de,buf1		;move str to buf1
	ld	hl,(ws+1369)	;str
	ld	bc,(ws+1377)	;len
	ldir
	ld	a,'['		;append "[]"
	ld	(de),a
	inc	de
	ld	a,']'
	ld	(de),a
	inc	de
	xor	a		;ending zero
	ld	(de),a
	pop	hl		;HL = vp
	push	hl
	ld	de,buf1
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;HL = vp
	ret
;	call f75_InternalAll;c
;	ld (ws+1373), hl
;	ld (ws+1381), hl
;	ld hl, (ws+1369)
;	push hl
;	ld hl, (ws+1377)
;	push hl
;	ld hl, (ws+1381)
;	call f34_MemCopy
;	ld de, (ws+1381)
;	ld hl, (ws+1377)
;	add hl,de
;	ld (ws+1381), hl
;	ld a,91
;	ld (hl),a
;	inc hl
;	ld (ws+1381), hl
;	ld a,93
;	ld (hl),a
;	inc hl
;	ld (ws+1381), hl
;	xor a
;	ld (hl),a
;	ld hl, (ws+1373)
;	ret


	; InternalStrDup workspace at ws+1372 length ws+10 OK
f78_InternalStr:   
	ld (ws+1372), hl	;str
	call f32_StrLen
	inc hl
	ld (ws+1378), hl	;len+1
	call f75_InternalAll;c
	ld (ws+1374), hl
	ld hl, (ws+1372)
	push hl
	ld hl, (ws+1378)
	push hl
	ld hl, (ws+1374)
	call f34_MemCopy
	ld hl, (ws+1374)
	ret

	; ExternalStrDup workspace at ws+1372 length ws+10 OK
f78_ExternalStr:   
	ld (ws+1372), hl	;str
	call f32_StrLen
	inc hl			;len+1
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl	;HL = vp
	push	hl
	ld	de,(ws+1372)	;str
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;HL = vp
	ret

        ; AllocNewSymbol workspace at ws+1398 length ws+4 OK
f70_AllocNewSym:
        ld hl, (symbol_freelist)
        ld a,h
        or l
        jp z, c01_0166
        ld hl, (symbol_freelist)
        ld (ws+1398), hl
        ld hl,( ws+66 )
        ld c,S_next
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( ws+66 ),bc
        ld hl,( ws+1398 )
        ld c,SYMBOL_SIZE
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _FillZero
        jp c01_0162
c01_0166:
        ld hl,SYMBOL_SIZE
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call f75_ExternalAl
        ld (ws+1398), hl
c01_0162:
        ld hl, (ws+1398)
        ret


        ; FreeSymbol workspace at ws+1373 length ws+2 OK
f71_FreeSymbol:
        ld (ws+1373), hl
;        ld hl,( ws+1373 )
        ld de,( ws+66 )
        ld c,S_next
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1373)
        ld (symbol_freelist), hl
        ret


        ; AllocNewType workspace at ws+1388 length ws+4 OK
f72_AllocNewTyp:
        ld hl, (type_freelist)
        ld a,h
        or l
        jp z, c01_016b
        ld hl, (type_freelist)
        ld (ws+1388), hl
        ld hl,( ws+68 )
        ld c,T_pointerto
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( ws+68 ),bc
        ld hl,( ws+1388 )
        ld c,TYPE_SIZE
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _FillZero
        jp c01_0167
c01_016b:
        ld hl,TYPE_SIZE
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call f75_ExternalAl
        ld (ws+1388), hl
c01_0167:
        ld hl, (ws+1388)
        ret


        ; FreeType workspace at ws+1373 length ws+2 OK
f73_FreeType:
        ld (ws+1373), hl
;        ld hl,( ws+1373 )
        ld de,( ws+68 )
        ld c,T_pointerto
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1373)
        ld (type_freelist), hl
        ret


c1c_x0:
        db 79,117,116,32,111,102,32,117,112,112,101,114,32,109,101,109,111,114,121,10,0


        ; ExternalAlloc workspace at ws+1426 length ws+4 OK
f75_ExternalAl:
IF	CHECK_TYPE
	ld a,b
	ld (obj_type),a
ENDIF
        ld (ws+1426), hl
;        ld hl,( ws+1426 )
        call _Alloc
        ld ( ws+1428 ),hl
;        ld hl, (ws+1428)
        ld a,h
        or l
        ret nz
c1c_9006:
        ld hl, (symbol_freelist)
        ld a,h
        or l
        jp z, c1c_900b
        ld hl, (symbol_freelist)
        ld (ws+1428), hl
        push hl
        pop ix
        ld l, (ix+8)
        ld h, (ix+9)
        ld (symbol_freelist), hl
        ld hl,( ws+1428 )
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _Free
        jp c1c_9006
c1c_900b:
c1c_900c:
        ld hl, (type_freelist)
        ld a,h
        or l
        jp z, c1c_9011
        ld hl, (type_freelist)
        ld (ws+1428), hl
        push hl
        pop ix
        ld l, (ix+9)
        ld h, (ix+10)
        ld (type_freelist), hl
        ld hl,( ws+1428 )
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _Free
        jp c1c_900c
c1c_9011:
        ld hl,( ws+1426 )
IF	CHECK_TYPE
	ld a,(obj_type)
	ld b,a
ENDIF
        call _Alloc
;;        ld ( ws+1428 ),hl
;        ld hl, (ws+1428)
        ld a,h
        or l
        ret nz
        ld hl,c1c_x0
        call f9_print
        jp f4_ExitWithErro


c01_c9:
	db 79,117,116,32,111,102,32,109,101,109,111,114,121,10,0

	; InternalAlloc workspace at ws+1426 length ws+8 !!!CHANGE
f75_InternalAll:  
	call f37_RawAlloc
	ld a,h
	or l
	ret nz
	ld hl,c01_c9
	call f9_print
	jp f4_ExitWithErro


f2___main_s0182:
	db 0
	db 0
	db 0
	db 0
	db 146
	db 187
	db 0
	db 144
	db 132
	db 152
	db 147
	db 173
	db 142
	db 136
	db 151
	db 33
	db 33
	db 33
	db 33
	db 33
	db 33
	db 33
	db 33
	db 33
	db 33
	db 134
	db 150
	db 0
	db 0
	db 0
	db 0
	db 16
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 145
	db 0
	db 133
	db 177
	db 48
	db 0
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 159
	db 176
	db 160
	db 155
c01_c10:
	db 64,97,108,105,97,115,0
c01_c11:
	db 64,97,115,109,0
c01_c12:
	db 64,97,116,0
c01_c13:
	db 64,98,121,116,101,115,111,102,0
c01_c14:
	db 64,100,101,99,108,0
c01_c15:
	db 64,101,120,116,101,114,110,0
c01_c16:
	db 64,105,110,100,101,120,111,102,0
c01_c17:
	db 64,105,109,112,108,0
c01_c18:
	db 64,115,105,122,101,111,102,0
c01_c19:
	db 64,110,101,120,116,0
c01_c20:
	db 64,112,114,101,118,0
c01_c21:
	db 97,110,100,0
c01_c22:
	db 97,115,0
c01_c23:
	db 98,114,101,97,107,0
c01_c24:
	db 99,97,115,101,0
c01_c25:
	db 99,111,110,115,116,0
c01_c26:
	db 99,111,110,116,105,110,117,101,0
c01_c27:
	db 101,108,115,101,0
c01_c28:
	db 101,108,115,101,105,102,0
c01_c29:
	db 101,110,100,0
c01_c30:
	db 101,120,116,101,114,110,0
c01_c31:
	db 105,102,0
c01_c32:
	db 105,115,0
c01_c33:
	db 105,110,99,108,117,100,101,0
c01_c34:
	db 105,110,116,0
c01_c35:
	db 105,110,116,101,114,102,97,99,101,0
c01_c36:
	db 105,109,112,108,101,109,101,110,116,115,0
c01_c37:
	db 108,111,111,112,0
c01_c38:
	db 110,111,116,0
c01_c39:
	db 111,114,0
c01_c40:
	db 114,101,99,111,114,100,0
c01_c41:
	db 114,101,116,117,114,110,0
c01_c42:
	db 115,117,98,0
c01_c43:
	db 116,104,101,110,0
c01_c44:
	db 116,121,112,101,100,101,102,0
c01_c45:
	db 118,97,114,0
c01_c46:
	db 119,104,101,110,0
c01_c47:
	db 119,104,105,108,101,0
f2___main_s0183:
	dw c01_c10
	dw c01_c11
	dw c01_c12
	dw c01_c13
	dw c01_c14
	dw c01_c15
	dw c01_c16
	dw c01_c17
	dw c01_c18
	dw c01_c19
	dw c01_c20
	dw c01_c21
	dw c01_c22
	dw c01_c23
	dw c01_c24
	dw c01_c25
	dw c01_c26
	dw c01_c27
	dw c01_c28
	dw c01_c29
	dw c01_c30
	dw c01_c31
	dw c01_c32
	dw c01_c33
	dw c01_c34
	dw c01_c35
	dw c01_c36
	dw c01_c37
	dw c01_c38
	dw c01_c39
	dw c01_c40
	dw c01_c41
	dw c01_c42
	dw c01_c43
	dw c01_c44
	dw c01_c45
	dw c01_c46
	dw c01_c47
f2___main_s0184:
	db 67
	db 1
	db 35
	db 36
	db 43
	db 11
	db 62
	db 42
	db 40
	db 60
	db 61
	db 46
	db 58
	db 3
	db 64
	db 7
	db 63
	db 9
	db 37
	db 10
	db 11
	db 12
	db 65
	db 255
	db 38
	db 44
	db 68
	db 13
	db 15
	db 47
	db 20
	db 21
	db 25
	db 26
	db 39
	db 28
	db 66
	db 29
c01_c48:
	db 101,114,114,111,114,58,32,0
c01_c49:
	db 60,101,111,102,62,0
c01_c50:
	db 58,32,0
c01_c51:
	db 58,32,0


	; StartError workspace at ws+1432 length ws+0 OK
f80_StartError:
	ld hl,c01_c48
	call f9_print
	ld hl, (ws+72)
	ld a,h
	or l
	jp nz, c01_0189
	ld hl,c01_c49
	call f9_print
	jp c01_0185
c01_0189:
	ld hl, (ws+72)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	ld hl,c01_c50
	call f9_print
	ld ix, (ws+72)
	ld l, (ix+4)
	ld h, (ix+5)
	call f16_print_i16
c01_0185:
	ld hl,c01_c51
;!!!	call f9_print
	jp f9_print
;!!!	ret


	; EndError workspace at ws+1432 length ws+0 OK
f81_EndError:
	call f10_print_nl
;!!!	call f4_ExitWithErro;
	jp f4_ExitWithErro;	;!!!
;!!!	ret


	; SimpleError workspace at ws+1430 length ws+2 OK
f82_SimpleError:
	ld (ws+1430), hl
	call f80_StartError
	ld hl, (ws+1430)
	call f9_print
;!!!	call f81_EndError
	jp f81_EndError	;!!!
;!!!	ret

ErrNr:	defz	'Error #'

	psect	bss

NrBuf:	defs	4

	psect	text

	global SimpleErrorNr

SimpleErrorNr:
	push	af
	call 	f80_StartError
	ld 	hl,ErrNr
	call 	f9_print
	pop	af
	call	f17_print_i8
	jp 	f81_EndError


	; LexerAddIncludePath workspace at ws+1298 length ws+6 OK
f83_LexerAddInc:        
	ld (ws+1298), hl
	ld hl,4
	call f75_InternalAll;c
	ld (ws+1302), hl
	ld de, (ws+70)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1298)
	ld hl, (ws+1302)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1302)
	ld (ws+70), hl
	ret

c01_c52:
	db 32,32,0


	; LexerPrintSpaces workspace at ws+1328 length ws+1 OK
f84_LexerPrintS:     
	ld a, (ws+374)
	ld (ws+1328), a
c01_018a:
;	ld a, (ws+1328)
	or a
;!!!	jp z, c01_018f
	ret z	;!!!
	ld hl,c01_c52
	call f9_print
	ld a, (ws+1328)
	dec a
	ld (ws+1328), a
	jp c01_018a
;!!!c01_018f:
;!!!	ret


	; lexer_i_open workspace at ws+1328 length ws+4 OK
f85_lexer_i_ope: 
	ld (ws+1328), hl
	ld de,ws+208
	push de
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f50_FCBOpenIn
	ld (ws+1331), a
	or a
	jp nz, c01_0194
	ld de,ws+208
	push de
	ld ix, (ws+1328)
	ld l, (ix+6)
	ld h, (ix+7)
	exx
	ld l, (ix+8)
	ld h, (ix+9)
	exx
	call f54_FCBSeek
	xor a
	ld (ws+1330), a
	jp c01_0190
c01_0194:
	ld a,1
	ld (ws+1330), a
c01_0190:
;!!!	ld a, (ws+1330)
	ret


	; lexer_i_close workspace at ws+1328 length ws+8 OK
f86_lexer_i_clo:  
	ld (ws+1328), hl
	ld hl,ws+208
	call f55_FCBPos
	ld (ws+1330), hl
	exx
	ld (ws+1332), hl
	exx
	ld hl, (ws+1330)
	exx
	ld hl, (ws+1332)
	exx
	ld ix, (ws+1328)
	ld (ix+6), l
	ld (ix+7), h
	exx
	ld (ix+8), l
	ld (ix+9), h
	exx
	ld hl,ws+208
	call f53_FCBClose
	ld (ws+1335), a
	ret

c01_c53:
	db 62,32,0
c01_c54:
	db 99,97,110,110,111,116,32,111,112,101,110,32,39,0
c01_c55:
	db 39,0


	; LexerIncludeFile workspace at ws+1309 length ws+19 OK
f87_LexerInclud:     
	ld (ws+1309), hl
	ld hl,10
	call f75_InternalAll;c
	ld (ws+1313), hl
	ld de, (ws+72)
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix, (ws+1313)
	ld (ix+4), 1
	ld (ix+5), 0
	ld h,d
	ld l,e
	ld a,h
	or l
	jp z, c01_0199
	ld hl, (ws+72)
	call f86_lexer_i_clo;e
c01_0199:
	ld hl, (ws+70)
	ld (ws+1315), hl
	ld hl, (ws+1309)
	call f32_StrLen
	ld (ws+1319), hl
c01_019a:
	ld hl, (ws+1315)
	ld a,h
	or l
	jp z, c01_019f
	ld hl, (ws+1315)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f32_StrLen
	ld (ws+1323), hl
	ld de, (ws+1319)
	add hl,de
	inc hl
	call f75_InternalAll;c
	ld (ws+1325), hl
	ld d,h
	ld e,l
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1315)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1323)
	push hl
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f34_MemCopy
	ld hl, (ws+1309)
	push hl
	ld hl, (ws+1319)
	inc hl
	push hl
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1323)
	add hl,de
	call f34_MemCopy
	ld hl, (ws+1313)
	call f85_lexer_i_ope;
	ld (ws+1327), a
	or a
	jp nz, c01_01a4
	ld a, (ws+374)
	inc a
	ld (ws+374), a
	call f84_LexerPrintS;aces
	ld hl,c01_c53
	call f9_print
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	call f10_print_nl
	ld hl, (ws+1313)
	ld (ws+72), hl
	ret
c01_01a4:
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
	ld hl, (ws+1315)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1315), hl
	jp c01_019a
c01_019f:
	call f80_StartError
	ld hl,c01_c54
	call f9_print
	ld hl, (ws+1309)
	call f9_print
	ld hl,c01_c55
	call f9_print
;!!!	call f81_EndError
	jp f81_EndError	;!!!
;!!!	ret


	; lexer_i_ctype workspace at ws+1321 length ws+3 OK
f89_lexer_i_cty:  
	ld (ws+1321), a
	cp 33
	jp c, c01_01ab
	ld b,127
	ld a, (ws+1321)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_01ab
	ld bc,f2___main_s0182
	ld a, (ws+1321)
	add 223
	ld l,a
	ld h,0
	add hl,bc
	ld a,(hl)
	ld (ws+1322), a
	and 128
	or a
	jp z, c01_01b1
	ld a, (ws+1322)
	and 127
	ld (ws+1323), a
	ld a,128
	ld (ws+1322), a
c01_01b1:
	jp c01_01a5
c01_01ab:
	xor a
	ld (ws+1322), a
	xor a
	ld (ws+1323), a
c01_01a5:
	ld a, (ws+1322)
	pop bc
	push af
	ld a, (ws+1323)
	push bc
	ret

c01_c56:
	db 60,32,0
;c01_c57:
;	db 73,47,79,32,101,114,114,111,114,0


	; lexer_i_getchar workspace at ws+1321 length ws+5 OK
f90_lexer_i_get:    
	ld a, (ws+74)
	or a
	jp z, c01_01b6
	ld a, (ws+74)
	ld (ws+1321), a
	xor a
	ld (ws+74), a
	jp end_f90_lexer_i;_getchar
c01_01b6:
c01_01b7:
	ld hl, (ws+72)
	ld a,h
	or l
	jp nz, c01_01bd
	xor a
	ld (ws+1321), a
	jp c01_01b8
c01_01bd:
	ld hl, (ws+72)
	ld (ws+1322), hl
	ld hl,ws+208
	call f61_FCBGetChar
	ld (ws+1321), a
	cp 26
	jp nz, c01_01c2
	xor a
	ld (ws+1321), a
c01_01c2:
	ld a, (ws+1321)
	or a
	jp z, c01_01c7
	jp c01_01b8
c01_01c7:
	ld hl, (ws+1322)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+72), hl
	ld hl, (ws+1322)
	call f86_lexer_i_clo;e
	ld hl, (ws+1322)
	call f40_Free
	ld hl, (ws+72)
	ld a,h
	or l
	jp z, c01_01cc
	ld a, (ws+374)
	dec a
	ld (ws+374), a
	call f84_LexerPrintS;aces
	ld hl,c01_c56
	call f9_print
	ld hl, (ws+72)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	call f10_print_nl
	ld hl, (ws+72)
	call f85_lexer_i_ope;
	ld (ws+1325), a
	or a
	jp z, c01_01d1
;	ld hl,c01_c57
;	call f82_SimpleError
	ld a,8
	call SimpleErrorNr
c01_01d1:
c01_01cc:
	jp c01_01b7
c01_01b8:
end_f90_lexer_i:        
	ld a, (ws+1321)
	ret

c01_c58:
	db 117,110,112,97,114,115,101,97,98,108,101,32,99,104,97,114,97,99,116,101,114,32,48,120,0


	; lexer_i_unparseable workspace at ws+1306 length ws+1 OK
f91_lexer_i_unp:        
	ld (ws+1306), a
	call f80_StartError
	ld hl,c01_c58
	call f9_print
	ld a, (ws+1306)
	call f18_print_hex_i;
;!!!	call f81_EndError
	jp f81_EndError	;!!!
;!!!	ret


	; lexer_i_skipwhitespace workspace at ws+1310 length ws+2 OK
f92_lexer_i_ski:           
c01_01d2:
	call f90_lexer_i_get;har
	ld (ws+1311), a
	cp 32
	jp nz, c01_01d5
	jp c01_01d4
c01_01d5:
	cp 13
	jp nz, c01_01d6
	jp c01_01d4
c01_01d6:
	cp 10
	jp nz, c01_01d7
	ld ix, (ws+72)
	ld l, (ix+4)
	ld h, (ix+5)
	inc hl
	ld (ix+4), l
	ld (ix+5), h
	jp c01_01d4
c01_01d7:
	cp 9
	jp nz, c01_01d8
	jp c01_01d4
c01_01d8:
	jp c01_01d3
c01_01d4:
	jp c01_01d2
c01_01d3:
	ld a, (ws+1311)
	ld (ws+74), a
end_f92_lexer_i:               
	ret

c01_c59:
	db 116,111,107,101,110,32,116,111,111,32,108,111,110,103,0

	; lexer_i_read_identifier workspace at ws+1306 length ws+4 OK
f93_lexer_i_rea:            
c01_01d9:
	call f90_lexer_i_get;har
	ld (ws+1307), a
	call f89_lexer_i_cty;e
	ld (ws+1309), a
	pop af
	ld (ws+1308), a
	and 32
	or a
	jp z, c01_01df
	ld a, (ws+1307)
	push af
	ld de,ws+75
	ld a, (ws+203)
	ld l,a
	ld h,0
	add hl,de
	pop af
	ld (hl),a
	ld a, (ws+203)
	inc a
	ld (ws+203), a
	cp 128
	jp nz, c01_01e4
	call f80_StartError
	ld hl,c01_c59
	call f9_print
	call f81_EndError
c01_01e4:
	jp c01_01db
c01_01df:
	ld a, (ws+1307)
	ld (ws+74), a
	jp c01_01da
c01_01db:
	jp c01_01d9
c01_01da:
	ld b,0
	ld de,ws+75
	ld a, (ws+203)
	ld l,a
	ld h,b
	add hl,de
	ld a,b
	ld (hl),a
	ret


	; lexer_i_match_keyword workspace at ws+1306 length ws+3 OK
f94_lexer_i_mat:          
	xor a
	ld (ws+1307), a
c01_01e5:
	ld a, (ws+1307)
	cp 38
	jp z, c01_01ea
	ld de,ws+75
	push de
	ld bc,f2___main_s0183
	ld a, (ws+1307)
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f29_StrCmp
	ld (ws+1308), a
	or a
	jp nz, c01_01ef
	ld bc,f2___main_s0184
	ld a, (ws+1307)
	ld l,a
	ld h,0
	add hl,bc
	ld a,(hl)
;!!!	ld (ws+1306), a
;!!!	jp end_f94_lexer_i_match_keyword
	ret	;!!!
c01_01ef:
	ld a, (ws+1307)
	inc a
	ld (ws+1307), a
	jp c01_01e5
c01_01ea:
	ld a,33
;!!!	ld (ws+1306), a
;!!!end_f94_lex:                  
;	ld a, (ws+1306)
	ret

c01_c60:
	db 105,110,118,97,108,105,100,32,110,117,109,98,101,114,0


	; lexer_i_read_number workspace at ws+1310 length ws+11 OK
f95_lexer_i_rea:        
	ld hl,0
	ld (ws+204), hl
	ld (ws+206), hl
	ld hl,10
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	call f90_lexer_i_get;har
	ld (ws+1317), a
	cp 48
	jp nz, c01_01f4
	call f90_lexer_i_get;har
	ld (ws+1317), a
	cp 98
	jp nz, c01_01f6
	ld hl,2
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ;;
c01_01f6:
	cp 111
	jp nz, c01_01f7
	ld hl,8
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ;;
c01_01f7:
	cp 100
	jp nz, c01_01f8
	ld hl,10
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ;;
c01_01f8:
	cp 120
	jp nz, c01_01f9
	ld hl,16
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ;;
c01_01f9:
	ld a, (ws+1317)
	ld (ws+74), a
	call f89_lexer_i_cty;e
	ld (ws+1315), a
	pop af
	ld (ws+1314), a
	and 32
	or a
;;	jp nz, c01_01fe
;;	ret
	ret z ;;
c01_01fe:
c01_01f5:
	jp c01_01f0
c01_01f4:
	ld a, (ws+1317)
	ld (ws+74), a
c01_01f0:
c01_01ff:
	call f90_lexer_i_get;har
	ld (ws+1319), a
	call f30_ToLower
	ld (ws+1317), a
	cp 95
	jp nz, c01_0205
	jp c01_01ff
c01_0205:
	ld a, (ws+1317)
	call f89_lexer_i_cty;e
	ld (ws+1315), a
	pop af
	ld (ws+1314), a
	and 32
	or a
	jp nz, c01_020a
	ld a, (ws+1317)
	ld (ws+74), a
;!!!	jp c01_0200
	ret	;!!!
c01_020a:
	ld a, (ws+1317)
	cp 97
	jp c, c01_020f
	ld a, (ws+1317)
	add 169
	ld (ws+1317), a
	jp c01_020b
c01_020f:
	ld a, (ws+1317)
	add 208
	ld (ws+1317), a
c01_020b:
	ld a, (ws+1317)
	push af
	ld a, (ws+1310)
	ld b,a
	pop af
	cp b
	jp c, c01_0214
	call f80_StartError
	ld hl,c01_c60
	call f9_print
	call f81_EndError
c01_0214:
	ld bc, (ws+204)
	exx
	ld bc, (ws+206)
	exx
	ld de, (ws+1310)
	exx
	ld de, (ws+1312)
	exx
	call f474__mul4
	ex de,hl
	exx
	ex de,hl
	exx
	ld a, (ws+1317)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+204), hl
	exx
	ld (ws+206), hl
	exx
	jp c01_01ff
;!!!c01_0200:
;!!!	ret

c01_c61:
	db 109,97,108,102,111,114,109,101,100,32,0


	; lexer_i_malformed workspace at ws+1315 length ws+2 OK
f96_lexer_i_mal:      
	ld (ws+1315), hl
	call f80_StartError
	ld hl,c01_c61
	call f9_print
	ld hl, (ws+1315)
	call f9_print
;!!!	call f81_EndError
	jp f81_EndError ;!!!
;!!!	ret

c01_c62:
	db 101,115,99,97,112,101,0


	; lexer_i_get_escaped workspace at ws+1313 length ws+2 OK
f97_lexer_i_get:        
	call f90_lexer_i_get;har
	ld (ws+1313), a
	cp 110
	jp nz, c01_0216
	ld a,10
	ld (ws+1313), a
	jp c01_0215
c01_0216:
	cp 114
	jp nz, c01_0217
	ld a,13
	ld (ws+1313), a
	jp c01_0215
c01_0217:
	cp 116
	jp nz, c01_0218
	ld a,9
	ld (ws+1313), a
	jp c01_0215
c01_0218:
	cp 92
	jp nz, c01_0219
	ld a,92
	ld (ws+1313), a
	jp c01_0215
c01_0219:
	cp 39
	jp nz, c01_021a
	ld a,39
	ld (ws+1313), a
	jp c01_0215
c01_021a:
	cp 34
	jp nz, c01_021b
	ld a,34
	ld (ws+1313), a
	jp c01_0215
c01_021b:
	cp 48
	jp nz, c01_021c
	xor a
	ld (ws+1313), a
	jp c01_0215
c01_021c:
	ld hl,c01_c62
	call f96_lexer_i_mal;ormed
c01_0215:
	ld a, (ws+1313)
	ret

c01_c63:
	db 115,116,114,105,110,103,32,99,111,110,115,116,97,110,116,0
c01_c64:
	db 115,116,114,105,110,103,32,99,111,110,115,116,97,110,116,32,116,111,111,32,108,111,110,103,0


	; lexer_i_read_string workspace at ws+1310 length ws+3 OK
f98_lexer_i_rea:        
	xor a
	ld (ws+203), a
c01_021d:
	call f90_lexer_i_get;har
	ld (ws+1311), a
	cp 32
	jp nc, c01_0223
	ld hl,c01_c63
	call f96_lexer_i_mal;ormed
c01_0223:
	ld a, (ws+1311)
	cp 34
	jp nz, c01_0225
	jp c01_021e
c01_0225:
	cp 92
	jp nz, c01_0226
	call f97_lexer_i_get;_escaped
	ld (ws+1311), a
c01_0226:
	ld a, (ws+1311)
	push af
	ld de,ws+75
	ld a, (ws+203)
	ld l,a
	ld h,0
	add hl,de
	pop af
	ld (hl),a
	ld a, (ws+203)
	inc a
	ld (ws+203), a
	cp 128
	jp nz, c01_021d ;;
	call f80_StartError
	ld hl,c01_c64
	call f9_print
	call f81_EndError
c01_022b:
	jp c01_021d
c01_021e:
	ld b,0
	ld de,ws+75
	ld a, (ws+203)
	ld l,a
	ld h,b
	add hl,de
	ld a,b
	ld (hl),a
	ret

c01_c65:
	db 99,104,97,114,97,99,116,101,114,32,99,111,110,115,116,97,110,116,0


	; malformed workspace at ws+1310 length ws+0 OK
f100_malformed:
	ld hl,c01_c65
;!!!	call f96_lexer_i_mal;ormed
	jp f96_lexer_i_mal;ormed	;!!!
;!!!	ret


	; lexer_i_read_char workspace at ws+1306 length ws+4 OK
f99_lexer_i_rea:      
	call f90_lexer_i_get;har
;	ld (ws+1307), a
	cp 32
	jp c, c01_0231
;	ld a, (ws+1307)
	cp 39
	jp nz, c01_0232
c01_0231:
	call f100_malformed
c01_0232:
;	ld a, (ws+1307)
	cp 92
	jp nz, c01_0238
	call f97_lexer_i_get;_escaped
;	ld (ws+1307), a
c01_0238:
;	ld a, (ws+1307)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	ld (ws+204), hl
	exx
	ld (ws+206), hl
	exx
	call f90_lexer_i_get;har
;	ld (ws+1307), a
	cp 39
;!!!	jp z, c01_023d
	ret z	;!!!
;!!!	call f100_malformed
	jp f100_malformed	;!!!
;!!!c01_023d:
;!!!	ret

c01_c66:
	db 105,110,99,108,117,100,101,32,100,105,114,101,99,116,105,118,101,0


	; malformed_include workspace at ws+1309 length ws+0 OK
f102_malformed_:       
	ld hl,c01_c66
;!!!	call f96_lexer_i_mal;ormed
	jp f96_lexer_i_mal;ormed	;!!!
;!!!	ret


	; lexer_i_include workspace at ws+1306 length ws+3 OK
f101_lexer_i_in:     
	call f92_lexer_i_ski;whitespace
	call f90_lexer_i_get;har
;	ld (ws+1307), a
	cp 34
;;	jp z, c01_0242
;;	call f102_malformed_;nclude
	call nz,f102_malformed_ ;;
;;c01_0242:
	call f98_lexer_i_rea;_string
	call f92_lexer_i_ski;whitespace
	call f90_lexer_i_get;har
;	ld (ws+1307), a
	cp 59
;;	jp z, c01_0247
;;	call f102_malformed_;nclude
	call nz,f102_malformed_ ;;
;;c01_0247:
	ld hl,ws+75
;!!!	call f87_LexerInclud;File
	jp f87_LexerInclud;File	;!!!
;!!!	ret

c01_c67:
	db 35,108,105,110,101,32,100,105,114,101,99,116,105,118,101,0


	; lexer_i_line_directive workspace at ws+1306 length ws+4 OK
f103_lexer_i_li:            
	call f92_lexer_i_ski;whitespace
	call f95_lexer_i_rea;_number
	call f92_lexer_i_ski;whitespace
	call f90_lexer_i_get;har
;	ld (ws+1307), a
	cp 34
	jp z, c01_024c
	ld hl,c01_c67
	call f96_lexer_i_mal;ormed
c01_024c:
	call f98_lexer_i_rea;_string
	ld hl, (ws+204)
	exx
	ld hl, (ws+206)
	exx
	ld ix, (ws+72)
	ld (ix+4), l
	ld (ix+5), h
	push ix
	pop hl
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
	ld hl,ws+75
	call f78_InternalStr;up
	ld d,h
	ld e,l
	ld hl, (ws+72)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ret

c01_c68:
	db 108,105,110,101,0

; jp optimizations
;c01_0263 ---> c01_0259 
;c01_025a ---> c01_024d
;c01_0269 ---> c01_0266 
;c01_026f ---> c01_0266 
;c01_0273 ---> c01_0266 
;c01_0279 ---> c01_0266
;c01_027f ---> c01_0266
;c01_0295 ---> c01_024e
;c01_0291 ---> c01_024d
	; LexerReadToken workspace at ws+1294 length ws+12 OK
f88_LexerReadTo:   
c01_024d:
	call f92_lexer_i_ski;whitespace
	call f90_lexer_i_get;har
	ld (ws+1296), a
	cp 35
	jp nz, c01_0253
	xor a
	ld (ws+203), a
	call f93_lexer_i_rea;_identifier
	ld de,ws+75
	push de
	ld hl,c01_c68
	call f29_StrCmp
	ld (ws+1297), a
	or a
;;	jp nz, c01_0258
;;	call f103_lexer_i_li;e_directive
	call z,f103_lexer_i_li ;;
;;c01_0258:
c01_0259:
	call f90_lexer_i_get;har
	ld (ws+1296), a
	cp 10
	jp z, c01_0262
	ld a, (ws+1296)
	cp 13
	jp z, c01_0262
	ld a, (ws+1296)
	or a
	jp nz, c01_0259 ;;
c01_0262:
	ld a, (ws+1296)
	ld (ws+74), a
	jp c01_024d ;;
;;c01_0263:
;;	jp c01_0259
;;c01_025a:
;;	jp c01_024d
c01_0253:
	ld a, (ws+1296)
	or a
	jp nz, c01_0267
	xor a
	ld (ws+1294), a
	jp c01_0266
c01_0267:
	cp 58
	jp nz, c01_0268
	call f90_lexer_i_get;har
	ld (ws+1296), a
	cp 61
	jp nz, c01_026d
	ld a,2
	ld (ws+1294), a
	jp c01_0266 ;;
c01_026d:
	ld a, (ws+1296)
	ld (ws+74), a
	ld a,6
	ld (ws+1294), a
;;c01_0269:
	jp c01_0266
c01_0268:
	cp 60
	jp nz, c01_026e
	call f90_lexer_i_get;har
	ld (ws+1296), a
	cp 60
	jp nz, c01_0270
	ld a,56
	ld (ws+1294), a
	jp c01_0266 ;;
c01_0270:
	cp 61
	jp nz, c01_0271
	ld a,51
	ld (ws+1294), a
	jp c01_0266 ;;
c01_0271:
	ld a, (ws+1296)
	ld (ws+74), a
	ld a,50
	ld (ws+1294), a
;;c01_026f:
	jp c01_0266
c01_026e:
	cp 61
	jp nz, c01_0272
	call f90_lexer_i_get;har
	ld (ws+1296), a
	cp 61
	jp nz, c01_0277
	ld a,54
	ld (ws+1294), a
	jp c01_0266 ;;
c01_0277:
	ld a, (ws+1296)
	call f91_lexer_i_unp;rseable
;;c01_0273:
	jp c01_0266
c01_0272:
	cp 33
	jp nz, c01_0278
	call f90_lexer_i_get;har
	ld (ws+1296), a
	cp 61
	jp nz, c01_027d
	ld a,55
	ld (ws+1294), a
	jp c01_0266 ;;
c01_027d:
	ld a, (ws+1296)
	call f91_lexer_i_unp;rseable
;;c01_0279:
	jp c01_0266
c01_0278:
	cp 62
	jp nz, c01_027e
	call f90_lexer_i_get;har
	ld (ws+1296), a
	cp 62
	jp nz, c01_0280
	ld a,57
	ld (ws+1294), a
	jp c01_0266 ;;
c01_0280:
	cp 61
	jp nz, c01_0281
	ld a,53
	ld (ws+1294), a
	jp c01_0266 ;;
c01_0281:
	ld a, (ws+1296)
	ld (ws+74), a
	ld a,52
	ld (ws+1294), a
;;c01_027f:
	jp c01_0266
c01_027e:
	cp 34
	jp nz, c01_0282
	call f98_lexer_i_rea;_string
	ld a,41
	ld (ws+1294), a
	jp c01_0266
c01_0282:
	cp 39
	jp nz, c01_0283
	call f99_lexer_i_rea;_char
	ld a,34
	ld (ws+1294), a
	jp c01_0266
c01_0283:
	ld a, (ws+1296)
	call f89_lexer_i_cty;e
	ld (ws+1294), a
	pop af
	ld (ws+1304), a
	and 128
	or a
;;	jp z, c01_0288
;;	jp c01_0284
	jp nz,c01_0284 ;;
c01_0288:
	ld a, (ws+1304)
	and 1
	or a
	jp z, c01_028c
	ld a, (ws+1296)
	ld (ws+74), a
	call f95_lexer_i_rea;_number
	ld a,34
	ld (ws+1294), a
	jp c01_0284
c01_028c:
	ld a, (ws+1304)
	and 16
	or a
	jp z, c01_0290
	ld a,1
	ld (ws+203), a
	ld a, (ws+1296)
	ld (ws+75), a
	call f93_lexer_i_rea;_identifier
	call f94_lexer_i_mat;h_keyword
	ld (ws+1294), a
	jp c01_0284
c01_0290:
	ld a, (ws+1296)
	call f91_lexer_i_unp;rseable
c01_0284:
c01_0266:
	ld a, (ws+1294)
	cp 255
	jp nz, c01_024e ;;
	call f101_lexer_i_in;lude
	jp c01_024d ;;
;;c01_0295:
;;	jp c01_024e
;;c01_0291:
;;	jp c01_024d
c01_024e:
	ld a, (ws+1294)
	ret
;--------------------------------------
