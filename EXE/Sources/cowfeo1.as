	ld sp,TOPSTACK
	call f2___main
	ld hl,0
	ld (80H),hl
	rst 0


	; ExitWithError workspace at ws+1441 length ws+0
f4_ExitWithError::
	ld hl,1
	ld (80h),hl
	rst 0 
;end_f4_ExitWithError:
	ret


	; AlignUp workspace at ws+1461 length ws+4
f5_AlignUp::
;	ld (ws+1461), hl
;	ld (ws+1463), hl
;end_f5_AlignUp:
;	ld hl, (ws+1463)
	ret


	; print_char workspace at ws+1460 length ws+1
f7_print_char::
	ld (ws+1460), a
	cp 10
	jp nz, c01_0005
	ld e, 13 
	ld c, 2 
	call 5 
c01_0005:
;c01_0001:
	ld a, ( ws+1460 ) 
	ld e, a 
	ld c, 2 
	jp   5  ;	call 5 
;end_f7_print_char:
;	ret


	; MemSet workspace at ws+1465 length ws+7
f8_MemSet::
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


	; print workspace at ws+1457 length ws+3
f9_print::
	ld (ws+1457), hl
c01_000d:
	ld hl, (ws+1457)
	ld a,(hl)
	ld (ws+1459), a
	or a
;	jp nz, c01_0013
;	ret
;c01_0013:
	ret z
;c01_000f:
	ld a, (ws+1459)
	call f7_print_char
	ld hl, (ws+1457)
	inc hl
	ld (ws+1457), hl
	jp c01_000d
;c01_000e:
;end_f9_print:
	ret


	; print_nl workspace at ws+1435 length ws+0
f10_print_nl::
	ld a,10
	jp   f7_print_char ;	call f7_print_char
;end_f10_print_nl:
;	ret


	; print_i16 workspace at ws+1435 length ws+2 OK
f16_print_i16::
	ex	de,hl		;DE = value
	ld	hl,buf6		;HL=buffer
	call	Bn2Dec
	ld	hl,buf6
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
buf6:	defs	6
;
	psect	text
;

	; print_i8 workspace at ws+1380 length ws+1 OK
f17_print_i8::
				;A = value
	ld	e,a
	ld	d,0		;DE = value
	ld	hl,buf6		;HL=buffer
	call	Bn2Dec
	ld	hl,buf6
	jp f9_print


	; print_hex_i8 workspace at ws+1307 length ws+3 OK
f18_print_hex_i8::
				;A = value
	call	Bin2Hex
	push	bc
	call	f7_print_char
	pop	bc
	ld	a,c
	jp	f7_print_char

print_hex_i16::
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
f27_ArgvInit::
	ld iy,129
	ld (ws+4), iy
	ld b,0
	push iy
	pop de
	ld ix,128
	ld a, (ix+0)
	ld l,a
	ld h,b
	add hl,de
	ld a,b
	ld (hl),a
;end_f27_ArgvInit:
	ret


	; ArgvNext workspace at ws+1298 length ws+3
f28_ArgvNext::
	ld hl, (ws+4)
	ld a,h
	or l
	jp nz, c01_005f
	ld hl, (ws+4)
	ld (ws+1298), hl
	jp end_f28_ArgvNext
c01_005f:
;c01_005b:
c01_0060:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+1300), a
	cp 32
	jp z, c01_0066
;c01_0065:
	jp c01_0061
c01_0066:
;c01_0062:
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
	jp z, c01_0068 ; c01_0070
;c01_0073:
	ld a, (ws+1300)
	cp 10
	jp z, c01_0068 ; c01_0070
;c01_0072:
	ld a, (ws+1300)
	or a
	jp nz, c01_0071
c01_0070:
	jp c01_0068
c01_0071:
;c01_0069:
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
end_f28_ArgvNext:
	ld hl, (ws+1298)
	ret


	; StrCmp workspace at ws+1399 length ws+5
f29_StrCmp::
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


	; ToLower workspace at ws+1325 length ws+2
f30_ToLower::
	cp 'A'		;less than A, return-it
	ret c
	cp 'Z'+1	;more than Z, return-it
	ret nc
	or 20H		;to lower case
	ret


	; StrLen workspace at ws+1416 length ws+7
f32_StrLen::
	ex de,hl	;DE=string pointer
	ld hl,0		;HL=size
loop1:
	ld a,(de)
	or a		;return size if 0
	ret z
	inc de		;increment pointer
	inc hl		;increment size
	jr loop1


	; MemCopy workspace at ws+1404 length ws+6
f34_MemCopy::
	ex de,hl	;DE=dest
	pop hl		;HL=ret addr
	pop bc		;BC=size
	ex (sp),hl	;HL=source, ret addr on stack
	ld a,b
	or c
	ret z		;return if size = 0
	ldir		;(HL) ---> (DE) BC bytes
	ret


	; RawAlloc workspace at ws+1437 length ws+24
f37_RawAlloc::
	ld (ws+1437), hl
	inc hl
	inc hl
	call f5_AlignUp
;	ld (ws+1441), hl
	ld (ws+1443), hl
	ld de,4
	and a
	sbc hl,de
	jp nc, c01_00c3
;c01_00c2:
	ld de,4
	ld (ws+1443), de
c01_00c3:
;c01_00bf:
	ld de, (ws+1443)
	ld hl,7
	add hl,de
	ld a,l
	and 248
	ld l,a
	ld a,h
	and 255
	ld h,a
	ld (ws+1443), hl
	ld hl, (ws+6)
	ld (ws+1445), hl
	ld bc,0
	ld (ws+1447), bc
	ld (ws+1449), bc
	ld (ws+1451), bc
	ld iy,65535
	ld (ws+1453), iy
c01_00c4:
	ld hl, (ws+1445)
	ld a,h
	or l
	jp z, c01_00c9
;c01_00c8:
	ld hl, (ws+1445)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1455), hl
	ld de, (ws+1443)
	and a
	sbc hl,de
	jp c, c01_00d0
;c01_00d1:
	ld hl, (ws+1455)
	ld de, (ws+1453)
	and a
	sbc hl,de
	jp nc, c01_00d0
;c01_00cf:
	ld hl, (ws+1445)
	ld (ws+1449), hl
	ld hl, (ws+1455)
	ld (ws+1453), hl
	ld hl, (ws+1447)
	ld (ws+1451), hl
	ld de, (ws+1453)
	ld hl, (ws+1443)
	and a
	sbc hl,de
;	jp nz, c01_00d6
;	jp c01_00c9
;c01_00d6:
	jp z,c01_00c9
;c01_00d2:
c01_00d0:
;c01_00ca:
	ld hl, (ws+1445)
	ld (ws+1447), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1445), hl
	jp c01_00c4
c01_00c9:
	ld hl, (ws+1449)
	ld a,h
	or l
	jp nz, c01_00db
	ld bc,0
	ld (ws+1439), bc
	jp end_f37_RawAlloc
c01_00db:
;c01_00d7:
	ld hl, (ws+1453)
	ld de, (ws+1443)
	and a
	sbc hl,de
	ld (ws+1457), hl
	ld de,4
	and a
	sbc hl,de
	jp nc, c01_00e0
;c01_00df:
	ld hl, (ws+1451)
	ld a,h
	or l
	jp z, c01_00e5
;c01_00e4:
	ld hl, (ws+1449)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1451)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00e1
c01_00e5:
	ld hl, (ws+1449)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+6), hl
c01_00e1:
	ld hl, (ws+1453)
	ld (ws+1443), hl
	jp c01_00dc
c01_00e0:
	ld de, (ws+1457)
	ld hl, (ws+1449)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1449)
	ld h,d
	ld l,e
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ld (ws+1449), hl
c01_00dc:
	ld hl, (ws+1449)
	ld (ws+1459), hl
	ld de, (ws+1443)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1459)
	inc hl
	inc hl
	ld (ws+1439), hl
	push hl
	ld d,0
	push de
	ld hl, (ws+1443)
	dec hl
	dec hl
	call f8_MemSet
end_f37_RawAlloc:
	ld hl, (ws+1439)
	ret


	; AddFreeBlock workspace at ws+1443 length ws+8
f39_AddFreeBlock::
	ld (ws+1445), hl
	pop bc
	pop hl
	ld (ws+1443), hl
	push bc
	push hl
	ld h,170
	push hl
	ld hl, (ws+1445)
	call f8_MemSet
	ld hl, (ws+1443)
	ld (ws+1447), hl
	ld de, (ws+1445)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+6)
	ld (ws+1449), hl
	ld hl, (ws+1447)
	ld de, (ws+1449)
	and a
	sbc hl,de
	jp nc, c01_00ef
;c01_00ee:
	ld de, (ws+1447)
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
	ld hl, (ws+1449)
	and a
	sbc hl,de
	jp nz, c01_00f4
	ld de, (ws+1445)
	ld hl, (ws+1449)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1447)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1449)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1447)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00f0
c01_00f4:
	ld de, (ws+1449)
	ld hl, (ws+1447)
	ld (hl),e
	inc hl
	ld (hl),d
c01_00f0:
	ld hl, (ws+1447)
	ld (ws+6), hl
	jp c01_00eb
c01_00ef:
c01_00f5:
	ld hl, (ws+1449)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz, c01_00fb
	ld de, (ws+1447)
	ld hl, (ws+1449)
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
;c01_00f7:
	ld bc, (ws+1447)
	ld hl, (ws+1449)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld h,b
	ld l,c
	and a
	sbc hl,de
	jp nc, c01_0100
;c01_00ff:
	ld de, (ws+1447)
	ld hl, (ws+1445)
	add hl,de
	ex de,hl
	ld hl, (ws+1449)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	and a
	sbc hl,de
	jp nz, c01_0105
	ld de, (ws+1445)
	ld hl, (ws+1449)
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
	ld hl, (ws+1447)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1449)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1447)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_0101
c01_0105:
	ld hl, (ws+1449)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1447)
	ld (hl),e
	inc hl
	ld (hl),d
c01_0101:
	ld de, (ws+1447)
	ld hl, (ws+1449)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00f6
c01_0100:
;c01_00fc:
	ld hl, (ws+1449)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1449), hl
	jp c01_00f5
c01_00f6:
	ld de, (ws+1449)
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
	ld hl, (ws+1447)
	and a
	sbc hl,de
	jp nz, c01_010a
	ld hl, (ws+1449)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1447)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1449)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1447)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1449)
	ld (hl),e
	inc hl
	ld (hl),d
c01_010a:
;c01_0106:
c01_00eb:
;end_f39_AddFreeBlock:
	ret


	; Free workspace at ws+1439 length ws+4
f40_Free::
	ld (ws+1439), hl
	ld a,h
	or l
	jp z, c01_010f
;c01_010e:
	ld hl, (ws+1439)
	dec hl
	dec hl
	ld (ws+1441), hl
	push hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f39_AddFreeBlock
c01_010f:
;c01_010b:
;end_f40_Free:
	ret


	; GetFreeMemory workspace at ws+1296 length ws+4
f41_GetFreeMemory::
	ld bc,0
	ld (ws+1296), bc
	ld hl, (ws+6)
	ld (ws+1298), hl
c01_0110:
	ld hl, (ws+1298)
	ld a,h
	or l
	jp z, c01_0115
;c01_0114:
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
;end_f41_GetFreeMemory:
	ld hl, (ws+1296)
	ret


	; fill workspace at ws+1348 length ws+8
f44_fill::
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
;c01_011f:
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
;c01_012b:
	ld b,122
	ld a, (ws+1355)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_012a
;c01_0129:
	ld a, (ws+1355)
	add 224
	ld (ws+1355), a
c01_012a:
;c01_0124:
	ld a, (ws+1355)
	ld hl, (ws+1348)
	ld (hl),a
	inc hl
	ld (ws+1348), hl
	ld a, (ws+1352)
	dec a
	ld (ws+1352), a
	or a
	jp nz, c01_0116 ; c01_0130
;c01_012f:
	jp c01_0117
c01_0130:
;c01_012c:
	jp c01_0116
c01_0117:
	ld hl, (ws+1350)
;	ld (ws+1353), hl
;end_f44_fill:
;	ld hl, (ws+1353)
	ret


	; file_i_init workspace at ws+1339 length ws+9
f43_file_i_init::
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
;	ld (ws+1343), hl
	ld (ws+1341), hl
c01_0131:
	ld hl, (ws+1341)
	ld a,(hl)
	ld (ws+1345), a
	cp 32
	jp c, c01_0132 ; c01_0138
;c01_013a:
	ld a, (ws+1345)
	cp 46
	jp nz, c01_0139
c01_0138:
	jp c01_0132
c01_0139:
;c01_0133:
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
;	ld (ws+1346), hl
	ld (ws+1341), hl
c01_013f:
;c01_013b:
	ld ix, (ws+1339)
	ld (ix+35), 255
	ld (ix+36), 255
	ld a,127
	push ix
	pop hl
	ld (hl),a
;end_f43_file_i_init:
	ret


	; fcb_i_gbpb workspace at ws+1427 length ws+7
f45_fcb_i_gbpb::
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
	call 5 
;end_f45_fcb_i_gbpb:
	ret


	; fcb_i_blockin workspace at ws+1425 length ws+2
f46_fcb_i_blockin::
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
;end_f46_fcb_i_blockin:
	ret


	; fcb_i_blockout workspace at ws+1425 length ws+2
f47_fcb_i_blockout::
	ld (ws+1425), hl
	inc hl
	ld a,(hl)
	or a
	jp z, c01_0144
;c01_0143:
	ld hl, (ws+1425)
	push hl
	ld a,34
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+1425)
	inc hl
	ld (hl),a
c01_0144:
;c01_0140:
;end_f47_fcb_i_blockout:
	ret


	; fcb_i_changeblock workspace at ws+1421 length ws+4
f48_fcb_i_changeblock::
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
	jp z, c01_0149
;c01_0148:
	ld hl, (ws+1421)
	call f47_fcb_i_blockout
	ld hl, (ws+1423)
	ld ix, (ws+1421)
	ld (ix+35), l
	ld (ix+36), h
	push ix
	pop hl
	call f46_fcb_i_blockin
c01_0149:
;c01_0145:
;end_f48_fcb_i_changeblock:
	ret


	; fcb_i_convert_a_to_error workspace at ws+1341 length ws+0
f49_fcb_i_convert_a_to_error::
	cp 0ffh 
	ld a, 0 
	ret nz 
	inc a 
;end_f49_fcb_i_convert_a_to_erro: 
	ret


	; FCBOpenIn workspace at ws+1332 length ws+7
f50_FCBOpenIn::
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
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+1336 ), a 
;end_f50_FCBOpenIn:
;	ld a, (ws+1336)
	ret


	; FCBOpenOut workspace at ws+1297 length ws+7
f52_FCBOpenOut::
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
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+1301 ), a 
;end_f52_FCBOpenOut:
;	ld a, (ws+1301)
	ret


	; FCBClose workspace at ws+1336 length ws+5
f53_FCBClose::
	ld (ws+1336), hl
	call f47_fcb_i_blockout
	ld hl, (ws+1336)
	inc hl
	inc hl
	ld (ws+1339), hl
	ld c, 16 
	ld de, ( ws+1339 ) 
	call 5 
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+1338 ), a 
;end_f53_FCBClose:
;	ld a, (ws+1338)
	ret


	; FCBSeek workspace at ws+1332 length ws+9
f54_FCBSeek::
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
	call f472__lsr4
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
;end_f54_FCBSeek:
	ret


	; FCBPos workspace at ws+1336 length ws+6
f55_FCBPos::
	ld (ws+1336), hl
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	exx
	ld hl,0
	exx
	ld a,7
	call f473__asl4
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
	call f485__or4
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
;end_f55_FCBPos:
	ld hl, (ws+1338)
	exx
	ld hl, (ws+1340)
	exx
	ret


	; fcb_i_nextchar workspace at ws+1419 length ws+2
f60_fcb_i_nextchar::
	ld (ws+1419), hl
	ld a,(hl)
	inc a
	ld (hl),a
	ld a,(hl)
	cp 128
	jp nz, c01_014e
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
c01_014e:
;c01_014a:
;end_f60_fcb_i_nextchar:
	ret


	; FCBGetChar workspace at ws+1326 length ws+3
f61_FCBGetChar::
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
;	ld (ws+1328), a
;end_f61_FCBGetChar:
;	ld a, (ws+1328)
	ret


	; FCBPutChar workspace at ws+1416 length ws+3
f62_FCBPutChar::
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
;end_f62_FCBPutChar:
	ret


;-----------------New append file stuff---------

        ; fcb_init workspace at ws+1339 length ws+9
f_fcb_init:
        ld (ws+1341), hl
        pop bc
        pop hl
        ld (ws+1339), hl
        push bc
        ld hl, (ws+1339)
        push hl
        ld h,0
        push hl
        ld hl,167
        call f8_MemSet
        ld hl, (ws+1339)
        inc hl
        inc hl
        inc hl
        inc hl
        push hl
        ld d,32
        push de
        ld hl,11
        call f8_MemSet
        ld hl, (ws+1339)
        inc hl
        inc hl
        inc hl
        inc hl
        push hl
        ld hl, (ws+1341)
        push hl
        ld a,8
        call f44_fill
        ld (ws+1341), hl
c1c_001c:
        ld hl, (ws+1341)
        ld a,(hl)
        ld (ws+1345), a
        cp 32
        jp c, c1c_001d
        ld a, (ws+1345)
        cp 46
        jp z,c1c_001d
        ld hl, (ws+1341)
        inc hl
        ld (ws+1341), hl
        jp c1c_001c
c1c_001d:
        ld a, (ws+1345)
        cp 46
        ret nz
        ld hl, (ws+1339)
        ld bc,12
        add hl,bc
        push hl
        ld hl, (ws+1341)
        inc hl
        push hl
        ld a,3
        call f44_fill
        ret

        ; FCBOpenRW workspace at ws+1310 length ws+11
f_FCBOpenRW:
        ld (ws+1315), a
        pop bc
        pop af
        ld (ws+1314), a
        pop hl
        ld (ws+1310), hl
        push bc
        inc hl
        inc hl
        inc hl
        ld (ws+1317), hl
        ld a, (ws+1315)
        ld hl, (ws+1310)
        inc hl
        ld (hl),a
        ld a, (ws+1314)
        ld hl, (ws+1310)
        inc hl
        inc hl
        ld (hl),a
        ld a, (ws+1315)
        cp 1
        jp nz, c1c_002f
        ld c, 19
        ld de, ( ws+1317 )
        call 5
        ld c, 22
        ld de, ( ws+1317 )
        call 5
        ld ( ws+1319 ), a
        ld a, (ws+1319)
        cp 255
        jp nz, c1c_0034
        ld a,3
        ld (ws+1320), a
        jp c1c_002b
c1c_0034:
        xor a
        ld (ws+1320), a
        jp c1c_002b
c1c_002f:
        ld c, 15
        ld de, ( ws+1317 )
        call 5
        ld ( ws+1319 ), a
        ld a, (ws+1319)
        cp 255
        jp nz, c1c_0039
        ld a,1
        ld (ws+1320), a
        jp c1c_0035
c1c_0039:
        xor a
        ld (ws+1320), a
c1c_0035:
c1c_002b:
        ld hl, (ws+1310)
        inc hl
        inc hl
        ld a,(hl)
        or a
        jp nz, c1c_003e
        ld a,26
        ld (ws+1312), a
        jp c1c_003a
c1c_003e:
        xor a
        ld (ws+1312), a
c1c_003a:
        ld hl, (ws+1310)
        ld de,39
        add hl,de
        push hl
        ld a, (ws+1312)
        push af
        ld hl,128
        call f8_MemSet
        ld a, (ws+1320)
        ret

        ; FCBOpenForAppend workspace at ws+1388 length ws+12
f_FCBOpenForAppend::
        ld (ws+1390), hl
        pop bc
        pop hl
        ld (ws+1388), hl
        push bc
        inc hl
        inc hl
        inc hl
        ld (ws+1393), hl
        ld hl, (ws+1388)
        push hl
        ld hl, (ws+1390)
        call f_fcb_init
        ld c, 17
        ld de, ( ws+1393 )
        call 5
        ld ( ws+1395 ), a
        ld a, (ws+1395)
        cp 255
        jp nz, c1c_0043
        ld hl, (ws+1388)
        push hl
        ld a,1
        push af
        call f_FCBOpenRW
        ld (ws+1392), a
        jp c1c_003f
c1c_0043:
        ld hl, (ws+1388)
        push hl
        ld b,1
        push bc
        ld a,2
        call f_FCBOpenRW
        ld (ws+1397), a
        ld (ws+1392), a
        or a
        jp nz, c1c_003f
        ld hl, (ws+1388)
        ld de,39
        add hl,de
        ld (ws+1398), hl
        ld c, 26
        ld de, ( ws+1398 )
        call 5
        ld c, 35
        ld de, ( ws+1393 )
        call 5
        ld hl, (ws+1388)
        ld de,39
        add hl,de
        push hl
        ld h,0
        push hl
        ld hl,128
        call f8_MemSet
        ld c, 34
        ld de, ( ws+1393 )
        call 5
        xor a
        ld (ws+1392), a
c1c_003f:
        ld a, (ws+1392)
        ret


        ; FCBPutChar workspace at ws+1388 length ws+10
f_FCBPutChar::
        ld (ws+1390), a
        pop bc
        pop hl
        ld (ws+1388), hl
        push bc
        inc hl
        ld a,(hl)
        or a
        jp nz, c1c_004d
        ld a,2
        ld (ws+1391), a
        jp c1c_9999
c1c_004d:
        ld hl, (ws+1388)
        ld a,(hl)
        ld (ws+1392), a
        ld a, (ws+1390)
        push af
        ld de,39
        add hl,de
        ex de,hl
        ld a, (ws+1392)
        ld l,a
        ld h,0
        add hl,de
        pop af
        ld (hl),a
        ld a, (ws+1392)
        cp 127
        jp nz, c1c_0052
        ld hl, (ws+1388)
        inc hl
        inc hl
        inc hl
        ld (ws+1393), hl
        ld hl, (ws+1388)
        ld de,39
        add hl,de
        ld (ws+1396), hl
        ld c, 26
        ld de, ( ws+1396 )
        call 5
        ld c, 21
        ld de, ( ws+1393 )
        call 5
        ld ( ws+1395 ),a
        ld a, (ws+1395)
        or a
        jp z, c1c_0057
        ld a,4
        ld (ws+1391), a
        jp c1c_9999
c1c_0057:
        xor a
        ld hl, (ws+1388)
        ld (hl),a
        inc hl
        inc hl
        ld a,(hl)
        or a
        jp nz, c1c_005c
        ld a,26
        ld (ws+1390), a
        jp c1c_0058
c1c_005c:
        xor a
        ld (ws+1390), a
c1c_0058:
        ld hl, (ws+1388)
        ld de,39
        add hl,de
        push hl
        ld a, (ws+1390)
        push af
        ld hl,128
        call f8_MemSet
        jp c1c_004e
c1c_0052:
        ld a, (ws+1392)
        inc a
        ld hl, (ws+1388)
        ld (hl),a
c1c_004e:
        xor a
        ld (ws+1391), a
c1c_9999:
        ld a, (ws+1391)
        ret


        ; FCBClose workspace at ws+1388 length ws+9
f_FCBClose::
        ld (ws+1388), hl
        inc hl
        inc hl
        inc hl
        ld (ws+1391), hl
        xor a
        ld (ws+1394), a
        xor a
        ld (ws+1390), a
        ld hl, (ws+1388)
        inc hl
        ld a,(hl)
        or a
        jp z, c1c_0070
        ld hl, (ws+1388)
        ld a,(hl)
        or a
        jp z, c1c_0066
        ld hl, (ws+1388)
        ld de,39
        add hl,de
        ld (ws+1395), hl
        ld c, 26
        ld de, ( ws+1395 )
        call 5
        ld c, 21
        ld de, ( ws+1391 )
        call 5
        ld ( ws+1394 ),a
c1c_0066:
        ld c, 16
        ld de, ( ws+1391 )
        call 5
        ld ( ws+1393 ),a
        ld a, (ws+1394)
        or a
        jp z, c1c_006b
        ld a,4
        ld (ws+1390), a
        jp c1c_0070
c1c_006b:
        ld a, (ws+1393)
        cp 255
        jp nz, c1c_0070
        ld a,1
        ld (ws+1390), a
c1c_0070:
        ld a, (ws+1390)
        ret

;-----------------------------------------------


	; StrDupBraced workspace at ws+1388 length ws+12
f76_StrDupBraced::
	ld (ws+1388), hl
	call f32_StrLen
;	ld (ws+1392), hl
	ld (ws+1394), hl
	inc hl
	inc hl
	inc hl
	call f75_InternalAlloc
;	ld (ws+1396), hl
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
;end_f76_StrDupBraced:
	ld hl, (ws+1390)
	ret


	; StrDupArrayed workspace at ws+1369 length ws+14
f77_StrDupArrayed::
	ld (ws+1371), hl
	pop bc
	pop hl
	ld (ws+1369), hl
	push bc
	call f32_StrLen
;	ld (ws+1375), hl
	ld (ws+1377), hl
	inc hl
	inc hl
	inc hl
	call f75_InternalAlloc
;	ld (ws+1379), hl
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
;end_f77_StrDupArrayed:
	ld hl, (ws+1373)
	ret


	; InternalStrDup workspace at ws+1372 length ws+10
f78_InternalStrDup::
	ld (ws+1372), hl
	call f32_StrLen
;	ld (ws+1376), hl
	inc hl
	ld (ws+1378), hl
	call f75_InternalAlloc
;	ld (ws+1380), hl
	ld (ws+1374), hl
	ld hl, (ws+1372)
	push hl
	ld hl, (ws+1378)
	push hl
	ld hl, (ws+1374)
	call f34_MemCopy
;end_f78_InternalStrDup:
	ld hl, (ws+1374)
	ret


	; AllocNewSymbol workspace at ws+1398 length ws+4
f70_AllocNewSymbol::
	ld hl, (ws+66)
	ld a,h
	or l
	jp z, c01_0166
;c01_0165:
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
	jp c01_0162
c01_0166:
	ld hl,11
	call f75_InternalAlloc
;	ld (ws+1400), hl
	ld (ws+1398), hl
c01_0162:
;end_f70_AllocNewSymbol:
	ld hl, (ws+1398)
	ret


	; FreeSymbol workspace at ws+1373 length ws+2
f71_FreeSymbol::
	ld (ws+1373), hl
	ld hl, (ws+66)
	ld ix, (ws+1373)
	ld (ix+8), l
	ld (ix+9), h
	push ix
	pop hl
	ld (ws+66), hl
;end_f71_FreeSymbol:
	ret


	; AllocNewType workspace at ws+1388 length ws+4
f72_AllocNewType::
	ld hl, (ws+68)
	ld a,h
	or l
	jp z, c01_016b
;c01_016a:
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
	jp c01_0167
c01_016b:
	ld hl,17
	call f75_InternalAlloc
;	ld (ws+1390), hl
	ld (ws+1388), hl
c01_0167:
;end_f72_AllocNewType:
	ld hl, (ws+1388)
	ret


	; FreeType workspace at ws+1373 length ws+2
f73_FreeType::
	ld (ws+1373), hl
	ld hl, (ws+68)
	ld ix, (ws+1373)
	ld (ix+9), l
	ld (ix+10), h
	push ix
	pop hl
	ld (ws+68), hl
;end_f73_FreeType:
	ret


c01_c9:
	db 79,117,116,32,111,102,32,109,101,109,111,114,121,10,0

	; InternalAlloc workspace at ws+1429 length ws+8
f75_InternalAlloc::
	ld (ws+1429), hl
	call f37_RawAlloc
;	ld (ws+1433), hl
	ld (ws+1431), hl
	ld a,h
	or l
	jp nz, c01_0170
c01_0171:
	ld hl, (ws+66)
	ld a,h
	or l
	jp z, c01_0176
;c01_0175:
	ld hl, (ws+66)
	ld (ws+1431), hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+66), hl
	ld hl, (ws+1431)
	call f40_Free
	jp c01_0171
c01_0176:
c01_0177:
	ld hl, (ws+68)
	ld a,h
	or l
	jp z, c01_017c
;c01_017b:
	ld hl, (ws+68)
	ld (ws+1431), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+68), hl
	ld hl, (ws+1431)
	call f40_Free
	jp c01_0177
c01_017c:
	call f79_PurgeAllFreeNodes
	ld hl, (ws+1429)
	call f37_RawAlloc
;	ld (ws+1435), hl
	ld (ws+1431), hl
	ld a,h
	or l
	jp nz, c01_0181
	ld hl,c01_c9
	call f9_print
	call f4_ExitWithError
c01_0181:
;c01_017d:
c01_0170:
;c01_016c:
;end_f75_InternalAlloc:
	ld hl, (ws+1431)
	ret


f2___main_s0182::
	db 0
	db 0
	db 0
	db 0
	db 146
	db 188
	db 0
	db 144
	db 132
	db 152
	db 147
	db 174
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
	db 178
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
	db 177
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
	db 110,105,108,0
c01_c39:
	db 110,111,116,0
c01_c40:
	db 111,114,0
c01_c41:
	db 114,101,99,111,114,100,0
c01_c42:
	db 114,101,116,117,114,110,0
c01_c43:
	db 115,117,98,0
c01_c44:
	db 116,104,101,110,0
c01_c45:
	db 116,121,112,101,100,101,102,0
c01_c46:
	db 118,97,114,0
c01_c47:
	db 119,104,101,110,0
c01_c48:
	db 119,104,105,108,101,0

f2___main_s0183::
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
	dw c01_c48

f2___main_s0184::
	db 68
	db 1
	db 35
	db 36
	db 43
	db 11
	db 63
	db 42
	db 40
	db 61
	db 62
	db 47
	db 59
	db 3
	db 65
	db 7
	db 64
	db 9
	db 37
	db 10
	db 11
	db 12
	db 66
	db 255
	db 38
	db 44
	db 69
	db 13
	db 45
	db 15
	db 48
	db 20
	db 21
	db 25
	db 26
	db 39
	db 28
	db 67
	db 29

c01_c49:
	db 101,114,114,111,114,58,32,0
c01_c50:
	db 60,101,111,102,62,0
c01_c51:
	db 58,32,0
c01_c52:
	db 58,32,0


	; StartError workspace at ws+1435 length ws+0
f80_StartError::
	ld hl,c01_c49
	call f9_print
	ld hl, (ws+72)
	ld a,h
	or l
	jp nz, c01_0189
	ld hl,c01_c50
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
	ld hl,c01_c51
	call f9_print
	ld ix, (ws+72)
	ld l, (ix+4)
	ld h, (ix+5)
	call f16_print_i16
c01_0185:
	ld hl,c01_c52
	jp   f9_print ;	call f9_print
;end_f80_StartError:
;	ret


	; EndError workspace at ws+1435 length ws+0
f81_EndError::
	call f10_print_nl
	jp   f4_ExitWithError ;	call f4_ExitWithError
;end_f81_EndError:
;	ret


	; SimpleError workspace at ws+1433 length ws+2
f82_SimpleError::
	ld (ws+1433), hl
	call f80_StartError
	ld hl, (ws+1433)
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f82_SimpleError:
;	ret


	; LexerAddIncludePath workspace at ws+1298 length ws+6
f83_LexerAddIncludePath::
	ld (ws+1298), hl
	ld hl,4
	call f75_InternalAlloc
;	ld (ws+1300), hl
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
;end_f83_LexerAddIncludePath:
	ret


c01_c53:
	db 32,32,0

	; LexerPrintSpaces workspace at ws+1328 length ws+1
f84_LexerPrintSpaces::
	ld a, (ws+374)
	ld (ws+1328), a
c01_018a:
	ld a, (ws+1328)
	or a
	jp z, c01_018f
;c01_018e:
	ld hl,c01_c53
	call f9_print
	ld a, (ws+1328)
	dec a
	ld (ws+1328), a
	jp c01_018a
c01_018f:
;end_f84_LexerPrintSpaces:
	ret


	; lexer_i_open workspace at ws+1328 length ws+4
f85_lexer_i_open::
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
;	ld (ws+1331), a
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
;end_f85_lexer_i_open:
	ld a, (ws+1330)
	ret


	; lexer_i_close workspace at ws+1328 length ws+8
f86_lexer_i_close::
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
;	ld (ws+1334), a
;	ld (ws+1335), a
;end_f86_lexer_i_close:
	ret


c01_c54:
	db 62,32,0
c01_c55:
	db 99,97,110,110,111,116,32,111,112,101,110,32,39,0
c01_c56:
	db 39,0

	; LexerIncludeFile workspace at ws+1309 length ws+19
f87_LexerIncludeFile::
	ld (ws+1309), hl
	ld hl,10
	call f75_InternalAlloc
;	ld (ws+1311), hl
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
;c01_0198:
	ld hl, (ws+72)
	call f86_lexer_i_close
c01_0199:
;c01_0195:
	ld hl, (ws+70)
	ld (ws+1315), hl
	ld hl, (ws+1309)
	call f32_StrLen
;	ld (ws+1317), hl
	ld (ws+1319), hl
c01_019a:
	ld hl, (ws+1315)
	ld a,h
	or l
	jp z, c01_019f
;c01_019e:
	ld hl, (ws+1315)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f32_StrLen
;	ld (ws+1321), hl
	ld (ws+1323), hl
	ld de, (ws+1319)
	add hl,de
	inc hl
	call f75_InternalAlloc
;	ld (ws+1325), hl
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
;	ld (ws+1327), a
	or a
	jp nz, c01_01a4
	ld a, (ws+374)
	inc a
	ld (ws+374), a
	call f84_LexerPrintSpaces
	ld hl,c01_c54
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
;c01_01a0:
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
	ld hl,c01_c55
	call f9_print
	ld hl, (ws+1309)
	call f9_print
	ld hl,c01_c56
	call f9_print
	call f81_EndError
;end_f87_LexerIncludeFile:
	ret


	; lexer_i_ctype workspace at ws+1321 length ws+3
f89_lexer_i_ctype::
	ld (ws+1321), a
	cp 33
	jp c, c01_01ab
;c01_01ac:
	ld b,127
	ld a, (ws+1321)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_01ab
;c01_01aa:
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
	jp z, c01_01a5 ; c01_01b1
;c01_01b0:
	ld a, (ws+1322)
	and 127
	ld (ws+1323), a
	ld a,128
	ld (ws+1322), a
c01_01b1:
;c01_01ad:
	jp c01_01a5
c01_01ab:
	xor a
	ld (ws+1322), a
	xor a
	ld (ws+1323), a
c01_01a5:
;end_f89_lexer_i_ctype:
	ld a, (ws+1322)
	pop bc
	push af
	ld a, (ws+1323)
	push bc
	ret


c01_c57:
	db 60,32,0
c01_c58:
	db 73,47,79,32,101,114,114,111,114,0

	; lexer_i_getchar workspace at ws+1321 length ws+5
f90_lexer_i_getchar::
	ld a, (ws+74)
	or a
	jp z, c01_01b6
;c01_01b5:
	ld a, (ws+74)
	ld (ws+1321), a
	xor a
	ld (ws+74), a
	jp end_f90_lexer_i_getchar
c01_01b6:
;c01_01b2:
c01_01b7:
	ld hl, (ws+72)
	ld a,h
	or l
	jp nz, c01_01bd
	xor a
	ld (ws+1321), a
	jp c01_01b8
c01_01bd:
;c01_01b9:
	ld hl, (ws+72)
	ld (ws+1322), hl
	ld hl,ws+208
	call f61_FCBGetChar
;	ld (ws+1324), a
	ld (ws+1321), a
	cp 26
	jp nz, c01_01c2
	xor a
	ld (ws+1321), a
c01_01c2:
;c01_01be:
	ld a, (ws+1321)
	or a
	jp z, c01_01c7
;c01_01c6:
	jp c01_01b8
c01_01c7:
;c01_01c3:
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
	jp z, c01_01b7 ; c01_01cc
;c01_01cb:
	ld a, (ws+374)
	dec a
	ld (ws+374), a
	call f84_LexerPrintSpaces
	ld hl,c01_c57
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
;	ld (ws+1325), a
	or a
	jp z, c01_01b7 ; c01_01d1
;c01_01d0:
	ld hl,c01_c58
	call f82_SimpleError
c01_01d1:
;c01_01cd:
c01_01cc:
;c01_01c8:
	jp c01_01b7
c01_01b8:
end_f90_lexer_i_getchar:
	ld a, (ws+1321)
	ret


c01_c59:
	db 117,110,112,97,114,115,101,97,98,108,101,32,99,104,97,114,97,99,116,101,114,32,48,120,0

	; lexer_i_unparseable workspace at ws+1306 length ws+1
f91_lexer_i_unparseable::
	ld (ws+1306), a
	call f80_StartError
	ld hl,c01_c59
	call f9_print
	ld a, (ws+1306)
	call f18_print_hex_i8
	jp   f81_EndError ;	call f81_EndError
;end_f91_lexer_i_unparseable:
;	ret


	; lexer_i_skipwhitespace workspace at ws+1310 length ws+2
f92_lexer_i_skipwhitespace::
c01_01d2:
	call f90_lexer_i_getchar
	ld (ws+1310), a
	ld (ws+1311), a
	cp 32
;	jp nz, c01_01d5
;	jp c01_01d4
;c01_01d5:
	jp z,c01_01d4
	cp 13
;	jp nz, c01_01d6
;	jp c01_01d4
;c01_01d6:
	jp z,c01_01d4
	cp 10
	jp nz, c01_01d7
	ld ix, (ws+72)
	ld l, (ix+4)
	ld h, (ix+5)
	inc hl
	ld (ix+4), l
	ld (ix+5), h
	jp c01_01d2 ; c01_01d4
c01_01d7:
	cp 9
	jp nz, c01_01d3 ; c01_01d8
	jp c01_01d2 ; c01_01d4
c01_01d8:
	jp c01_01d3
c01_01d4:
	jp c01_01d2
c01_01d3:
	ld a, (ws+1311)
	ld (ws+74), a
;end_f92_lexer_i_skipwhitespace:
	ret


c01_c60:
	db 116,111,107,101,110,32,116,111,111,32,108,111,110,103,0

	; lexer_i_read_identifier workspace at ws+1306 length ws+4
f93_lexer_i_read_identifier::
c01_01d9:
	call f90_lexer_i_getchar
	ld (ws+1306), a
	ld (ws+1307), a
	call f89_lexer_i_ctype
;	ld (ws+1309), a
	pop af
	ld (ws+1308), a
	and 32
	or a
	jp z, c01_01df
;c01_01de:
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
	jp nz, c01_01d9 ; c01_01e4
;c01_01e3:
	call f80_StartError
	ld hl,c01_c60
	call f9_print
	call f81_EndError
c01_01e4:
;c01_01e0:
	jp c01_01d9 ; c01_01db
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
;end_f93_lexer_i_read_identifier:
	ret


	; lexer_i_match_keyword workspace at ws+1306 length ws+3
f94_lexer_i_match_keyword::
	xor a
	ld (ws+1307), a
c01_01e5:
	ld a, (ws+1307)
	cp 39
	jp z, c01_01ea
;c01_01e9:
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
;	ld (ws+1308), a
	or a
	jp nz, c01_01ef
	ld bc,f2___main_s0184
	ld a, (ws+1307)
	ld l,a
	ld h,0
	add hl,bc
	ld a,(hl)
	ld (ws+1306), a
	jp end_f94_lexer_i_match_keyword
c01_01ef:
;c01_01eb:
	ld a, (ws+1307)
	inc a
	ld (ws+1307), a
	jp c01_01e5
c01_01ea:
	ld a,33
	ld (ws+1306), a
end_f94_lexer_i_match_keyword:
	ld a, (ws+1306)
	ret


c01_c61:
	db 105,110,118,97,108,105,100,32,110,117,109,98,101,114,0

	; lexer_i_read_number workspace at ws+1310 length ws+11
f95_lexer_i_read_number::
	ld hl,0
	ld (ws+204), hl
	ld (ws+206), hl
	ld hl,10
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	call f90_lexer_i_getchar
	ld (ws+1316), a
	ld (ws+1317), a
	cp 48
	jp nz, c01_01f4
	call f90_lexer_i_getchar
	ld (ws+1317), a
	cp 98
	jp nz, c01_01f6
	ld hl,2
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ; c01_01f5
c01_01f6:
	cp 111
	jp nz, c01_01f7
	ld hl,8
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ; c01_01f5
c01_01f7:
	cp 100
	jp nz, c01_01f8
	ld hl,10
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ; c01_01f5
c01_01f8:
	cp 120
	jp nz, c01_01f9
	ld hl,16
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ; c01_01f5
c01_01f9:
	ld a, (ws+1317)
	ld (ws+74), a
	call f89_lexer_i_ctype
;	ld (ws+1315), a
	pop af
	ld (ws+1314), a
	and 32
	or a
	jp nz, c01_01f0 ; c01_01fe
;c01_01fd:
	ret
c01_01fe:
;c01_01fa:
c01_01f5:
	jp c01_01f0
c01_01f4:
	ld a, (ws+1317)
	ld (ws+74), a
c01_01f0:
c01_01ff:
	call f90_lexer_i_getchar
;	ld (ws+1319), a
	call f30_ToLower
;	ld (ws+1320), a
	ld (ws+1317), a
	cp 95
;	jp nz, c01_0205
;	jp c01_01ff
;c01_0205:
	jp z,c01_01ff
;c01_0201:
	ld a, (ws+1317)
	call f89_lexer_i_ctype
;	ld (ws+1315), a
	pop af
	ld (ws+1314), a
	and 32
	or a
	jp nz, c01_020a
	ld a, (ws+1317)
	ld (ws+74), a
	jp c01_0200
c01_020a:
;c01_0206:
	ld a, (ws+1317)
	cp 97
	jp c, c01_020f
;c01_020e:
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
;c01_0213:
	call f80_StartError
	ld hl,c01_c61
	call f9_print
	call f81_EndError
c01_0214:
;c01_0210:
	ld bc, (ws+204)
	exx
	ld bc, (ws+206)
	exx
	ld de, (ws+1310)
	exx
	ld de, (ws+1312)
	exx
	call f477__mul4
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
c01_0200:
;end_f95_lexer_i_read_number:
	ret


c01_c62:
	db 109,97,108,102,111,114,109,101,100,32,0

	; lexer_i_malformed workspace at ws+1315 length ws+2
f96_lexer_i_malformed::
	ld (ws+1315), hl
	call f80_StartError
	ld hl,c01_c62
	call f9_print
	ld hl, (ws+1315)
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f96_lexer_i_malformed:
;	ret


c01_c63:
	db 101,115,99,97,112,101,0

	; lexer_i_get_escaped workspace at ws+1313 length ws+2
f97_lexer_i_get_escaped::
	call f90_lexer_i_getchar
;	ld (ws+1314), a
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
	ld hl,c01_c63
	call f96_lexer_i_malformed
c01_0215:
;end_f97_lexer_i_get_escaped:
	ld a, (ws+1313)
	ret


c01_c64:
	db 115,116,114,105,110,103,32,99,111,110,115,116,97,110,116,0
c01_c65:
	db 115,116,114,105,110,103,32,99,111,110,115,116,97,110,116,32,116,111,111,32,108,111,110,103,0

	; lexer_i_read_string workspace at ws+1310 length ws+3
f98_lexer_i_read_string::
	xor a
	ld (ws+203), a
c01_021d:
	call f90_lexer_i_getchar
	ld (ws+1310), a
	ld (ws+1311), a
	cp 32
	jp nc, c01_0223
;c01_0222:
	ld hl,c01_c64
	call f96_lexer_i_malformed
c01_0223:
;c01_021f:
	ld a, (ws+1311)
	cp 34
;	jp nz, c01_0225
;	jp c01_021e
;c01_0225:
	jp z,c01_021e
	cp 92
	jp nz, c01_0226
	call f97_lexer_i_get_escaped
	ld (ws+1311), a
c01_0226:
;c01_0224:
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
	jp nz, c01_021d ; c01_022b
;c01_022a:
	call f80_StartError
	ld hl,c01_c65
	call f9_print
	call f81_EndError
c01_022b:
;c01_0227:
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
;end_f98_lexer_i_read_string:
	ret


c01_c66:
	db 99,104,97,114,97,99,116,101,114,32,99,111,110,115,116,97,110,116,0

	; malformed workspace at ws+1310 length ws+0
f100_malformed::
	ld hl,c01_c66
	jp   f96_lexer_i_malformed ;	call f96_lexer_i_malformed
;end_f100_malformed:
;	ret


	; lexer_i_read_char workspace at ws+1306 length ws+4
f99_lexer_i_read_char::
	call f90_lexer_i_getchar
	ld (ws+1306), a
	ld (ws+1307), a
	cp 32
	jp c, c01_0231
;c01_0233:
	ld a, (ws+1307)
	cp 39
	jp nz, c01_0232
c01_0231:
	call f100_malformed
c01_0232:
;c01_022c:
	ld a, (ws+1307)
	cp 92
	jp nz, c01_0238
	call f97_lexer_i_get_escaped
	ld (ws+1307), a
c01_0238:
;c01_0234:
	ld a, (ws+1307)
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
;	ld (ws+1309), a
	ld (ws+1307), a
	cp 39
	jp z, c01_023d
;c01_023c:
	call f100_malformed
c01_023d:
;c01_0239:
;end_f99_lexer_i_read_char:
	ret


c01_c67:
	db 105,110,99,108,117,100,101,32,100,105,114,101,99,116,105,118,101,0

	; malformed_include workspace at ws+1309 length ws+0
f102_malformed_include::
	ld hl,c01_c67
	jp   f96_lexer_i_malformed ;	call f96_lexer_i_malformed
;end_f102_malformed_include:
;	ret


	; lexer_i_include workspace at ws+1306 length ws+3
f101_lexer_i_include::
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
;	ld (ws+1306), a
;	ld (ws+1307), a
	cp 34
	jp z, c01_0242
;c01_0241:
	call f102_malformed_include
c01_0242:
;c01_023e:
	call f98_lexer_i_read_string
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
;	ld (ws+1308), a
;	ld (ws+1307), a
	cp 59
	jp z, c01_0247
;c01_0246:
	call f102_malformed_include
c01_0247:
;c01_0243:
	ld hl,ws+75
	jp   f87_LexerIncludeFile ;	call f87_LexerIncludeFile
;end_f101_lexer_i_include:
;	ret


c01_c68:
	db 35,108,105,110,101,32,100,105,114,101,99,116,105,118,101,0

	; lexer_i_line_directive workspace at ws+1306 length ws+4
f103_lexer_i_line_directive::
	call f92_lexer_i_skipwhitespace
	call f95_lexer_i_read_number
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
;	ld (ws+1306), a
;	ld (ws+1307), a
	cp 34
	jp z, c01_024c
;c01_024b:
	ld hl,c01_c68
	call f96_lexer_i_malformed
c01_024c:
;c01_0248:
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
;	ld (ws+1308), hl
	ld d,h
	ld e,l
	ld hl, (ws+72)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
;end_f103_lexer_i_line_directive:
	ret


c01_c69:
	db 108,105,110,101,0

	; LexerReadToken workspace at ws+1294 length ws+12
f88_LexerReadToken::
c01_024d:
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
	ld (ws+1295), a
	ld (ws+1296), a
	cp 35
	jp nz, c01_0253
	xor a
	ld (ws+203), a
	call f93_lexer_i_read_identifier
	ld de,ws+75
	push de
	ld hl,c01_c69
	call f29_StrCmp
;	ld (ws+1297), a
	or a
;	jp nz, c01_0258
;	call f103_lexer_i_line_directive
;c01_0258:
	call z,f103_lexer_i_line_directive
;c01_0254:
c01_0259:
	call f90_lexer_i_getchar
;	ld (ws+1298), a
	ld (ws+1296), a
	cp 10
	jp z, c01_0262
;c01_0265:
	ld a, (ws+1296)
	cp 13
	jp z, c01_0262
;c01_0264:
	ld a, (ws+1296)
	or a
	jp nz, c01_0259 ; c01_0263
c01_0262:
	ld a, (ws+1296)
	ld (ws+74), a
	jp c01_024d ; c01_025a
c01_0263:
;c01_025b:
	jp c01_0259
c01_025a:
	jp c01_024d
c01_0253:
;c01_024f:
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
	jp c01_0266 ; c01_0269
c01_026d:
	ld a, (ws+1296)
	ld (ws+74), a
	ld a,6
	ld (ws+1294), a
c01_0269:
	jp c01_0266
c01_0268:
	cp 60
	jp nz, c01_026e
	call f90_lexer_i_getchar
	ld (ws+1296), a
	cp 60
	jp nz, c01_0270
	ld a,57
	ld (ws+1294), a
	jp c01_0266 ; c01_026f
c01_0270:
	cp 61
	jp nz, c01_0271
	ld a,52
	ld (ws+1294), a
	jp c01_0266 ; c01_026f
c01_0271:
	ld a, (ws+1296)
	ld (ws+74), a
	ld a,51
	ld (ws+1294), a
c01_026f:
	jp c01_0266
c01_026e:
	cp 61
	jp nz, c01_0272
	call f90_lexer_i_getchar
	ld (ws+1296), a
	cp 61
	jp nz, c01_0277
	ld a,55
	ld (ws+1294), a
	jp c01_0266 ; c01_0273
c01_0277:
	ld a, (ws+1296)
	call f91_lexer_i_unparseable
c01_0273:
	jp c01_0266
c01_0272:
	cp 33
	jp nz, c01_0278
	call f90_lexer_i_getchar
	ld (ws+1296), a
	cp 61
	jp nz, c01_027d
	ld a,56
	ld (ws+1294), a
	jp c01_0266 ; c01_0279
c01_027d:
	ld a, (ws+1296)
	call f91_lexer_i_unparseable
c01_0279:
	jp c01_0266
c01_0278:
	cp 62
	jp nz, c01_027e
	call f90_lexer_i_getchar
	ld (ws+1303), a
	ld (ws+1296), a
	cp 62
	jp nz, c01_0280
	ld a,58
	ld (ws+1294), a
	jp c01_0266 ; c01_027f
c01_0280:
	cp 61
	jp nz, c01_0281
	ld a,54
	ld (ws+1294), a
	jp c01_0266 ; c01_027f
c01_0281:
	ld a, (ws+1296)
	ld (ws+74), a
	ld a,53
	ld (ws+1294), a
c01_027f:
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
	jp z, c01_0288
;c01_0287:
	jp c01_0284
c01_0288:
	ld a, (ws+1304)
	and 1
	or a
	jp z, c01_028c
;c01_028b:
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
;c01_028f:
	ld a,1
	ld (ws+203), a
	ld a, (ws+1296)
	ld (ws+75), a
	call f93_lexer_i_read_identifier
	call f94_lexer_i_match_keyword
;	ld (ws+1305), a
	ld (ws+1294), a
	jp c01_0284
c01_0290:
	ld a, (ws+1296)
	call f91_lexer_i_unparseable
c01_0284:
c01_0266:
	ld a, (ws+1294)
	cp 255
	jp nz, c01_024e ; c01_0295
;c01_0294:
	call f101_lexer_i_include
	jp c01_024d ; c01_0291
c01_0295:
	jp c01_024e
c01_0291:
	jp c01_024d
c01_024e:
;end_f88_LexerReadToken:
	ld a, (ws+1294)
	ret


	; CountParameters workspace at ws+1354 length ws+3
f104_CountParameters::
	ld (ws+1354), hl
	xor a
	ld (ws+1356), a
c01_0296:
	ld hl, (ws+1354)
	ld a,h
	or l
	jp z, c01_029b
;c01_029a:
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
	jp c01_0296
c01_029b:
;end_f104_CountParameters:
	ld a, (ws+1356)
	ret


	; GetInputParameter workspace at ws+1373 length ws+5
f105_GetInputParameter::
	ld (ws+1375), a
	pop bc
	pop hl
	ld (ws+1373), hl
	push bc
	push hl
	pop ix
	ld a, (ix+26)
	or a
	jp z, c01_02a0
;c01_029f:
	ld ix, (ws+1373)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1376), hl
c01_02a1:
	ld a, (ws+1375)
	or a
	jp z, c01_029c ; c01_02a6
;c01_02a5:
	ld ix, (ws+1376)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1376), hl
	ld a, (ws+1375)
	dec a
	ld (ws+1375), a
	jp c01_02a1
c01_02a6:
	jp c01_029c
c01_02a0:
	ld ix,0
	ld (ws+1376), ix
c01_029c:
;end_f105_GetInputParameter:
	ld hl, (ws+1376)
	ret


	; GetOutputParameter workspace at ws+1378 length ws+5
f106_GetOutputParameter::
	ld (ws+1380), a
	pop bc
	pop hl
	ld (ws+1378), hl
	push bc
	push hl
	pop ix
	ld a, (ix+27)
	or a
	jp z, c01_02ab
;c01_02aa:
	ld a, (ws+1380)
	ld b,a
	ld ix, (ws+1378)
	ld a, (ix+26)
	add a,b
	ld (ws+1380), a
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1381), hl
c01_02ac:
	ld a, (ws+1380)
	or a
	jp z, c01_02a7 ; c01_02b1
;c01_02b0:
	ld ix, (ws+1381)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1381), hl
	ld a, (ws+1380)
	dec a
	ld (ws+1380), a
	jp c01_02ac
c01_02b1:
	jp c01_02a7
c01_02ab:
	ld ix,0
	ld (ws+1381), ix
c01_02a7:
;end_f106_GetOutputParameter:
	ld hl, (ws+1381)
	ret


	; WidthToIndex workspace at ws+1416 length ws+2
f108_WidthToIndex::
	ld (ws+1416), a
	cp 4
	jp nz, c01_02b3
	ld a,3
	ld (ws+1417), a
	jp c01_02b2
c01_02b3:
	cp 8
	jp nz, c01_02b4
	ld a,4
	ld (ws+1417), a
	jp c01_02b2
c01_02b4:
	ld a, (ws+1416)
	ld (ws+1417), a
c01_02b2:
;end_f108_WidthToIndex:
	ld a, (ws+1417)
	ret


	; MidBltu workspace at ws+1377 length ws+17
f110_MidBltu::
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
;	ld (ws+1391), a
	add 66
	call f109_AllocateNewNode
;	ld (ws+1392), hl
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
;end_f110_MidBltu:
	ld hl, (ws+1389)
	ret


	; MidSubref workspace at ws+1363 length ws+6
f111_MidSubref::
	ld (ws+1363), hl
	ld a,43
	call f109_AllocateNewNode
;	ld (ws+1367), hl
	ld (ws+1365), hl
	ld de, (ws+1363)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f111_MidSubref:
	ld hl, (ws+1365)
	ret


	; MidStartinit workspace at ws+1363 length ws+6
f112_MidStartinit::
	ld (ws+1363), hl
	ld a,6
	call f109_AllocateNewNode
;	ld (ws+1367), hl
	ld (ws+1365), hl
	ld de, (ws+1363)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f112_MidStartinit:
	ld hl, (ws+1365)
	ret


	; MidCall workspace at ws+1378 length ws+10
f113_MidCall::
	ld (ws+1382), hl
	pop bc
	pop hl
	ld (ws+1380), hl
	pop hl
	ld (ws+1378), hl
	push bc
	ld a,29
	call f109_AllocateNewNode
;	ld (ws+1386), hl
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
;end_f113_MidCall:
	ld hl, (ws+1384)
	ret


	; MidEndinit workspace at ws+1355 length ws+4
f114_MidEndinit::
	ld a,15
	call f109_AllocateNewNode
;	ld (ws+1357), hl
;	ld (ws+1355), hl
;end_f114_MidEndinit:
;	ld hl, (ws+1355)
	ret


	; MidInit workspace at ws+1380 length ws+10
f116_MidInit::
	ld (ws+1381), hl
	exx
	ld (ws+1383), hl
	exx
	pop bc
	pop af
	ld (ws+1380), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1387), a
	add 7
	call f109_AllocateNewNode
;	ld (ws+1388), hl
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
;end_f116_MidInit:
	ld hl, (ws+1385)
	ret


	; MidBor workspace at ws+1355 length ws+15
f119_MidBor::
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
;	ld (ws+1368), hl
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
;end_f119_MidBor:
	ld hl, (ws+1366)
	ret


	; MidPoparg workspace at ws+1378 length ws+11
f122_MidPoparg::
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
;	ld (ws+1386), a
	add 35
	call f109_AllocateNewNode
;	ld (ws+1387), hl
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
;end_f122_MidPoparg:
	ld hl, (ws+1384)
	ret


	; MidArg workspace at ws+1360 length ws+15
f123_MidArg::
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
;	ld (ws+1372), a
	add 30
	call f109_AllocateNewNode
;	ld (ws+1373), hl
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
;end_f123_MidArg:
	ld hl, (ws+1370)
	ret


	; MidString workspace at ws+1357 length ws+6
f124_MidString::
	ld (ws+1357), hl
	ld a,41
	call f109_AllocateNewNode
;	ld (ws+1361), hl
	ld (ws+1359), hl
	ld de, (ws+1357)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f124_MidString:
	ld hl, (ws+1359)
	ret


	; MidReturn workspace at ws+1355 length ws+4
f127_MidReturn::
	ld a,28
	call f109_AllocateNewNode
;	ld (ws+1357), hl
;	ld (ws+1355), hl
;end_f127_MidReturn:
;	ld hl, (ws+1355)
	ret


	; MidAsmsymbol workspace at ws+1360 length ws+6
f128_MidAsmsymbol::
	ld (ws+1360), hl
	ld a,20
	call f109_AllocateNewNode
;	ld (ws+1364), hl
	ld (ws+1362), hl
	ld de, (ws+1360)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f128_MidAsmsymbol:
	ld hl, (ws+1362)
	ret


	; MidBeq workspace at ws+1374 length ws+17
f129_MidBeq::
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
;	ld (ws+1388), a
	add 56
	call f109_AllocateNewNode
;	ld (ws+1389), hl
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
;end_f129_MidBeq:
	ld hl, (ws+1386)
	ret


	; MidJump workspace at ws+1361 length ws+6
f130_MidJump::
	ld (ws+1361), hl
	ld a,27
	call f109_AllocateNewNode
;	ld (ws+1365), hl
	ld (ws+1363), hl
	ld de, (ws+1361)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f130_MidJump:
	ld hl, (ws+1363)
	ret


	; MidInitsubref workspace at ws+1369 length ws+6
f131_MidInitsubref::
	ld (ws+1369), hl
	ld a,14
	call f109_AllocateNewNode
;	ld (ws+1373), hl
	ld (ws+1371), hl
	ld de, (ws+1369)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f131_MidInitsubref:
	ld hl, (ws+1371)
	ret


	; MidAsmgroupend workspace at ws+1397 length ws+4
f132_MidAsmgroupend::
	ld a,17
	call f109_AllocateNewNode
;	ld (ws+1399), hl
;	ld (ws+1397), hl
;end_f132_MidAsmgroupend:
;	ld hl, (ws+1397)
	ret


	; MidEndcase workspace at ws+1361 length ws+6
f133_MidEndcase::
	ld (ws+1361), a
	call f108_WidthToIndex
;	ld (ws+1364), a
	add 81
	call f109_AllocateNewNode
;	ld (ws+1365), hl
;	ld (ws+1362), hl
;end_f133_MidEndcase:
;	ld hl, (ws+1362)
	ret


	; MidLabel workspace at ws+1390 length ws+6
f135_MidLabel::
	ld (ws+1390), hl
	ld a,26
	call f109_AllocateNewNode
;	ld (ws+1394), hl
	ld (ws+1392), hl
	ld de, (ws+1390)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f135_MidLabel:
	ld hl, (ws+1392)
	ret


	; MidInitstring workspace at ws+1369 length ws+6
f136_MidInitstring::
	ld (ws+1369), hl
	ld a,12
	call f109_AllocateNewNode
;	ld (ws+1373), hl
	ld (ws+1371), hl
	ld de, (ws+1369)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f136_MidInitstring:
	ld hl, (ws+1371)
	ret


	; MidAsmgroupstart workspace at ws+1397 length ws+4
f137_MidAsmgroupstart::
	ld a,16
	call f109_AllocateNewNode
;	ld (ws+1399), hl
;	ld (ws+1397), hl
;end_f137_MidAsmgroupstart:
;	ld hl, (ws+1397)
	ret


	; MidEndsub workspace at ws+1359 length ws+6
f138_MidEndsub::
	ld (ws+1359), hl
	ld a,5
	call f109_AllocateNewNode
;	ld (ws+1363), hl
	ld (ws+1361), hl
	ld de, (ws+1359)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f138_MidEndsub:
	ld hl, (ws+1361)
	ret


	; MidEndfile workspace at ws+1294 length ws+4
f139_MidEndfile::
	ld a,3
	call f109_AllocateNewNode
;	ld (ws+1296), hl
;	ld (ws+1294), hl
;end_f139_MidEndfile:
;	ld hl, (ws+1294)
	ret


	; MidInitaddress workspace at ws+1369 length ws+8
f140_MidInitaddress::
	ld (ws+1371), hl
	pop bc
	pop hl
	ld (ws+1369), hl
	push bc
	ld a,13
	call f109_AllocateNewNode
;	ld (ws+1375), hl
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
;end_f140_MidInitaddress:
	ld hl, (ws+1373)
	ret


	; MidAsmvalue workspace at ws+1360 length ws+8
f142_MidAsmvalue::
	ld (ws+1360), hl
	exx
	ld (ws+1362), hl
	exx
	ld a,22
	call f109_AllocateNewNode
;	ld (ws+1366), hl
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
;end_f142_MidAsmvalue:
	ld hl, (ws+1364)
	ret


	; MidAsmstart workspace at ws+1355 length ws+4
f143_MidAsmstart::
	ld a,18
	call f109_AllocateNewNode
;	ld (ws+1357), hl
;	ld (ws+1355), hl
;end_f143_MidAsmstart:
;	ld hl, (ws+1355)
	ret


	; MidAddress workspace at ws+1378 length ws+8
f146_MidAddress::
	ld (ws+1380), hl
	pop bc
	pop hl
	ld (ws+1378), hl
	push bc
	ld a,42
	call f109_AllocateNewNode
;	ld (ws+1384), hl
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
;end_f146_MidAddress:
	ld hl, (ws+1382)
	ret


	; MidAsmend workspace at ws+1355 length ws+4
f148_MidAsmend::
	ld a,23
	call f109_AllocateNewNode
;	ld (ws+1357), hl
;	ld (ws+1355), hl
;end_f148_MidAsmend:
;	ld hl, (ws+1355)
	ret


	; MidBlts workspace at ws+1377 length ws+17
f151_MidBlts::
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
;	ld (ws+1391), a
	add 61
	call f109_AllocateNewNode
;	ld (ws+1392), hl
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
;end_f151_MidBlts:
	ld hl, (ws+1389)
	ret


	; MidWhencase workspace at ws+1361 length ws+12
f154_MidWhencase::
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
;	ld (ws+1370), a
	add 76
	call f109_AllocateNewNode
;	ld (ws+1371), hl
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
;end_f154_MidWhencase:
	ld hl, (ws+1368)
	ret


	; MidBand workspace at ws+1355 length ws+15
f155_MidBand::
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
;	ld (ws+1368), hl
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
;end_f155_MidBand:
	ld hl, (ws+1366)
	ret


	; MidDeref workspace at ws+1390 length ws+8
f156_MidDeref::
	ld (ws+1391), hl
	pop bc
	pop af
	ld (ws+1390), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1395), a
	add 44
	call f109_AllocateNewNode
;	ld (ws+1396), hl
	ld (ws+1393), hl
	ld hl, (ws+1391)
	ld ix, (ws+1393)
	ld (ix+9), l
	ld (ix+10), h
;end_f156_MidDeref:
	ld hl, (ws+1393)
	ret


	; MidAsmtext workspace at ws+1355 length ws+6
f158_MidAsmtext::
	ld (ws+1355), hl
	ld a,19
	call f109_AllocateNewNode
;	ld (ws+1359), hl
	ld (ws+1357), hl
	ld de, (ws+1355)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f158_MidAsmtext:
	ld hl, (ws+1357)
	ret


	; MidStartcase workspace at ws+1363 length ws+8
f159_MidStartcase::
	ld (ws+1364), hl
	pop bc
	pop af
	ld (ws+1363), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1368), a
	add 71
	call f109_AllocateNewNode
;	ld (ws+1369), hl
	ld (ws+1366), hl
	ld hl, (ws+1364)
	ld ix, (ws+1366)
	ld (ix+9), l
	ld (ix+10), h
;end_f159_MidStartcase:
	ld hl, (ws+1366)
	ret


	; MidStartfile workspace at ws+1294 length ws+4
f161_MidStartfile::
	ld a,2
	call f109_AllocateNewNode
;	ld (ws+1296), hl
;	ld (ws+1294), hl
;end_f161_MidStartfile:
;	ld hl, (ws+1294)
	ret


	; MidPair workspace at ws+1355 length ws+8
f162_MidPair::
	ld (ws+1357), hl
	pop bc
	pop hl
	ld (ws+1355), hl
	push bc
	ld a,25
	call f109_AllocateNewNode
;	ld (ws+1361), hl
	ld (ws+1359), hl
	ld hl, (ws+1355)
	ld ix, (ws+1359)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1357)
	ld (ix+11), l
	ld (ix+12), h
;end_f162_MidPair:
	ld hl, (ws+1359)
	ret


	; MidEnd workspace at ws+1360 length ws+4
f163_MidEnd::
	ld a,1
	call f109_AllocateNewNode
;	ld (ws+1362), hl
;	ld (ws+1360), hl
;end_f163_MidEnd:
;	ld hl, (ws+1360)
	ret


	; MidConstant workspace at ws+1416 length ws+8
f166_MidConstant::
	ld (ws+1416), hl
	exx
	ld (ws+1418), hl
	exx
	ld a,40
	call f109_AllocateNewNode
;	ld (ws+1422), hl
	ld (ws+1420), hl
	ld de, (ws+1416)
	exx
	ld de, (ws+1418)
	exx
	ld hl, (ws+1420)
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
;end_f166_MidConstant:
	ld hl, (ws+1420)
	ret


	; MidStore workspace at ws+1378 length ws+10
f167_MidStore::
	ld (ws+1381), hl
	pop bc
	pop hl
	ld (ws+1379), hl
	pop af
	ld (ws+1378), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1385), a
	add 49
	call f109_AllocateNewNode
;	ld (ws+1386), hl
	ld (ws+1383), hl
	ld hl, (ws+1379)
	ld ix, (ws+1383)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1381)
	ld (ix+11), l
	ld (ix+12), h
;end_f167_MidStore:
	ld hl, (ws+1383)
	ret


	; MidStartsub workspace at ws+1359 length ws+6
f168_MidStartsub::
	ld (ws+1359), hl
	ld a,4
	call f109_AllocateNewNode
;	ld (ws+1363), hl
	ld (ws+1361), hl
	ld de, (ws+1359)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f168_MidStartsub:
	ld hl, (ws+1361)
	ret


	; MidAsmsubref workspace at ws+1360 length ws+6
f169_MidAsmsubref::
	ld (ws+1360), hl
	ld a,21
	call f109_AllocateNewNode
;	ld (ws+1364), hl
	ld (ws+1362), hl
	ld de, (ws+1360)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f169_MidAsmsubref:
	ld hl, (ws+1362)
	ret


	; AllocateNewNode workspace at ws+1424 length ws+5
f109_AllocateNewNode::
	ld (ws+1424), a
	ld hl, (ws+375)
	ld a,h
	or l
	jp z, c01_02ba
;c01_02b9:
	ld hl, (ws+375)
	ld (ws+1425), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+375), hl
	ld hl, (ws+1425)
	push hl
	ld d,0
	push de
	ld hl,14
	call f8_MemSet
	jp c01_02b6
c01_02ba:
	ld hl,14
	call f75_InternalAlloc
;	ld (ws+1427), hl
	ld (ws+1425), hl
c01_02b6:
	ld a, (ws+1424)
	ld ix, (ws+1425)
	ld (ix+13), a
;end_f109_AllocateNewNode:
	ld hl, (ws+1425)
	ret


	; FreeNode workspace at ws+1424 length ws+2
f171_FreeNode::
	ld (ws+1424), hl
	ld hl, (ws+375)
	ld ix, (ws+1424)
	ld (ix+9), l
	ld (ix+10), h
	push ix
	pop hl
	ld (ws+375), hl
;end_f171_FreeNode:
	ret


	; PurgeAllFreeNodes workspace at ws+1437 length ws+2
f79_PurgeAllFreeNodes::
c01_02bb:
	ld hl, (ws+375)
	ld a,h
	or l
	jp z, c01_02c0
;c01_02bf:
	ld hl, (ws+375)
	ld (ws+1437), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+375), hl
	ld hl, (ws+1437)
	call f40_Free
	jp c01_02bb
c01_02c0:
;end_f79_PurgeAllFreeNodes:
	ret




