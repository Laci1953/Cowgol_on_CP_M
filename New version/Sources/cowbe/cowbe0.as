	psect text

	global ws
	global TOPSTACK
global clcn32
global f10_print_nl
global f16_print_i16
global f17_print_i8
global f18_print_hex_i8
global f20_print_hex_i16
global f22_print_hex_i32
global f26_MemZero
global f27_ArgvInit
global f28_ArgvNext
global f29_StrCmp
global f32_StrLen
global f34_MemCopy
global f38_Alloc
global f4_ExitWithError
global f40_Free
global f41_GetFreeMemory
global f52_FCBOpenOut
global f53_FCBClose
global f55_FCBPos
global f61_FCBGetChar
global f62_FCBPutChar
global f65_FCBPutBlock
global f7_print_char
global f71_FindSubr
global f72_StartError
global f73_EndError
global f74_SimpleError
global f75_CannotOpen
global f76_InternalAlloc
global f78_PurgeAllFreeInstructions
global f79_GetInputParameter
global f8_MemSet
global f80_GetOutputParameter
global f83_AllocateNewNode
global f84_MidcodeName
global f85_FreeNode
global f50_FCBOpenIn
global f9_print
global f478__lsr2
global f479__asl2
global f482__asl4
global f483__asr4
global f494__or4
global f498__cmpu4
global f499__cmps4
global f500__jpde
global f2___main_s016c
global U32toHexaAscii
global Bin2Hex

	ld sp,TOPSTACK
	call f2___main
	ld hl,0
	ld (80H),hl
	rst 0


	; ExitWithError workspace at ws+3183 length ws+0
f4_ExitWithError:
	ld hl,1
	ld (80H),hl
	rst 0 


	; AlignUp workspace at ws+3160 length ws+4
f5_AlignUp:
	ret


	; print_char workspace at ws+3188 length ws+1
f7_print_char:
	ld (ws+3188), a
	cp 10
	jp nz,    _0005
	ld e, 13 
	ld c, 2 
	call 5 
_0005:
	ld a, ( ws+3188 ) 
	ld e, a 
	ld c, 2 
	jp 5 


	; MemSet workspace at ws+3199 length ws+7
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


	; print workspace at ws+3183 length ws+3
f9_print:
	ld (ws+3183), hl
_000d:
	ld hl, (ws+3183)
	ld a,(hl)
	ld (ws+3185), a
	or a
	ret z
	ld a, (ws+3185)
	call f7_print_char
	ld hl, (ws+3183)
	inc hl
	ld (ws+3183), hl
	jp    _000d


	; print_nl workspace at ws+3183 length ws+0
f10_print_nl:
	ld a,10
	jp f7_print_char

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
;### CLCN32 -> Converts 32Bit-Value in ASCII-String (terminated by 0)
;### Input      DE,IX=32bit value, IY=destination address
;### Output     IY=last char in destination string
;### Destroyed AF,BC,DE,HL,IX
clcn32t:dw 1,0,     10,0,     100,0,     1000,0,     10000,0
        dw 86a0h,1, 4240h,0fh, 9680h,98h, 0e100h,5f5h, 0ca00h,3b9ah
clcn32z:ds 4

clcn32: ld (clcn32z),ix
        ld (clcn32z+2),de
        ld ix,clcn32t+36
        ld b,9
        ld c,0
clcn321:ld a,'0'
        or a
clcn322:ld e,(ix+0)
	ld d,(ix+1)
	ld hl,(clcn32z)
  	sbc hl,de
	ld (clcn32z),hl
        ld e,(ix+2)
	ld d,(ix+3)
	ld hl,(clcn32z+2)
	sbc hl,de
	ld (clcn32z+2),hl
        jr c,clcn325
        inc c
        inc a
        jr clcn322
clcn325:ld e,(ix+0)
	ld d,(ix+1)
	ld hl,(clcn32z)
  	add hl,de
	ld (clcn32z),hl
        ld e,(ix+2)
	ld d,(ix+3)
	ld hl,(clcn32z+2)
	adc hl,de
	ld (clcn32z+2),hl
        ld de,-4
        add ix,de
        inc c
        dec c
        jr z,clcn323
        ld (iy+0),a
        inc iy
clcn323:djnz clcn321
        ld a,(clcn32z)
        add '0'
        ld (iy+0),a
        ld (iy+1),0
        ret


	; print_i16 workspace at ws+3042 length ws+2
f16_print_i16:
	ex	de,hl		;DE = value
	ld	hl,ws+3141	;HL=buffer
	call	Bn2Dec
	ld	hl,ws+3141
	jp f9_print


	; print_i8 workspace at ws+3136 length ws+1
f17_print_i8:
				;A = value
	ld	e,a
	ld	d,0		;DE = value
	ld	hl,ws+3141	;HL=buffer
	call	Bn2Dec
	ld	hl,ws+3141
	jp f9_print


	; print_hex_i8 workspace at ws+3185 length ws+3
f18_print_hex_i8:
				;A = value
	call	Bin2Hex
	push	bc
	call	f7_print_char
	pop	bc
	ld	a,c
	jp	f7_print_char


	; print_hex_i16 workspace at ws+3183 length ws+2
f20_print_hex_i16:
				;HL=value
	push	hl
	ld	a,h
	call	f18_print_hex_i8
	pop	hl
	ld	a,l
	jp	f18_print_hex_i8


	; print_hex_i32 workspacec at ws+3136 length ws+4
f22_print_hex_i32:
	exx
	call f20_print_hex_i16	;high
	exx
	jp f20_print_hex_i16	;low
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
ToLower:
	cp 'A'		;less than A, return-it
	ret c
	cp 'Z'+1	;more than Z, return-it
	ret nc
	or 20H		;to lower case
	ret
;
;	unsigned 32 bit to hexa ascii lowercase
;
;	DE,BC = 32 bit number
;	HL = buffer
;
;	returns HL=pointer of final 0
;
U32toHexaAscii:
	xor	a
	ld	(nz_digit_stored),a
	push	bc		;save low part
	ld	a,d
	call	Bin2Hex		;ret A=B, C
	call	InsertOrSkip
	ld	a,c
	call	InsertOrSkip
	ld	a,e
	call	Bin2Hex		;ret A=B, C
	call	InsertOrSkip
	ld	a,c
	call	InsertOrSkip
	pop	de		;restore low part to DE
	ld	a,d
	call	Bin2Hex		;ret A=B, C
	call	InsertOrSkip
	ld	a,c
	call	InsertOrSkip
	ld	a,e
	call	Bin2Hex		;ret A=B, C
	call	InsertOrSkip
	ld	a,c
	call	InsertOrSkip
	ld	a,(nz_digit_stored)
	or	a
	jr	nz,is_stored
	ld	(hl),'0'
	inc	hl
is_stored:
	ld	(hl),0
	ret
;
nz_digit_stored:defs 1
;
InsertOrSkip:
	call	ToLower
	ld	d,a
	ld	a,(nz_digit_stored)
	or	a
	ld	a,d
	jr	nz,store
	cp	'0'
	ret	z
store:
	ld	(hl),a
	inc	hl
	ld	(nz_digit_stored),a
	ret
;	

	; MemZero workspace at ws+3124 length ws+4
f26_MemZero:
	ld (ws+3126), hl	;size
	pop bc
	pop de			;pointer
	push bc
	ex de,hl		;HL=pointer,DE=size
loopz:	ld a,e
	or d
	ret z
	ld (hl),0
	inc hl
	dec de
	jr loopz


	; ArgvInit workspace at ws+3046 length ws+0
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


	; ArgvNext workspace at ws+3046 length ws+3
f28_ArgvNext:
	ld hl, (ws+4)
	ld a,h
	or l
	jp nz,    _005f
	ld hl, (ws+4)
	ld (ws+3046), hl
	jp end_f28_ArgvNext
_005f:
_0060:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+3048), a
	cp 32
	jp nz,   _0061
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp    _0060
_0061:
	ld hl, (ws+4)
	ld (ws+3046), hl
_0067:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+3048), a
	cp 32
	jp z,    _0068
	ld a, (ws+3048)
	cp 10
	jp z,    _0068
	ld a, (ws+3048)
	or a
	jp z,   _0068
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp    _0067
_0068:
	xor a
	ld hl, (ws+4)
	ld (hl),a
	ld a, (ws+3048)
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
	ld hl, (ws+3046)
	ret


	; StrCmp workspace at ws+3128 length ws+5
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


	; StrLen workspace at ws+3136 length ws+7
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


	; MemCopy workspace at ws+3159 length ws+6
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


	; RawAlloc workspace at ws+3136 length ws+24
f37_RawAlloc:
	ld (ws+3136), hl
	inc hl
	inc hl
	call f5_AlignUp
	ld (ws+3142), hl
	ld de,4
	and a
	sbc hl,de
	jp nc,    _00c3
	ld de,4
	ld (ws+3142), de
_00c3:
	ld de, (ws+3142)
	ld hl,7
	add hl,de
	ld a,l
	and 248
	ld l,a
	ld a,h
	and 255
	ld h,a
	ld (ws+3142), hl
	ld hl, (ws+6)
	ld (ws+3144), hl
	ld bc,0
	ld (ws+3146), bc
	ld (ws+3148), bc
	ld (ws+3150), bc
	ld iy,65535
	ld (ws+3152), iy
_00c4:
	ld hl, (ws+3144)
	ld a,h
	or l
	jp z,    _00c9
	ld hl, (ws+3144)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3154), hl
	ld de, (ws+3142)
	and a
	sbc hl,de
	jp c,    _00d0
	ld hl, (ws+3154)
	ld de, (ws+3152)
	and a
	sbc hl,de
	jp nc,    _00d0
	ld hl, (ws+3144)
	ld (ws+3148), hl
	ld hl, (ws+3154)
	ld (ws+3152), hl
	ld hl, (ws+3146)
	ld (ws+3150), hl
	ld de, (ws+3152)
	ld hl, (ws+3142)
	and a
	sbc hl,de
	jp nz,    _00d6
	jp    _00c9
_00d6:
_00d0:
	ld hl, (ws+3144)
	ld (ws+3146), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3144), hl
	jp    _00c4
_00c9:
	ld hl, (ws+3148)
	ld a,h
	or l
	jp nz,    _00db
	ld bc,0
	ld (ws+3138), bc
	jp end_f37_RawAlloc
_00db:
	ld hl, (ws+3152)
	ld de, (ws+3142)
	and a
	sbc hl,de
	ld (ws+3156), hl
	ld de,4
	and a
	sbc hl,de
	jp nc,    _00e0
	ld hl, (ws+3150)
	ld a,h
	or l
	jp z,    _00e5
	ld hl, (ws+3148)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3150)
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _00e1
_00e5:
	ld hl, (ws+3148)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+6), hl
_00e1:
	ld hl, (ws+3152)
	ld (ws+3142), hl
	jp    _00dc
_00e0:
	ld de, (ws+3156)
	ld hl, (ws+3148)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+3148)
	ld h,d
	ld l,e
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ld (ws+3148), hl
_00dc:
	ld hl, (ws+3148)
	ld (ws+3158), hl
	ld de, (ws+3142)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3158)
	inc hl
	inc hl
	ld (ws+3138), hl
	push hl
	ld d,0
	push de
	ld hl, (ws+3142)
	dec hl
	dec hl
	call f8_MemSet
end_f37_RawAlloc:
	ld hl, (ws+3138)
	ret

_c8:
	db 79,117,116,32,111,102,32,109,101,109,111,114,121,0

	; Alloc workspace at ws+3083 length ws+6
f38_Alloc:
	call f37_RawAlloc
	ld a,h
	or l
	ret nz
	ld hl,   _c8
	call f9_print
	jp f4_ExitWithError


	; AddFreeBlock workspace at ws+3142 length ws+8
f39_AddFreeBlock:
	ld (ws+3144), hl
	pop bc
	pop hl
	ld (ws+3142), hl
	push bc
	push hl
	ld h,170
	push hl
	ld hl, (ws+3144)
	call f8_MemSet
	ld hl, (ws+3142)
	ld (ws+3146), hl
	ld de, (ws+3144)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+6)
	ld (ws+3148), hl
	ld hl, (ws+3146)
	ld de, (ws+3148)
	and a
	sbc hl,de
	jp nc,    _00ef
	ld de, (ws+3146)
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
	ld hl, (ws+3148)
	and a
	sbc hl,de
	jp nz,    _00f4
	ld de, (ws+3144)
	ld hl, (ws+3148)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+3146)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3148)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3146)
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _00f0
_00f4:
	ld de, (ws+3148)
	ld hl, (ws+3146)
	ld (hl),e
	inc hl
	ld (hl),d
_00f0:
	ld hl, (ws+3146)
	ld (ws+6), hl
	ret
_00ef:
_00f5:
	ld hl, (ws+3148)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz,    _00fb
	ld de, (ws+3146)
	ld hl, (ws+3148)
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
	ld bc, (ws+3146)
	ld hl, (ws+3148)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld h,b
	ld l,c
	and a
	sbc hl,de
	jp nc,    _0100
	ld de, (ws+3146)
	ld hl, (ws+3144)
	add hl,de
	ex de,hl
	ld hl, (ws+3148)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	and a
	sbc hl,de
	jp nz,    _0105
	ld de, (ws+3144)
	ld hl, (ws+3148)
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
	ld hl, (ws+3146)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3148)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3146)
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _0101
_0105:
	ld hl, (ws+3148)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3146)
	ld (hl),e
	inc hl
	ld (hl),d
_0101:
	ld de, (ws+3146)
	ld hl, (ws+3148)
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _00f6
_0100:
	ld hl, (ws+3148)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3148), hl
	jp    _00f5
_00f6:
	ld de, (ws+3148)
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
	ld hl, (ws+3146)
	and a
	sbc hl,de
	ret nz
	ld hl, (ws+3148)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3146)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+3148)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3146)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3148)
	ld (hl),e
	inc hl
	ld (hl),d
	ret


	; Free workspace at ws+3138 length ws+4
f40_Free:
	ld a,h
	or l
	ret z
	dec hl
	dec hl
	push hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f39_AddFreeBlock
	ret


	; GetFreeMemory workspace at ws+3042 length ws+4
f41_GetFreeMemory:
	ld bc,0
	ld (ws+3042), bc
	ld hl, (ws+6)
	ld (ws+3044), hl
_0110:
	ld hl, (ws+3044)
	ld a,h
	or l
	jp z,    _0115
	ld de, (ws+3042)
	ld hl, (ws+3044)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ld (ws+3042), hl
	ld hl, (ws+3044)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3044), hl
	jp    _0110
_0115:
	ld hl, (ws+3042)
	ret

	; fill workspace at ws+3059 length ws+8
f44_fill:
	ld (ws+3063), a
	pop bc
	pop hl
	ld (ws+3061), hl
	pop hl
	ld (ws+3059), hl
	push bc
_0116:
	ld hl, (ws+3061)
	ld a,(hl)
	ld (ws+3066), a
	cp 32
	jp c,    _011d
	ld a, (ws+3066)
	cp 46
	jp nz,    _011e
_011d:
	ld a,32
	ld (ws+3066), a
	jp    _0118
_011e:
	ld a, (ws+3066)
	cp 42
	jp nz,    _0123
	ld a,63
	ld (ws+3066), a
	jp    _0118
_0123:
	ld hl, (ws+3061)
	inc hl
	ld (ws+3061), hl
_0118:
	ld a, (ws+3066)
	cp 97
	jp c,    _012a
	ld b,122
	ld a, (ws+3066)
	push af
	ld a,b
	pop bc
	cp b
	jp c,    _012a
	ld a, (ws+3066)
	add 224
	ld (ws+3066), a
_012a:
	ld a, (ws+3066)
	ld hl, (ws+3059)
	ld (hl),a
	inc hl
	ld (ws+3059), hl
	ld a, (ws+3063)
	dec a
	ld (ws+3063), a
	or a
	jp nz,    _0116
	ld hl, (ws+3061)
	ret


	; file_i_init workspace at ws+3050 length ws+9
f43_file_i_init:
	ld (ws+3052), hl
	pop bc
	pop hl
	ld (ws+3050), hl
	push bc
	ld hl, (ws+3050)
	push hl
	ld d,0
	push de
	ld hl,166
	call f8_MemSet
	ld hl, (ws+3050)
	inc hl
	inc hl
	inc hl
	push hl
	ld b,32
	push bc
	ld hl,11
	call f8_MemSet
	ld hl, (ws+3050)
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, (ws+3052)
	push hl
	ld a,8
	call f44_fill
	ld (ws+3052), hl
_0131:
	ld hl, (ws+3052)
	ld a,(hl)
	ld (ws+3056), a
	cp 32
	jp c,    _0132
	ld a, (ws+3056)
	cp 46
	jp z,   _0132
	ld hl, (ws+3052)
	inc hl
	ld (ws+3052), hl
	jp    _0131
_0132:
	ld a, (ws+3056)
	cp 46
	jp nz,    _013f
	ld de, (ws+3050)
	ld hl,11
	add hl,de
	push hl
	ld hl, (ws+3052)
	inc hl
	push hl
	ld a,3
	call f44_fill
	ld (ws+3052), hl
_013f:
	ld ix, (ws+3050)
	ld (ix+35), 255
	ld (ix+36), 255
	ld a,127
	push ix
	pop hl
	ld (hl),a
	ret


	; fcb_i_gbpb workspace at ws+3199 length ws+7
f45_fcb_i_gbpb:
	ld (ws+3201), a
	pop bc
	pop hl
	ld (ws+3199), hl
	push bc
	inc hl
	inc hl
	ld (ws+3202), hl
	ld hl, (ws+3199)
	ld de,38
	add hl,de
	ld (ws+3204), hl
	ld c, 26 
	ld de, ( ws+3204 ) 
	call 5 
	ld a, ( ws+3201 ) 
	ld c, a 
	ld de, ( ws+3202 ) 
	jp 5 


	; fcb_i_blockin workspace at ws+3197 length ws+2
f46_fcb_i_blockin:
	ld (ws+3197), hl
	ld de,38
	add hl,de
	push hl
	ld d,0
	push de
	ld hl,128
	call f8_MemSet
	ld hl, (ws+3197)
	push hl
	ld a,33
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+3197)
	inc hl
	ld (hl),a
	ret


	; fcb_i_blockout workspace at ws+3197 length ws+2
f47_fcb_i_blockout:
	ld (ws+3197), hl
	inc hl
	ld a,(hl)
	or a
	ret z
	ld hl, (ws+3197)
	push hl
	ld a,34
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+3197)
	inc hl
	ld (hl),a
	ret


	; fcb_i_changeblock workspace at ws+3193 length ws+4
f48_fcb_i_changeblock:
	ld (ws+3195), hl
	pop bc
	pop hl
	ld (ws+3193), hl
	push bc
	ld de, (ws+3195)
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	and a
	sbc hl,de
	ret z
	ld hl, (ws+3193)
	call f47_fcb_i_blockout
	ld hl, (ws+3195)
	ld ix, (ws+3193)
	ld (ix+35), l
	ld (ix+36), h
	push ix
	pop hl
	jp f46_fcb_i_blockin


	; fcb_i_convert_a_to_error workspace at ws+3050 length ws+0
f49_fcb_i_convert_a_to_error:
	cp 0ffh 
	ld a, 0 
	ret nz 
	inc a 
	ret


	; FCBOpenIn workspace at ws+3043 length ws+7
f50_FCBOpenIn:
	ld (ws+3045), hl
	pop bc
	pop hl
	ld (ws+3043), hl
	push bc
	push hl
	ld hl, (ws+3045)
	call f43_file_i_init
	ld hl, (ws+3043)
	inc hl
	inc hl
	ld (ws+3048), hl
	ld c, 15 
	ld de, ( ws+3048 ) 
	call 5 
	jp f49_fcb_i_convert_a_to_error 


	; FCBOpenOut workspace at ws+3043 length ws+7
f52_FCBOpenOut:
	ld (ws+3045), hl
	pop bc
	pop hl
	ld (ws+3043), hl
	push bc
	push hl
	ld hl, (ws+3045)
	call f43_file_i_init
	ld hl, (ws+3043)
	inc hl
	inc hl
	ld (ws+3048), hl
	ld c, 19 
	ld de, ( ws+3048 ) 
	call 5 
	ld c, 22 
	ld de, ( ws+3048 ) 
	call 5 
	jp f49_fcb_i_convert_a_to_error 


	; FCBClose workspace at ws+3042 length ws+5
f53_FCBClose:
	ld (ws+3042), hl
	call f47_fcb_i_blockout
	ld hl, (ws+3042)
	inc hl
	inc hl
	ld (ws+3045), hl
	ld c, 16 
	ld de, ( ws+3045 ) 
	call 5 
	jp f49_fcb_i_convert_a_to_error 


	; FCBPos workspace at ws+3093 length ws+6
f55_FCBPos:
	ld (ws+3093), hl
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	exx
	ld hl,0
	exx
	ld a,7
	call f482__asl4
	ex de,hl
	exx
	ex de,hl
	exx
	ld hl, (ws+3093)
	ld a,(hl)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	call f494__or4
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
	ld (ws+3095), hl
	exx
	ld (ws+3097), hl
	exx
	ld hl, (ws+3095)
	exx
	ld hl, (ws+3097)
	exx
	ret


	; fcb_i_nextchar workspace at ws+3191 length ws+2
f60_fcb_i_nextchar:
	ld (ws+3191), hl
	ld a,(hl)
	inc a
	ld (hl),a
	ld a,(hl)
	cp 128
	ret nz
	ld hl, (ws+3191)
	push hl
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	inc hl
	call f48_fcb_i_changeblock
	xor a
	ld hl, (ws+3191)
	ld (hl),a
	ret


	; FCBGetChar workspace at ws+3091 length ws+3
f61_FCBGetChar:
	ld (ws+3091), hl
	call f60_fcb_i_nextchar
	ld hl, (ws+3091)
	ld de,38
	add hl,de
	ex de,hl
	ld hl, (ws+3091)
	ld a,(hl)
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
	ret


	; FCBPutChar workspace at ws+3188 length ws+3
f62_FCBPutChar:
	ld (ws+3190), a
	pop bc
	pop hl
	ld (ws+3188), hl
	push bc
	call f60_fcb_i_nextchar
	ld a, (ws+3190)
	push af
	ld hl, (ws+3188)
	ld de,38
	add hl,de
	ex de,hl
	ld hl, (ws+3188)
	ld a,(hl)
	ld l,a
	ld h,0
	add hl,de
	pop af
	ld (hl),a
	ld a,1
	ld hl, (ws+3188)
	inc hl
	ld (hl),a
	ret


	; FCBPutBlock workspace at ws+3182 length ws+6
f65_FCBPutBlock:
	ld (ws+3186), hl
	pop bc
	pop hl
	ld (ws+3184), hl
	pop hl
	ld (ws+3182), hl
	push bc
_015c:
	ld hl, (ws+3186)
	ld a,h
	or l
	ret z
	ld hl, (ws+3182)
	push hl
	ld hl, (ws+3184)
	ld a,(hl)
	call f62_FCBPutChar
	ld hl, (ws+3184)
	inc hl
	ld (ws+3184), hl
	ld hl, (ws+3186)
	dec hl
	ld (ws+3186), hl
	jp    _015c

	; MidReader workspace at ws+3066 length ws+2
f66_MidReader:
	ret

_c9:
	db 101,114,114,111,114,58,32,0

	; StartError workspace at ws+3183 length ws+0
f72_StartError:
	ld hl,   _c9
	jp f9_print


	; EndError workspace at ws+3183 length ws+0
f73_EndError:
	call f10_print_nl
	jp f4_ExitWithError


	; SimpleError workspace at ws+3142 length ws+2
f74_SimpleError:
	ld (ws+3142), hl
	call f72_StartError
	ld hl, (ws+3142)
	call f9_print
	jp f73_EndError


_c10:
	db 117,110,97,98,108,101,32,116,111,32,111,112,101,110,32,39,0
_c11:
	db 39,0

	; CannotOpen workspace at ws+3043 length ws+2
f75_CannotOpen:
	ld (ws+3043), hl
	call f72_StartError
	ld hl,   _c10
	call f9_print
	ld hl, (ws+3043)
	call f9_print
	ld hl,   _c11
	call f9_print
	jp f73_EndError


_c12:
	db 79,117,116,32,111,102,32,109,101,109,111,114,121,10,0

	; InternalAlloc workspace at ws+3128 length ws+8
f76_InternalAlloc:
	ld (ws+3128), hl
	call f37_RawAlloc
	ld a,h
	or l
	ret nz
	call f77_PurgeAllFreeNodes
	call f78_PurgeAllFreeInstructions
	ld hl, (ws+3128)
	call f37_RawAlloc
	ld a,h
	or l
	ret nz
	ld hl,   _c12
	call f9_print
	jp f4_ExitWithError

_c13:
	db 112,97,114,97,109,0
_c14:
	db 105,121,0
_c15:
	db 105,120,0
_c16:
	db 98,99,98,99,0
_c17:
	db 100,101,100,101,0
_c18:
	db 104,108,104,108,0
_c19:
	db 98,99,0
_c20:
	db 100,101,0
_c21:
	db 104,108,0
_c22:
	db 108,0
_c23:
	db 104,0
_c24:
	db 101,0
_c25:
	db 100,0
_c26:
	db 99,0
_c27:
	db 98,0
_c28:
	db 97,0

f2___main_s016c:
	dw    _c13
	dw 32768
	dw 32768
	dw 32768
	db 1
	dw    _c14
	dw 16384
	dw 16384
	dw 25472
	db 0
	dw    _c15
	dw 8192
	dw 8192
	dw 25472
	db 0
	dw    _c16
	dw 4096
	dw 4614
	dw 7168
	db 0
	dw    _c17
	dw 2048
	dw 2328
	dw 7168
	db 0
	dw    _c18
	dw 1024
	dw 1248
	dw 7168
	db 0
	dw    _c19
	dw 512
	dw 4614
	dw 25472
	db 0
	dw    _c20
	dw 256
	dw 2328
	dw 25472
	db 0
	dw    _c21
	dw 128
	dw 1248
	dw 25472
	db 0
	dw    _c22
	dw 64
	dw 64
	dw 64
	db 0
	dw    _c23
	dw 32
	dw 1248
	dw 43
	db 0
	dw    _c24
	dw 16
	dw 16
	dw 16
	db 0
	dw    _c25
	dw 8
	dw 2328
	dw 43
	db 0
	dw    _c26
	dw 4
	dw 4
	dw 4
	db 0
	dw    _c27
	dw 2
	dw 4614
	dw 43
	db 0
	dw    _c28
	dw 1
	dw 1
	dw 43
	db 0


	; GetInputParameter workspace at ws+3124 length ws+5
f79_GetInputParameter:
	ld (ws+3126), a
	pop bc
	pop hl
	ld (ws+3124), hl
	push bc
	ld bc,0
	ld (ws+3127), bc
	push hl
	pop ix
	ld a, (ix+12)
	or a
	jp z,    _0171
	ld ix, (ws+3124)
	ld e, (ix+8)
	ld d, (ix+9)
	ld a, (ws+3126)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3127), hl
_0171:
	ld hl, (ws+3127)
	ret


	; GetOutputParameter workspace at ws+3124 length ws+5
f80_GetOutputParameter:
	ld (ws+3126), a
	pop bc
	pop hl
	ld (ws+3124), hl
	push bc
	ld bc,0
	ld (ws+3127), bc
	push hl
	pop ix
	ld a, (ix+13)
	or a
	jp z,    _0176
	ld ix, (ws+3124)
	ld e, (ix+10)
	ld d, (ix+11)
	ld a, (ws+3126)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3127), hl
_0176:
	ld hl, (ws+3127)
	ret

_c30:
	db 69,78,68,0
_c31:
	db 83,84,65,82,84,70,73,76,69,0
_c32:
	db 69,78,68,70,73,76,69,0
_c33:
	db 83,84,65,82,84,83,85,66,0
_c34:
	db 69,78,68,83,85,66,0
_c35:
	db 83,84,65,82,84,73,78,73,84,0
_c36:
	db 73,78,73,84,48,0
_c37:
	db 73,78,73,84,49,0
_c38:
	db 73,78,73,84,50,0
_c39:
	db 73,78,73,84,52,0
_c40:
	db 73,78,73,84,56,0
_c41:
	db 73,78,73,84,83,84,82,73,78,71,0
_c42:
	db 73,78,73,84,65,68,68,82,69,83,83,0
_c43:
	db 73,78,73,84,83,85,66,82,69,70,0
_c44:
	db 69,78,68,73,78,73,84,0
_c45:
	db 65,83,77,71,82,79,85,80,83,84,65,82,84,0
_c46:
	db 65,83,77,71,82,79,85,80,69,78,68,0
_c47:
	db 65,83,77,83,84,65,82,84,0
_c48:
	db 65,83,77,84,69,88,84,0
_c49:
	db 65,83,77,83,89,77,66,79,76,0
_c50:
	db 65,83,77,83,85,66,82,69,70,0
_c51:
	db 65,83,77,86,65,76,85,69,0
_c52:
	db 65,83,77,69,78,68,0
_c53:
	db 70,65,76,76,66,65,67,75,0
_c54:
	db 80,65,73,82,0
_c55:
	db 76,65,66,69,76,0
_c56:
	db 74,85,77,80,0
_c57:
	db 82,69,84,85,82,78,0
_c58:
	db 67,65,76,76,0
_c59:
	db 65,82,71,48,0
_c60:
	db 65,82,71,49,0
_c61:
	db 65,82,71,50,0
_c62:
	db 65,82,71,52,0
_c63:
	db 65,82,71,56,0
_c64:
	db 80,79,80,65,82,71,48,0
_c65:
	db 80,79,80,65,82,71,49,0
_c66:
	db 80,79,80,65,82,71,50,0
_c67:
	db 80,79,80,65,82,71,52,0
_c68:
	db 80,79,80,65,82,71,56,0
_c69:
	db 67,79,78,83,84,65,78,84,0
_c70:
	db 83,84,82,73,78,71,0
_c71:
	db 65,68,68,82,69,83,83,0
_c72:
	db 83,85,66,82,69,70,0
_c73:
	db 68,69,82,69,70,48,0
_c74:
	db 68,69,82,69,70,49,0
_c75:
	db 68,69,82,69,70,50,0
_c76:
	db 68,69,82,69,70,52,0
_c77:
	db 68,69,82,69,70,56,0
_c78:
	db 83,84,79,82,69,48,0
_c79:
	db 83,84,79,82,69,49,0
_c80:
	db 83,84,79,82,69,50,0
_c81:
	db 83,84,79,82,69,52,0
_c82:
	db 83,84,79,82,69,56,0
_c83:
	db 66,65,78,68,0
_c84:
	db 66,79,82,0
_c85:
	db 66,69,81,48,0
_c86:
	db 66,69,81,49,0
_c87:
	db 66,69,81,50,0
_c88:
	db 66,69,81,52,0
_c89:
	db 66,69,81,56,0
_c90:
	db 66,76,84,83,48,0
_c91:
	db 66,76,84,83,49,0
_c92:
	db 66,76,84,83,50,0
_c93:
	db 66,76,84,83,52,0
_c94:
	db 66,76,84,83,56,0
_c95:
	db 66,76,84,85,48,0
_c96:
	db 66,76,84,85,49,0
_c97:
	db 66,76,84,85,50,0
_c98:
	db 66,76,84,85,52,0
_c99:
	db 66,76,84,85,56,0
_c100:
	db 83,84,65,82,84,67,65,83,69,48,0
_c101:
	db 83,84,65,82,84,67,65,83,69,49,0
_c102:
	db 83,84,65,82,84,67,65,83,69,50,0
_c103:
	db 83,84,65,82,84,67,65,83,69,52,0
_c104:
	db 83,84,65,82,84,67,65,83,69,56,0
_c105:
	db 87,72,69,78,67,65,83,69,48,0
_c106:
	db 87,72,69,78,67,65,83,69,49,0
_c107:
	db 87,72,69,78,67,65,83,69,50,0
_c108:
	db 87,72,69,78,67,65,83,69,52,0
_c109:
	db 87,72,69,78,67,65,83,69,56,0
_c110:
	db 69,78,68,67,65,83,69,48,0
_c111:
	db 69,78,68,67,65,83,69,49,0
_c112:
	db 69,78,68,67,65,83,69,50,0
_c113:
	db 69,78,68,67,65,83,69,52,0
_c114:
	db 69,78,68,67,65,83,69,56,0
_c115:
	db 67,65,83,84,49,48,0
_c116:
	db 67,65,83,84,49,49,0
_c117:
	db 67,65,83,84,49,50,0
_c118:
	db 67,65,83,84,49,52,0
_c119:
	db 67,65,83,84,49,56,0
_c120:
	db 67,65,83,84,50,48,0
_c121:
	db 67,65,83,84,50,49,0
_c122:
	db 67,65,83,84,50,50,0
_c123:
	db 67,65,83,84,50,52,0
_c124:
	db 67,65,83,84,50,56,0
_c125:
	db 67,65,83,84,52,48,0
_c126:
	db 67,65,83,84,52,49,0
_c127:
	db 67,65,83,84,52,50,0
_c128:
	db 67,65,83,84,52,52,0
_c129:
	db 67,65,83,84,52,56,0
_c130:
	db 67,65,83,84,56,48,0
_c131:
	db 67,65,83,84,56,49,0
_c132:
	db 67,65,83,84,56,50,0
_c133:
	db 67,65,83,84,56,52,0
_c134:
	db 67,65,83,84,56,56,0
_c135:
	db 78,79,84,48,0
_c136:
	db 78,79,84,49,0
_c137:
	db 78,79,84,50,0
_c138:
	db 78,79,84,52,0
_c139:
	db 78,79,84,56,0
_c140:
	db 78,69,71,48,0
_c141:
	db 78,69,71,49,0
_c142:
	db 78,69,71,50,0
_c143:
	db 78,69,71,52,0
_c144:
	db 78,69,71,56,0
_c145:
	db 76,83,72,73,70,84,48,0
_c146:
	db 76,83,72,73,70,84,49,0
_c147:
	db 76,83,72,73,70,84,50,0
_c148:
	db 76,83,72,73,70,84,52,0
_c149:
	db 76,83,72,73,70,84,56,0
_c150:
	db 82,83,72,73,70,84,85,48,0
_c151:
	db 82,83,72,73,70,84,85,49,0
_c152:
	db 82,83,72,73,70,84,85,50,0
_c153:
	db 82,83,72,73,70,84,85,52,0
_c154:
	db 82,83,72,73,70,84,85,56,0
_c155:
	db 82,83,72,73,70,84,83,48,0
_c156:
	db 82,83,72,73,70,84,83,49,0
_c157:
	db 82,83,72,73,70,84,83,50,0
_c158:
	db 82,83,72,73,70,84,83,52,0
_c159:
	db 82,83,72,73,70,84,83,56,0
_c160:
	db 83,85,66,48,0
_c161:
	db 83,85,66,49,0
_c162:
	db 83,85,66,50,0
_c163:
	db 83,85,66,52,0
_c164:
	db 83,85,66,56,0
_c165:
	db 68,73,86,85,48,0
_c166:
	db 68,73,86,85,49,0
_c167:
	db 68,73,86,85,50,0
_c168:
	db 68,73,86,85,52,0
_c169:
	db 68,73,86,85,56,0
_c170:
	db 68,73,86,83,48,0
_c171:
	db 68,73,86,83,49,0
_c172:
	db 68,73,86,83,50,0
_c173:
	db 68,73,86,83,52,0
_c174:
	db 68,73,86,83,56,0
_c175:
	db 82,69,77,85,48,0
_c176:
	db 82,69,77,85,49,0
_c177:
	db 82,69,77,85,50,0
_c178:
	db 82,69,77,85,52,0
_c179:
	db 82,69,77,85,56,0
_c180:
	db 82,69,77,83,48,0
_c181:
	db 82,69,77,83,49,0
_c182:
	db 82,69,77,83,50,0
_c183:
	db 82,69,77,83,52,0
_c184:
	db 82,69,77,83,56,0
_c185:
	db 65,68,68,48,0
_c186:
	db 65,68,68,49,0
_c187:
	db 65,68,68,50,0
_c188:
	db 65,68,68,52,0
_c189:
	db 65,68,68,56,0
_c190:
	db 77,85,76,48,0
_c191:
	db 77,85,76,49,0
_c192:
	db 77,85,76,50,0
_c193:
	db 77,85,76,52,0
_c194:
	db 77,85,76,56,0
_c195:
	db 65,78,68,48,0
_c196:
	db 65,78,68,49,0
_c197:
	db 65,78,68,50,0
_c198:
	db 65,78,68,52,0
_c199:
	db 65,78,68,56,0
_c200:
	db 79,82,48,0
_c201:
	db 79,82,49,0
_c202:
	db 79,82,50,0
_c203:
	db 79,82,52,0
_c204:
	db 79,82,56,0
_c205:
	db 69,79,82,48,0
_c206:
	db 69,79,82,49,0
_c207:
	db 69,79,82,50,0
_c208:
	db 69,79,82,52,0
_c209:
	db 69,79,82,56,0

f84_MidcodeName_s017a:
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
	dw    _c48
	dw    _c49
	dw    _c50
	dw    _c51
	dw    _c52
	dw    _c53
	dw    _c54
	dw    _c55
	dw    _c56
	dw    _c57
	dw    _c58
	dw    _c59
	dw    _c60
	dw    _c61
	dw    _c62
	dw    _c63
	dw    _c64
	dw    _c65
	dw    _c66
	dw    _c67
	dw    _c68
	dw    _c69
	dw    _c70
	dw    _c71
	dw    _c72
	dw    _c73
	dw    _c74
	dw    _c75
	dw    _c76
	dw    _c77
	dw    _c78
	dw    _c79
	dw    _c80
	dw    _c81
	dw    _c82
	dw    _c83
	dw    _c84
	dw    _c85
	dw    _c86
	dw    _c87
	dw    _c88
	dw    _c89
	dw    _c90
	dw    _c91
	dw    _c92
	dw    _c93
	dw    _c94
	dw    _c95
	dw    _c96
	dw    _c97
	dw    _c98
	dw    _c99
	dw    _c100
	dw    _c101
	dw    _c102
	dw    _c103
	dw    _c104
	dw    _c105
	dw    _c106
	dw    _c107
	dw    _c108
	dw    _c109
	dw    _c110
	dw    _c111
	dw    _c112
	dw    _c113
	dw    _c114
	dw    _c115
	dw    _c116
	dw    _c117
	dw    _c118
	dw    _c119
	dw    _c120
	dw    _c121
	dw    _c122
	dw    _c123
	dw    _c124
	dw    _c125
	dw    _c126
	dw    _c127
	dw    _c128
	dw    _c129
	dw    _c130
	dw    _c131
	dw    _c132
	dw    _c133
	dw    _c134
	dw    _c135
	dw    _c136
	dw    _c137
	dw    _c138
	dw    _c139
	dw    _c140
	dw    _c141
	dw    _c142
	dw    _c143
	dw    _c144
	dw    _c145
	dw    _c146
	dw    _c147
	dw    _c148
	dw    _c149
	dw    _c150
	dw    _c151
	dw    _c152
	dw    _c153
	dw    _c154
	dw    _c155
	dw    _c156
	dw    _c157
	dw    _c158
	dw    _c159
	dw    _c160
	dw    _c161
	dw    _c162
	dw    _c163
	dw    _c164
	dw    _c165
	dw    _c166
	dw    _c167
	dw    _c168
	dw    _c169
	dw    _c170
	dw    _c171
	dw    _c172
	dw    _c173
	dw    _c174
	dw    _c175
	dw    _c176
	dw    _c177
	dw    _c178
	dw    _c179
	dw    _c180
	dw    _c181
	dw    _c182
	dw    _c183
	dw    _c184
	dw    _c185
	dw    _c186
	dw    _c187
	dw    _c188
	dw    _c189
	dw    _c190
	dw    _c191
	dw    _c192
	dw    _c193
	dw    _c194
	dw    _c195
	dw    _c196
	dw    _c197
	dw    _c198
	dw    _c199
	dw    _c200
	dw    _c201
	dw    _c202
	dw    _c203
	dw    _c204
	dw    _c205
	dw    _c206
	dw    _c207
	dw    _c208
	dw    _c209


	; MidcodeName workspace at ws+3136 length ws+3
f84_MidcodeName:
	ld de,f84_MidcodeName_s017a
	dec a
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ret


	; AllocateNewNode workspace at ws+3112 length ws+5
f83_AllocateNewNode:
	ld (ws+3112), a
	ld hl, (ws+52)
	ld a,h
	or l
	jp z,    _017f
	ld hl, (ws+52)
	ld (ws+3113), hl
	push hl
	pop ix
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+52), hl
	ld hl, (ws+3113)
	push hl
	ld d,0
	push de
	ld hl,26
	call f8_MemSet
	jp    _017b
_017f:
	ld hl,26
	call f76_InternalAlloc
	ld (ws+3113), hl
_017b:
	ld a, (ws+3112)
	ld ix, (ws+3113)
	ld (ix+25), a
	ld hl, (ws+3113)
	ret


	; FreeNode workspace at ws+3081 length ws+2
f85_FreeNode:
	ld (ws+3081), hl
	ld hl, (ws+52)
	ld ix, (ws+3081)
	ld (ix+11), l
	ld (ix+12), h
	push ix
	pop hl
	ld (ws+52), hl
	ret


	; PurgeAllFreeNodes workspace at ws+3136 length ws+2
f77_PurgeAllFreeNodes:
_0180:
	ld hl, (ws+52)
	ld a,h
	or l
	ret z
	ld hl, (ws+52)
	ld (ws+3136), hl
	push hl
	pop ix
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+52), hl
	ld hl, (ws+3136)
	call f40_Free
	jp    _0180


_c391:
	db 67,79,87,66,69,58,32,0
_c392:
	db 100,111,110,101,58,32,0

	; __main workspace at ws+0 length ws+3040
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
	ld bc,0
	ld (ws+8), bc
	ld (ws+10), bc
	ld (ws+14), bc
	ld (ws+16), bc
	ld (ws+52), bc
	ld (ws+2268), bc
	ld (ws+2286), bc
	ld (ws+3000), bc
	ld (ws+3002), bc
	ld (ws+3004), bc
	ld bc,ws+18
	ld (ws+50), bc
	xor a
	ld (ws+2288), a
	ld (ws+2999), a
	ld de,ws+2615
	push de
	ld hl,192
	call f26_MemZero
	ld bc,ws+2807
	push bc
	ld hl,192
	call f26_MemZero
	ld hl,   _c391
	call f9_print
	call f471_PrintFreeMemory
	call f473_ParseArguments
	ld hl, (ws+8)
	call f127_InputterOpenfile
	ld hl, (ws+10)
	call f114_EmitterOpenfile
	call f470_ProcessFile
	call f115_EmitterClosefile
	call f128_InputterClosefile
	ld hl,   _c392
	call f9_print
	jp f471_PrintFreeMemory


    ; _lsr1
f475__lsr1:
    dec b
    ret m
    srl a
    jp f475__lsr1

    ; _lsr2
f478__lsr2:
    dec a
    ret m
    srl h
    rr l
    jp f478__lsr2

    ; _asl2
f479__asl2:
    dec a
    ret m
    add hl, hl
    jp f479__asl2

    ; _lsr4
f481__lsr4:
    dec a
    ret m
    exx
    srl h
    rr l
    exx
    rr h
    rr l
    jp f481__lsr4

    ; _asl4
f482__asl4:
    dec a
    ret m
    add hl, hl
    exx
    adc hl, hl
    exx
    jp f482__asl4

    ; _asr4
f483__asr4:
    dec a
    ret m
    exx
    sra h
    rr l
    exx
    rr h
    rr l
    jp f483__asr4

    ; _dvrmu4
f491__dvrmu4:
    ld a, 32            ; bit count
    and a               ; reset carry
    sbc hl, hl          ; reset remainder
    exx
    sbc hl, hl
    exx
    jp f491__dvrmu4_entry
f491__dvrmu4_loop1:
    add hl, de
    exx
    adc hl, de
    exx
f491__dvrmu4_loop2:
    dec a
    ret z
f491__dvrmu4_entry:
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
    jp c, f491__dvrmu4_loop1      ; if remainder < RHS, undo add and go round again
    inc c               ; we know the bottom bit is clear
    jp f491__dvrmu4_loop2

    ; _or4
f494__or4:
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

    ; _cmpu4
f498__cmpu4:
    and a               ; clear carry
    sbc hl, de
    ret nz
    exx
    sbc hl, de
    exx
    ret

    ; _cmps4
f499__cmps4:
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
f500__jpde:
    push de
    ret
 


global _exit
_exit: rst 0
psect data
ws:
defs 3206
psect bss
defs 128
TOPSTACK:
