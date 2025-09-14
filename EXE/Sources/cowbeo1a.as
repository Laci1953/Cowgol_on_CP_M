	psect text

 global f2___main_s016c
 global f4_ExitWithError
 global f7_print_char
 global f8_MemSet
 global f9_print
 global f10_print_nl
 global f11_UIToA
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
 global f40_Free
 global f41_GetFreeMemory
 global f50_FCBOpenIn
 global f52_FCBOpenOut
 global f53_FCBClose
 global f55_FCBPos
 global f61_FCBGetChar
 global f65_FCBPutBlock
 global f71_FindSubr
 global f72_StartError
 global f73_EndError
 global f74_SimpleError
 global f75_CannotOpen
 global f76_InternalAlloc
 global f78_PurgeAllFreeInstructions
 global f79_GetInputParameter
 global f80_GetOutputParameter
 global f83_AllocateNewNode
 global f84_MidcodeName
 global f85_FreeNode
 global f86_WriteB8
 global f87_WriteB16
 global f88_FlushCurrentStream
 global f89_E_b8
 global f90_E_b16
 global f92_E_space
 global f93_E_comma
 global f94_E_tab
 global f95_E_nl
 global f98_E
 global f99_E_u32
 global f100_E_u16
 global f101_E_u8
 global f110_E_subref
 global f111_E_wsref
 global f109_E_labelref
 global f102_E_i8
 global f103_E_i16
 global f112_EmitterOpenStream
 global f113_EmitterCloseStream
 global f114_EmitterOpenfile
 global f115_EmitterClosefile
 global f116_EmitterDeclareSubroutine
 global f117_EmitterDeclareExternalSubr
 global f118_EmitterReferenceSubroutine

	ld sp, TOP+128
	call f2___main
	ld hl,0
	ld (80h),hl
	rst 0

	; ExitWithError workspace at ws+3183 length ws+0
f4_ExitWithError:
	ld hl,1
	ld (80h),hl
	rst 0 
;end_f4_ExitWithError:
	ret

	; AlignUp workspace at ws+3160 length ws+4
f5_AlignUp:
;	ld (ws+3160), hl
;	ld (ws+3162), hl
;end_f5_AlignUp:
;	ld hl, (ws+3162)
	ret


	; print_char workspace at ws+3188 length ws+1
f7_print_char:
	ld (ws+3188), a
	cp 10
	jp nz, c01_0005
	ld e, 13 
	ld c, 2 
	call 5 
c01_0005:
;c01_0001:
	ld a, ( ws+3188 ) 
	ld e, a 
	ld c, 2 
	jp   5  ;	call 5 
;end_f7_print_char:
;	ret


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
c01_000d:
	ld hl, (ws+3183)
	ld a,(hl)
	ld (ws+3185), a
	or a
;	jp nz, c01_0013
;	ret
;c01_0013:
	ret z
;c01_000f:
	ld a, (ws+3185)
	call f7_print_char
	ld hl, (ws+3183)
	inc hl
	ld (ws+3183), hl
	jp c01_000d
;c01_000e:
;end_f9_print:
	ret


	; print_nl workspace at ws+3183 length ws+0
f10_print_nl:
	ld a,10
	jp   f7_print_char ;	call f7_print_char
;end_f10_print_nl:
;	ret


	; UIToA workspace at ws+3176 length ws+18
f11_UIToA:
	ld (ws+3181), hl
	pop bc
	pop af
	ld (ws+3180), a
	pop hl
	ld (ws+3176), hl
	pop hl
	ld (ws+3178), hl
	push bc
	ld hl, (ws+3181)
	ld (ws+3183), hl
c01_0014:
	ld bc, (ws+3176)
	exx
	ld bc, (ws+3178)
	exx
	ld a, (ws+3180)
	ld e,a
	xor a
	ld d,a
	exx
	ld e,a
	ld d,a
	exx
	call f491__dvrmu4
	ld (ws+3185), hl
	exx
	ld (ws+3187), hl
	exx
	ld bc, (ws+3176)
	exx
	ld bc, (ws+3178)
	exx
	ld a, (ws+3180)
	ld e,a
	xor a
	ld d,a
	exx
	ld e,a
	ld d,a
	exx
	call f491__dvrmu4
	ld (ws+3176), bc
	exx
	ld (ws+3178), bc
	exx
	ld hl, (ws+3185)
	exx
	ld hl, (ws+3187)
	exx
	ld de,10
	exx
	ld de,0
	exx
	call f498__cmpu4
	jp nc, c01_001a
;c01_0019:
	ld de, (ws+3185)
	exx
	ld de, (ws+3187)
	exx
	ld hl,48
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+3185), hl
	exx
	ld (ws+3187), hl
	exx
	jp c01_0016
c01_001a:
	ld de, (ws+3185)
	exx
	ld de, (ws+3187)
	exx
	ld hl,87
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+3185), hl
	exx
	ld (ws+3187), hl
	exx
c01_0016:
	ld a, (ws+3185)
	ld hl, (ws+3183)
	ld (hl),a
	inc hl
	ld (ws+3183), hl
	ld hl, (ws+3176)
	exx
	ld hl, (ws+3178)
	exx
	ld a,h
	or l
	exx
	or h
	or l
	exx
	jp nz, c01_0014 ; c01_001f
;c01_001e:
	jp c01_0015
c01_001f:
;c01_001b:
	jp c01_0014
c01_0015:
	ld hl, (ws+3181)
	ld (ws+3189), hl
	ld hl, (ws+3183)
	dec hl
	ld (ws+3191), hl
c01_0020:
	ld hl, (ws+3189)
	ld de, (ws+3191)
	and a
	sbc hl,de
	jp nc, c01_0025
;c01_0024:
	ld hl, (ws+3189)
	ld a,(hl)
	ld (ws+3193), a
	ld hl, (ws+3191)
	ld a,(hl)
	ld hl, (ws+3189)
	ld (hl),a
	ld a, (ws+3193)
	ld hl, (ws+3191)
	ld (hl),a
	ld hl, (ws+3189)
	inc hl
	ld (ws+3189), hl
	ld hl, (ws+3191)
	dec hl
	ld (ws+3191), hl
	jp c01_0020
c01_0025:
	xor a
	ld hl, (ws+3183)
	ld (hl),a
;end_f11_UIToA:
	ld hl, (ws+3183)
	ret


	; print_i32 workspace at ws+3137 length ws+20
f15_print_i32:
	ld (ws+3137), hl
	exx
	ld (ws+3139), hl
	exx
	exx
	push hl
	exx
	push hl
	ld h,10
	push hl
	ld hl,ws+3141
	call f11_UIToA
;	ld (ws+3153), hl
;	ld (ws+3155), hl
	ld hl,ws+3141
	call f9_print
;end_f15_print_i32:
	ret


	; print_i16 workspace at ws+3042 length ws+2
f16_print_i16:
	ld (ws+3042), hl
	exx
	ld hl,0
	exx
	jp   f15_print_i32 ;	call f15_print_i32
;end_f16_print_i16:
;	ret


	; print_i8 workspace at ws+3136 length ws+1
f17_print_i8:
	ld (ws+3136), a
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	jp   f15_print_i32 ;	call f15_print_i32
;end_f17_print_i8:
;	ret


	; print_hex_i8 workspace at ws+3185 length ws+3
f18_print_hex_i8:
	ld (ws+3185), a
	ld a,2
	ld (ws+3186), a
c01_002b:
	ld a, (ws+3185)
	ld b,4
	call f475__lsr1
	ld (ws+3187), a
	cp 10
	jp nc, c01_0031
;c01_0030:
	ld a, (ws+3187)
	add 48
	ld (ws+3187), a
	jp c01_002d
c01_0031:
	ld a, (ws+3187)
	add 87
	ld (ws+3187), a
c01_002d:
	ld a, (ws+3187)
	call f7_print_char
	ld a, (ws+3185)
	add a,a
	add a,a
	add a,a
	add a,a
	ld (ws+3185), a
	ld a, (ws+3186)
	dec a
	ld (ws+3186), a
	or a
	jp nz, c01_002b ; c01_0036
;c01_0035:
	jp c01_002c
c01_0036:
;c01_0032:
	jp c01_002b
c01_002c:
;end_f18_print_hex_i8:
	ret


	; print_hex_i16 workspace at ws+3183 length ws+2
f20_print_hex_i16:
	ld (ws+3183), hl
	ld a,8
	call f478__lsr2
	ld a,l
	call f18_print_hex_i8
	ld a, (ws+3183)
	jp   f18_print_hex_i8 ;	call f18_print_hex_i8
;end_f20_print_hex_i16:
;	ret


	; print_hex_i32 workspace at ws+3136 length ws+4
f22_print_hex_i32:
	ld (ws+3136), hl
	exx
	ld (ws+3138), hl
	exx
	ld a,24
	call f481__lsr4
	ld a,l
	call f18_print_hex_i8
	ld hl, (ws+3136)
	exx
	ld hl, (ws+3138)
	exx
	ld a,16
	call f481__lsr4
	ld a,l
	call f18_print_hex_i8
	ld hl, (ws+3136)
	exx
	ld hl, (ws+3138)
	exx
	ld a,8
	call f481__lsr4
	ld a,l
	call f18_print_hex_i8
	ld a, (ws+3136)
	jp   f18_print_hex_i8 ;	call f18_print_hex_i8
;end_f22_print_hex_i32:
;	ret


	; MemZero workspace at ws+3124 length ws+4
f26_MemZero:
			;HL=size
	pop	bc
	pop	de	;DE=buf
	push	bc
	ex	de,hl
loopz:	ld	a,d
	or	e
	ret	z
	ld	(hl),0
	inc	hl
	dec	de
	jr	loopz


	; ArgvInit workspace at ws+3046 length ws+0
f27_ArgvInit:
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


	; ArgvNext workspace at ws+3046 length ws+3
f28_ArgvNext:
	ld hl, (ws+4)
	ld a,h
	or l
	jp nz, c01_005f
	ld hl, (ws+4)
	ld (ws+3046), hl
	jp end_f28_ArgvNext
c01_005f:
;c01_005b:
c01_0060:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+3048), a
	cp 32
;	jp z, c01_0066
;	jp c01_0061
;c01_0066:
	jp nz,c01_0061
;c01_0062:
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp c01_0060
c01_0061:
	ld hl, (ws+4)
	ld (ws+3046), hl
c01_0067:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+3048), a
	cp 32
	jp z, c01_0068 ; c01_0070
;c01_0073:
	ld a, (ws+3048)
	cp 10
	jp z, c01_0068 ; c01_0070
;c01_0072:
	ld a, (ws+3048)
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
	ld a, (ws+3048)
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
;	ld (ws+3140), hl
	ld (ws+3142), hl
	ld de,4
	and a
	sbc hl,de
	jp nc, c01_00c3
;c01_00c2:
	ld de,4
	ld (ws+3142), de
c01_00c3:
;c01_00bf:
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
c01_00c4:
	ld hl, (ws+3144)
	ld a,h
	or l
	jp z, c01_00c9
;c01_00c8:
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
	jp c, c01_00d0
;c01_00d1:
	ld hl, (ws+3154)
	ld de, (ws+3152)
	and a
	sbc hl,de
	jp nc, c01_00d0
;c01_00cf:
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
;	jp nz, c01_00d6
;	jp c01_00c9
;c01_00d6:
	jp z,c01_00c9
;c01_00d2:
c01_00d0:
;c01_00ca:
	ld hl, (ws+3144)
	ld (ws+3146), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3144), hl
	jp c01_00c4
c01_00c9:
	ld hl, (ws+3148)
	ld a,h
	or l
	jp nz, c01_00db
	ld bc,0
	ld (ws+3138), bc
	jp end_f37_RawAlloc
c01_00db:
;c01_00d7:
	ld hl, (ws+3152)
	ld de, (ws+3142)
	and a
	sbc hl,de
	ld (ws+3156), hl
	ld de,4
	and a
	sbc hl,de
	jp nc, c01_00e0
;c01_00df:
	ld hl, (ws+3150)
	ld a,h
	or l
	jp z, c01_00e5
	ld hl, (ws+3148)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3150)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00e1
c01_00e5:
	ld hl, (ws+3148)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+6), hl
c01_00e1:
	ld hl, (ws+3152)
	ld (ws+3142), hl
	jp c01_00dc
c01_00e0:
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
c01_00dc:
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
c01_c8:
	db 79,117,116,32,111,102,32,109,101,109,111,114,121,0


	; Alloc workspace at ws+3083 length ws+6
f38_Alloc:
	ld (ws+3083), hl
	call f37_RawAlloc
;	ld (ws+3087), hl
	ld (ws+3085), hl
	ld a,h
	or l
	jp nz, c01_00ea
	ld hl,c01_c8
	call f9_print
	call f4_ExitWithError
c01_00ea:
;c01_00e6:
;end_f38_Alloc:
	ld hl, (ws+3085)
	ret


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
	jp nc, c01_00ef
;c01_00ee:
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
	jp nz, c01_00f4
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
	jp c01_00f0
c01_00f4:
	ld de, (ws+3148)
	ld hl, (ws+3146)
	ld (hl),e
	inc hl
	ld (hl),d
c01_00f0:
	ld hl, (ws+3146)
	ld (ws+6), hl
	jp c01_00eb
c01_00ef:
c01_00f5:
	ld hl, (ws+3148)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz, c01_00fb
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
	jp c01_00f6
c01_00fb:
;c01_00f7:
	ld bc, (ws+3146)
	ld hl, (ws+3148)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld h,b
	ld l,c
	and a
	sbc hl,de
	jp nc, c01_0100
;c01_00ff:
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
	jp nz, c01_0105
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
	jp c01_0101
c01_0105:
	ld hl, (ws+3148)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3146)
	ld (hl),e
	inc hl
	ld (hl),d
c01_0101:
	ld de, (ws+3146)
	ld hl, (ws+3148)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00f6
c01_0100:
;c01_00fc:
	ld hl, (ws+3148)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3148), hl
	jp c01_00f5
c01_00f6:
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
	jp nz, c01_010a
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
c01_010a:
;c01_0106:
c01_00eb:
;end_f39_AddFreeBlock:
	ret


	; Free workspace at ws+3138 length ws+4
f40_Free:
	ld (ws+3138), hl
	ld a,h
	or l
	jp z, c01_010f
	ld hl, (ws+3138)
	dec hl
	dec hl
	ld (ws+3140), hl
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


	; GetFreeMemory workspace at ws+3042 length ws+4
f41_GetFreeMemory:
	ld bc,0
	ld (ws+3042), bc
	ld hl, (ws+6)
	ld (ws+3044), hl
c01_0110:
	ld hl, (ws+3044)
	ld a,h
	or l
	jp z, c01_0115
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
	jp c01_0110
c01_0115:
;end_f41_GetFreeMemory:
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
c01_0116:
	ld hl, (ws+3061)
	ld a,(hl)
	ld (ws+3066), a
	cp 32
	jp c, c01_011d
;c01_011f:
	ld a, (ws+3066)
	cp 46
	jp nz, c01_011e
c01_011d:
	ld a,32
	ld (ws+3066), a
	jp c01_0118
c01_011e:
	ld a, (ws+3066)
	cp 42
	jp nz, c01_0123
	ld a,63
	ld (ws+3066), a
	jp c01_0118
c01_0123:
	ld hl, (ws+3061)
	inc hl
	ld (ws+3061), hl
c01_0118:
	ld a, (ws+3066)
	cp 97
	jp c, c01_012a
;c01_012b:
	ld b,122
	ld a, (ws+3066)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_012a
;c01_0129:
	ld a, (ws+3066)
	add 224
	ld (ws+3066), a
c01_012a:
;c01_0124:
	ld a, (ws+3066)
	ld hl, (ws+3059)
	ld (hl),a
	inc hl
	ld (ws+3059), hl
	ld a, (ws+3063)
	dec a
	ld (ws+3063), a
	or a
	jp nz, c01_0116 ; c01_0130
;c01_012f:
	jp c01_0117
c01_0130:
;c01_012c:
	jp c01_0116
c01_0117:
	ld hl, (ws+3061)
;	ld (ws+3064), hl
;end_f44_fill:
;	ld hl, (ws+3064)
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
;	ld (ws+3054), hl
	ld (ws+3052), hl
c01_0131:
	ld hl, (ws+3052)
	ld a,(hl)
	ld (ws+3056), a
	cp 32
	jp c, c01_0132 ; c01_0138
;c01_013a:
	ld a, (ws+3056)
	cp 46
	jp nz, c01_0139
c01_0138:
	jp c01_0132
c01_0139:
;c01_0133:
	ld hl, (ws+3052)
	inc hl
	ld (ws+3052), hl
	jp c01_0131
c01_0132:
	ld a, (ws+3056)
	cp 46
	jp nz, c01_013f
	ld de, (ws+3050)
	ld hl,11
	add hl,de
	push hl
	ld hl, (ws+3052)
	inc hl
	push hl
	ld a,3
	call f44_fill
;	ld (ws+3057), hl
	ld (ws+3052), hl
c01_013f:
;c01_013b:
	ld ix, (ws+3050)
	ld (ix+35), 255
	ld (ix+36), 255
	ld a,127
	push ix
	pop hl
	ld (hl),a
;end_f43_file_i_init:
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
	call 5 
;end_f45_fcb_i_gbpb:
	ret


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
;end_f46_fcb_i_blockin:
	ret


	; fcb_i_blockout workspace at ws+3197 length ws+2
f47_fcb_i_blockout:
	ld (ws+3197), hl
	inc hl
	ld a,(hl)
	or a
	jp z, c01_0144
	ld hl, (ws+3197)
	push hl
	ld a,34
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+3197)
	inc hl
	ld (hl),a
c01_0144:
;c01_0140:
;end_f47_fcb_i_blockout:
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
	jp z, c01_0149
	ld hl, (ws+3193)
	call f47_fcb_i_blockout
	ld hl, (ws+3195)
	ld ix, (ws+3193)
	ld (ix+35), l
	ld (ix+36), h
	push ix
	pop hl
	call f46_fcb_i_blockin
c01_0149:
;c01_0145:
;end_f48_fcb_i_changeblock:
	ret


	; fcb_i_convert_a_to_error workspace at ws+3050 length ws+0
f49_fcb_i_convert_a_to_error:
	cp 0ffh 
	ld a, 0 
	ret nz 
	inc a 
;end_f49_fcb_i_convert_a_to_erro: 
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
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+3047 ), a 
;end_f50_FCBOpenIn:
;	ld a, (ws+3047)
	ret


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
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+3047 ), a 
;end_f52_FCBOpenOut:
;	ld a, (ws+3047)
	ret


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
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+3044 ), a 
;end_f53_FCBClose:
;	ld a, (ws+3044)
	ret


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
;end_f55_FCBPos:
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
	jp nz, c01_014e
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
c01_014e:
;c01_014a:
;end_f60_fcb_i_nextchar:
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
;	ld (ws+3093), a
;end_f61_FCBGetChar:
;	ld a, (ws+3093)
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
;end_f62_FCBPutChar:
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
c01_015c:
	ld hl, (ws+3186)
	ld a,h
	or l
	jp z, c01_0161
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
	jp c01_015c
c01_0161:
;end_f65_FCBPutBlock:
	ret


	; MidReader workspace at ws+3066 length ws+2
f66_MidReader:
	ld (ws+3066), hl
;end_f66_MidReader:
	ret
c01_c9:
	db 101,114,114,111,114,58,32,0


	; StartError workspace at ws+3183 length ws+0
f72_StartError:
	ld hl,c01_c9
	jp   f9_print ;	call f9_print
;end_f72_StartError:
;	ret


	; EndError workspace at ws+3183 length ws+0
f73_EndError:
	call f10_print_nl
	jp   f4_ExitWithError ;	call f4_ExitWithError
;end_f73_EndError:
;	ret


	; SimpleError workspace at ws+3142 length ws+2
f74_SimpleError:
	ld (ws+3142), hl
	call f72_StartError
	ld hl, (ws+3142)
	call f9_print
	jp   f73_EndError ;	call f73_EndError
;end_f74_SimpleError:
;	ret
c01_c10:
	db 117,110,97,98,108,101,32,116,111,32,111,112,101,110,32,39,0
c01_c11:
	db 39,0


	; CannotOpen workspace at ws+3043 length ws+2
f75_CannotOpen:
	ld (ws+3043), hl
	call f72_StartError
	ld hl,c01_c10
	call f9_print
	ld hl, (ws+3043)
	call f9_print
	ld hl,c01_c11
	call f9_print
	jp   f73_EndError ;	call f73_EndError
;end_f75_CannotOpen:
;	ret
c01_c12:
	db 79,117,116,32,111,102,32,109,101,109,111,114,121,10,0


	; InternalAlloc workspace at ws+3128 length ws+8
f76_InternalAlloc:
	ld (ws+3128), hl
	call f37_RawAlloc
;	ld (ws+3132), hl
	ld (ws+3130), hl
	ld a,h
	or l
	jp nz, c01_0166
	call f77_PurgeAllFreeNodes
	call f78_PurgeAllFreeInstructions
	ld hl, (ws+3128)
	call f37_RawAlloc
;	ld (ws+3134), hl
	ld (ws+3130), hl
	ld a,h
	or l
	jp nz, c01_016b
	ld hl,c01_c12
	call f9_print
	call f4_ExitWithError
c01_016b:
;c01_0167:
c01_0166:
;c01_0162:
;end_f76_InternalAlloc:
	ld hl, (ws+3130)
	ret
c01_c13:
	db 112,97,114,97,109,0
c01_c14:
	db 105,121,0
c01_c15:
	db 105,120,0
c01_c16:
	db 98,99,98,99,0
c01_c17:
	db 100,101,100,101,0
c01_c18:
	db 104,108,104,108,0
c01_c19:
	db 98,99,0
c01_c20:
	db 100,101,0
c01_c21:
	db 104,108,0
c01_c22:
	db 108,0
c01_c23:
	db 104,0
c01_c24:
	db 101,0
c01_c25:
	db 100,0
c01_c26:
	db 99,0
c01_c27:
	db 98,0
c01_c28:
	db 97,0
f2___main_s016c:
	dw c01_c13
	dw 32768
	dw 32768
	dw 32768
	db 1
	dw c01_c14
	dw 16384
	dw 16384
	dw 25472
	db 0
	dw c01_c15
	dw 8192
	dw 8192
	dw 25472
	db 0
	dw c01_c16
	dw 4096
	dw 4614
	dw 7168
	db 0
	dw c01_c17
	dw 2048
	dw 2328
	dw 7168
	db 0
	dw c01_c18
	dw 1024
	dw 1248
	dw 7168
	db 0
	dw c01_c19
	dw 512
	dw 4614
	dw 25472
	db 0
	dw c01_c20
	dw 256
	dw 2328
	dw 25472
	db 0
	dw c01_c21
	dw 128
	dw 1248
	dw 25472
	db 0
	dw c01_c22
	dw 64
	dw 64
	dw 64
	db 0
	dw c01_c23
	dw 32
	dw 1248
	dw 43
	db 0
	dw c01_c24
	dw 16
	dw 16
	dw 16
	db 0
	dw c01_c25
	dw 8
	dw 2328
	dw 43
	db 0
	dw c01_c26
	dw 4
	dw 4
	dw 4
	db 0
	dw c01_c27
	dw 2
	dw 4614
	dw 43
	db 0
	dw c01_c28
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
	jp z, c01_0171
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
c01_0171:
;c01_016d:
;end_f79_GetInputParameter:
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
	jp z, c01_0176
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
c01_0176:
;c01_0172:
;end_f80_GetOutputParameter:
	ld hl, (ws+3127)
	ret
c01_c30:
	db 69,78,68,0
c01_c31:
	db 83,84,65,82,84,70,73,76,69,0
c01_c32:
	db 69,78,68,70,73,76,69,0
c01_c33:
	db 83,84,65,82,84,83,85,66,0
c01_c34:
	db 69,78,68,83,85,66,0
c01_c35:
	db 83,84,65,82,84,73,78,73,84,0
c01_c36:
	db 73,78,73,84,48,0
c01_c37:
	db 73,78,73,84,49,0
c01_c38:
	db 73,78,73,84,50,0
c01_c39:
	db 73,78,73,84,52,0
c01_c40:
	db 73,78,73,84,56,0
c01_c41:
	db 73,78,73,84,83,84,82,73,78,71,0
c01_c42:
	db 73,78,73,84,65,68,68,82,69,83,83,0
c01_c43:
	db 73,78,73,84,83,85,66,82,69,70,0
c01_c44:
	db 69,78,68,73,78,73,84,0
c01_c45:
	db 65,83,77,71,82,79,85,80,83,84,65,82,84,0
c01_c46:
	db 65,83,77,71,82,79,85,80,69,78,68,0
c01_c47:
	db 65,83,77,83,84,65,82,84,0
c01_c48:
	db 65,83,77,84,69,88,84,0
c01_c49:
	db 65,83,77,83,89,77,66,79,76,0
c01_c50:
	db 65,83,77,83,85,66,82,69,70,0
c01_c51:
	db 65,83,77,86,65,76,85,69,0
c01_c52:
	db 65,83,77,69,78,68,0
c01_c53:
	db 70,65,76,76,66,65,67,75,0
c01_c54:
	db 80,65,73,82,0
c01_c55:
	db 76,65,66,69,76,0
c01_c56:
	db 74,85,77,80,0
c01_c57:
	db 82,69,84,85,82,78,0
c01_c58:
	db 67,65,76,76,0
c01_c59:
	db 65,82,71,48,0
c01_c60:
	db 65,82,71,49,0
c01_c61:
	db 65,82,71,50,0
c01_c62:
	db 65,82,71,52,0
c01_c63:
	db 65,82,71,56,0
c01_c64:
	db 80,79,80,65,82,71,48,0
c01_c65:
	db 80,79,80,65,82,71,49,0
c01_c66:
	db 80,79,80,65,82,71,50,0
c01_c67:
	db 80,79,80,65,82,71,52,0
c01_c68:
	db 80,79,80,65,82,71,56,0
c01_c69:
	db 67,79,78,83,84,65,78,84,0
c01_c70:
	db 83,84,82,73,78,71,0
c01_c71:
	db 65,68,68,82,69,83,83,0
c01_c72:
	db 83,85,66,82,69,70,0
c01_c73:
	db 68,69,82,69,70,48,0
c01_c74:
	db 68,69,82,69,70,49,0
c01_c75:
	db 68,69,82,69,70,50,0
c01_c76:
	db 68,69,82,69,70,52,0
c01_c77:
	db 68,69,82,69,70,56,0
c01_c78:
	db 83,84,79,82,69,48,0
c01_c79:
	db 83,84,79,82,69,49,0
c01_c80:
	db 83,84,79,82,69,50,0
c01_c81:
	db 83,84,79,82,69,52,0
c01_c82:
	db 83,84,79,82,69,56,0
c01_c83:
	db 66,65,78,68,0
c01_c84:
	db 66,79,82,0
c01_c85:
	db 66,69,81,48,0
c01_c86:
	db 66,69,81,49,0
c01_c87:
	db 66,69,81,50,0
c01_c88:
	db 66,69,81,52,0
c01_c89:
	db 66,69,81,56,0
c01_c90:
	db 66,76,84,83,48,0
c01_c91:
	db 66,76,84,83,49,0
c01_c92:
	db 66,76,84,83,50,0
c01_c93:
	db 66,76,84,83,52,0
c01_c94:
	db 66,76,84,83,56,0
c01_c95:
	db 66,76,84,85,48,0
c01_c96:
	db 66,76,84,85,49,0
c01_c97:
	db 66,76,84,85,50,0
c01_c98:
	db 66,76,84,85,52,0
c01_c99:
	db 66,76,84,85,56,0
c01_c100:
	db 83,84,65,82,84,67,65,83,69,48,0
c01_c101:
	db 83,84,65,82,84,67,65,83,69,49,0
c01_c102:
	db 83,84,65,82,84,67,65,83,69,50,0
c01_c103:
	db 83,84,65,82,84,67,65,83,69,52,0
c01_c104:
	db 83,84,65,82,84,67,65,83,69,56,0
c01_c105:
	db 87,72,69,78,67,65,83,69,48,0
c01_c106:
	db 87,72,69,78,67,65,83,69,49,0
c01_c107:
	db 87,72,69,78,67,65,83,69,50,0
c01_c108:
	db 87,72,69,78,67,65,83,69,52,0
c01_c109:
	db 87,72,69,78,67,65,83,69,56,0
c01_c110:
	db 69,78,68,67,65,83,69,48,0
c01_c111:
	db 69,78,68,67,65,83,69,49,0
c01_c112:
	db 69,78,68,67,65,83,69,50,0
c01_c113:
	db 69,78,68,67,65,83,69,52,0
c01_c114:
	db 69,78,68,67,65,83,69,56,0
c01_c115:
	db 67,65,83,84,49,48,0
c01_c116:
	db 67,65,83,84,49,49,0
c01_c117:
	db 67,65,83,84,49,50,0
c01_c118:
	db 67,65,83,84,49,52,0
c01_c119:
	db 67,65,83,84,49,56,0
c01_c120:
	db 67,65,83,84,50,48,0
c01_c121:
	db 67,65,83,84,50,49,0
c01_c122:
	db 67,65,83,84,50,50,0
c01_c123:
	db 67,65,83,84,50,52,0
c01_c124:
	db 67,65,83,84,50,56,0
c01_c125:
	db 67,65,83,84,52,48,0
c01_c126:
	db 67,65,83,84,52,49,0
c01_c127:
	db 67,65,83,84,52,50,0
c01_c128:
	db 67,65,83,84,52,52,0
c01_c129:
	db 67,65,83,84,52,56,0
c01_c130:
	db 67,65,83,84,56,48,0
c01_c131:
	db 67,65,83,84,56,49,0
c01_c132:
	db 67,65,83,84,56,50,0
c01_c133:
	db 67,65,83,84,56,52,0
c01_c134:
	db 67,65,83,84,56,56,0
c01_c135:
	db 78,79,84,48,0
c01_c136:
	db 78,79,84,49,0
c01_c137:
	db 78,79,84,50,0
c01_c138:
	db 78,79,84,52,0
c01_c139:
	db 78,79,84,56,0
c01_c140:
	db 78,69,71,48,0
c01_c141:
	db 78,69,71,49,0
c01_c142:
	db 78,69,71,50,0
c01_c143:
	db 78,69,71,52,0
c01_c144:
	db 78,69,71,56,0
c01_c145:
	db 76,83,72,73,70,84,48,0
c01_c146:
	db 76,83,72,73,70,84,49,0
c01_c147:
	db 76,83,72,73,70,84,50,0
c01_c148:
	db 76,83,72,73,70,84,52,0
c01_c149:
	db 76,83,72,73,70,84,56,0
c01_c150:
	db 82,83,72,73,70,84,85,48,0
c01_c151:
	db 82,83,72,73,70,84,85,49,0
c01_c152:
	db 82,83,72,73,70,84,85,50,0
c01_c153:
	db 82,83,72,73,70,84,85,52,0
c01_c154:
	db 82,83,72,73,70,84,85,56,0
c01_c155:
	db 82,83,72,73,70,84,83,48,0
c01_c156:
	db 82,83,72,73,70,84,83,49,0
c01_c157:
	db 82,83,72,73,70,84,83,50,0
c01_c158:
	db 82,83,72,73,70,84,83,52,0
c01_c159:
	db 82,83,72,73,70,84,83,56,0
c01_c160:
	db 83,85,66,48,0
c01_c161:
	db 83,85,66,49,0
c01_c162:
	db 83,85,66,50,0
c01_c163:
	db 83,85,66,52,0
c01_c164:
	db 83,85,66,56,0
c01_c165:
	db 68,73,86,85,48,0
c01_c166:
	db 68,73,86,85,49,0
c01_c167:
	db 68,73,86,85,50,0
c01_c168:
	db 68,73,86,85,52,0
c01_c169:
	db 68,73,86,85,56,0
c01_c170:
	db 68,73,86,83,48,0
c01_c171:
	db 68,73,86,83,49,0
c01_c172:
	db 68,73,86,83,50,0
c01_c173:
	db 68,73,86,83,52,0
c01_c174:
	db 68,73,86,83,56,0
c01_c175:
	db 82,69,77,85,48,0
c01_c176:
	db 82,69,77,85,49,0
c01_c177:
	db 82,69,77,85,50,0
c01_c178:
	db 82,69,77,85,52,0
c01_c179:
	db 82,69,77,85,56,0
c01_c180:
	db 82,69,77,83,48,0
c01_c181:
	db 82,69,77,83,49,0
c01_c182:
	db 82,69,77,83,50,0
c01_c183:
	db 82,69,77,83,52,0
c01_c184:
	db 82,69,77,83,56,0
c01_c185:
	db 65,68,68,48,0
c01_c186:
	db 65,68,68,49,0
c01_c187:
	db 65,68,68,50,0
c01_c188:
	db 65,68,68,52,0
c01_c189:
	db 65,68,68,56,0
c01_c190:
	db 77,85,76,48,0
c01_c191:
	db 77,85,76,49,0
c01_c192:
	db 77,85,76,50,0
c01_c193:
	db 77,85,76,52,0
c01_c194:
	db 77,85,76,56,0
c01_c195:
	db 65,78,68,48,0
c01_c196:
	db 65,78,68,49,0
c01_c197:
	db 65,78,68,50,0
c01_c198:
	db 65,78,68,52,0
c01_c199:
	db 65,78,68,56,0
c01_c200:
	db 79,82,48,0
c01_c201:
	db 79,82,49,0
c01_c202:
	db 79,82,50,0
c01_c203:
	db 79,82,52,0
c01_c204:
	db 79,82,56,0
c01_c205:
	db 69,79,82,48,0
c01_c206:
	db 69,79,82,49,0
c01_c207:
	db 69,79,82,50,0
c01_c208:
	db 69,79,82,52,0
c01_c209:
	db 69,79,82,56,0
f84_MidcodeName_s017a:
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
	dw c01_c49
	dw c01_c50
	dw c01_c51
	dw c01_c52
	dw c01_c53
	dw c01_c54
	dw c01_c55
	dw c01_c56
	dw c01_c57
	dw c01_c58
	dw c01_c59
	dw c01_c60
	dw c01_c61
	dw c01_c62
	dw c01_c63
	dw c01_c64
	dw c01_c65
	dw c01_c66
	dw c01_c67
	dw c01_c68
	dw c01_c69
	dw c01_c70
	dw c01_c71
	dw c01_c72
	dw c01_c73
	dw c01_c74
	dw c01_c75
	dw c01_c76
	dw c01_c77
	dw c01_c78
	dw c01_c79
	dw c01_c80
	dw c01_c81
	dw c01_c82
	dw c01_c83
	dw c01_c84
	dw c01_c85
	dw c01_c86
	dw c01_c87
	dw c01_c88
	dw c01_c89
	dw c01_c90
	dw c01_c91
	dw c01_c92
	dw c01_c93
	dw c01_c94
	dw c01_c95
	dw c01_c96
	dw c01_c97
	dw c01_c98
	dw c01_c99
	dw c01_c100
	dw c01_c101
	dw c01_c102
	dw c01_c103
	dw c01_c104
	dw c01_c105
	dw c01_c106
	dw c01_c107
	dw c01_c108
	dw c01_c109
	dw c01_c110
	dw c01_c111
	dw c01_c112
	dw c01_c113
	dw c01_c114
	dw c01_c115
	dw c01_c116
	dw c01_c117
	dw c01_c118
	dw c01_c119
	dw c01_c120
	dw c01_c121
	dw c01_c122
	dw c01_c123
	dw c01_c124
	dw c01_c125
	dw c01_c126
	dw c01_c127
	dw c01_c128
	dw c01_c129
	dw c01_c130
	dw c01_c131
	dw c01_c132
	dw c01_c133
	dw c01_c134
	dw c01_c135
	dw c01_c136
	dw c01_c137
	dw c01_c138
	dw c01_c139
	dw c01_c140
	dw c01_c141
	dw c01_c142
	dw c01_c143
	dw c01_c144
	dw c01_c145
	dw c01_c146
	dw c01_c147
	dw c01_c148
	dw c01_c149
	dw c01_c150
	dw c01_c151
	dw c01_c152
	dw c01_c153
	dw c01_c154
	dw c01_c155
	dw c01_c156
	dw c01_c157
	dw c01_c158
	dw c01_c159
	dw c01_c160
	dw c01_c161
	dw c01_c162
	dw c01_c163
	dw c01_c164
	dw c01_c165
	dw c01_c166
	dw c01_c167
	dw c01_c168
	dw c01_c169
	dw c01_c170
	dw c01_c171
	dw c01_c172
	dw c01_c173
	dw c01_c174
	dw c01_c175
	dw c01_c176
	dw c01_c177
	dw c01_c178
	dw c01_c179
	dw c01_c180
	dw c01_c181
	dw c01_c182
	dw c01_c183
	dw c01_c184
	dw c01_c185
	dw c01_c186
	dw c01_c187
	dw c01_c188
	dw c01_c189
	dw c01_c190
	dw c01_c191
	dw c01_c192
	dw c01_c193
	dw c01_c194
	dw c01_c195
	dw c01_c196
	dw c01_c197
	dw c01_c198
	dw c01_c199
	dw c01_c200
	dw c01_c201
	dw c01_c202
	dw c01_c203
	dw c01_c204
	dw c01_c205
	dw c01_c206
	dw c01_c207
	dw c01_c208
	dw c01_c209


	; MidcodeName workspace at ws+3136 length ws+3
f84_MidcodeName:
	ld (ws+3136), a
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
;	ld (ws+3137), hl
;end_f84_MidcodeName:
;	ld hl, (ws+3137)
	ret


	; AllocateNewNode workspace at ws+3112 length ws+5
f83_AllocateNewNode:
	ld (ws+3112), a
	ld hl, (ws+52)
	ld a,h
	or l
	jp z, c01_017f
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
	jp c01_017b
c01_017f:
	ld hl,26
	call f76_InternalAlloc
;	ld (ws+3115), hl
	ld (ws+3113), hl
c01_017b:
	ld a, (ws+3112)
	ld ix, (ws+3113)
	ld (ix+25), a
;end_f83_AllocateNewNode:
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
;end_f85_FreeNode:
	ret


	; PurgeAllFreeNodes workspace at ws+3136 length ws+2
f77_PurgeAllFreeNodes:
c01_0180:
	ld hl, (ws+52)
	ld a,h
	or l
	jp z, c01_0185
	ld hl, (ws+52)
	ld (ws+3136), hl
	push hl
	pop ix
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+52), hl
	ld hl, (ws+3136)
	call f40_Free
	jp c01_0180
c01_0185:
;end_f77_PurgeAllFreeNodes:
	ret


	; WriteB8 workspace at ws+3184 length ws+1
f86_WriteB8:
	ld (ws+3184), a
	ld de,ws+54
	push de
	call f62_FCBPutChar
;end_f86_WriteB8:
	ret


	; WriteB16 workspace at ws+3182 length ws+2
f87_WriteB16:
	ld (ws+3182), hl
	ld a, (ws+3182)
	call f86_WriteB8
	ld hl, (ws+3182)
	ld a,8
	call f478__lsr2
	ld a,l
	jp   f86_WriteB8 ;	call f86_WriteB8
;end_f87_WriteB16:
;	ret


	; FlushCurrentStream workspace at ws+3181 length ws+1
f88_FlushCurrentStream:
	ld (ws+3181), a
	ld a,70
	call f86_WriteB8
	ld hl, (ws+2268)
	inc hl
	inc hl
	inc hl
	call f87_WriteB16
	ld a, (ws+2288)
	push af
	ld a, (ws+3181)
	ld b,a
	pop af
	or b
	call f86_WriteB8
	ld hl, (ws+2286)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f87_WriteB16
	ld de,ws+54
	push de
	ld hl,ws+220
	push hl
	ld hl, (ws+2268)
	call f65_FCBPutBlock
	ld bc,0
	ld (ws+2268), bc
;end_f88_FlushCurrentStream:
	ret


	; E_b8 workspace at ws+3180 length ws+1
f89_E_b8:
	ld (ws+3180), a
	ld hl, (ws+2286)
	ld a,h
	or l
	jp z, c01_018a
	ld a, (ws+3180)
	ld de,ws+220
	ld hl, (ws+2268)
	add hl,de
	ld (hl),a
	ld hl, (ws+2268)
	inc hl
	ld (ws+2268), hl
	ld de,63488
	add hl,de
	ld a,h
	or l
	jp nz, c01_018f
	xor a
	call f88_FlushCurrentStream
c01_018f:
;c01_018b:
c01_018a:
;c01_0186:
;end_f89_E_b8:
	ret


	; E_b16 workspace at ws+3154 length ws+2
f90_E_b16:
	ld (ws+3154), hl
	ld a, (ws+3154)
	call f89_E_b8
	ld hl, (ws+3154)
	ld a,8
	call f478__lsr2
	ld a,l
	jp   f89_E_b8 ;	call f89_E_b8
;end_f90_E_b16:
;	ret


	; E_space workspace at ws+3151 length ws+0
f92_E_space:
	ld a,32
	jp   f89_E_b8 ;	call f89_E_b8
;end_f92_E_space:
;	ret


	; E_comma workspace at ws+3173 length ws+0
f93_E_comma:
	ld a,44
	jp   f89_E_b8 ;	call f89_E_b8
;end_f93_E_comma:
;	ret


	; E_tab workspace at ws+3173 length ws+0
f94_E_tab:
	ld a,9
	jp   f89_E_b8 ;	call f89_E_b8
;end_f94_E_tab:
;	ret


	; E_nl workspace at ws+3173 length ws+0
f95_E_nl:
	ld a,10
	jp   f89_E_b8 ;	call f89_E_b8
;end_f95_E_nl:
;	ret


	; E workspace at ws+3177 length ws+3
f98_E:
	ld (ws+3177), hl
c01_0190:
	ld hl, (ws+3177)
	ld a,(hl)
	ld (ws+3179), a
	inc hl
	ld (ws+3177), hl
	or a
;	jp nz, c01_0196
;	jp c01_0191
;c01_0196:
	jp z,c01_0191
;c01_0192:
	ld a, (ws+3179)
	call f89_E_b8
	jp c01_0190
c01_0191:
;end_f98_E:
	ret


	; E_u32 workspace at ws+3153 length ws+23
f99_E_u32:
	ld (ws+3153), hl
	exx
	ld (ws+3155), hl
	exx
	ld iy,ws+3157
	ld (ws+3169), iy
	exx
	push hl
	exx
	push hl
	ld h,10
	push hl
	push iy
	pop hl
	call f11_UIToA
;	ld (ws+3171), hl
;	ld (ws+3173), hl
c01_0197:
	ld hl, (ws+3169)
	ld a,(hl)
	ld (ws+3175), a
	or a
;	jp nz, c01_019d
;	jp c01_0198
;c01_019d:
	jp z,c01_0198
;c01_0199:
	ld a, (ws+3175)
	call f89_E_b8
	ld hl, (ws+3169)
	inc hl
	ld (ws+3169), hl
	jp c01_0197
c01_0198:
;end_f99_E_u32:
	ret


	; E_u16 workspace at ws+3151 length ws+2
f100_E_u16:
	ld (ws+3151), hl
	exx
	ld hl,0
	exx
	jp   f99_E_u32 ;	call f99_E_u32
;end_f100_E_u16:
;	ret


	; E_u8 workspace at ws+3146 length ws+1
f101_E_u8:
	ld (ws+3146), a
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	jp   f99_E_u32 ;	call f99_E_u32
;end_f101_E_u8:
;	ret


	; E_i8 workspace at ws+3138 length ws+1
f102_E_i8:
	ld (ws+3138), a
	or a
	jp p, c01_01a2
;c01_01a1:
	ld a,45
	call f89_E_b8
	ld a, (ws+3138)
	ld b,a
	xor a
	sub b
	ld (ws+3138), a
	jp c01_019e
c01_01a2:
	ld a,43
	call f89_E_b8
c01_019e:
	ld a, (ws+3138)
	jp   f101_E_u8 ;	call f101_E_u8
;end_f102_E_i8:
;	ret


	; E_i16 workspace at ws+3149 length ws+2
f103_E_i16:
	ld (ws+3149), hl
	bit 7,h
	jp z, c01_01a7
	ld a,45
	call f89_E_b8
	ld de, (ws+3149)
	xor a
	ld l,a
	ld h,a
	sbc hl,de
	ld (ws+3149), hl
	jp c01_01a3
c01_01a7:
	ld a,43
	call f89_E_b8
c01_01a3:
	ld hl, (ws+3149)
	jp   f100_E_u16 ;	call f100_E_u16
;end_f103_E_i16:
;	ret


	; E_h workspace at ws+3156 length ws+15
f105_E_h:
	ld (ws+3160), a
	pop bc
	pop hl
	ld (ws+3156), hl
	pop hl
	ld (ws+3158), hl
	push bc
	ld hl, (ws+3156)
	exx
	ld hl, (ws+3158)
	exx
	exx
	push hl
	exx
	push hl
	ld b,16
	push bc
	ld hl,ws+3161
	call f11_UIToA
;	ld (ws+3166), hl
;	ld (ws+3168), hl
	ld a, (ws+3160)
	push af
	ld bc,ws+3161
	and a
	sbc hl,bc
	ld a,l
	ld b,a
	pop af
	sub b
	ld (ws+3170), a
c01_01ad:
	ld a, (ws+3170)
	or a
	jp z, c01_01b2
	ld a,48
	call f89_E_b8
	ld a, (ws+3170)
	dec a
	ld (ws+3170), a
	jp c01_01ad
c01_01b2:
	ld hl,ws+3161
	call f98_E
;end_f105_E_h:
	ret


	; E_h16 workspace at ws+3154 length ws+2
f107_E_h16:
	ld (ws+3154), hl
	exx
	ld hl,0
	exx
	exx
	push hl
	exx
	push hl
	ld a,4
	call f105_E_h
;end_f107_E_h16:
	ret


	; E_labelref workspace at ws+3135 length ws+2
f109_E_labelref:
	ld (ws+3135), hl
	ld a,3
	call f89_E_b8
	ld hl, (ws+3135)
	jp   f107_E_h16 ;	call f107_E_h16
;end_f109_E_labelref:
;	ret


	; E_subref workspace at ws+3124 length ws+2
f110_E_subref:
	ld (ws+3124), hl
	ld d,h
	ld e,l
	ld hl, (ws+12)
	and a
	sbc hl,de
	jp nz, c01_01b7
	ld a,4
	call f89_E_b8
	jp c01_01b3
c01_01b7:
	ld a,1
	call f89_E_b8
	ld hl, (ws+3124)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f90_E_b16
c01_01b3:
;end_f110_E_subref:
	ret
c01_c210:
	db 95,115,0


	; E_wsref workspace at ws+3149 length ws+5
f111_E_wsref:
	ld (ws+3152), hl
	pop bc
	pop af
	ld (ws+3151), a
	pop hl
	ld (ws+3149), hl
	push bc
	cp 255
	jp nz, c01_01bc
	ld a,1
	call f89_E_b8
	ld hl, (ws+3149)
	call f90_E_b16
	ld hl,c01_c210
	call f98_E
	ld hl, (ws+3152)
	call f107_E_h16
	jp c01_01b8
c01_01bc:
	ld a,2
	call f89_E_b8
	ld hl, (ws+3149)
	call f90_E_b16
	ld a, (ws+3151)
	call f89_E_b8
	ld hl, (ws+3152)
	call f90_E_b16
c01_01b8:
;end_f111_E_wsref:
	ret


	; EmitterOpenStream workspace at ws+3124 length ws+2
f112_EmitterOpenStream:
	ld (ws+3124), hl
	ld hl, (ws+2286)
	ld a,h
	or l
	jp nz, c01_01c1
	ld ix,ws+2270
	ld (ws+2286), ix
	xor a
	ld (ws+2288), a
	jp c01_01bd
c01_01c1:
	xor a
	call f88_FlushCurrentStream
	ld hl, (ws+2286)
	inc hl
	inc hl
	ld (ws+2286), hl
	ld a, (ws+2288)
	inc a
	ld (ws+2288), a
c01_01bd:
	ld hl, (ws+3124)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+2286)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f112_EmitterOpenStream:
	ret


	; EmitterCloseStream workspace at ws+3124 length ws+0
f113_EmitterCloseStream:
	ld a,128
	call f88_FlushCurrentStream
	ld de, (ws+2286)
	ld hl,ws+2270
	and a
	sbc hl,de
	jp nz, c01_01c6
	ld de,0
	ld (ws+2286), de
	jp c01_01c2
c01_01c6:
	ld hl, (ws+2286)
	dec hl
	dec hl
	ld (ws+2286), hl
	ld a, (ws+2288)
	dec a
	ld (ws+2288), a
c01_01c2:
;end_f113_EmitterCloseStream:
	ret
c01_c211:
	db 99,97,110,110,111,116,32,111,112,101,110,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterOpenfile workspace at ws+3040 length ws+3
f114_EmitterOpenfile:
	ld (ws+3040), hl
	ld bc,ws+54
	push bc
	call f52_FCBOpenOut
;	ld (ws+3042), a
	or a
	jp z, c01_01cb
	ld hl,c01_c211
	call f74_SimpleError
c01_01cb:
;c01_01c7:
;end_f114_EmitterOpenfile:
	ret
c01_c212:
	db 99,97,110,110,111,116,32,99,108,111,115,101,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterClosefile workspace at ws+3040 length ws+1
f115_EmitterClosefile:
	ld a,69
	call f86_WriteB8
	ld hl,0
	call f87_WriteB16
	ld hl,ws+54
	call f53_FCBClose
;	ld (ws+3040), a
	or a
	jp z, c01_01d0
	ld hl,c01_c212
	call f74_SimpleError
c01_01d0:
;c01_01cc:
;end_f115_EmitterClosefile:
	ret


	; EmitterDeclareSubroutine workspace at ws+3056 length ws+6
f116_EmitterDeclareSubroutine:
	ld (ws+3056), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f32_StrLen
;	ld (ws+3058), hl
	ld (ws+3060), hl
	ld a,78
	call f86_WriteB8
	ld hl, (ws+3060)
	inc hl
	inc hl
	call f87_WriteB16
	ld hl, (ws+3056)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f87_WriteB16
	ld bc,ws+54
	push bc
	ld hl, (ws+3056)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+3060)
	call f65_FCBPutBlock
;end_f116_EmitterDeclareSubrouti:  
	ret


	; EmitterDeclareExternalSubroutine workspace at ws+3128 length ws+8
f117_EmitterDeclareExternalSubr:      
	ld (ws+3130), hl
	pop bc
	pop hl
	ld (ws+3128), hl
	push bc
	ld hl, (ws+3130)
	call f32_StrLen
;	ld (ws+3132), hl
	ld (ws+3134), hl
	ld a,88
	call f86_WriteB8
	ld hl, (ws+3134)
	inc hl
	inc hl
	call f87_WriteB16
	ld hl, (ws+3128)
	call f87_WriteB16
	ld bc,ws+54
	push bc
	ld hl, (ws+3130)
	push hl
	ld hl, (ws+3134)
	call f65_FCBPutBlock
;end_f117_EmitterDeclareExternal:          
	ret


	; EmitterReferenceSubroutineById workspace at ws+3128 length ws+4
f118_EmitterReferenceSubroutine:    
	ld (ws+3130), hl
	pop bc
	pop hl
	ld (ws+3128), hl
	push bc
	ld a,82
	call f86_WriteB8
	ld hl,4
	call f87_WriteB16
	ld hl, (ws+3128)
	call f87_WriteB16
	ld hl, (ws+3130)
	jp   f87_WriteB16 ;	call f87_WriteB16
;end_f118_EmitterReferenceSubrou:        
;	ret
