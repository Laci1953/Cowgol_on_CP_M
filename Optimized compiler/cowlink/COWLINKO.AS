psect text
ld sp,TOPSTACK
	call f2___main
	ld hl,0
	ld (80h),hl
	rst 0


	; ExitWithError workspace at ws+888 length ws+0
f4_ExitWithError:
	ld hl,1
	ld (80h),hl
	rst 0 
;end_f4_ExitWithError:
	ret


	; AlignUp workspace at ws+383 length ws+4
f5_AlignUp:
	ld (ws+383), hl
;	ld (ws+385), hl
;end_f5_AlignUp:
;	ld hl, (ws+385)
	ret


	; print_char workspace at ws+909 length ws+1
f7_print_char:
	ld (ws+909), a
	cp 10
	jp nz, c01_0005
	ld e, 13 
	ld c, 2 
	call 5 
c01_0005:
;c01_0001:
	ld a, ( ws+909 ) 
	ld e, a 
	ld c, 2 
	jp   5  ;	call 5 
;end_f7_print_char:
;	ret


	; MemSet workspace at ws+383 length ws+7
f8_MemSet:
	ld (ws+386), hl
	pop bc
	pop af
	ld (ws+385), a
	pop hl
	ld (ws+383), hl
	push bc
	ld d,h
	ld e,l
	ld hl, (ws+386)
	add hl,de
	ld (ws+388), hl
c01_0006:
	ld de, (ws+383)
	ld hl, (ws+388)
	and a
	sbc hl,de
;	jp nz, c01_000c
;	ret
;c01_000c:
	ret z
;c01_0008:
	ld a, (ws+385)
	ld hl, (ws+383)
	ld (hl),a
	inc hl
	ld (ws+383), hl
	jp c01_0006
;c01_0007:
;end_f8_MemSet:
	ret


	; print workspace at ws+906 length ws+3
f9_print:
	ld (ws+906), hl
c01_000d:
	ld hl, (ws+906)
	ld a,(hl)
	ld (ws+908), a
	or a
;	jp nz, c01_0013
;	ret
;c01_0013:
	ret z
;c01_000f:
	ld a, (ws+908)
	call f7_print_char
	ld hl, (ws+906)
	inc hl
	ld (ws+906), hl
	jp c01_000d
;c01_000e:
;end_f9_print:
	ret


	; print_nl workspace at ws+333 length ws+0
f10_print_nl:
	ld a,10
	jp   f7_print_char ;	call f7_print_char
;end_f10_print_nl:
;	ret


	; UIToA workspace at ws+906 length ws+18
f11_UIToA:
	ld (ws+911), hl
	pop bc
	pop af
	ld (ws+910), a
	pop hl
	ld (ws+906), hl
	pop hl
	ld (ws+908), hl
	push bc
	ld hl, (ws+911)
	ld (ws+913), hl
c01_0014:
	ld bc, (ws+906)
	exx
	ld bc, (ws+908)
	exx
	ld a, (ws+910)
	ld e,a
	xor a
	ld d,a
	exx
	ld e,a
	ld d,a
	exx
	call f133__dvrmu4
	ld (ws+915), hl
	exx
	ld (ws+917), hl
	exx
	ld bc, (ws+906)
	exx
	ld bc, (ws+908)
	exx
	ld a, (ws+910)
	ld e,a
	xor a
	ld d,a
	exx
	ld e,a
	ld d,a
	exx
	call f133__dvrmu4
	ld (ws+906), bc
	exx
	ld (ws+908), bc
	exx
	ld hl, (ws+915)
	exx
	ld hl, (ws+917)
	exx
	ld de,10
	exx
	ld de,0
	exx
	call f140__cmpu4
	jp nc, c01_001a
;c01_0019:
	ld de, (ws+915)
	exx
	ld de, (ws+917)
	exx
	ld hl,48
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+915), hl
	exx
	ld (ws+917), hl
	exx
	jp c01_0016
c01_001a:
	ld de, (ws+915)
	exx
	ld de, (ws+917)
	exx
	ld hl,87
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+915), hl
	exx
	ld (ws+917), hl
	exx
c01_0016:
	ld a, (ws+915)
	ld hl, (ws+913)
	ld (hl),a
	inc hl
	ld (ws+913), hl
	ld hl, (ws+906)
	exx
	ld hl, (ws+908)
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
	ld hl, (ws+911)
	ld (ws+919), hl
	ld hl, (ws+913)
	dec hl
	ld (ws+921), hl
c01_0020:
	ld hl, (ws+919)
	ld de, (ws+921)
	and a
	sbc hl,de
	jp nc, c01_0025
;c01_0024:
	ld hl, (ws+919)
	ld a,(hl)
	ld (ws+923), a
	ld hl, (ws+921)
	ld a,(hl)
	ld hl, (ws+919)
	ld (hl),a
	ld a, (ws+923)
	ld hl, (ws+921)
	ld (hl),a
	ld hl, (ws+919)
	inc hl
	ld (ws+919), hl
	ld hl, (ws+921)
	dec hl
	ld (ws+921), hl
	jp c01_0020
c01_0025:
	xor a
	ld hl, (ws+913)
	ld (hl),a
;end_f11_UIToA:
	ld hl, (ws+913)
	ret


	; print_i32 workspace at ws+886 length ws+20
f15_print_i32:
	ld (ws+886), hl
	exx
	ld (ws+888), hl
	exx
	exx
	push hl
	exx
	push hl
	ld h,10
	push hl
	ld hl,ws+890
	call f11_UIToA
;	ld (ws+902), hl
;	ld (ws+904), hl
	ld hl,ws+890
	call f9_print
;end_f15_print_i32:
	ret


	; print_i16 workspace at ws+884 length ws+2
f16_print_i16:
	ld (ws+884), hl
	exx
	ld hl,0
	exx
	jp   f15_print_i32 ;	call f15_print_i32
;end_f16_print_i16:
;	ret


	; print_i8 workspace at ws+884 length ws+1
f17_print_i8:
	ld (ws+884), a
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


	; print_hex_i8 workspace at ws+335 length ws+3
f18_print_hex_i8:
	ld (ws+335), a
	ld a,2
	ld (ws+336), a
c01_002b:
	ld a, (ws+335)
	ld b,4
	call f117__lsr1
	ld (ws+337), a
	cp 10
	jp nc, c01_0031
;c01_0030:
	ld a, (ws+337)
	add 48
	ld (ws+337), a
	jp c01_002d
c01_0031:
	ld a, (ws+337)
	add 87
	ld (ws+337), a
c01_002d:
	ld a, (ws+337)
	call f7_print_char
	ld a, (ws+335)
	add a,a
	add a,a
	add a,a
	add a,a
	ld (ws+335), a
	ld a, (ws+336)
	dec a
	ld (ws+336), a
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


	; print_hex_i16 workspace at ws+307 length ws+2
f20_print_hex_i16:
	ld (ws+307), hl
	ld a,8
	call f120__lsr2
	ld a,l
	call f18_print_hex_i8
	ld a, (ws+307)
	jp   f18_print_hex_i8 ;	call f18_print_hex_i8
;end_f20_print_hex_i16:
;	ret


	; print_hex_i32 workspace at ws+331 length ws+4
f22_print_hex_i32:
	ld (ws+331), hl
	exx
	ld (ws+333), hl
	exx
	ld a,24
	call f123__lsr4
	ld a,l
	call f18_print_hex_i8
	ld hl, (ws+331)
	exx
	ld hl, (ws+333)
	exx
	ld a,16
	call f123__lsr4
	ld a,l
	call f18_print_hex_i8
	ld hl, (ws+331)
	exx
	ld hl, (ws+333)
	exx
	ld a,8
	call f123__lsr4
	ld a,l
	call f18_print_hex_i8
	ld a, (ws+331)
	jp   f18_print_hex_i8 ;	call f18_print_hex_i8
;end_f22_print_hex_i32:
;	ret


	; MemZero workspace at ws+256 length ws+4
f26_MemZero:
	ld (ws+258), hl
	pop bc
	pop hl
	ld (ws+256), hl
	push bc
	push hl
	ld d,0
	push de
	ld hl, (ws+258)
	call f8_MemSet
;end_f26_MemZero:
	ret


	; ArgvInit workspace at ws+256 length ws+0
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


	; ArgvNext workspace at ws+256 length ws+3
f28_ArgvNext:
	ld hl, (ws+4)
	ld a,h
	or l
	jp nz, c01_005f
	ld hl, (ws+4)
	ld (ws+256), hl
	jp end_f28_ArgvNext
c01_005f:
;c01_005b:
c01_0060:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+258), a
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
	ld (ws+256), hl
c01_0067:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+258), a
	cp 32
	jp z, c01_0068 ; c01_0070
;c01_0073:
	ld a, (ws+258)
	cp 10
	jp z, c01_0068 ; c01_0070
;c01_0072:
	ld a, (ws+258)
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
	ld a, (ws+258)
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
	ld hl, (ws+256)
	ret


	; StrCmp workspace at ws+340 length ws+5
f29_StrCmp:
	ld (ws+342), hl
	pop bc
	pop hl
	ld (ws+340), hl
	push bc
c01_0079:
	ld hl, (ws+340)
	ld a,(hl)
	push af
	ld hl, (ws+342)
	ld a,(hl)
	ld b,a
	pop af
	sub b
	ld (ws+344), a
	or a
	jp nz, c01_007a ; c01_0080
;c01_0082:
	ld hl, (ws+340)
	ld a,(hl)
	or a
	jp nz, c01_0081
c01_0080:
	jp c01_007a
c01_0081:
;c01_007b:
	ld hl, (ws+340)
	inc hl
	ld (ws+340), hl
	ld hl, (ws+342)
	inc hl
	ld (ws+342), hl
	jp c01_0079
c01_007a:
;end_f29_StrCmp:
	ld a, (ws+344)
	ret


	; ToLower workspace at ws+263 length ws+2
f30_ToLower:
	ld (ws+263), a
	cp 65
	jp c, c01_0089
;c01_008a:
	ld b,90
	ld a, (ws+263)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_0089
;c01_0088:
	ld a, (ws+263)
	or 32
	ld (ws+264), a
	jp c01_0083
c01_0089:
	ld a, (ws+263)
	ld (ws+264), a
c01_0083:
;end_f30_ToLower:
	ld a, (ws+264)
	ret


	; StrICmp workspace at ws+256 length ws+7
f31_StrICmp:
	ld (ws+258), hl
	pop bc
	pop hl
	ld (ws+256), hl
	push bc
c01_008b:
	ld hl, (ws+256)
	ld a,(hl)
	call f30_ToLower
	ld (ws+261), a
	ld hl, (ws+258)
	ld a,(hl)
	call f30_ToLower
	ld (ws+262), a
	ld a, (ws+261)
	push af
	ld a, (ws+262)
	ld b,a
	pop af
	sub b
	ld (ws+260), a
	or a
	jp nz, c01_008c ; c01_0092
;c01_0094:
	ld hl, (ws+256)
	ld a,(hl)
	or a
	jp nz, c01_0093
c01_0092:
	jp c01_008c
c01_0093:
;c01_008d:
	ld hl, (ws+256)
	inc hl
	ld (ws+256), hl
	ld hl, (ws+258)
	inc hl
	ld (ws+258), hl
	jp c01_008b
c01_008c:
;end_f31_StrICmp:
	ld a, (ws+260)
	ret


	; StrLen workspace at ws+350 length ws+7
f32_StrLen:
	ld (ws+350), hl
	ld (ws+354), hl
c01_0095:
	ld hl, (ws+354)
	ld a,(hl)
	ld (ws+356), a
	or a
;	jp nz, c01_009b
;	jp c01_0096
;c01_009b:
	jp z,c01_0096
;c01_0097:
	ld hl, (ws+354)
	inc hl
	ld (ws+354), hl
	jp c01_0095
c01_0096:
	ld hl, (ws+354)
	ld de, (ws+350)
	and a
	sbc hl,de
;	ld (ws+352), hl
;end_f32_StrLen:
;	ld hl, (ws+352)
	ret


	; MemCopy workspace at ws+350 length ws+6
f34_MemCopy:
	ld (ws+354), hl
	pop bc
	pop hl
	ld (ws+352), hl
	pop hl
	ld (ws+350), hl
	push bc
c01_00a3:
	ld hl, (ws+352)
	ld a,h
	or l
	jp z, c01_00a8
	ld hl, (ws+350)
	ld a,(hl)
	ld hl, (ws+354)
	ld (hl),a
	inc hl
	ld (ws+354), hl
	ld hl, (ws+350)
	inc hl
	ld (ws+350), hl
	ld hl, (ws+352)
	dec hl
	ld (ws+352), hl
	jp c01_00a3
c01_00a8:
;end_f34_MemCopy:
	ret


	; RawAlloc workspace at ws+359 length ws+24
f37_RawAlloc:
	ld (ws+359), hl
	inc hl
	inc hl
	call f5_AlignUp
;	ld (ws+363), hl
	ld (ws+365), hl
	ld de,4
	and a
	sbc hl,de
	jp nc, c01_00c3
;c01_00c2:
	ld de,4
	ld (ws+365), de
c01_00c3:
;c01_00bf:
	ld de, (ws+365)
	ld hl,7
	add hl,de
	ld a,l
	and 248
	ld l,a
	ld a,h
	and 255
	ld h,a
	ld (ws+365), hl
	ld hl, (ws+6)
	ld (ws+367), hl
	ld bc,0
	ld (ws+369), bc
	ld (ws+371), bc
	ld (ws+373), bc
	ld iy,65535
	ld (ws+375), iy
c01_00c4:
	ld hl, (ws+367)
	ld a,h
	or l
	jp z, c01_00c9
;c01_00c8:
	ld hl, (ws+367)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+377), hl
	ld de, (ws+365)
	and a
	sbc hl,de
	jp c, c01_00d0
;c01_00d1:
	ld hl, (ws+377)
	ld de, (ws+375)
	and a
	sbc hl,de
	jp nc, c01_00d0
;c01_00cf:
	ld hl, (ws+367)
	ld (ws+371), hl
	ld hl, (ws+377)
	ld (ws+375), hl
	ld hl, (ws+369)
	ld (ws+373), hl
	ld de, (ws+375)
	ld hl, (ws+365)
	and a
	sbc hl,de
;	jp nz, c01_00d6
;	jp c01_00c9
;c01_00d6:
	jp z,c01_00c9
;c01_00d2:
c01_00d0:
;c01_00ca:
	ld hl, (ws+367)
	ld (ws+369), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+367), hl
	jp c01_00c4
c01_00c9:
	ld hl, (ws+371)
	ld a,h
	or l
	jp nz, c01_00db
	ld bc,0
	ld (ws+361), bc
	jp end_f37_RawAlloc
c01_00db:
;c01_00d7:
	ld hl, (ws+375)
	ld de, (ws+365)
	and a
	sbc hl,de
	ld (ws+379), hl
	ld de,4
	and a
	sbc hl,de
	jp nc, c01_00e0
;c01_00df:
	ld hl, (ws+373)
	ld a,h
	or l
	jp z, c01_00e5
	ld hl, (ws+371)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+373)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00e1
c01_00e5:
	ld hl, (ws+371)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+6), hl
c01_00e1:
	ld hl, (ws+375)
	ld (ws+365), hl
	jp c01_00dc
c01_00e0:
	ld de, (ws+379)
	ld hl, (ws+371)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+371)
	ld h,d
	ld l,e
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ld (ws+371), hl
c01_00dc:
	ld hl, (ws+371)
	ld (ws+381), hl
	ld de, (ws+365)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+381)
	inc hl
	inc hl
	ld (ws+361), hl
	push hl
	ld d,0
	push de
	ld hl, (ws+365)
	dec hl
	dec hl
	call f8_MemSet
end_f37_RawAlloc:
	ld hl, (ws+361)
	ret
c01_c8:
	db 79,117,116,32,111,102,32,109,101,109,111,114,121,0


	; Alloc workspace at ws+353 length ws+6
f38_Alloc:
	ld (ws+353), hl
	call f37_RawAlloc
;	ld (ws+357), hl
	ld (ws+355), hl
	ld a,h
	or l
	jp nz, c01_00ea
	ld hl,c01_c8
	call f9_print
	call f4_ExitWithError
c01_00ea:
;c01_00e6:
;end_f38_Alloc:
	ld hl, (ws+355)
	ret


	; AddFreeBlock workspace at ws+289 length ws+8
f39_AddFreeBlock:
	ld (ws+291), hl
	pop bc
	pop hl
	ld (ws+289), hl
	push bc
	push hl
	ld h,170
	push hl
	ld hl, (ws+291)
	call f8_MemSet
	ld hl, (ws+289)
	ld (ws+293), hl
	ld de, (ws+291)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+6)
	ld (ws+295), hl
	ld hl, (ws+293)
	ld de, (ws+295)
	and a
	sbc hl,de
	jp nc, c01_00ef
;c01_00ee:
	ld de, (ws+293)
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
	ld hl, (ws+295)
	and a
	sbc hl,de
	jp nz, c01_00f4
	ld de, (ws+291)
	ld hl, (ws+295)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+293)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+295)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+293)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00f0
c01_00f4:
	ld de, (ws+295)
	ld hl, (ws+293)
	ld (hl),e
	inc hl
	ld (hl),d
c01_00f0:
	ld hl, (ws+293)
	ld (ws+6), hl
	jp c01_00eb
c01_00ef:
c01_00f5:
	ld hl, (ws+295)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz, c01_00fb
	ld de, (ws+293)
	ld hl, (ws+295)
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
	ld bc, (ws+293)
	ld hl, (ws+295)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld h,b
	ld l,c
	and a
	sbc hl,de
	jp nc, c01_0100
;c01_00ff:
	ld de, (ws+293)
	ld hl, (ws+291)
	add hl,de
	ex de,hl
	ld hl, (ws+295)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	and a
	sbc hl,de
	jp nz, c01_0105
	ld de, (ws+291)
	ld hl, (ws+295)
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
	ld hl, (ws+293)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+295)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+293)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_0101
c01_0105:
	ld hl, (ws+295)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+293)
	ld (hl),e
	inc hl
	ld (hl),d
c01_0101:
	ld de, (ws+293)
	ld hl, (ws+295)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00f6
c01_0100:
;c01_00fc:
	ld hl, (ws+295)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+295), hl
	jp c01_00f5
c01_00f6:
	ld de, (ws+295)
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
	ld hl, (ws+293)
	and a
	sbc hl,de
	jp nz, c01_010a
	ld hl, (ws+295)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+293)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+295)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+293)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+295)
	ld (hl),e
	inc hl
	ld (hl),d
c01_010a:
;c01_0106:
c01_00eb:
;end_f39_AddFreeBlock:
	ret


	; Free workspace at ws+285 length ws+4
f40_Free:
	ld (ws+285), hl
	ld a,h
	or l
	jp z, c01_010f
	ld hl, (ws+285)
	dec hl
	dec hl
	ld (ws+287), hl
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


	; GetFreeMemory workspace at ws+256 length ws+4
f41_GetFreeMemory:
	ld bc,0
	ld (ws+256), bc
	ld hl, (ws+6)
	ld (ws+258), hl
c01_0110:
	ld hl, (ws+258)
	ld a,h
	or l
	jp z, c01_0115
	ld de, (ws+256)
	ld hl, (ws+258)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ld (ws+256), hl
	ld hl, (ws+258)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+258), hl
	jp c01_0110
c01_0115:
;end_f41_GetFreeMemory:
	ld hl, (ws+256)
	ret


	; StrDup workspace at ws+340 length ws+10
f42_StrDup:
	ld (ws+340), hl
	call f32_StrLen
;	ld (ws+344), hl
	inc hl
	ld (ws+346), hl
	call f38_Alloc
;	ld (ws+348), hl
	ld (ws+342), hl
	ld hl, (ws+340)
	push hl
	ld hl, (ws+346)
	push hl
	ld hl, (ws+342)
	call f34_MemCopy
;end_f42_StrDup:
	ld hl, (ws+342)
	ret


	; fill workspace at ws+347 length ws+8
f44_fill:
	ld (ws+351), a
	pop bc
	pop hl
	ld (ws+349), hl
	pop hl
	ld (ws+347), hl
	push bc
c01_0116:
	ld hl, (ws+349)
	ld a,(hl)
	ld (ws+354), a
	cp 32
	jp c, c01_011d
;c01_011f:
	ld a, (ws+354)
	cp 46
	jp nz, c01_011e
c01_011d:
	ld a,32
	ld (ws+354), a
	jp c01_0118
c01_011e:
	ld a, (ws+354)
	cp 42
	jp nz, c01_0123
	ld a,63
	ld (ws+354), a
	jp c01_0118
c01_0123:
	ld hl, (ws+349)
	inc hl
	ld (ws+349), hl
c01_0118:
	ld a, (ws+354)
	cp 97
	jp c, c01_012a
;c01_012b:
	ld b,122
	ld a, (ws+354)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_012a
;c01_0129:
	ld a, (ws+354)
	add 224
	ld (ws+354), a
c01_012a:
;c01_0124:
	ld a, (ws+354)
	ld hl, (ws+347)
	ld (hl),a
	inc hl
	ld (ws+347), hl
	ld a, (ws+351)
	dec a
	ld (ws+351), a
	or a
	jp nz, c01_0116 ; c01_0130
;c01_012f:
	jp c01_0117
c01_0130:
;c01_012c:
	jp c01_0116
c01_0117:
	ld hl, (ws+349)
;	ld (ws+352), hl
;end_f44_fill:
;	ld hl, (ws+352)
	ret


	; file_i_init workspace at ws+338 length ws+9
f43_file_i_init:
	ld (ws+340), hl
	pop bc
	pop hl
	ld (ws+338), hl
	push bc
	ld hl, (ws+338)
	push hl
	ld d,0
	push de
	ld hl,166
	call f8_MemSet
	ld hl, (ws+338)
	inc hl
	inc hl
	inc hl
	push hl
	ld b,32
	push bc
	ld hl,11
	call f8_MemSet
	ld hl, (ws+338)
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, (ws+340)
	push hl
	ld a,8
	call f44_fill
;	ld (ws+342), hl
	ld (ws+340), hl
c01_0131:
	ld hl, (ws+340)
	ld a,(hl)
	ld (ws+344), a
	cp 32
	jp c, c01_0132 ; c01_0138
;c01_013a:
	ld a, (ws+344)
	cp 46
	jp nz, c01_0139
c01_0138:
	jp c01_0132
c01_0139:
;c01_0133:
	ld hl, (ws+340)
	inc hl
	ld (ws+340), hl
	jp c01_0131
c01_0132:
	ld a, (ws+344)
	cp 46
	jp nz, c01_013f
	ld de, (ws+338)
	ld hl,11
	add hl,de
	push hl
	ld hl, (ws+340)
	inc hl
	push hl
	ld a,3
	call f44_fill
;	ld (ws+345), hl
	ld (ws+340), hl
c01_013f:
;c01_013b:
	ld ix, (ws+338)
	ld (ix+35), 255
	ld (ix+36), 255
	ld a,127
	push ix
	pop hl
	ld (hl),a
;end_f43_file_i_init:
	ret


	; fcb_i_gbpb workspace at ws+356 length ws+7
f45_fcb_i_gbpb:
	ld (ws+358), a
	pop bc
	pop hl
	ld (ws+356), hl
	push bc
	inc hl
	inc hl
	ld (ws+359), hl
	ld hl, (ws+356)
	ld de,38
	add hl,de
	ld (ws+361), hl
	ld c, 26 
	ld de, ( ws+361 ) 
	call 5 
	ld a, ( ws+358 ) 
	ld c, a 
	ld de, ( ws+359 ) 
	call 5 
;end_f45_fcb_i_gbpb:
	ret


	; fcb_i_blockin workspace at ws+354 length ws+2
f46_fcb_i_blockin:
	ld (ws+354), hl
	ld de,38
	add hl,de
	push hl
	ld d,0
	push de
	ld hl,128
	call f8_MemSet
	ld hl, (ws+354)
	push hl
	ld a,33
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+354)
	inc hl
	ld (hl),a
;end_f46_fcb_i_blockin:
	ret


	; fcb_i_blockout workspace at ws+354 length ws+2
f47_fcb_i_blockout:
	ld (ws+354), hl
	inc hl
	ld a,(hl)
	or a
	jp z, c01_0144
	ld hl, (ws+354)
	push hl
	ld a,34
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+354)
	inc hl
	ld (hl),a
c01_0144:
;c01_0140:
;end_f47_fcb_i_blockout:
	ret


	; fcb_i_changeblock workspace at ws+350 length ws+4
f48_fcb_i_changeblock:
	ld (ws+352), hl
	pop bc
	pop hl
	ld (ws+350), hl
	push bc
	ld de, (ws+352)
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	and a
	sbc hl,de
	jp z, c01_0149
	ld hl, (ws+350)
	call f47_fcb_i_blockout
	ld hl, (ws+352)
	ld ix, (ws+350)
	ld (ix+35), l
	ld (ix+36), h
	push ix
	pop hl
	call f46_fcb_i_blockin
c01_0149:
;c01_0145:
;end_f48_fcb_i_changeblock:
	ret


	; fcb_i_convert_a_to_error workspace at ws+338 length ws+0
f49_fcb_i_convert_a_to_error:
	cp 0ffh 
	ld a, 0 
	ret nz 
	inc a 
;end_f49_fcb_i_convert_a_to_erro: 
	ret


	; FCBOpenIn workspace at ws+331 length ws+7
f50_FCBOpenIn:
	ld (ws+333), hl
	pop bc
	pop hl
	ld (ws+331), hl
	push bc
	push hl
	ld hl, (ws+333)
	call f43_file_i_init
	ld hl, (ws+331)
	inc hl
	inc hl
	ld (ws+336), hl
	ld c, 15 
	ld de, ( ws+336 ) 
	call 5 
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+335 ), a 
;end_f50_FCBOpenIn:
;	ld a, (ws+335)
	ret


	; FCBOpenOut workspace at ws+259 length ws+7
f52_FCBOpenOut:
	ld (ws+261), hl
	pop bc
	pop hl
	ld (ws+259), hl
	push bc
	push hl
	ld hl, (ws+261)
	call f43_file_i_init
	ld hl, (ws+259)
	inc hl
	inc hl
	ld (ws+264), hl
	ld c, 19 
	ld de, ( ws+264 ) 
	call 5 
	ld c, 22 
	ld de, ( ws+264 ) 
	call 5 
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+263 ), a 
;end_f52_FCBOpenOut:
;	ld a, (ws+263)
	ret


	; FCBClose workspace at ws+257 length ws+5
f53_FCBClose:
	ld (ws+257), hl
	call f47_fcb_i_blockout
	ld hl, (ws+257)
	inc hl
	inc hl
	ld (ws+260), hl
	ld c, 16 
	ld de, ( ws+260 ) 
	call 5 
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+259 ), a 
;end_f53_FCBClose:
;	ld a, (ws+259)
	ret


	; FCBSeek workspace at ws+331 length ws+9
f54_FCBSeek:
	ld (ws+333), hl
	exx
	ld (ws+335), hl
	exx
	pop bc
	pop hl
	ld (ws+331), hl
	push bc
	ld de, (ws+333)
	exx
	ld de, (ws+335)
	exx
	ld hl,65535
	exx
	ld hl,65535
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+333), hl
	exx
	ld (ws+335), hl
	exx
	ld hl, (ws+333)
	exx
	ld hl, (ws+335)
	exx
	ld a,7
	call f123__lsr4
	ld (ws+337), hl
	ld a, (ws+333)
	and 127
	ld (ws+339), a
	ld hl, (ws+331)
	push hl
	ld hl, (ws+337)
	call f48_fcb_i_changeblock
	ld a, (ws+339)
	ld hl, (ws+331)
	ld (hl),a
;end_f54_FCBSeek:
	ret


	; fcb_i_nextchar workspace at ws+348 length ws+2
f60_fcb_i_nextchar:
	ld (ws+348), hl
	ld a,(hl)
	inc a
	ld (hl),a
	ld a,(hl)
	cp 128
	jp nz, c01_014e
	ld hl, (ws+348)
	push hl
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	inc hl
	call f48_fcb_i_changeblock
	xor a
	ld hl, (ws+348)
	ld (hl),a
c01_014e:
;c01_014a:
;end_f60_fcb_i_nextchar:
	ret


	; FCBGetChar workspace at ws+345 length ws+3
f61_FCBGetChar:
	ld (ws+345), hl
	call f60_fcb_i_nextchar
	ld hl, (ws+345)
	ld de,38
	add hl,de
	ex de,hl
	ld hl, (ws+345)
	ld a,(hl)
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
;	ld (ws+347), a
;end_f61_FCBGetChar:
;	ld a, (ws+347)
	ret


	; FCBPutChar workspace at ws+330 length ws+3
f62_FCBPutChar:
	ld (ws+332), a
	pop bc
	pop hl
	ld (ws+330), hl
	push bc
	call f60_fcb_i_nextchar
	ld a, (ws+332)
	push af
	ld hl, (ws+330)
	ld de,38
	add hl,de
	ex de,hl
	ld hl, (ws+330)
	ld a,(hl)
	ld l,a
	ld h,0
	add hl,de
	pop af
	ld (hl),a
	ld a,1
	ld hl, (ws+330)
	inc hl
	ld (hl),a
;end_f62_FCBPutChar:
	ret
c01_c9:
	db 101,114,114,111,114,58,32,0


	; StartError workspace at ws+333 length ws+0
f66_StartError:
	ld hl,c01_c9
	jp   f9_print ;	call f9_print
;end_f66_StartError:
;	ret


	; EndError workspace at ws+333 length ws+0
f67_EndError:
	call f10_print_nl
	jp   f4_ExitWithError ;	call f4_ExitWithError
;end_f67_EndError:
;	ret


	; SimpleError workspace at ws+285 length ws+2
f68_SimpleError:
	ld (ws+285), hl
	call f66_StartError
	ld hl, (ws+285)
	call f9_print
	jp   f67_EndError ;	call f67_EndError
;end_f68_SimpleError:
;	ret
c01_c10:
	db 117,110,97,98,108,101,32,116,111,32,111,112,101,110,32,39,0
c01_c11:
	db 39,0


	; CannotOpen workspace at ws+331 length ws+2
f69_CannotOpen:
	ld (ws+331), hl
	call f66_StartError
	ld hl,c01_c10
	call f9_print
	ld hl, (ws+331)
	call f9_print
	ld hl,c01_c11
	call f9_print
	jp   f67_EndError ;	call f67_EndError
;end_f69_CannotOpen:
;	ret


	; E_b8 workspace at ws+329 length ws+1
f70_E_b8:
	ld (ws+329), a
	ld hl,ws+16
	push hl
	call f62_FCBPutChar
;end_f70_E_b8:
	ret


	; E workspace at ws+317 length ws+3
f71_E:
	ld (ws+317), hl
c01_0162:
	ld hl, (ws+317)
	ld a,(hl)
	ld (ws+319), a
	inc hl
	ld (ws+317), hl
	or a
;	jp nz, c01_0168
;	jp c01_0163
;c01_0168:
	jp z,c01_0163
;c01_0164:
	ld a, (ws+319)
	call f70_E_b8
	jp c01_0162
c01_0163:
;end_f71_E:
	ret


	; E_u32 workspace at ws+306 length ws+23
f72_E_u32:
	ld (ws+306), hl
	exx
	ld (ws+308), hl
	exx
	ld iy,ws+310
	ld (ws+322), iy
	exx
	push hl
	exx
	push hl
	ld h,10
	push hl
	push iy
	pop hl
	call f11_UIToA
;	ld (ws+324), hl
;	ld (ws+326), hl
c01_0169:
	ld hl, (ws+322)
	ld a,(hl)
	ld (ws+328), a
	or a
;	jp nz, c01_016f
;	jp c01_016a
;c01_016f:
	jp z,c01_016a
;c01_016b:
	ld a, (ws+328)
	call f70_E_b8
	ld hl, (ws+322)
	inc hl
	ld (ws+322), hl
	jp c01_0169
c01_016a:
;end_f72_E_u32:
	ret


	; E_u16 workspace at ws+304 length ws+2
f73_E_u16:
	ld (ws+304), hl
	exx
	ld hl,0
	exx
	jp   f72_E_u32 ;	call f72_E_u32
;end_f73_E_u16:
;	ret


	; E_h workspace at ws+302 length ws+15
f76_E_h:
	ld (ws+306), a
	pop bc
	pop hl
	ld (ws+302), hl
	pop hl
	ld (ws+304), hl
	push bc
	ld hl, (ws+302)
	exx
	ld hl, (ws+304)
	exx
	exx
	push hl
	exx
	push hl
	ld b,16
	push bc
	ld hl,ws+307
	call f11_UIToA
;	ld (ws+312), hl
;	ld (ws+314), hl
	ld a, (ws+306)
	push af
	ld de,ws+307
	and a
	sbc hl,de
	ld a,l
	ld b,a
	pop af
	sub b
	ld (ws+316), a
c01_0175:
	ld a, (ws+316)
	or a
	jp z, c01_017a
	ld a,48
	call f70_E_b8
	ld a, (ws+316)
	dec a
	ld (ws+316), a
	jp c01_0175
c01_017a:
	ld hl,ws+307
	call f71_E
;end_f76_E_h:
	ret


	; E_h8 workspace at ws+301 length ws+1
f77_E_h8:
	ld (ws+301), a
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	exx
	push hl
	exx
	push hl
	ld a,2
	call f76_E_h
;end_f77_E_h8:
	ret
c01_c12:
	db 99,97,110,110,111,116,32,111,112,101,110,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterOpenfile workspace at ws+256 length ws+3
f79_EmitterOpenfile:
	ld (ws+256), hl
	ld bc,ws+16
	push bc
	call f52_FCBOpenOut
;	ld (ws+258), a
	or a
	jp z, c01_017f
	ld hl,c01_c12
	call f68_SimpleError
c01_017f:
;c01_017b:
;end_f79_EmitterOpenfile:
	ret
c01_c13:
	db 99,97,110,110,111,116,32,99,108,111,115,101,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterClosefile workspace at ws+256 length ws+1
f80_EmitterClosefile:
	ld hl,ws+16
	call f53_FCBClose
;	ld (ws+256), a
	or a
	jp z, c01_0184
	ld hl,c01_c13
	call f68_SimpleError
c01_0184:
;c01_0180:
;end_f80_EmitterClosefile:
	ret


	; E_nl workspace at ws+301 length ws+0
f81_E_nl:
	ld a,10
	jp   f70_E_b8 ;	call f70_E_b8
;end_f81_E_nl:
;	ret


	; ArchAlignUp workspace at ws+884 length ws+5
f82_ArchAlignUp:
	ld (ws+886), a
	pop bc
	pop hl
	ld (ws+884), hl
	push bc
;	ld (ws+887), hl
;end_f82_ArchAlignUp:
;	ld hl, (ws+887)
	ret


	; ArchEmitSubRef workspace at ws+301 length ws+2
f83_ArchEmitSubRef:
	ld (ws+301), hl
	ld a,102
	call f70_E_b8
	ld ix, (ws+301)
	ld l, (ix+60)
	ld h, (ix+61)
	call f73_E_u16
	ld a,95
	call f70_E_b8
	ld ix, (ws+301)
	ld l, (ix+38)
	ld h, (ix+39)
	jp   f71_E ;	call f71_E
;end_f83_ArchEmitSubRef:
;	ret
c01_c14:
	db 119,115,43,0


	; ArchEmitWSRef workspace at ws+301 length ws+3
f84_ArchEmitWSRef:
	ld (ws+302), hl
	pop bc
	pop af
	ld (ws+301), a
	push bc
	ld hl,c01_c14
	call f71_E
	ld hl, (ws+302)
	call f73_E_u16
;end_f84_ArchEmitWSRef:
	ret
c01_c15:
	db 9,111,114,103,32,49,48,48,104,10,0
c01_c16:
	db 9,108,120,105,32,115,112,44,32,84,79,80,43,0
c01_c17:
	db 9,99,97,108,108,32,0
c01_c18:
	db 9,114,115,116,32,48,10,0


	; ArchEmitHeader workspace at ws+256 length ws+4
f85_ArchEmitHeader:
	ld (ws+256), hl
	ld hl,c01_c15
	call f71_E
	ld hl,c01_c16
	call f71_E
	ld hl,128
	call f73_E_u16
	call f81_E_nl
c01_0185:
	ld hl, (ws+256)
	ld a,h
	or l
	jp z, c01_018a
	ld hl, (ws+256)
	ld de,170
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+258), hl
	ld a,h
	or l
	jp z, c01_018f
	ld hl,c01_c17
	call f71_E
	ld hl, (ws+258)
	call f83_ArchEmitSubRef
	call f81_E_nl
c01_018f:
;c01_018b:
	ld hl, (ws+256)
	ld bc,202
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+256), hl
	jp c01_0185
c01_018a:
	ld hl,c01_c18
	jp   f71_E ;	call f71_E
;end_f85_ArchEmitHeader:
;	ret
c01_c19:
	db 84,79,80,58,10,0
c01_c20:
	db 119,115,32,101,113,117,32,84,79,80,43,0
c01_c21:
	db 76,79,77,69,77,32,101,113,117,32,119,115,43,0
c01_c22:
	db 9,101,110,100,10,0


	; ArchEmitFooter workspace at ws+256 length ws+2
f86_ArchEmitFooter:
	ld (ws+256), hl
	ld hl,c01_c19
	call f71_E
	ld hl,c01_c20
	call f71_E
	ld hl,128
	call f73_E_u16
	call f81_E_nl
	ld hl,c01_c21
	call f71_E
	ld hl, (ws+182)
	call f73_E_u16
	call f81_E_nl
	ld hl,c01_c22
	call f71_E
	ld a,26
	jp   f70_E_b8 ;	call f70_E_b8
;end_f86_ArchEmitFooter:
;	ret


	; read_bin1 workspace at ws+341 length ws+4
f87_read_bin1:
	ld (ws+341), hl
	call f61_FCBGetChar
;	ld (ws+344), a
;	ld (ws+343), a
;end_f87_read_bin1:
;	ld a, (ws+343)
	ret


	; read_bin2 workspace at ws+331 length ws+6
f88_read_bin2:
	ld (ws+331), hl
	call f87_read_bin1
;	ld (ws+335), a
	ld l,a
	ld h,0
	ld (ws+333), hl
	ld hl, (ws+331)
	call f87_read_bin1
;	ld (ws+336), a
	ld de, (ws+333)
	ld l,a
	ld h,0
	ld a,8
	call f121__asl2
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
;	ld (ws+333), hl
;end_f88_read_bin2:
;	ld hl, (ws+333)
	ret


	; read_string workspace at ws+331 length ws+10
f90_read_string:
	ld (ws+333), a
	pop bc
	pop hl
	ld (ws+331), hl
	push bc
	inc a
	ld l,a
	ld h,0
	call f38_Alloc
;	ld (ws+336), hl
	ld (ws+334), hl
	ld (ws+338), hl
c01_0190:
	ld a, (ws+333)
	or a
;	jp nz, c01_0196
;	jp c01_0191
;c01_0196:
	jp z,c01_0191
;c01_0192:
	ld hl, (ws+331)
	call f87_read_bin1
;	ld (ws+340), a
	ld hl, (ws+338)
	ld (hl),a
	inc hl
	ld (ws+338), hl
	ld a, (ws+333)
	dec a
	ld (ws+333), a
	jp c01_0190
c01_0191:
;end_f90_read_string:
	ld hl, (ws+334)
	ret


	; AddRef workspace at ws+331 length ws+10
f91_AddRef:
	ld (ws+333), hl
	pop bc
	pop hl
	ld (ws+331), hl
	push bc
	push hl
	pop ix
	ld l, (ix+58)
	ld h, (ix+59)
	ld (ws+335), hl
	inc hl
	ld ix, (ws+331)
	ld (ix+58), l
	ld (ix+59), h
	push ix
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+337), hl
c01_0197:
	ld hl, (ws+335)
	ld de,16
	and a
	sbc hl,de
	jp c, c01_019c
;c01_019b:
	ld hl, (ws+337)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz, c01_01a1
	ld hl,34
	call f38_Alloc
;	ld (ws+339), hl
	ld d,h
	ld e,l
	ld hl, (ws+337)
	ld (hl),e
	inc hl
	ld (hl),d
c01_01a1:
;c01_019d:
	ld hl, (ws+337)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+337), hl
	ld hl, (ws+335)
	ld bc,65520
	add hl,bc
	ld (ws+335), hl
	jp c01_0197
c01_019c:
	ld bc, (ws+333)
	ld de, (ws+337)
	inc de
	inc de
	ld a, (ws+335)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld (hl),c
	inc hl
	ld (hl),b
;end_f91_AddRef:
	ret


	; FindSub workspace at ws+343 length ws+10
f92_FindSub:
	ld (ws+345), hl
	pop bc
	pop hl
	ld (ws+343), hl
	push bc
	ld de,168
	add hl,de
	ld (ws+349), hl
c01_01a2:
	ld hl, (ws+345)
	ld bc,16
	and a
	sbc hl,bc
	jp c, c01_01a7
;c01_01a6:
	ld hl, (ws+349)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz, c01_01ac
	ld hl,34
	call f38_Alloc
;	ld (ws+351), hl
	ld d,h
	ld e,l
	ld hl, (ws+349)
	ld (hl),e
	inc hl
	ld (hl),d
c01_01ac:
;c01_01a8:
	ld hl, (ws+349)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+349), hl
	ld hl, (ws+345)
	ld de,65520
	add hl,de
	ld (ws+345), hl
	jp c01_01a2
c01_01a7:
	ld de, (ws+349)
	inc de
	inc de
	ld a, (ws+345)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
;	ld (ws+347), hl
;end_f92_FindSub:
;	ld hl, (ws+347)
	ret


	; FindOrCreateSub workspace at ws+331 length ws+12
f93_FindOrCreateSub:
	ld (ws+333), hl
	pop bc
	pop hl
	ld (ws+331), hl
	push bc
	push hl
	ld hl, (ws+333)
	call f92_FindSub
;	ld (ws+337), hl
	ld (ws+339), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+335), hl
	ld a,h
	or l
	jp nz, c01_01b1
	ld hl,63
	call f38_Alloc
;	ld (ws+341), hl
	ld (ws+335), hl
	ld de, (ws+331)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+10)
	ld hl, (ws+335)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+335)
	ld (ws+10), hl
	ld hl, (ws+12)
	ld ix, (ws+335)
	ld (ix+60), l
	ld (ix+61), h
	push ix
	pop de
	ld hl, (ws+339)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+12)
	inc hl
	ld (ws+12), hl
c01_01b1:
;c01_01ad:
;end_f93_FindOrCreateSub:
	ld hl, (ws+335)
	ret


	; Deref workspace at ws+884 length ws+6
f94_Deref:
	ld (ws+884), hl
	ld (ws+886), hl
	ld a,h
	or l
	jp z, c01_01b6
	ld ix, (ws+884)
	ld l, (ix+40)
	ld h, (ix+41)
	ld (ws+888), hl
	ld a,h
	or l
	jp z, c01_01bb
	ld ix, (ws+888)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+886), hl
c01_01bb:
;c01_01b7:
c01_01b6:
;c01_01b2:
;end_f94_Deref:
	ld hl, (ws+886)
	ret


	; FindOrCreateExternal workspace at ws+331 length ws+9
f95_FindOrCreateExternal:
	ld (ws+331), hl
	ld hl, (ws+8)
	ld (ws+333), hl
c01_01bc:
	ld hl, (ws+333)
	ld a,h
	or l
	jp z, c01_01c1
	ld hl, (ws+333)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+331)
	call f29_StrCmp
;	ld (ws+335), a
	or a
	jp nz, c01_01c6
	jp end_f95_FindOrCreateExternal
c01_01c6:
;c01_01c2:
	ld hl, (ws+333)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+333), hl
	jp c01_01bc
c01_01c1:
	ld hl,6
	call f38_Alloc
;	ld (ws+336), hl
	ld (ws+333), hl
	ld de, (ws+8)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+331)
	call f42_StrDup
;	ld (ws+338), hl
	ld d,h
	ld e,l
	ld hl, (ws+333)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+333)
	ld (ws+8), hl
end_f95_FindOrCreateExternal:
	ld hl, (ws+333)
	ret
c01_c23:
	db 109,117,108,116,105,112,108,101,32,101,120,116,101,114,110,97,108,32,100,101,99,108,97,114,97,116,105,111,110,115,32,111,102
db 32,39,0
c01_c24:
	db 39,0
c01_c25:
	db 101,114,114,111,114,58,32,117,110,115,117,112,112,111,114,116,101,100,32,114,101,99,111,114,100,32,39,0
c01_c26:
	db 39,32,105,110,32,0
c01_c27:
	db 32,97,116,32,0


	; OpenAndLoadCoo workspace at ws+266 length ws+65
f96_OpenAndLoadCoo:
	ld (ws+266), hl
	ld hl,206
	call f38_Alloc
;	ld (ws+270), hl
	ld (ws+268), hl
	ld de, (ws+12)
	ld bc,204
	add hl,bc
	ld (hl),e
	inc hl
	ld (hl),d
	ld bc, (ws+266)
	ld hl, (ws+268)
	ld de,166
	add hl,de
	ld (hl),c
	inc hl
	ld (hl),b
	ld hl, (ws+12)
	inc hl
	ld (ws+12), hl
	ld hl, (ws+268)
	push hl
	ld h,b
	ld l,c
	call f50_FCBOpenIn
;	ld (ws+272), a
	or a
	jp z, c01_01cb
	ld hl, (ws+266)
	call f69_CannotOpen
c01_01cb:
;c01_01c7:
	ld hl,0
	ld (ws+276), hl
	ld (ws+278), hl
c01_01cc:
	ld hl, (ws+268)
	push hl
	ld hl, (ws+276)
	exx
	ld hl, (ws+278)
	exx
	call f54_FCBSeek
	ld hl, (ws+268)
	call f87_read_bin1
	ld (ws+280), a
	ld (ws+281), a
	ld hl, (ws+268)
	call f88_read_bin2
;	ld (ws+282), hl
	ld (ws+284), hl
	ld a, (ws+281)
	cp 69
;	jp nz, c01_01d2
;	jp c01_01cd
;c01_01d2:
	jp z,c01_01cd
	ld a, (ws+281)
	cp 70
	jp nz, c01_01d6
	ld hl, (ws+268)
	call f87_read_bin1
;	ld (ws+288), a
	ld (ws+273), a
	ld hl, (ws+268)
	call f88_read_bin2
;	ld (ws+289), hl
	ld (ws+274), hl
	ld hl, (ws+268)
	push hl
	ld hl, (ws+274)
	call f93_FindOrCreateSub
;	ld (ws+291), hl
	ld (ws+286), hl
	push hl
	pop ix
	ld a, (ix+62)
	or 2
	push hl
	pop ix
	ld (ix+62), a
	jp c01_01ce
c01_01d6:
	ld a, (ws+281)
	cp 82
	jp nz, c01_01da
	ld hl, (ws+268)
	call f88_read_bin2
;	ld (ws+293), hl
	ld (ws+295), hl
	ld hl, (ws+268)
	call f88_read_bin2
;	ld (ws+297), hl
	ld (ws+299), hl
	ld hl, (ws+268)
	push hl
	ld hl, (ws+295)
	call f93_FindOrCreateSub
	ld (ws+301), hl
	ld hl, (ws+268)
	push hl
	ld hl, (ws+299)
	call f93_FindOrCreateSub
	ld (ws+303), hl
	ld hl, (ws+301)
	push hl
	ld hl, (ws+303)
	call f91_AddRef
	jp c01_01ce
c01_01da:
	ld a, (ws+281)
	cp 87
	jp nz, c01_01de
	ld hl, (ws+268)
	call f88_read_bin2
;	ld (ws+305), hl
	ld (ws+274), hl
	ld hl, (ws+268)
	push hl
	ld hl, (ws+274)
	call f93_FindOrCreateSub
;	ld (ws+307), hl
	ld (ws+286), hl
	ld hl, (ws+268)
	call f87_read_bin1
	ld (ws+309), a
	ld (ws+310), a
	ld hl, (ws+268)
	call f88_read_bin2
;	ld (ws+311), hl
	ld b,h
	ld c,l
	ld de, (ws+286)
	ld hl,42
	add hl,de
	ex de,hl
	ld a, (ws+310)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld (hl),c
	inc hl
	ld (hl),b
	jp c01_01ce
c01_01de:
	ld a, (ws+281)
	cp 78
	jp nz, c01_01e2
	ld hl, (ws+268)
	call f88_read_bin2
;	ld (ws+313), hl
	ld (ws+274), hl
	ld hl, (ws+268)
	push hl
	ld hl, (ws+274)
	call f93_FindOrCreateSub
;	ld (ws+315), hl
	ld (ws+286), hl
	ld hl, (ws+268)
	push hl
	ld a, (ws+284)
	add 254
	call f90_read_string
;	ld (ws+317), hl
	ld ix, (ws+286)
	ld (ix+38), l
	ld (ix+39), h
	jp c01_01ce
c01_01e2:
	ld a, (ws+281)
	cp 88
	jp nz, c01_01e6
	ld hl, (ws+268)
	call f88_read_bin2
;	ld (ws+319), hl
	ld (ws+274), hl
	ld hl, (ws+268)
	push hl
	ld hl, (ws+274)
	call f93_FindOrCreateSub
;	ld (ws+321), hl
	ld (ws+286), hl
	ld hl, (ws+268)
	push hl
	ld a, (ws+284)
	add 254
	call f90_read_string
;	ld (ws+323), hl
	ld (ws+325), hl
	call f95_FindOrCreateExternal
;	ld (ws+327), hl
	ld (ws+329), hl
	ld ix, (ws+286)
	ld l, (ix+40)
	ld h, (ix+41)
	ld a,h
	or l
	jp z, c01_01eb
	call f66_StartError
	ld hl,c01_c23
	call f9_print
	ld hl, (ws+325)
	call f9_print
	ld hl,c01_c24
	call f9_print
	call f67_EndError
c01_01eb:
;c01_01e7:
	ld hl, (ws+329)
	ld ix, (ws+286)
	ld (ix+40), l
	ld (ix+41), h
	jp c01_01ce
c01_01e6:
	ld hl,c01_c25
	call f9_print
	ld a, (ws+281)
	call f7_print_char
	ld hl,c01_c26
	call f9_print
	ld hl, (ws+266)
	call f9_print
	ld hl,c01_c27
	call f9_print
	ld hl, (ws+276)
	exx
	ld hl, (ws+278)
	exx
	call f22_print_hex_i32
	call f10_print_nl
	call f4_ExitWithError
c01_01ce:
	ld de, (ws+276)
	exx
	ld de, (ws+278)
	exx
	ld hl, (ws+284)
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ex de,hl
	exx
	ex de,hl
	exx
	ld hl,3
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+276), hl
	exx
	ld (ws+278), hl
	exx
	jp c01_01cc
c01_01cd:
;end_f96_OpenAndLoadCoo:
	ld hl, (ws+268)
	ret


	; InitStreams workspace at ws+256 length ws+0
f97_InitStreams:
	ld bc,ws+191
	push bc
	ld hl,32
	call f26_MemZero
;end_f97_InitStreams:
	ret
c01_c28:
	db 115,116,114,101,97,109,32,73,68,32,111,117,116,32,111,102,32,114,97,110,103,101,0


	; SetStream workspace at ws+280 length ws+5
f98_SetStream:
	ld (ws+280), a
	cp 8
	jp c, c01_01f0
;c01_01ef:
	ld hl,c01_c28
	call f68_SimpleError
c01_01f0:
;c01_01ec:
	ld bc,ws+191
	ld a, (ws+280)
	ld l,a
	ld h,0
	add hl,hl
	add hl,hl
	add hl,bc
	ld (ws+223), hl
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz, c01_01f5
	ld hl,258
	call f38_Alloc
;	ld (ws+281), hl
	ld (ws+283), hl
	ld d,h
	ld e,l
	ld hl, (ws+223)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+283)
	ld hl, (ws+223)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
c01_01f5:
;c01_01f1:
;end_f98_SetStream:
	ret
c01_c29:
	db 114,101,102,101,114,101,110,99,101,32,116,111,32,117,110,100,101,102,105,110,101,100,32,115,117,98,114,111,117,116,105,110
db 101,32,0
c01_c30:
	db 39,0
c01_c31:
	db 39,0
c01_c32:
	db 119,104,105,99,104,32,105,115,32,97,110,111,110,121,109,111,117,115,0


	; CheckSubExists workspace at ws+305 length ws+2
f99_CheckSubExists:
	ld (ws+305), hl
	push hl
	pop ix
	ld a, (ix+62)
	and 2
	or a
	jp nz, c01_01fa
	call f66_StartError
	ld hl,c01_c29
	call f9_print
	ld ix, (ws+305)
	ld l, (ix+60)
	ld h, (ix+61)
	call f20_print_hex_i16
	ld a,32
	call f7_print_char
	ld ix, (ws+305)
	ld l, (ix+38)
	ld h, (ix+39)
	ld a,h
	or l
	jp z, c01_01ff
	ld hl,c01_c30
	call f9_print
	ld ix, (ws+305)
	ld l, (ix+38)
	ld h, (ix+39)
	call f9_print
	ld hl,c01_c31
	call f9_print
	jp c01_01fb
c01_01ff:
	ld hl,c01_c32
	call f9_print
c01_01fb:
	call f67_EndError
c01_01fa:
;c01_01f6:
;end_f99_CheckSubExists:
	ret


	; ParseWsRef workspace at ws+301 length ws+4
f101_ParseWsRef:
	ld a, (ws+226)
	ld e,a
	ld d,0
	ld a, (ws+227)
	ld l,a
	ld h,d
	ld a,8
	call f121__asl2
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ws+286), hl
	ld a, (ws+228)
	ld (ws+290), a
	ld a, (ws+229)
	ld e,a
	ld d,0
	ld a, (ws+230)
	ld l,a
	ld h,d
	ld a,8
	call f121__asl2
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ws+291), hl
	ld hl, (ws+14)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+286)
	call f93_FindOrCreateSub
;	ld (ws+301), hl
	ld (ws+288), hl
	call f94_Deref
;	ld (ws+303), hl
	ld (ws+288), hl
	call f99_CheckSubExists
;end_f101_ParseWsRef:
	ret


	; WriteCharacterFromStream workspace at ws+285 length ws+16
f100_WriteCharacterFromStream:
	ld (ws+285), a
	ld a, (ws+233)
	or a
	jp nz, c01_0204
	ld a, (ws+285)
	cp 3
	jp nz, c01_0206
	ld a,99
	call f70_E_b8
	ld hl, (ws+14)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld de,204
	add hl,de
	ld a,(hl)
	call f77_E_h8
	ld a,95
	call f70_E_b8
	ret
c01_0206:
	cp 4
	jp nz, c01_0207
	ld hl, (ws+14)
	call f83_ArchEmitSubRef
	ret
c01_0207:
	cp 1
	jp nz, c01_0208
	ld a,3
	ld (ws+233), a
	jp c01_0205
c01_0208:
	cp 2
	jp nz, c01_0209
	ld a,6
	ld (ws+233), a
	jp c01_0205
c01_0209:
	cp 5
	jp nz, c01_020a
	ld a,4
	ld (ws+233), a
	jp c01_0205
c01_020a:
	cp 6
	jp nz, c01_020b
	ld a,6
	ld (ws+233), a
	jp c01_0205
c01_020b:
	cp 10
	jp nz, c01_020c
	call f81_E_nl
	ret
c01_020c:
	ld a, (ws+285)
	call f70_E_b8
	ret
c01_0205:
	ld a, (ws+285)
	ld (ws+225), a
	ld a,1
	ld (ws+234), a
	jp c01_0200
c01_0204:
	ld a, (ws+285)
	push af
	ld bc,ws+225
	ld a, (ws+234)
	ld l,a
	ld h,0
	add hl,bc
	pop af
	ld (hl),a
	ld a, (ws+234)
	inc a
	ld (ws+234), a
	ld b,a
	ld a, (ws+233)
	cp b
;	jp z, c01_0211
;	ret
;c01_0211:
	ret nz
;c01_020d:
	ld a, (ws+225)
	cp 1
	jp nz, c01_0213
	ld a, (ws+226)
	ld e,a
	ld d,0
	ld a, (ws+227)
	ld l,a
	ld h,d
	ld a,8
	call f121__asl2
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ws+286), hl
	ld hl, (ws+14)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+286)
	call f93_FindOrCreateSub
;	ld (ws+293), hl
	ld (ws+288), hl
	call f94_Deref
;	ld (ws+295), hl
	ld (ws+288), hl
	call f99_CheckSubExists
	ld hl, (ws+288)
	call f83_ArchEmitSubRef
	jp c01_0212
c01_0213:
	cp 2
	jp nz, c01_0214
	call f101_ParseWsRef
	ld a, (ws+290)
	push af
	ld de, (ws+288)
	ld hl,50
	add hl,de
	ex de,hl
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+291)
	add hl,de
	call f84_ArchEmitWSRef
	jp c01_0212
c01_0214:
	cp 5
	jp nz, c01_0215
	ld a, (ws+226)
	ld e,a
	ld d,0
	ld a, (ws+227)
	ld l,a
	ld h,d
	ld a,8
	call f121__asl2
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ws+286), hl
	ld a, (ws+228)
	ld (ws+290), a
	ld hl, (ws+14)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+286)
	call f93_FindOrCreateSub
;	ld (ws+297), hl
	ld (ws+288), hl
	call f94_Deref
;	ld (ws+299), hl
	ld (ws+288), hl
	call f99_CheckSubExists
	ld a, (ws+290)
	push af
	ld hl, (ws+288)
	ld de,42
	add hl,de
	ex de,hl
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f84_ArchEmitWSRef
	jp c01_0212
c01_0215:
	cp 6
	jp nz, c01_0216
	call f101_ParseWsRef
	ld de, (ws+288)
	ld hl,50
	add hl,de
	ex de,hl
	ld a, (ws+290)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+291)
	add hl,de
	call f73_E_u16
c01_0216:
c01_0212:
	xor a
	ld (ws+233), a
c01_0200:
;end_f100_WriteCharacterFromStre:  
	ret


	; FlushStream workspace at ws+280 length ws+5
f102_FlushStream:
	ld hl, (ws+223)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+280), hl
c01_0217:
	ld hl, (ws+280)
	ld a,h
	or l
	jp z, c01_021c
	xor a
	ld (ws+282), a
c01_021d:
	ld a, (ws+282)
	ld d,a
	ld hl, (ws+280)
	ld bc,255
	add hl,bc
	ld a,(hl)
	cp d
	jp z, c01_0222
	ld de, (ws+280)
	ld a, (ws+282)
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
	call f100_WriteCharacterFromStream
	ld a, (ws+282)
	inc a
	ld (ws+282), a
	jp c01_021d
c01_0222:
	ld hl, (ws+280)
	ld (ws+283), hl
	ld de,256
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+280), hl
	ld hl, (ws+283)
	call f40_Free
	jp c01_0217
c01_021c:
	ld bc,0
	ld hl, (ws+223)
	ld (hl),c
	inc hl
	ld (hl),b
	ld hl, (ws+223)
	inc hl
	inc hl
	ld (hl),c
	inc hl
	ld (hl),b
;end_f102_FlushStream:
	ret


	; WriteStream workspace at ws+281 length ws+5
f103_WriteStream:
	ld (ws+281), a
	ld hl, (ws+223)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+282), hl
	ld d,h
	ld e,l
	ld hl,255
	add hl,de
	ld a,(hl)
	cp 255
	jp nz, c01_0227
	ld hl,258
	call f38_Alloc
;	ld (ws+284), hl
	ld (ws+282), hl
	ld b,h
	ld c,l
	ld hl, (ws+223)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld de,256
	add hl,de
	ld (hl),c
	inc hl
	ld (hl),b
	ld de, (ws+282)
	ld hl, (ws+223)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
c01_0227:
;c01_0223:
	ld a, (ws+281)
	push af
	ld de, (ws+282)
	ld h,d
	ld l,e
	ld bc,255
	add hl,bc
	ld a,(hl)
	ld l,a
	ld h,0
	add hl,de
	pop af
	ld (hl),a
	ld h,d
	ld l,e
	add hl,bc
	ld a,(hl)
	inc a
	ld h,d
	ld l,e
	add hl,bc
	ld (hl),a
;end_f103_WriteStream:
	ret
c01_c33:
	db 101,114,114,111,114,58,32,109,97,108,102,111,114,109,101,100,32,99,111,111,102,105,108,101,58,32,0


	; MalformedError workspace at ws+284 length ws+2
f105_MalformedError:
	ld (ws+284), hl
	ld hl,c01_c33
	call f9_print
	ld hl, (ws+284)
	call f9_print
	call f10_print_nl
	jp   f4_ExitWithError ;	call f4_ExitWithError
;end_f105_MalformedError:
;	ret
c01_c34:
	db 117,110,101,120,112,101,99,116,101,100,32,101,110,100,32,111,102,32,99,104,117,110,107,0


	; UnexpectedEndOfChunk workspace at ws+284 length ws+0
f106_UnexpectedEndOfChunk:
	ld hl,c01_c34
	jp   f105_MalformedError ;	call f105_MalformedError
;end_f106_UnexpectedEndOfChunk:
;	ret


	; ReadB1 workspace at ws+281 length ws+2
f107_ReadB1:
	ld hl, (ws+263)
	ld de,1
	and a
	sbc hl,de
	jp nc, c01_022c
;c01_022b:
	call f106_UnexpectedEndOfChunk
c01_022c:
;c01_0228:
	ld hl, (ws+263)
	dec hl
	ld (ws+263), hl
	ld hl, (ws+258)
	call f87_read_bin1
;	ld (ws+282), a
;	ld (ws+281), a
;end_f107_ReadB1:
;	ld a, (ws+281)
	ret


	; ReadB2 workspace at ws+280 length ws+4
f108_ReadB2:
	ld hl, (ws+263)
	ld bc,2
	and a
	sbc hl,bc
	jp nc, c01_0231
;c01_0230:
	call f106_UnexpectedEndOfChunk
c01_0231:
;c01_022d:
	ld hl, (ws+263)
	dec hl
	dec hl
	ld (ws+263), hl
	ld hl, (ws+258)
	call f88_read_bin2
;	ld (ws+282), hl
;	ld (ws+280), hl
;end_f108_ReadB2:
;	ld hl, (ws+280)
	ret


	; CopySourceChunk workspace at ws+280 length ws+1
f109_CopySourceChunk:
c01_0232:
	ld hl, (ws+263)
	ld a,h
	or l
	jp z, c01_0237
	call f107_ReadB1
	ld (ws+262), a
	call f103_WriteStream
	jp c01_0232
c01_0237:
;end_f109_CopySourceChunk:
	ret


	; WriteSubroutinesToOutputFile workspace at ws+258 length ws+22
f104_WriteSubroutinesToOutputFi:  
	ld (ws+258), hl
	ld hl,0
	ld (ws+266), hl
	ld (ws+268), hl
c01_0238:
	ld ix,255
	ld (ws+263), ix
	ld hl, (ws+258)
	push hl
	ld hl, (ws+266)
	exx
	ld hl, (ws+268)
	exx
	call f54_FCBSeek
	call f107_ReadB1
;	ld (ws+270), a
	ld (ws+262), a
	call f108_ReadB2
;	ld (ws+271), hl
	ld (ws+263), hl
	ld de, (ws+266)
	exx
	ld de, (ws+268)
	exx
	ld hl, (ws+263)
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ex de,hl
	exx
	ex de,hl
	exx
	ld hl,3
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+266), hl
	exx
	ld (ws+268), hl
	exx
	ld a, (ws+262)
	cp 69
;	jp nz, c01_023e
;	jp c01_0239
;c01_023e:
	jp z,c01_0239
	ld a, (ws+262)
	cp 70
	jp nz, c01_0238 ; c01_0242
;c01_0241:
	call f107_ReadB1
;	ld (ws+273), a
	ld (ws+265), a
	call f108_ReadB2
;	ld (ws+274), hl
	ld (ws+260), hl
	ld hl, (ws+258)
	push hl
	ld hl, (ws+260)
	call f93_FindOrCreateSub
;	ld (ws+276), hl
	ld (ws+14), hl
	call f94_Deref
;	ld (ws+278), hl
	ld (ws+14), hl
	push hl
	pop ix
	ld a, (ix+62)
	and 1
	or a
	jp z, c01_0238 ; c01_0247
;c01_0246:
	ld a, (ws+265)
	and 127
	call f98_SetStream
	call f109_CopySourceChunk
	ld a, (ws+265)
	and 128
	or a
	jp z, c01_0238 ; c01_024c
;c01_024b:
	call f102_FlushStream
c01_024c:
;c01_0248:
c01_0247:
;c01_0243:
c01_0242:
;c01_023a:
	jp c01_0238
c01_0239:
;end_f104_WriteSubroutinesToOutp:      
	ret
c01_c35:
	db 67,111,112,121,105,110,103,32,102,114,111,109,32,105,110,112,117,116,32,102,105,108,101,58,32,0


	; WriteAllSubroutinesToOutputFile workspace at ws+256 length ws+2
f110_WriteAllSubroutinesToOutpu:     
	ld (ws+256), hl
c01_024d:
	ld hl, (ws+256)
	ld a,h
	or l
	jp z, c01_0252
	ld hl,c01_c35
	call f9_print
	ld de, (ws+256)
	ld hl,166
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	call f10_print_nl
	ld hl, (ws+256)
	call f104_WriteSubroutinesToOutputFi;e
	ld hl, (ws+256)
	ld de,202
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+256), hl
	jp c01_024d
c01_0252:
;end_f110_WriteAllSubroutinesToO:         
	ret
c01_c36:
	db 99,111,110,102,108,105,99,116,105,110,103,32,101,120,116,101,114,110,97,108,115,0
c01_c37:
	db 101,114,114,111,114,58,32,101,120,116,101,114,110,97,108,32,39,0
c01_c38:
	db 39,32,117,110,114,101,115,111,108,118,101,100,10,0
c01_c39:
	db 97,98,111,114,116,105,110,103,0


	; ResolveExternals workspace at ws+256 length ws+5
f111_ResolveExternals:
	xor a
	ld (ws+258), a
	ld hl, (ws+10)
	ld (ws+259), hl
c01_0253:
	ld hl, (ws+259)
	ld a,h
	or l
	jp z, c01_0258
	ld ix, (ws+259)
	ld a, (ix+62)
	and 2
	or a
	jp z, c01_025d
	ld ix, (ws+259)
	ld l, (ix+40)
	ld h, (ix+41)
	ld (ws+256), hl
	ld a,h
	or l
	jp z, c01_0262
	ld ix, (ws+256)
	ld l, (ix+4)
	ld h, (ix+5)
	ld a,h
	or l
	jp z, c01_0269
;c01_026a:
	ld ix, (ws+256)
	ld e, (ix+4)
	ld d, (ix+5)
	ld hl, (ws+259)
	and a
	sbc hl,de
	jp z, c01_0269
;c01_0268:
	ld hl,c01_c36
	call f68_SimpleError
c01_0269:
;c01_0263:
	ld hl, (ws+259)
	ld ix, (ws+256)
	ld (ix+4), l
	ld (ix+5), h
c01_0262:
;c01_025e:
c01_025d:
;c01_0259:
	ld hl, (ws+259)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+259), hl
	jp c01_0253
c01_0258:
	ld hl, (ws+10)
	ld (ws+259), hl
c01_026b:
	ld hl, (ws+259)
	ld a,h
	or l
	jp z, c01_0270
	ld ix, (ws+259)
	ld l, (ix+40)
	ld h, (ix+41)
	ld (ws+256), hl
	ld a,h
	or l
	jp z, c01_0277
;c01_0278:
	ld ix, (ws+256)
	ld l, (ix+4)
	ld h, (ix+5)
	ld a,h
	or l
	jp nz, c01_0277
;c01_0276:
	ld hl,c01_c37
	call f9_print
	ld hl, (ws+256)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	ld hl,c01_c38
	call f9_print
	ld a,1
	ld (ws+258), a
c01_0277:
;c01_0271:
	ld hl, (ws+259)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+259), hl
	jp c01_026b
c01_0270:
	ld a, (ws+258)
	or a
	jp z, c01_027d
	ld hl,c01_c39
	call f68_SimpleError
c01_027d:
;c01_0279:
;end_f111_ResolveExternals:
	ret
c01_c40:
	db 101,114,114,111,114,58,32,100,101,112,101,110,100,101,110,99,121,32,103,114,97,112,104,32,111,118,101,114,102,108,111,119,10
db 0


	; push workspace at ws+884 length ws+4
f113_push:
	ld (ws+884), hl
	ld hl, (ws+858)
	ld (ws+886), hl
c01_0284:
	ld hl, (ws+886)
	ld a,h
	or l
	jp z, c01_0289
	ld hl, (ws+886)
	dec hl
	ld (ws+886), hl
	ld bc,ws+258
	add hl,hl
	add hl,bc
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+884)
	and a
	sbc hl,de
	jp nz, c01_0284 ; c01_028e
;c01_028d:
	ret
c01_028e:
;c01_028a:
	jp c01_0284
c01_0289:
	ld hl, (ws+858)
	ld de,65236
	add hl,de
	ld a,h
	or l
	jp nz, c01_0293
	ld hl,c01_c40
	call f9_print
	call f4_ExitWithError
c01_0293:
;c01_028f:
	ld de, (ws+884)
	ld bc,ws+258
	ld hl, (ws+858)
	add hl,hl
	add hl,bc
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+858)
	inc hl
	ld (ws+858), hl
;end_f113_push:
	ret
c01_c41:
	db 87,111,114,107,115,112,97,99,101,32,115,105,122,101,115,58,10,0
c01_c42:
	db 32,32,35,0
c01_c43:
	db 58,32,0
c01_c44:
	db 32,98,121,116,101,115,10,0


	; PlaceSubroutines workspace at ws+256 length ws+628
f112_PlaceSubroutines:
	ld (ws+256), hl
	ld iy,0
	ld (ws+858), iy
	xor a
	ld (ws+860), a
c01_027e:
	ld a, (ws+860)
	cp 4
	jp z, c01_0283
	ld de,0
	ld bc,ws+182
	ld a, (ws+860)
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld (hl),e
	inc hl
	ld (hl),d
	inc a
	ld (ws+860), a
	jp c01_027e
c01_0283:
	ld hl, (ws+256)
	call f113_push
c01_0294:
	ld hl, (ws+858)
	ld a,h
	or l
	jp z, c01_0299
	ld hl, (ws+858)
	dec hl
	ld (ws+858), hl
	ld bc,ws+258
	add hl,hl
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+256), hl
	push hl
	pop ix
	ld a, (ix+62)
	or 1
	push hl
	pop ix
	ld (ix+62), a
	xor a
	ld (ws+860), a
c01_029a:
	ld a, (ws+860)
	cp 4
	jp z, c01_029f
	ld hl, (ws+256)
	ld de,50
	add hl,de
	ex de,hl
	ld a, (ws+860)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld c,(hl)
	inc hl
	ld b,(hl)
	ld de, (ws+256)
	ld hl,42
	add hl,de
	ex de,hl
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,bc
	ld (ws+869), hl
	push hl
	ld a,8
	call f82_ArchAlignUp
;	ld (ws+871), hl
	ld d,h
	ld e,l
	ld bc,ws+861
	ld a, (ws+860)
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld (hl),e
	inc hl
	ld (hl),d
	ld de,ws+182
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld de, (ws+869)
	and a
	sbc hl,de
	jp nc, c01_02a4
;c01_02a3:
	ld bc, (ws+869)
	ld de,ws+182
	ld a, (ws+860)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld (hl),c
	inc hl
	ld (hl),b
c01_02a4:
;c01_02a0:
	ld a, (ws+860)
	inc a
	ld (ws+860), a
	jp c01_029a
c01_029f:
	ld hl, (ws+256)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+873), hl
c01_02a5:
	ld hl, (ws+873)
	ld a,h
	or l
	jp z, c01_0294 ; c01_02aa
;c01_02a9:
	xor a
	ld (ws+875), a
c01_02ab:
	ld a, (ws+875)
	cp 16
	jp z, c01_02b0
;c01_02af:
	ld de, (ws+873)
	inc de
	inc de
	ld a, (ws+875)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+876), hl
	ld a, (ws+875)
	inc a
	ld (ws+875), a
	ld a,h
	or l
;	jp nz, c01_02b5
;	jp c01_02b0
;c01_02b5:
	jp z,c01_02b0
;c01_02b1:
	ld hl, (ws+876)
	call f94_Deref
;	ld (ws+878), hl
	ld (ws+876), hl
	xor a
	ld (ws+860), a
c01_02b6:
	ld a, (ws+860)
	cp 4
	jp z, c01_02bb
	ld de, (ws+876)
	ld hl,50
	add hl,de
	ex de,hl
	ld a, (ws+860)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+880), hl
	ld bc,ws+861
	ld a, (ws+860)
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+882), hl
	ld hl, (ws+880)
	ld de, (ws+882)
	and a
	sbc hl,de
	jp nc, c01_02c0
;c01_02bf:
	ld bc, (ws+882)
	ld de, (ws+876)
	ld hl,50
	add hl,de
	ex de,hl
	ld a, (ws+860)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld (hl),c
	inc hl
	ld (hl),b
	ld hl, (ws+876)
	call f113_push
c01_02c0:
;c01_02bc:
	ld a, (ws+860)
	inc a
	ld (ws+860), a
	jp c01_02b6
c01_02bb:
	ld ix, (ws+876)
	ld a, (ix+62)
	and 1
	or a
	jp nz, c01_02ab ; c01_02c5
;c01_02c4:
	ld hl, (ws+876)
	call f113_push
	ld ix, (ws+876)
	ld a, (ix+62)
	or 1
	ld (ix+62), a
c01_02c5:
;c01_02c1:
	jp c01_02ab
c01_02b0:
	ld hl, (ws+873)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+873), hl
	jp c01_02a5
c01_02aa:
	jp c01_0294
c01_0299:
	ld hl,c01_c41
	call f9_print
	xor a
	ld (ws+860), a
c01_02c6:
	ld a, (ws+860)
	cp 4
	jp z, c01_02cb
	ld hl,c01_c42
	call f9_print
	ld a, (ws+860)
	call f17_print_i8
	ld hl,c01_c43
	call f9_print
	ld de,ws+182
	ld a, (ws+860)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f16_print_i16
	ld hl,c01_c44
	call f9_print
	ld a, (ws+860)
	inc a
	ld (ws+860), a
	jp c01_02c6
c01_02cb:
;end_f112_PlaceSubroutines:
	ret
c01_c45:
	db 67,79,87,76,73,78,75,58,32,0
c01_c46:
	db 107,66,32,102,114,101,101,10,0
c01_c47:
	db 83,121,110,116,97,120,32,101,114,114,111,114,10,0


	; SyntaxError workspace at ws+256 length ws+0
f114_SyntaxError:
	ld hl,c01_c47
	jp   f68_SimpleError ;	call f68_SimpleError
;end_f114_SyntaxError:
;	ret
c01_c48:
	db 65,100,100,105,110,103,32,105,110,112,117,116,32,102,105,108,101,58,32,0


	; AddInputFile workspace at ws+256 length ws+10
f115_AddInputFile:
	ld (ws+256), hl
	ld hl,c01_c48
	call f9_print
	ld hl, (ws+256)
	call f9_print
	call f10_print_nl
	ld hl, (ws+256)
	call f96_OpenAndLoadCoo
	ld (ws+258), hl
	ld (ws+260), hl
	ld hl, (ws+239)
	ld a,h
	or l
	jp nz, c01_02d0
	ld hl, (ws+260)
	ld (ws+239), hl
	ld (ws+237), hl
	jp c01_02cc
c01_02d0:
	ld de, (ws+260)
	ld hl, (ws+237)
	ld bc,202
	add hl,bc
	ld (hl),e
	inc hl
	ld (hl),d
	ld h,d
	ld l,e
	ld (ws+237), hl
c01_02cc:
	ld hl, (ws+260)
	push hl
	ld hl,0
	call f92_FindSub
;	ld (ws+262), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+264), hl
	ld a,h
	or l
	jp z, c01_02d5
	ld hl, (ws+243)
	ld a,h
	or l
	jp nz, c01_02da
	ld hl, (ws+264)
	ld (ws+243), hl
c01_02da:
;c01_02d6:
c01_02d5:
;c01_02d1:
	ld hl, (ws+245)
	ld a,h
	or l
	jp z, c01_02df
	ld hl, (ws+245)
	push hl
	ld hl, (ws+264)
	call f91_AddRef
c01_02df:
;c01_02db:
	ld hl, (ws+264)
	ld (ws+245), hl
;end_f115_AddInputFile:
	ret
c01_c49:
	db 45,111,0
c01_c50:
	db 78,111,32,109,97,105,110,32,115,117,98,114,111,117,116,105,110,101,32,105,110,32,97,110,121,32,99,111,111,102,105,108,101,0
c01_c51:
	db 78,111,32,111,117,116,112,117,116,32,102,105,108,101,110,97,109,101,32,115,112,101,99,105,102,105,101,100,0
c01_c52:
	db 65,110,97,108,121,115,105,110,103,46,46,46,10,0
c01_c53:
	db 67,114,101,97,116,105,110,103,32,111,117,116,112,117,116,32,102,105,108,101,58,32,0
c01_c54:
	db 100,111,110,101,58,32,0
c01_c55:
	db 107,66,32,102,114,101,101,10,0


	; __main workspace at ws+0 length ws+256
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
	ld ix,1
	ld (ws+12), ix
	ld a,1
	ld (ws+190), a
	xor a
	ld (ws+233), a
	xor a
	ld (ws+234), a
	ld hl,c01_c45
	call f9_print
	call f41_GetFreeMemory
	ld (ws+235), hl
	ld a,10
	call f120__lsr2
	call f16_print_i16
	ld hl,c01_c46
	call f9_print
	ld iy,0
	ld (ws+237), iy
	ld (ws+239), iy
	ld (ws+241), iy
	ld (ws+243), iy
	ld (ws+245), iy
	call f27_ArgvInit
c01_02e0:
	call f28_ArgvNext
	ld (ws+247), hl
	ld (ws+249), hl
	ld a,h
	or l
;	jp nz, c01_02e6
;	jp c01_02e1
;c01_02e6:
	jp z,c01_02e1
;c01_02e2:
	ld hl, (ws+249)
	push hl
	ld hl,c01_c49
	call f31_StrICmp
	ld (ws+251), a
	or a
	jp nz, c01_02eb
	call f28_ArgvNext
	ld (ws+252), hl
	ld (ws+241), hl
	jp c01_02e0 ; c01_02e7
c01_02eb:
	ld hl, (ws+249)
	ld a,(hl)
	cp 45
	jp nz, c01_02ef
	call f114_SyntaxError
	jp c01_02e7
c01_02ef:
	ld hl, (ws+249)
	call f115_AddInputFile
c01_02e7:
	jp c01_02e0
c01_02e1:
	ld hl, (ws+243)
	ld a,h
	or l
	jp nz, c01_02f4
	ld hl,c01_c50
	call f68_SimpleError
c01_02f4:
;c01_02f0:
	ld hl, (ws+241)
	ld a,h
	or l
	jp nz, c01_02f9
	ld hl,c01_c51
	call f68_SimpleError
c01_02f9:
;c01_02f5:
	ld hl,c01_c52
	call f9_print
	call f111_ResolveExternals
	ld hl, (ws+243)
	call f112_PlaceSubroutines
	ld hl, (ws+241)
	call f79_EmitterOpenfile
	ld hl,c01_c53
	call f9_print
	ld hl, (ws+241)
	call f9_print
	call f10_print_nl
	call f97_InitStreams
	ld a,7
	call f98_SetStream
	ld hl, (ws+239)
	call f85_ArchEmitHeader
	call f102_FlushStream
	ld hl, (ws+239)
	call f110_WriteAllSubroutinesToOutpu;File
	ld a,7
	call f98_SetStream
	ld hl, (ws+239)
	call f86_ArchEmitFooter
	call f102_FlushStream
	call f80_EmitterClosefile
	ld hl,c01_c54
	call f9_print
	call f41_GetFreeMemory
	ld (ws+254), hl
	ld a,10
	call f120__lsr2
	call f16_print_i16
	ld hl,c01_c55
	call f9_print
;end_f2___main:
	ret
    ; _lsr1
f117__lsr1:
    dec b
    ret m
    srl a
    jp f117__lsr1

    ; _lsr2
f120__lsr2:
    dec a
    ret m
    srl h
    rr l
    jp f120__lsr2

    ; _asl2
f121__asl2:
    dec a
    ret m
    add hl, hl
    jp f121__asl2

    ; _lsr4
f123__lsr4:
    dec a
    ret m
    exx
    srl h
    rr l
    exx
    rr h
    rr l
    jp f123__lsr4

    ; _dvrmu4
f133__dvrmu4:
    ld a, 32            ; bit count
    and a               ; reset carry
    sbc hl, hl          ; reset remainder
    exx
    sbc hl, hl
    exx
    jp f133__dvrmu4_entry
f133__dvrmu4_loop1:
    add hl, de
    exx
    adc hl, de
    exx
f133__dvrmu4_loop2:
    dec a
    ret z
f133__dvrmu4_entry:
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
    jp c, f133__dvrmu4_loop1      ; if re;ainder < RHS, undo add and go round again
    inc c               ; we know the bottom bit is clear
    jp f133__dvrmu4_loop2

    ; _cmpu4
f140__cmpu4:
    and a               ; clear carry
    sbc hl, de
    ret nz
    exx
    sbc hl, de
    exx
    ret

global _exit
_exit: rst 0
psect data
ws:
defs 924
psect bss
defs 128
TOPSTACK:
