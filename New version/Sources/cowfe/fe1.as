	psect text

	global ws

 global f10_print_nl
 global f104_CountParameters
 global f105_GetInputParameter
 global f106_GetOutputParameter
 global f108_WidthToIndex
 global f109_AllocateNewNode
 global f110_MidWhencase
 global f111_MidDeref
 global f112_MidInitstring
 global f113_MidSubref
 global f115_MidBeq
 global f116_MidEndcase
 global f117_MidBand
 global f118_MidAsmtext
 global f119_MidStartsub
 global f120_MidStartcase
 global f121_MidInitaddress
 global f123_MidAddress
 global f125_MidAsmgroupend
 global f126_MidAsmvalue
 global f127_MidBor
 global f130_MidAsmsymbol
 global f131_MidLabel
 global f132_MidInitsubref
 global f133_MidStore
 global f134_MidEndinit
 global f135_MidCall
 global f137_MidBlts
 global f140_MidStartinit
 global f144_MidString
 global f147_MidAsmstart
 global f148_MidJump
 global f149_MidPoparg
 global f153_MidAsmsubref
 global f155_MidBltu
 global f156_MidAsmend
 global f16_print_i16
 global f160_MidAsmgroupstart
 global f161_MidConstant
 global f162_MidEnd
 global f163_MidEndsub
 global f164_MidArg
 global f165_MidPair
 global f166_MidReturn
 global f169_MidInit
 global f17_print_i8
 global f171_FreeNode
 global f172_NodeWidth
 global f27_ArgvInit
 global f28_ArgvNext
 global f29_StrCmp
 global f32_StrLen
 global f4_ExitWithError
 global f40_Free
 global f41_GetFreeMemory
 global f466__lsr2
 global f469__lsr4
 global f470__asl4
 global f471__asr4
 global f473__mul2
 global f474__mul4
 global f477__dvrmu2
 global f479__dvrmu4
 global f480__dvrms4
 global f481__and4
 global f482__or4
 global f483__eor4
 global f484__not4
 global f487__cmps4
 global f488__jpde
 global f52_FCBOpenOut
 global f53_FCBClose
 global f62_FCBPutChar
 global f70_AllocNewSymbol
 global f71_FreeSymbol
 global f72_AllocNewType
 global f73_FreeType
 global f74_IsPtr
 global f75_InternalAlloc
 global f76_StrDupBraced
 global f77_StrDupArrayed
 global f78_InternalStrDup
 global f80_StartError
 global f81_EndError
 global f82_SimpleError
 global f83_LexerAddIncludePath
 global f9_print
 global fxx_print_hex_i16

	ld sp,TOPSTACK
	call f2___main
	ld hl,0		;!!!
	ld (80H),hl	;!!!
	rst 0


	; ExitWithError workspace at ws+1434 length ws+0
f4_ExitWithError:
	rst 0 
	ld hl,1		;!!!
	ld (80H),hl	;!!!
	ret


	; AlignUp workspace at ws+1458 length ws+4
f5_AlignUp:
	ret


	; print_char workspace at ws+1457 length ws+1
f7_print_char:
	ld (ws+1457), a
	cp 10
	jp nz,    _0005
	ld e, 13 
	ld c, 2 
	call 5 
_0005:
	ld a, ( ws+1457 ) 
	ld e, a 
	ld c, 2 
	jp 5 


	; MemSet workspace at ws+1458 length ws+7
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
	jp loopm


	; print workspace at ws+1454 length ws+3
f9_print:
	ld (ws+1454), hl
_000d:
	ld hl, (ws+1454)
	ld a,(hl)
	ld (ws+1456), a
	or a
	ret z	;!!!
	ld a, (ws+1456)
	call f7_print_char
	ld hl, (ws+1454)
	inc hl
	ld (ws+1454), hl
	jp    _000d


	; print_nl workspace at ws+1432 length ws+0
f10_print_nl:
	ld a,10
	jp f7_print_char


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
buffer:	defs	2
bufptr:	defs	2
curlen:	defs	1
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
f18_print_hex_i8: 
				;A = value
	call	Bin2Hex
	push	bc
	call	f7_print_char
	pop	bc
	ld	a,c
	jp	f7_print_char

	; print_hex_i16
fxx_print_hex_i16:
				;HL=value
	push	hl
	ld	a,h
	call	f18_print_hex_i8
	pop	hl
	ld	a,l
	jp	f18_print_hex_i8
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

	; ArgvInit workspace at ws+1298 length ws+0
f27_ArgvInit:
	ld de,129
	ld (ws+4), de
	ld ix,128
	ld a, (ix+0)
	ld l,a
	ld h,0
	add hl,de
	xor a
	ld (hl),a
	ret


	; ArgvNext workspace at ws+1298 length ws+3
f28_ArgvNext:
	ld hl, (ws+4)
	ld a,h
	or l
	jp nz,    _005f
	ld hl, (ws+4)
	ld (ws+1298), hl
	jp end_f28_ArgvNext
_005f:
_0060:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+1300), a
	cp 32
	jp z,    _0066
	jp    _0061
_0066:
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp    _0060
_0061:
	ld hl, (ws+4)
	ld (ws+1298), hl
_0067:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+1300), a
	cp 32
	jp z,    _0070
	ld a, (ws+1300)
	cp 10
	jp z,    _0070
	ld a, (ws+1300)
	or a
	jp nz,    _0071
_0070:
	jp    _0068
_0071:
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp    _0067
_0068:
	xor a
	ld hl, (ws+4)
	ld (hl),a
	ld a, (ws+1300)
	cp 32
	jp nz,    _0078
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp    _0074
_0078:
	ld bc,0
	ld (ws+4), bc
_0074:
end_f28_ArgvNext:
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
	jp nz,noteq
	or a		;equal if 0
	ret z
	inc hl
	inc de
	jp loop
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
	jp loop1

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


	; RawAlloc workspace at ws+1434 length ws+24
f37_RawAlloc:
	ld (ws+1434), hl
	inc hl
	inc hl
	call f5_AlignUp
	ld (ws+1440), hl
	ld de,4
	and a
	sbc hl,de
	jp nc,    _00c3
	ld de,4
	ld (ws+1440), de
_00c3:
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
	ld bc,65535
	ld (ws+1450), bc
_00c4:
	ld hl, (ws+1442)
	ld a,h
	or l
	jp z,    _00c9
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
	jp c,    _00d0
	ld hl, (ws+1452)
	ld de, (ws+1450)
	and a
	sbc hl,de
	jp nc,    _00d0
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
	jp nz,    _00d6
	jp    _00c9
_00d6:
_00d0:
	ld hl, (ws+1442)
	ld (ws+1444), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1442), hl
	jp    _00c4
_00c9:
	ld hl, (ws+1446)
	ld a,h
	or l
	jp nz,    _00db
	ld bc,0
	ld (ws+1436), bc
	jp end_f37_RawAlloc
_00db:
	ld hl, (ws+1450)
	ld de, (ws+1440)
	and a
	sbc hl,de
	ld (ws+1454), hl
	ld de,4
	and a
	sbc hl,de
	jp nc,    _00e0
	ld hl, (ws+1448)
	ld a,h
	or l
	jp z,    _00e5
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1448)
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _00e1
_00e5:
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+6), hl
_00e1:
	ld hl, (ws+1450)
	ld (ws+1440), hl
	jp    _00dc
_00e0:
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
_00dc:
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
end_f37_RawAlloc:
	ld hl, (ws+1436)
	ret


	; AddFreeBlock workspace at ws+1440 length ws+8
f39_AddFreeBlock:
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
	jp nc,    _00ef
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
	jp nz,    _00f4
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
	jp    _00f0
_00f4:
	ld de, (ws+1446)
	ld hl, (ws+1444)
	ld (hl),e
	inc hl
	ld (hl),d
_00f0:
	ld hl, (ws+1444)
	ld (ws+6), hl
	jp    _00eb
_00ef:
_00f5:
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz,    _00fb
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
	jp    _00f6
_00fb:
	ld bc, (ws+1444)
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld h,b
	ld l,c
	and a
	sbc hl,de
	jp nc,    _0100
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
	jp nz,    _0105
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
	jp    _0101
_0105:
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1444)
	ld (hl),e
	inc hl
	ld (hl),d
_0101:
	ld de, (ws+1444)
	ld hl, (ws+1446)
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _00f6
_0100:
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1446), hl
	jp    _00f5
_00f6:
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
	jp nz,    _010a
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
_010a:
_00eb:
	ret


	; Free workspace at ws+1436 length ws+4
f40_Free:
	ld (ws+1436), hl
	ld a,h
	or l
	ret z
	ld hl, (ws+1436)
	dec hl
	dec hl
	ld (ws+1438), hl
	push hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f39_AddFreeBlock
	ret


	; GetFreeMemory workspace at ws+1296 length ws+4
f41_GetFreeMemory:
	ld bc,0
	ld (ws+1296), bc
	ld hl, (ws+6)
	ld (ws+1298), hl
_0110:
	ld hl, (ws+1298)
	ld a,h
	or l
	jp z,    _0115
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
	jp    _0110
_0115:
	ld hl, (ws+1296)
	ret


	; fill workspace at ws+1348 length ws+8
f44_fill:
	ld (ws+1352), a
	pop bc
	pop hl
	ld (ws+1350), hl
	pop hl
	ld (ws+1348), hl
	push bc
_0116:
	ld hl, (ws+1350)
	ld a,(hl)
	ld (ws+1355), a
	cp 32
	jp c,    _011d
	ld a, (ws+1355)
	cp 46
	jp nz,    _011e
_011d:
	ld a,32
	ld (ws+1355), a
	jp    _0118
_011e:
	ld a, (ws+1355)
	cp 42
	jp nz,    _0123
	ld a,63
	ld (ws+1355), a
	jp    _0118
_0123:
	ld hl, (ws+1350)
	inc hl
	ld (ws+1350), hl
_0118:
	ld a, (ws+1355)
	cp 97
	jp c,    _012a
	ld b,122
	ld a, (ws+1355)
	push af
	ld a,b
	pop bc
	cp b
	jp c,    _012a
	ld a, (ws+1355)
	add 224
	ld (ws+1355), a
_012a:
	ld a, (ws+1355)
	ld hl, (ws+1348)
	ld (hl),a
	inc hl
	ld (ws+1348), hl
	ld a, (ws+1352)
	dec a
	ld (ws+1352), a
	or a
	jp nz,    _0130
	jp    _0117
_0130:
	jp    _0116
_0117:
	ld hl, (ws+1350)
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
_0131:
	ld hl, (ws+1341)
	ld a,(hl)
	ld (ws+1345), a
	cp 32
	jp c,    _0138
	ld a, (ws+1345)
	cp 46
	jp nz,    _0139
_0138:
	jp    _0132
_0139:
	ld hl, (ws+1341)
	inc hl
	ld (ws+1341), hl
	jp    _0131
_0132:
	ld a, (ws+1345)
	cp 46
	jp nz,    _013f
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
_013f:
	ld ix, (ws+1339)
	ld (ix+35), 255
	ld (ix+36), 255
	ld a,127
	push ix
	pop hl
	ld (hl),a
	ret


	; fcb_i_gbpb workspace at ws+1427 length ws+7
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
	jp 5 


	; fcb_i_blockin workspace at ws+1425 length ws+2
f46_fcb_i_blockin:
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


	; fcb_i_blockout workspace at ws+1425 length ws+2
f47_fcb_i_blockout:
	ld (ws+1425), hl
	inc hl
	ld a,(hl)
	or a
	ret z
	ld hl, (ws+1425)
	push hl
	ld a,34
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+1425)
	inc hl
	ld (hl),a
	ret


	; fcb_i_changeblock workspace at ws+1421 length ws+4
f48_fcb_i_changeblock:
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
	ret z
	ld hl, (ws+1421)
	call f47_fcb_i_blockout
	ld hl, (ws+1423)
	ld ix, (ws+1421)
	ld (ix+35), l
	ld (ix+36), h
	push ix
	pop hl
	jp f46_fcb_i_blockin


	; fcb_i_convert_a_to_error workspace at ws+1341 length ws+0
f49_fcb_i_convert_a_to_error:
	cp 0ffh 
	ld a, 0 
	ret nz 
	inc a 
	ret


	; FCBOpenIn workspace at ws+1332 length ws+7
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
	jp f49_fcb_i_convert_a_to_error 


	; FCBOpenOut workspace at ws+1297 length ws+7
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
	jp f49_fcb_i_convert_a_to_error 


	; FCBClose workspace at ws+1336 length ws+5
f53_FCBClose:
	ld (ws+1336), hl
	call f47_fcb_i_blockout
	ld hl, (ws+1336)
	inc hl
	inc hl
	ld (ws+1339), hl
	ld c, 16 
	ld de, ( ws+1339 ) 
	call 5 
	jp f49_fcb_i_convert_a_to_error 


	; FCBSeek workspace at ws+1332 length ws+9
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
	call f48_fcb_i_changeblock
	ld a, (ws+1340)
	ld hl, (ws+1332)
	ld (hl),a
	ret


	; FCBPos workspace at ws+1336 length ws+6
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


	; fcb_i_nextchar workspace at ws+1419 length ws+2
f60_fcb_i_nextchar:
	ld (ws+1419), hl
	ld a,(hl)
	inc a
	ld (hl),a
	ld a,(hl)
	cp 128
	ret nz
	ld hl, (ws+1419)
	push hl
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	inc hl
	call f48_fcb_i_changeblock
	xor a
	ld hl, (ws+1419)
	ld (hl),a
	ret


	; FCBGetChar workspace at ws+1326 length ws+3
f61_FCBGetChar:
	ld (ws+1326), hl
	call f60_fcb_i_nextchar
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
	ret


	; FCBPutChar workspace at ws+1416 length ws+3
f62_FCBPutChar:
	ld (ws+1418), a
	pop bc
	pop hl
	ld (ws+1416), hl
	push bc
	call f60_fcb_i_nextchar
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


	; StrDupBraced workspace at ws+1388 length ws+12
f76_StrDupBraced:
	ld (ws+1388), hl
	call f32_StrLen
	ld (ws+1394), hl
	inc hl
	inc hl
	inc hl
	call f75_InternalAlloc
	ld (ws+1390), hl
	ld (ws+1398), hl
	ld a,91
	ld (hl),a
	inc hl
	ld (ws+1398), hl
	ld hl, (ws+1388)
	push hl
	ld hl, (ws+1394)
	push hl
	ld hl, (ws+1398)
	call f34_MemCopy
	ld de, (ws+1398)
	ld hl, (ws+1394)
	add hl,de
	ld (ws+1398), hl
	ld a,93
	ld (hl),a
	inc hl
	ld (ws+1398), hl
	xor a
	ld (hl),a
	ld hl, (ws+1390)
	ret


	; StrDupArrayed workspace at ws+1369 length ws+14
f77_StrDupArrayed:
	ld (ws+1371), hl
	pop bc
	pop hl
	ld (ws+1369), hl
	push bc
	call f32_StrLen
	ld (ws+1377), hl
	inc hl
	inc hl
	inc hl
	call f75_InternalAlloc
	ld (ws+1373), hl
	ld (ws+1381), hl
	ld hl, (ws+1369)
	push hl
	ld hl, (ws+1377)
	push hl
	ld hl, (ws+1381)
	call f34_MemCopy
	ld de, (ws+1381)
	ld hl, (ws+1377)
	add hl,de
	ld (ws+1381), hl
	ld a,91
	ld (hl),a
	inc hl
	ld (ws+1381), hl
	ld a,93
	ld (hl),a
	inc hl
	ld (ws+1381), hl
	xor a
	ld (hl),a
	ld hl, (ws+1373)
	ret


	; InternalStrDup workspace at ws+1372 length ws+10
f78_InternalStrDup:
	ld (ws+1372), hl
	call f32_StrLen
	ld (ws+1376), hl
	inc hl
	ld (ws+1378), hl
	call f75_InternalAlloc
	ld (ws+1374), hl
	ld hl, (ws+1372)
	push hl
	ld hl, (ws+1378)
	push hl
	ld hl, (ws+1374)
	call f34_MemCopy
	ld hl, (ws+1374)
	ret


	; AllocNewSymbol workspace at ws+1398 length ws+4
f70_AllocNewSymbol:
	ld hl, (ws+66)
	ld a,h
	or l
	jp z,    _0166
	ld hl, (ws+66)
	ld (ws+1398), hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+66), hl
	ld hl, (ws+1398)
	push hl
	ld d,0
	push de
	ld hl,11
	call f8_MemSet
	jp    _0162
_0166:
	ld hl,11
	call f75_InternalAlloc
	ld (ws+1398), hl
_0162:
	ld hl, (ws+1398)
	ret


	; FreeSymbol workspace at ws+1373 length ws+2
f71_FreeSymbol:
	ld (ws+1373), hl
	ld hl, (ws+66)
	ld ix, (ws+1373)
	ld (ix+8), l
	ld (ix+9), h
	push ix
	pop hl
	ld (ws+66), hl
	ret


	; AllocNewType workspace at ws+1388 length ws+4
f72_AllocNewType:
	ld hl, (ws+68)
	ld a,h
	or l
	jp z,    _016b
	ld hl, (ws+68)
	ld (ws+1388), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+68), hl
	ld hl, (ws+1388)
	push hl
	ld d,0
	push de
	ld hl,17
	call f8_MemSet
	jp    _0167
_016b:
	ld hl,17
	call f75_InternalAlloc
	ld (ws+1388), hl
_0167:
	ld hl, (ws+1388)
	ret


	; FreeType workspace at ws+1373 length ws+2
f73_FreeType:
	ld (ws+1373), hl
	ld hl, (ws+68)
	ld ix, (ws+1373)
	ld (ix+9), l
	ld (ix+10), h
	push ix
	pop hl
	ld (ws+68), hl
	ret
_c9:
	db 79,117,116,32,111,102,32,109,101,109,111,114,121,10,0


	; InternalAlloc workspace at ws+1426 length ws+8
f75_InternalAlloc:
	ld (ws+1426), hl
	call f37_RawAlloc
	ld (ws+1428), hl
	ld a,h
	or l
	jp nz,    _0170
_0171:
	ld hl, (ws+66)
	ld a,h
	or l
	jp z,    _0176
	ld hl, (ws+66)
	ld (ws+1428), hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+66), hl
	ld hl, (ws+1428)
	call f40_Free
	jp    _0171
_0176:
_0177:
	ld hl, (ws+68)
	ld a,h
	or l
	jp z,    _017c
	ld hl, (ws+68)
	ld (ws+1428), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+68), hl
	ld hl, (ws+1428)
	call f40_Free
	jp    _0177
_017c:
	call f79_PurgeAllFreeNodes
	ld hl, (ws+1426)
	call f37_RawAlloc
	ld (ws+1428), hl
	ld a,h
	or l
	jp nz,    _0181
	ld hl,   _c9
	call f9_print
	call f4_ExitWithError
_0181:
_0170:
	ld hl, (ws+1428)
	ret

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
_c10:
	db 64,97,108,105,97,115,0
_c11:
	db 64,97,115,109,0
_c12:
	db 64,97,116,0
_c13:
	db 64,98,121,116,101,115,111,102,0
_c14:
	db 64,100,101,99,108,0
_c15:
	db 64,101,120,116,101,114,110,0
_c16:
	db 64,105,110,100,101,120,111,102,0
_c17:
	db 64,105,109,112,108,0
_c18:
	db 64,115,105,122,101,111,102,0
_c19:
	db 64,110,101,120,116,0
_c20:
	db 64,112,114,101,118,0
_c21:
	db 97,110,100,0
_c22:
	db 97,115,0
_c23:
	db 98,114,101,97,107,0
_c24:
	db 99,97,115,101,0
_c25:
	db 99,111,110,115,116,0
_c26:
	db 99,111,110,116,105,110,117,101,0
_c27:
	db 101,108,115,101,0
_c28:
	db 101,108,115,101,105,102,0
_c29:
	db 101,110,100,0
_c30:
	db 101,120,116,101,114,110,0
_c31:
	db 105,102,0
_c32:
	db 105,115,0
_c33:
	db 105,110,99,108,117,100,101,0
_c34:
	db 105,110,116,0
_c35:
	db 105,110,116,101,114,102,97,99,101,0
_c36:
	db 105,109,112,108,101,109,101,110,116,115,0
_c37:
	db 108,111,111,112,0
_c38:
	db 110,111,116,0
_c39:
	db 111,114,0
_c40:
	db 114,101,99,111,114,100,0
_c41:
	db 114,101,116,117,114,110,0
_c42:
	db 115,117,98,0
_c43:
	db 116,104,101,110,0
_c44:
	db 116,121,112,101,100,101,102,0
_c45:
	db 118,97,114,0
_c46:
	db 119,104,101,110,0
_c47:
	db 119,104,105,108,101,0
f2___main_s0183:
	dw    _c10
	dw    _c11
	dw    _c12
	dw    _c13
	dw    _c14
	dw    _c15
	dw    _c16
	dw    _c17
	dw    _c18
	dw    _c19
	dw    _c20
	dw    _c21
	dw    _c22
	dw    _c23
	dw    _c24
	dw    _c25
	dw    _c26
	dw    _c27
	dw    _c28
	dw    _c29
	dw    _c30
	dw    _c31
	dw    _c32
	dw    _c33
	dw    _c34
	dw    _c35
	dw    _c36
	dw    _c37
	dw    _c38
	dw    _c39
	dw    _c40
	dw    _c41
	dw    _c42
	dw    _c43
	dw    _c44
	dw    _c45
	dw    _c46
	dw    _c47
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
_c48:
	db 101,114,114,111,114,58,32,0
_c49:
	db 60,101,111,102,62,0
_c50:
	db 58,32,0
_c51:
	db 58,32,0


	; StartError workspace at ws+1432 length ws+0
f80_StartError:
	ld hl,   _c48
	call f9_print
	ld hl, (ws+72)
	ld a,h
	or l
	jp nz,    _0189
	ld hl,   _c49
	call f9_print
	jp    _0185
_0189:
	ld hl, (ws+72)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	ld hl,   _c50
	call f9_print
	ld ix, (ws+72)
	ld l, (ix+4)
	ld h, (ix+5)
	call f16_print_i16
_0185:
	ld hl,   _c51
	jp f9_print


	; EndError workspace at ws+1432 length ws+0
f81_EndError:
	call f10_print_nl
	jp f4_ExitWithError


	; SimpleError workspace at ws+1430 length ws+2
f82_SimpleError:
	ld (ws+1430), hl
	call f80_StartError
	ld hl, (ws+1430)
	call f9_print
	jp f81_EndError


	; LexerAddIncludePath workspace at ws+1298 length ws+6
f83_LexerAddIncludePath:
	ld (ws+1298), hl
	ld hl,4
	call f75_InternalAlloc
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
_c52:
	db 32,32,0


	; LexerPrintSpaces workspace at ws+1328 length ws+1
f84_LexerPrintSpaces:
	ld a, (ws+374)
	ld (ws+1328), a
_018a:
	ld a, (ws+1328)
	or a
	ret z
	ld hl,   _c52
	call f9_print
	ld a, (ws+1328)
	dec a
	ld (ws+1328), a
	jp    _018a


	; lexer_i_open workspace at ws+1328 length ws+4
f85_lexer_i_open:
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
	jp nz,    _0194
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
	jp    _0190
_0194:
	ld a,1
	ld (ws+1330), a
_0190:
	ld a, (ws+1330)
	ret


	; lexer_i_close workspace at ws+1328 length ws+8
f86_lexer_i_close:
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
	jp f53_FCBClose

_c53:
	db 62,32,0
_c54:
	db 99,97,110,110,111,116,32,111,112,101,110,32,39,0
_c55:
	db 39,0


	; LexerIncludeFile workspace at ws+1309 length ws+19
f87_LexerIncludeFile:
	ld (ws+1309), hl
	ld hl,10
	call f75_InternalAlloc
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
	jp z,    _0199
	ld hl, (ws+72)
	call f86_lexer_i_close
_0199:
	ld hl, (ws+70)
	ld (ws+1315), hl
	ld hl, (ws+1309)
	call f32_StrLen
	ld (ws+1319), hl
_019a:
	ld hl, (ws+1315)
	ld a,h
	or l
	jp z,    _019f
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
	call f75_InternalAlloc
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
	call f85_lexer_i_open
	or a
	jp nz,    _01a4
	ld a, (ws+374)
	inc a
	ld (ws+374), a
	call f84_LexerPrintSpaces
	ld hl,   _c53
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
_01a4:
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
	jp    _019a
_019f:
	call f80_StartError
	ld hl,   _c54
	call f9_print
	ld hl, (ws+1309)
	call f9_print
	ld hl,   _c55
	call f9_print
	jp f81_EndError


	; lexer_i_ctype workspace at ws+1321 length ws+3
f89_lexer_i_ctype:
	ld (ws+1321), a
	cp 33
	jp c,    _01ab
	ld b,127
	ld a, (ws+1321)
	push af
	ld a,b
	pop bc
	cp b
	jp c,    _01ab
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
	jp z,    _01b1
	ld a, (ws+1322)
	and 127
	ld (ws+1323), a
	ld a,128
	ld (ws+1322), a
_01b1:
	jp    _01a5
_01ab:
	xor a
	ld (ws+1322), a
	xor a
	ld (ws+1323), a
_01a5:
	ld a, (ws+1322)
	pop bc
	push af
	ld a, (ws+1323)
	push bc
	ret
_c56:
	db 60,32,0
_c57:
	db 73,47,79,32,101,114,114,111,114,0


	; lexer_i_getchar workspace at ws+1321 length ws+5
f90_lexer_i_getchar:
	ld a, (ws+74)
	or a
	jp z,    _01b6
	ld a, (ws+74)
	ld (ws+1321), a
	xor a
	ld (ws+74), a
	jp end_f90_lexer_i_getchar
_01b6:
_01b7:
	ld hl, (ws+72)
	ld a,h
	or l
	jp nz,    _01bd
	xor a
	ld (ws+1321), a
	jp    _01b8
_01bd:
	ld hl, (ws+72)
	ld (ws+1322), hl
	ld hl,ws+208
	call f61_FCBGetChar
	ld (ws+1321), a
	cp 26
	jp nz,    _01c2
	xor a
	ld (ws+1321), a
_01c2:
	ld a, (ws+1321)
	or a
	jp z,    _01c7
	jp    _01b8
_01c7:
	ld hl, (ws+1322)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+72), hl
	ld hl, (ws+1322)
	call f86_lexer_i_close
	ld hl, (ws+1322)
	call f40_Free
	ld hl, (ws+72)
	ld a,h
	or l
	jp z,    _01b7
	ld a, (ws+374)
	dec a
	ld (ws+374), a
	call f84_LexerPrintSpaces
	ld hl,   _c56
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
	call f85_lexer_i_open
	or a
	jp z,    _01b7
	ld hl,   _c57
	call f82_SimpleError
	jp    _01b7
_01b8:
end_f90_lexer_i_getchar:
	ld a, (ws+1321)
	ret

_c58:
	db 117,110,112,97,114,115,101,97,98,108,101,32,99,104,97,114,97,99,116,101,114,32,48,120,0


	; lexer_i_unparseable workspace at ws+1306 length ws+1
f91_lexer_i_unparseable:
	ld (ws+1306), a
	call f80_StartError
	ld hl,   _c58
	call f9_print
	ld a, (ws+1306)
	call f18_print_hex_i8
	jp f81_EndError


	; lexer_i_skipwhitespace workspace at ws+1310 length ws+2
f92_lexer_i_skipwhitespace:
_01d2:
	call f90_lexer_i_getchar
	ld (ws+1311), a
	cp 32
	jp z,   _01d2
	cp 13
	jp z,   _01d2
	cp 10
	jp nz,  _01d7
	ld ix, (ws+72)
	ld l, (ix+4)
	ld h, (ix+5)
	inc hl
	ld (ix+4), l
	ld (ix+5), h
	jp    _01d2
_01d7:
	cp 9
	jp z,   _01d2
	ld a, (ws+1311)
	ld (ws+74), a
	ret

_c59:
	db 116,111,107,101,110,32,116,111,111,32,108,111,110,103,0


	; lexer_i_read_identifier workspace at ws+1306 length ws+4
f93_lexer_i_read_identifier:
_01d9:
	call f90_lexer_i_getchar
	ld (ws+1307), a
	call f89_lexer_i_ctype
	pop af
	and 32
	or a
	jp z,    _01df
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
	jp nz,    _01d9
	call f80_StartError
	ld hl,   _c59
	call f9_print
	call f81_EndError
	jp    _01d9
_01df:
	ld a, (ws+1307)
	ld (ws+74), a
	ld b,0
	ld de,ws+75
	ld a, (ws+203)
	ld l,a
	ld h,b
	add hl,de
	ld a,b
	ld (hl),a
	ret


	; lexer_i_match_keyword workspace at ws+1306 length ws+3
f94_lexer_i_match_keyword:
	xor a
	ld (ws+1307), a
_01e5:
	ld a, (ws+1307)
	cp 38
	jp z,    _01ea
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
	or a
	jp nz,    _01ef
	ld bc,f2___main_s0184
	ld a, (ws+1307)
	ld l,a
	ld h,0
	add hl,bc
	ld a,(hl)
	ld (ws+1306), a
	jp end_f94_lexer_i_match_keyword
_01ef:
	ld a, (ws+1307)
	inc a
	ld (ws+1307), a
	jp    _01e5
_01ea:
	ld a,33
	ld (ws+1306), a
end_f94_lexer_i_match_keyword:
	ld a, (ws+1306)
	ret


_c60:
	db 105,110,118,97,108,105,100,32,110,117,109,98,101,114,0


	; lexer_i_read_number workspace at ws+1310 length ws+11
f95_lexer_i_read_number:
	ld hl,0
	ld (ws+204), hl
	ld (ws+206), hl
	ld hl,10
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	call f90_lexer_i_getchar
	ld (ws+1317), a
	cp 48
	jp nz,    _01f4
	call f90_lexer_i_getchar
	ld (ws+1317), a
	cp 98
	jp nz,    _01f6
	ld hl,2
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp    _01f0
_01f6:
	cp 111
	jp nz,    _01f7
	ld hl,8
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp    _01f0
_01f7:
	cp 100
	jp nz,    _01f8
	ld hl,10
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp    _01f0
_01f8:
	cp 120
	jp nz,    _01f9
	ld hl,16
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp    _01f0
_01f9:
	ld a, (ws+1317)
	ld (ws+74), a
	call f89_lexer_i_ctype
	ld (ws+1315), a
	pop af
	ld (ws+1314), a
	and 32
	or a
	ret z
	jp    _01f0
_01f4:
	ld a, (ws+1317)
	ld (ws+74), a
_01f0:
_01ff:
	call f90_lexer_i_getchar
	ld (ws+1319), a
	call f30_ToLower
	ld (ws+1317), a
	cp 95
	jp  z,  _01ff
	call f89_lexer_i_ctype
	ld (ws+1315), a
	pop af
	ld (ws+1314), a
	and 32
	or a
	jp nz,    _020a
	ld a, (ws+1317)
	ld (ws+74), a
	ret
_020a:
	ld a, (ws+1317)
	cp 97
	jp c,    _020f
	add 169
	ld (ws+1317), a
	jp    _020b
_020f:
	ld a, (ws+1317)
	add 208
	ld (ws+1317), a
_020b:
	ld a, (ws+1317)
	push af
	ld a, (ws+1310)
	ld b,a
	pop af
	cp b
	jp c,    _0214
	call f80_StartError
	ld hl,   _c60
	call f9_print
	call f81_EndError
_0214:
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
	jp    _01ff

_c61:
	db 109,97,108,102,111,114,109,101,100,32,0


	; lexer_i_malformed workspace at ws+1315 length ws+2
f96_lexer_i_malformed:
	ld (ws+1315), hl
	call f80_StartError
	ld hl,   _c61
	call f9_print
	ld hl, (ws+1315)
	call f9_print
	jp f81_EndError

_c62:
	db 101,115,99,97,112,101,0


	; lexer_i_get_escaped workspace at ws+1313 length ws+2
f97_lexer_i_get_escaped:
	call f90_lexer_i_getchar
	ld (ws+1313), a
	cp 110
	jp nz,    _0216
	ld a,10
	ld (ws+1313), a
	jp    _0215
_0216:
	cp 114
	jp nz,    _0217
	ld a,13
	ld (ws+1313), a
	jp    _0215
_0217:
	cp 116
	jp nz,    _0218
	ld a,9
	ld (ws+1313), a
	jp    _0215
_0218:
	cp 92
	jp nz,    _0219
	ld a,92
	ld (ws+1313), a
	jp    _0215
_0219:
	cp 39
	jp nz,    _021a
	ld a,39
	ld (ws+1313), a
	jp    _0215
_021a:
	cp 34
	jp nz,    _021b
	ld a,34
	ld (ws+1313), a
	jp    _0215
_021b:
	cp 48
	jp nz,    _021c
	xor a
	ld (ws+1313), a
	jp    _0215
_021c:
	ld hl,   _c62
	call f96_lexer_i_malformed
_0215:
	ld a, (ws+1313)
	ret

_c63:
	db 115,116,114,105,110,103,32,99,111,110,115,116,97,110,116,0
_c64:
	db 115,116,114,105,110,103,32,99,111,110,115,116,97,110,116,32,116,111,111,32,108,111,110,103,0


	; lexer_i_read_string workspace at ws+1310 length ws+3
f98_lexer_i_read_string:
	xor a
	ld (ws+203), a
_021d:
	call f90_lexer_i_getchar
	ld (ws+1311), a
	cp 32
	jp nc,    _0223
	ld hl,   _c63
	call f96_lexer_i_malformed
_0223:
	ld a, (ws+1311)
	cp 34
	jp nz,    _0225
	jp    _021e
_0225:
	cp 92
	jp nz,    _0226
	call f97_lexer_i_get_escaped
	ld (ws+1311), a
_0226:
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
	jp nz,    _022b
	call f80_StartError
	ld hl,   _c64
	call f9_print
	call f81_EndError
_022b:
	jp    _021d
_021e:
	ld b,0
	ld de,ws+75
	ld a, (ws+203)
	ld l,a
	ld h,b
	add hl,de
	ld a,b
	ld (hl),a
	ret

_c65:
	db 99,104,97,114,97,99,116,101,114,32,99,111,110,115,116,97,110,116,0


	; malformed workspace at ws+1310 length ws+0
f100_malformed:
	ld hl,   _c65
	jp f96_lexer_i_malformed


	; lexer_i_read_char workspace at ws+1306 length ws+4
f99_lexer_i_read_char:
	call f90_lexer_i_getchar
	ld (ws+1307), a
	cp 32
	jp c,    _0231
	cp 39
	jp nz,    _0232
_0231:
	call f100_malformed
_0232:
	ld a, (ws+1307)
	cp 92
	jp nz,    _0238
	call f97_lexer_i_get_escaped
_0238:
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
	call f90_lexer_i_getchar
	cp 39
	ret z
	jp f100_malformed

_c66:
	db 105,110,99,108,117,100,101,32,100,105,114,101,99,116,105,118,101,0


	; malformed_include workspace at ws+1309 length ws+0
f102_malformed_include:
	ld hl,   _c66
	jp f96_lexer_i_malformed


	; lexer_i_include workspace at ws+1306 length ws+3
f101_lexer_i_include:
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
	cp 34
	call nz, f102_malformed_include
	call f98_lexer_i_read_string
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
	cp 59
	call nz, f102_malformed_include
	ld hl,ws+75
	jp f87_LexerIncludeFile

_c67:
	db 35,108,105,110,101,32,100,105,114,101,99,116,105,118,101,0


	; lexer_i_line_directive workspace at ws+1306 length ws+4
f103_lexer_i_line_directive:
	call f92_lexer_i_skipwhitespace
	call f95_lexer_i_read_number
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
	cp 34
	jp z,    _024c
	ld hl,   _c67
	call f96_lexer_i_malformed
_024c:
	call f98_lexer_i_read_string
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
	call f78_InternalStrDup
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
f88_LexerReadToken:   
c01_024d:
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
	ld (ws+1296), a
	cp 35
	jp nz, c01_0253
	xor a
	ld (ws+203), a
	call f93_lexer_i_read_identifier
	ld de,ws+75
	push de
	ld hl,c01_c68
	call f29_StrCmp
	ld (ws+1297), a
	or a
;;	jp nz, c01_0258
;;	call f103_lexer_i_line_directive
	call z,f103_lexer_i_line_directive
;;c01_0258:
c01_0259:
	call f90_lexer_i_getchar
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
	call f90_lexer_i_getchar
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
	call f90_lexer_i_getchar
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
	call f90_lexer_i_getchar
	ld (ws+1296), a
	cp 61
	jp nz, c01_0277
	ld a,54
	ld (ws+1294), a
	jp c01_0266 ;;
c01_0277:
	ld a, (ws+1296)
	call f91_lexer_i_unparseable
;;c01_0273:
	jp c01_0266
c01_0272:
	cp 33
	jp nz, c01_0278
	call f90_lexer_i_getchar
	ld (ws+1296), a
	cp 61
	jp nz, c01_027d
	ld a,55
	ld (ws+1294), a
	jp c01_0266 ;;
c01_027d:
	ld a, (ws+1296)
	call f91_lexer_i_unparseable
;;c01_0279:
	jp c01_0266
c01_0278:
	cp 62
	jp nz, c01_027e
	call f90_lexer_i_getchar
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
	call f98_lexer_i_read_string
	ld a,41
	ld (ws+1294), a
	jp c01_0266
c01_0282:
	cp 39
	jp nz, c01_0283
	call f99_lexer_i_read_char
	ld a,34
	ld (ws+1294), a
	jp c01_0266
c01_0283:
	ld a, (ws+1296)
	call f89_lexer_i_ctype
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
	call f95_lexer_i_read_number
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
	call f93_lexer_i_read_identifier
	call f94_lexer_i_match_keyword
	ld (ws+1294), a
	jp c01_0284
c01_0290:
	ld a, (ws+1296)
	call f91_lexer_i_unparseable
c01_0284:
c01_0266:
	ld a, (ws+1294)
	cp 255
	jp nz, c01_024e ;;
	call f101_lexer_i_include
	jp c01_024d ;;
;;c01_0295:
;;	jp c01_024e
;;c01_0291:
;;	jp c01_024d
c01_024e:
	ld a, (ws+1294)
	ret


	; CountParameters workspace at ws+1354 length ws+3
f104_CountParameters:
	ld (ws+1354), hl
	xor a
	ld (ws+1356), a
_0296:
	ld hl, (ws+1354)
	ld a,h
	or l
	jp z,    _029b
	ld a, (ws+1356)
	inc a
	ld (ws+1356), a
	ld hl, (ws+1354)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1354), hl
	jp    _0296
_029b:
	ld a, (ws+1356)
	ret


	; GetInputParameter workspace at ws+1373 length ws+5
f105_GetInputParameter:
	ld (ws+1375), a
	pop bc
	pop hl
	ld (ws+1373), hl
	push bc
	push hl
	pop ix
	ld a, (ix+26)
	or a
	jp z,    _02a0
	ld ix, (ws+1373)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1376), hl
_02a1:
	ld a, (ws+1375)
	or a
	jp z,    _029c
	ld ix, (ws+1376)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1376), hl
	ld a, (ws+1375)
	dec a
	ld (ws+1375), a
	jp    _02a1
_02a0:
	ld bc,0
	ld (ws+1376), bc
_029c:
	ld hl, (ws+1376)
	ret


	; GetOutputParameter workspace at ws+1378 length ws+5
f106_GetOutputParameter:
	ld (ws+1380), a
	pop bc
	pop hl
	ld (ws+1378), hl
	push bc
	push hl
	pop ix
	ld a, (ix+27)
	or a
	jp z,    _02ab
	ld a, (ws+1380)
	ld b,a
	ld ix, (ws+1378)
	ld a, (ix+26)
	add a,b
	ld (ws+1380), a
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1381), hl
_02ac:
	ld a, (ws+1380)
	or a
	jp z,    _02a7
	ld ix, (ws+1381)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1381), hl
	ld a, (ws+1380)
	dec a
	ld (ws+1380), a
	jp    _02ac
_02ab:
	ld bc,0
	ld (ws+1381), bc
_02a7:
	ld hl, (ws+1381)
	ret


	; WidthToIndex workspace at ws+1413 length ws+2
f108_WidthToIndex:
	ld (ws+1413), a
	cp 4
	jp nz,    _02b3
	ld a,3
	ld (ws+1414), a
	jp    _02b2
_02b3:
	cp 8
	jp nz,    _02b4
	ld a,4
	ld (ws+1414), a
	jp    _02b2
_02b4:
	ld a, (ws+1413)
	ld (ws+1414), a
_02b2:
	ld a, (ws+1414)
	ret


	; MidWhencase workspace at ws+1361 length ws+12
f110_MidWhencase:
	ld (ws+1366), hl
	pop bc
	pop hl
	ld (ws+1362), hl
	pop hl
	ld (ws+1364), hl
	pop af
	ld (ws+1361), a
	push bc
	call f108_WidthToIndex
	add 76
	call f109_AllocateNewNode
	ld (ws+1368), hl
	ld de, (ws+1362)
	exx
	ld de, (ws+1364)
	exx
	ld hl, (ws+1368)
	ld (hl),e
	inc hl
	ld (hl),d
	inc hl
	push hl
	exx
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	exx
	ld hl, (ws+1366)
	ld ix, (ws+1368)
	ld (ix+4), l
	ld (ix+5), h
	ld hl, (ws+1368)
	ret


	; MidDeref workspace at ws+1390 length ws+8
f111_MidDeref:
	ld (ws+1391), hl
	pop bc
	pop af
	ld (ws+1390), a
	push bc
	call f108_WidthToIndex
	add 44
	call f109_AllocateNewNode
	ld (ws+1393), hl
	ld hl, (ws+1391)
	ld ix, (ws+1393)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1393)
	ret


	; MidInitstring workspace at ws+1369 length ws+6
f112_MidInitstring:
	ld (ws+1369), hl
	ld a,12
	call f109_AllocateNewNode
	ld (ws+1371), hl
	ld de, (ws+1369)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1371)
	ret


	; MidSubref workspace at ws+1363 length ws+6
f113_MidSubref:
	ld (ws+1363), hl
	ld a,43
	call f109_AllocateNewNode
	ld (ws+1365), hl
	ld de, (ws+1363)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1365)
	ret


	; MidBeq workspace at ws+1374 length ws+17
f115_MidBeq:
	ld (ws+1385), a
	pop bc
	pop hl
	ld (ws+1383), hl
	pop hl
	ld (ws+1381), hl
	pop hl
	ld (ws+1379), hl
	pop hl
	ld (ws+1377), hl
	pop hl
	ld (ws+1375), hl
	pop af
	ld (ws+1374), a
	push bc
	call f108_WidthToIndex
	add 56
	call f109_AllocateNewNode
	ld (ws+1386), hl
	ld hl, (ws+1375)
	ld ix, (ws+1386)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1377)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1379)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1381)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1383)
	ld (ix+4), l
	ld (ix+5), h
	ld a, (ws+1385)
	ld (ix+6), a
	ld hl, (ws+1386)
	ret


	; MidEndcase workspace at ws+1361 length ws+6
f116_MidEndcase:
	ld (ws+1361), a
	call f108_WidthToIndex
	add 81
	jp f109_AllocateNewNode


	; MidBand workspace at ws+1355 length ws+15
f117_MidBand:
	ld (ws+1365), a
	pop bc
	pop hl
	ld (ws+1363), hl
	pop hl
	ld (ws+1361), hl
	pop hl
	ld (ws+1359), hl
	pop hl
	ld (ws+1357), hl
	pop hl
	ld (ws+1355), hl
	push bc
	ld a,54
	call f109_AllocateNewNode
	ld (ws+1366), hl
	ld hl, (ws+1355)
	ld ix, (ws+1366)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1357)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1359)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1361)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1363)
	ld (ix+4), l
	ld (ix+5), h
	ld a, (ws+1365)
	ld (ix+6), a
	ld hl, (ws+1366)
	ret


	; MidAsmtext workspace at ws+1355 length ws+6
f118_MidAsmtext:
	ld (ws+1355), hl
	ld a,19
	call f109_AllocateNewNode
	ld (ws+1357), hl
	ld de, (ws+1355)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1357)
	ret


	; MidStartsub workspace at ws+1359 length ws+6
f119_MidStartsub:
	ld (ws+1359), hl
	ld a,4
	call f109_AllocateNewNode
	ld (ws+1361), hl
	ld de, (ws+1359)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1361)
	ret


	; MidStartcase workspace at ws+1363 length ws+8
f120_MidStartcase:
	ld (ws+1364), hl
	pop bc
	pop af
	ld (ws+1363), a
	push bc
	call f108_WidthToIndex
	add 71
	call f109_AllocateNewNode
	ld (ws+1366), hl
	ld hl, (ws+1364)
	ld ix, (ws+1366)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1366)
	ret


	; MidInitaddress workspace at ws+1369 length ws+8
f121_MidInitaddress:
	ld (ws+1371), hl
	pop bc
	pop hl
	ld (ws+1369), hl
	push bc
	ld a,13
	call f109_AllocateNewNode
	ld (ws+1373), hl
	ld de, (ws+1369)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1371)
	ld hl, (ws+1373)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1373)
	ret


	; MidAddress workspace at ws+1378 length ws+8
f123_MidAddress:
	ld (ws+1380), hl
	pop bc
	pop hl
	ld (ws+1378), hl
	push bc
	ld a,42
	call f109_AllocateNewNode
	ld (ws+1382), hl
	ld de, (ws+1378)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1380)
	ld hl, (ws+1382)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1382)
	ret


	; MidAsmgroupend workspace at ws+1397 length ws+4
f125_MidAsmgroupend:
	ld a,17
	jp f109_AllocateNewNode


	; MidAsmvalue workspace at ws+1360 length ws+8
f126_MidAsmvalue:
	ld (ws+1360), hl
	exx
	ld (ws+1362), hl
	exx
	ld a,22
	call f109_AllocateNewNode
	ld (ws+1364), hl
	ld de, (ws+1360)
	exx
	ld de, (ws+1362)
	exx
	ld hl, (ws+1364)
	ld (hl),e
	inc hl
	ld (hl),d
	inc hl
	push hl
	exx
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	exx
	ld hl, (ws+1364)
	ret


	; MidBor workspace at ws+1355 length ws+15
f127_MidBor:
	ld (ws+1365), a
	pop bc
	pop hl
	ld (ws+1363), hl
	pop hl
	ld (ws+1361), hl
	pop hl
	ld (ws+1359), hl
	pop hl
	ld (ws+1357), hl
	pop hl
	ld (ws+1355), hl
	push bc
	ld a,55
	call f109_AllocateNewNode
	ld (ws+1366), hl
	ld hl, (ws+1355)
	ld ix, (ws+1366)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1357)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1359)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1361)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1363)
	ld (ix+4), l
	ld (ix+5), h
	ld a, (ws+1365)
	ld (ix+6), a
	ld hl, (ws+1366)
	ret


	; MidAsmsymbol workspace at ws+1360 length ws+6
f130_MidAsmsymbol:
	ld (ws+1360), hl
	ld a,20
	call f109_AllocateNewNode
	ld (ws+1362), hl
	ld de, (ws+1360)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1362)
	ret


	; MidLabel workspace at ws+1390 length ws+6
f131_MidLabel:
	ld (ws+1390), hl
	ld a,26
	call f109_AllocateNewNode
	ld (ws+1392), hl
	ld de, (ws+1390)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1392)
	ret


	; MidInitsubref workspace at ws+1369 length ws+6
f132_MidInitsubref:
	ld (ws+1369), hl
	ld a,14
	call f109_AllocateNewNode
	ld (ws+1371), hl
	ld de, (ws+1369)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1371)
	ret


	; MidStore workspace at ws+1378 length ws+10
f133_MidStore:
	ld (ws+1381), hl
	pop bc
	pop hl
	ld (ws+1379), hl
	pop af
	ld (ws+1378), a
	push bc
	call f108_WidthToIndex
	add 49
	call f109_AllocateNewNode
	ld (ws+1383), hl
	ld hl, (ws+1379)
	ld ix, (ws+1383)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1381)
	ld (ix+11), l
	ld (ix+12), h
	ld hl, (ws+1383)
	ret


	; MidEndinit workspace at ws+1355 length ws+4
f134_MidEndinit:
	ld a,15
	jp f109_AllocateNewNode


	; MidCall workspace at ws+1378 length ws+10
f135_MidCall:
	ld (ws+1382), hl
	pop bc
	pop hl
	ld (ws+1380), hl
	pop hl
	ld (ws+1378), hl
	push bc
	ld a,29
	call f109_AllocateNewNode
	ld (ws+1384), hl
	ld hl, (ws+1378)
	ld ix, (ws+1384)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1380)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1382)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1384)
	ret


	; MidBlts workspace at ws+1377 length ws+17
f137_MidBlts:
	ld (ws+1388), a
	pop bc
	pop hl
	ld (ws+1386), hl
	pop hl
	ld (ws+1384), hl
	pop hl
	ld (ws+1382), hl
	pop hl
	ld (ws+1380), hl
	pop hl
	ld (ws+1378), hl
	pop af
	ld (ws+1377), a
	push bc
	call f108_WidthToIndex
	add 61
	call f109_AllocateNewNode
	ld (ws+1389), hl
	ld hl, (ws+1378)
	ld ix, (ws+1389)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1380)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1382)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1384)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1386)
	ld (ix+4), l
	ld (ix+5), h
	ld a, (ws+1388)
	ld (ix+6), a
	ld hl, (ws+1389)
	ret


	; MidStartinit workspace at ws+1363 length ws+6
f140_MidStartinit:
	ld (ws+1363), hl
	ld a,6
	call f109_AllocateNewNode
	ld (ws+1365), hl
	ld de, (ws+1363)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1365)
	ret


	; MidString workspace at ws+1357 length ws+6
f144_MidString:
	ld (ws+1357), hl
	ld a,41
	call f109_AllocateNewNode
	ld (ws+1359), hl
	ld de, (ws+1357)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1359)
	ret


	; MidAsmstart workspace at ws+1355 length ws+4
f147_MidAsmstart:
	ld a,18
	jp f109_AllocateNewNode


	; MidJump workspace at ws+1361 length ws+6
f148_MidJump:
	ld (ws+1361), hl
	ld a,27
	call f109_AllocateNewNode
	ld (ws+1363), hl
	ld de, (ws+1361)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1363)
	ret


	; MidPoparg workspace at ws+1378 length ws+11
f149_MidPoparg:
	ld (ws+1383), a
	pop bc
	pop hl
	ld (ws+1381), hl
	pop hl
	ld (ws+1379), hl
	pop af
	ld (ws+1378), a
	push bc
	call f108_WidthToIndex
	add 35
	call f109_AllocateNewNode
	ld (ws+1384), hl
	ld de, (ws+1379)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1381)
	ld hl, (ws+1384)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld a, (ws+1383)
	ld hl, (ws+1384)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl),a
	ld hl, (ws+1384)
	ret


	; MidAsmsubref workspace at ws+1360 length ws+6
f153_MidAsmsubref:
	ld (ws+1360), hl
	ld a,21
	call f109_AllocateNewNode
	ld (ws+1362), hl
	ld de, (ws+1360)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1362)
	ret


	; MidBltu workspace at ws+1377 length ws+17
f155_MidBltu:
	ld (ws+1388), a
	pop bc
	pop hl
	ld (ws+1386), hl
	pop hl
	ld (ws+1384), hl
	pop hl
	ld (ws+1382), hl
	pop hl
	ld (ws+1380), hl
	pop hl
	ld (ws+1378), hl
	pop af
	ld (ws+1377), a
	push bc
	call f108_WidthToIndex
	ld (ws+1391), a
	add 66
	call f109_AllocateNewNode
	ld (ws+1389), hl
	ld hl, (ws+1378)
	ld ix, (ws+1389)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1380)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1382)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1384)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1386)
	ld (ix+4), l
	ld (ix+5), h
	ld a, (ws+1388)
	ld (ix+6), a
	ld hl, (ws+1389)
	ret


	; MidAsmend workspace at ws+1355 length ws+4
f156_MidAsmend:
	ld a,23
	jp f109_AllocateNewNode


	; MidEndfile workspace at ws+1294 length ws+4
f159_MidEndfile:
	ld a,3
	jp f109_AllocateNewNode


	; MidAsmgroupstart workspace at ws+1397 length ws+4
f160_MidAsmgroupstart:
	ld a,16
	jp f109_AllocateNewNode


	; MidConstant workspace at ws+1413 length ws+8
f161_MidConstant:
	ld (ws+1413), hl
	exx
	ld (ws+1415), hl
	exx
	ld a,40
	call f109_AllocateNewNode
	ld (ws+1417), hl
	ld de, (ws+1413)
	exx
	ld de, (ws+1415)
	exx
	ld hl, (ws+1417)
	ld (hl),e
	inc hl
	ld (hl),d
	inc hl
	push hl
	exx
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	exx
	ld hl, (ws+1417)
	ret


	; MidEnd workspace at ws+1360 length ws+4
f162_MidEnd:
	ld a,1
	jp f109_AllocateNewNode


	; MidEndsub workspace at ws+1359 length ws+6
f163_MidEndsub:
	ld (ws+1359), hl
	ld a,5
	call f109_AllocateNewNode
	ld (ws+1361), hl
	ld de, (ws+1359)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1361)
	ret


	; MidArg workspace at ws+1360 length ws+15
f164_MidArg:
	ld (ws+1369), a
	pop bc
	pop hl
	ld (ws+1367), hl
	pop hl
	ld (ws+1365), hl
	pop hl
	ld (ws+1363), hl
	pop hl
	ld (ws+1361), hl
	pop af
	ld (ws+1360), a
	push bc
	call f108_WidthToIndex
	add 30
	call f109_AllocateNewNode
	ld (ws+1370), hl
	ld hl, (ws+1361)
	ld ix, (ws+1370)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1363)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1365)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1367)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld a, (ws+1369)
	push ix
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl),a
	ld hl, (ws+1370)
	ret


	; MidPair workspace at ws+1355 length ws+8
f165_MidPair:
	ld (ws+1357), hl
	pop bc
	pop hl
	ld (ws+1355), hl
	push bc
	ld a,25
	call f109_AllocateNewNode
	ld (ws+1359), hl
	ld hl, (ws+1355)
	ld ix, (ws+1359)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1357)
	ld (ix+11), l
	ld (ix+12), h
	ld hl, (ws+1359)
	ret


	; MidReturn workspace at ws+1355 length ws+4
f166_MidReturn:
	ld a,28
	jp f109_AllocateNewNode


	; MidStartfile workspace at ws+1294 length ws+4
f168_MidStartfile:
	ld a,2
	jp f109_AllocateNewNode


	; MidInit workspace at ws+1380 length ws+10
f169_MidInit:
	ld (ws+1381), hl
	exx
	ld (ws+1383), hl
	exx
	pop bc
	pop af
	ld (ws+1380), a
	push bc
	call f108_WidthToIndex
	add 7
	call f109_AllocateNewNode
	ld (ws+1385), hl
	ld de, (ws+1381)
	exx
	ld de, (ws+1383)
	exx
	ld hl, (ws+1385)
	ld (hl),e
	inc hl
	ld (hl),d
	inc hl
	push hl
	exx
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	exx
	ld hl, (ws+1385)
	ret


	; AllocateNewNode workspace at ws+1421 length ws+5
f109_AllocateNewNode:
	ld (ws+1421), a
	ld hl, (ws+375)
	ld a,h
	or l
	jp z,    _02ba
	ld hl, (ws+375)
	ld (ws+1422), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+375), hl
	ld hl, (ws+1422)
	push hl
	ld d,0
	push de
	ld hl,14
	call f8_MemSet
	jp    _02b6
_02ba:
	ld hl,14
	call f75_InternalAlloc
	ld (ws+1422), hl
_02b6:
	ld a, (ws+1421)
	ld ix, (ws+1422)
	ld (ix+13), a
	ld hl, (ws+1422)
	ret


	; FreeNode workspace at ws+1421 length ws+2
f171_FreeNode:
	ld (ws+1421), hl
	ld hl, (ws+375)
	ld ix, (ws+1421)
	ld (ix+9), l
	ld (ix+10), h
	push ix
	pop hl
	ld (ws+375), hl
	ret


	; PurgeAllFreeNodes workspace at ws+1434 length ws+2
f79_PurgeAllFreeNodes:
_02bb:
	ld hl, (ws+375)
	ld a,h
	or l
	ret z
	ld hl, (ws+375)
	ld (ws+1434), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+375), hl
	ld hl, (ws+1434)
	call f40_Free
	jp    _02bb


	; NodeWidth workspace at ws+1377 length ws+3
f172_NodeWidth:
	ld (ws+1377), hl
	xor a
	ld (ws+1379), a
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp z,    _02c5
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld de,11
	add hl,de
	ld a,(hl)
	ld (ws+1379), a
_02c5:
	ld a, (ws+1379)
	ret


_c411:
	db 67,79,87,70,69,58,32,0
_c412:
	db 0
_c413:
	db 100,111,110,101,58,32,0


	; __main workspace at ws+0 length ws+1294
f2___main:
	ld hl, __Hbss
	ld ( ws+0 ), hl 
	ld hl, (6) 
	ld ( ws+2 ), hl 
	ld hl, (ws+0)
	ld (ws+6), hl
	ld bc,0
	ld (hl),c
	inc hl
	ld (hl),b
	ld (ws+8), bc
	ld (ws+10), bc
	ld (ws+30), bc
	ld (ws+66), bc
	ld (ws+68), bc
	ld (ws+70), bc
	ld (ws+72), bc
	ld (ws+375), bc
	ld hl, (ws+2)
	ld de, (ws+0)
	and a
	sbc hl,de
	ex de,hl
	ld hl, (ws+6)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld bc,1
	ld (ws+14), bc
	ld (ws+16), bc
	ld bc,ws+32
	ld (ws+64), bc
	xor a
	ld (ws+74), a
	ld (ws+203), a
	ld (ws+374), a
	ld (ws+557), a
	ld hl,   _c411
	call f9_print
	call f459_PrintFreeMemory
	call f461_ParseArguments
	ld hl,   _c412
	call f83_LexerAddIncludePath
	ld hl, (ws+8)
	call f87_LexerIncludeFile
	call f279_CreateMainSubroutine
	call f251_ArchInitTypes
	ld hl, (ws+10)
	call f207_EmitterOpenfile
	ld hl, (ws+12)
	call f209_EmitterDeclareSubroutine
	call f168_MidStartfile
	ld (ws+1276), hl
	call f269_Generate
	ld hl, (ws+12)
	call f119_MidStartsub
	call f269_Generate
	call f456_ParserInit
_082f:
	call f88_LexerReadToken
	ld (ws+1281), a
	cp 34
	jp nz,    _0832
	ld hl, (ws+204)
	exx
	ld hl, (ws+206)
	exx
	ld (ws+1282), hl
	exx
	ld (ws+1284), hl
	exx
	jp    _0831
_0832:
	cp 33
	jp nz,    _0833
	ld hl,ws+75
	call f78_InternalStrDup
	ld (ws+1282), hl
	jp    _0831
_0833:
	cp 41
	jp nz,    _0834
	ld hl,ws+75
	call f78_InternalStrDup
	ld (ws+1282), hl
	jp    _0831
_0834:
	ld hl,0
	ld (ws+1282), hl
	ld (ws+1284), hl
_0831:
	ld a, (ws+1281)
	push af
	ld hl,ws+1282
	call f458_ParserFeedToken
	ld a, (ws+1281)
	or a
	jp nz,    _082f
	call f457_ParserDeinit
	ld hl, (ws+12)
	call f163_MidEndsub
	call f269_Generate
	ld hl, (ws+12)
	call f280_ReportWorkspaces
	call f159_MidEndfile
	call f269_Generate
	call f208_EmitterClosefile
	ld hl,   _c413
	call f9_print
	jp f459_PrintFreeMemory


    ; _lsr1
f463__lsr1:
    dec b
    ret m
    srl a
    jp f463__lsr1

    ; _lsr2
f466__lsr2:
    dec a
    ret m
    srl h
    rr l
    jp f466__lsr2

    ; _lsr4
f469__lsr4:
    dec a
    ret m
    exx
    srl h
    rr l
    exx
    rr h
    rr l
    jp f469__lsr4

    ; _asl4
f470__asl4:
    dec a
    ret m
    add hl, hl
    exx
    adc hl, hl
    exx
    jp f470__asl4

    ; _asr4
f471__asr4:
    dec a
    ret m
    exx
    sra h
    rr l
    exx
    rr h
    rr l
    jp f471__asr4

    ; _mul2
f473__mul2:
    ld hl, 0
    ld a, 16            ; number of iterations
f473__mul2_loop:
    add hl, hl
    rl e
    rl d
    jp nc, f473__mul2_noadd
    add hl, bc
    jp nc, 1f;
    inc de              ; if carry increment high word
1:
f473__mul2_noadd:
    dec a
    jp nz, f473__mul2_loop
    ret

    ; _mul4
f474__mul4:
    and a               ; reset carry
    sbc hl, hl          ; lower result to 0
    exx
    sbc hl, hl          ; upper result to 0
    exx
    ld a, 32            ; number of iterations
f474__mul4_loop:
    exx
    sra b               ; right shift lhs
    rr c
    exx
    rr b
    rr c                ; lowest bit to carry
    jp nc, f474__mul4_noadd
    add hl, de          ; result += rhs
    exx
    adc hl, de
    exx
f474__mul4_noadd:
    sla e               ; left shift rhs
    rl d
    exx
    rl e
    rl d
    exx
    dec a
    jp nz, f474__mul4_loop
    ret

    ; _dvrmu2
f477__dvrmu2:
    ld a, 16            ; bit count
    ld hl, 0            ; reset remainder
    jp f477__dvrmu2_entry
f477__dvrmu2_loop1:
    add hl, de
f477__dvrmu2_loop2:
    dec a
    ret z
f477__dvrmu2_entry:
    sla c               ; left shift LHS
    rl b
    adc hl, hl          ; top bit of LHS goes into remainder
    or a                ; clear carry
    sbc hl, de          ; sets carry if remainder(hl) < de
    jp c, f477__dvrmu2_loop1      ; if remainder < de, undo add and go round again
    inc c               ; we know the bottom bit is clear
    jp f477__dvrmu2_loop2

    ; _dvrmu4
f479__dvrmu4:
    ld a, 32            ; bit count
    and a               ; reset carry
    sbc hl, hl          ; reset remainder
    exx
    sbc hl, hl
    exx
    jp f479__dvrmu4_entry
f479__dvrmu4_loop1:
    add hl, de
    exx
    adc hl, de
    exx
f479__dvrmu4_loop2:
    dec a
    ret z
f479__dvrmu4_entry:
    sla c               ; left shift LHS
    rl b
    exx
    rl c
    rl b
    exx
    adc hl, hl          ; top bit of LHS goes into remainder
    exx
    adc hl, hl
    exx
    or a                ; clear carry
    sbc hl, de          ; sets carry if remainder < RHS
    exx
    sbc hl, de
    exx
    jp c, f479__dvrmu4_loop1      ; if remainder < RHS, undo add and go round again
    inc c               ; we know the bottom bit is clear
    jp f479__dvrmu4_loop2

    ; _dvrms4
f480__dvrms4:
    exx
    ld a, b
    xor d               ; discover sign of result
    push af             ; save for later
    xor d               ; recover b (and sign of remainder) (and clear carry)
    push af             ; save for later
    exx

    jp p, f480__dvrms4_bcbc_positive
    sbc hl, hl          ; set hl to 0
    sbc hl, bc          ; negate bc
    ld b, h
    ld c, l
    exx
    ld hl, 0
    sbc hl, bc
    ld b, h
    ld c, l
    exx
f480__dvrms4_bcbc_positive:

    exx
    bit 7, d            ; get sign of dede
    exx
    jp z, f480__dvrms4_dede_positive
    ld hl, 0
    and a
    sbc hl, de
    ex de, hl
    exx
    ld hl, 0
    sbc hl, de
    ex de, hl
    exx                 ; negate dede
f480__dvrms4_dede_positive:

    call f479__dvrmu4       ; actually d; the division
    ex de, hl           ; put remainder in de as we need hl
    exx
    ex de, hl
    exx

    pop af              ; recover sign of remainder
    jp p, f480__dvrms4_remainder_positive
    and a               ; clear carry
    sbc hl, hl
    sbc hl, de          ; invert remainder
    ex de, hl
    exx
    ld hl, 0
    sbc hl, de
    ex de, hl
    exx
f480__dvrms4_remainder_positive:

    pop af              ; recover sign of result
    ret p               ; return now if we're good
    and a
    sbc hl, hl
    sbc hl, bc          ; invert result
    ld b, h
    ld c, l
    exx
    ld hl, 0
    sbc hl, bc
    ld b, h
    ld c, l
    exx
    ret

    ; _and4
f481__and4:
    ld a, l
    and e
    ld l, a
    ld a, h
    and d
    ld h, a
    exx

    ld a, l
    and e
    ld l, a
    ld a, h
    and d
    ld h, a
    exx
    ret

    ; _or4
f482__or4:
    ld a, l
    or e
    ld l, a
    ld a, h
    or d
    ld h, a
    exx

    ld a, l
    or e
    ld l, a
    ld a, h
    or d
    ld h, a
    exx
    ret

    ; _eor4
f483__eor4:
    ld a, l
    xor e
    ld l, a
    ld a, h
    xor d
    ld h, a
    exx

    ld a, l
    xor e
    ld l, a
    ld a, h
    xor d
    ld h, a
    exx
    ret

    ; _not4
f484__not4:
    ld a, l
    cpl
    ld l, a
    ld a, h
    cpl
    ld h, a
    exx

    ld a, l
    cpl
    ld l, a
    ld a, h
    cpl
    ld h, a
    exx
    ret

    ; _cmpu4
f486__cmpu4:
    and a               ; clear carry
    sbc hl, de
    ret nz
    exx
    sbc hl, de
    exx
    ret

    ; _cmps4
f487__cmps4:
    and a               ; clear carry
    sbc hl, de
    exx
    sbc hl, de          ; leaves C set on unsigned overflow
    ld a, h             ; preserve high byte
    exx
    jp po, 1f;
    xor 080h            ; invert sign byte, spoil Z
1:
    ret

    ; _jpbc
f488__jpde:
    push de
    ret
 


global _exit
_exit: rst 0
psect data
ws:
defs 1472
psect bss
defs 128
TOPSTACK:
