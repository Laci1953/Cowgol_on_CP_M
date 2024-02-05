	psect text

global f470_ProcessFile
global f471_PrintFreeMemory
global f473_ParseArguments
global f71_FindSubr

	; PopulateMatchBuffer workspace at ws+3103 length ws+6
f428_PopulateMatchBuffer:
	ld (ws+3107), hl
	pop bc
	pop hl
	ld (ws+3105), hl
	pop hl
	ld (ws+3103), hl
	push bc
	ld hl, (ws+3105)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld a, (ix+25)
	ld hl, (ws+3107)
	ld (hl),a
	ld hl, (ws+3105)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld e, (ix+11)
	ld d, (ix+12)
	ld hl, (ws+3105)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3105)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z,    _058d
	ld hl, (ws+3105)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld a, (ix+25)
	ld hl, (ws+3107)
	inc hl
	ld (hl),a
	ld hl, (ws+3105)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+11)
	ld h, (ix+12)
	ld ix, (ws+3105)
	ld (ix+4), l
	ld (ix+5), h
	ld l, (ix+4)
	ld h, (ix+5)
	ld a,h
	or l
	jp z,    _0592
	ld ix, (ws+3105)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	pop ix
	ld a, (ix+25)
	ld hl, (ws+3107)
	inc hl
	inc hl
	ld (hl),a
_0592:
	ld hl, (ws+3105)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+13)
	ld h, (ix+14)
	ld ix, (ws+3105)
	ld (ix+6), l
	ld (ix+7), h
	ld l, (ix+6)
	ld h, (ix+7)
	ld a,h
	or l
	jp z,    _0597
	ld ix, (ws+3105)
	ld l, (ix+6)
	ld h, (ix+7)
	push hl
	pop ix
	ld a, (ix+25)
	ld hl, (ws+3107)
	inc hl
	inc hl
	inc hl
	ld (hl),a
_0597:
_058d:
	ld hl, (ws+3105)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+13)
	ld h, (ix+14)
	ld ix, (ws+3105)
	ld (ix+8), l
	ld (ix+9), h
	ld l, (ix+8)
	ld h, (ix+9)
	ld a,h
	or l
	ret z
	ld ix, (ws+3105)
	ld l, (ix+8)
	ld h, (ix+9)
	push hl
	pop ix
	ld a, (ix+25)
	ld hl, (ws+3107)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl),a
	ld ix, (ws+3105)
	ld l, (ix+8)
	ld h, (ix+9)
	push hl
	pop ix
	ld l, (ix+11)
	ld h, (ix+12)
	ld ix, (ws+3105)
	ld (ix+10), l
	ld (ix+11), h
	ld l, (ix+10)
	ld h, (ix+11)
	ld a,h
	or l
	ret z
	ld ix, (ws+3105)
	ld l, (ix+10)
	ld h, (ix+11)
	push hl
	pop ix
	ld a, (ix+25)
	ld ix, (ws+3107)
	ld (ix+5), a
	ld ix, (ws+3105)
	ld l, (ix+10)
	ld h, (ix+11)
	push hl
	pop ix
	ld l, (ix+11)
	ld h, (ix+12)
	ld ix, (ws+3105)
	ld (ix+12), l
	ld (ix+13), h
	ld l, (ix+12)
	ld h, (ix+13)
	ld a,h
	or l
	jp z,    _05a6
	ld ix, (ws+3105)
	ld l, (ix+12)
	ld h, (ix+13)
	push hl
	pop ix
	ld a, (ix+25)
	ld ix, (ws+3107)
	ld (ix+6), a
_05a6:
	ld ix, (ws+3105)
	ld l, (ix+10)
	ld h, (ix+11)
	push hl
	pop ix
	ld l, (ix+13)
	ld h, (ix+14)
	ld ix, (ws+3105)
	ld (ix+14), l
	ld (ix+15), h
	ld l, (ix+14)
	ld h, (ix+15)
	ld a,h
	or l
	ret z
	ld ix, (ws+3105)
	ld l, (ix+14)
	ld h, (ix+15)
	push hl
	pop ix
	ld a, (ix+25)
	ld ix, (ws+3107)
	ld (ix+7), a
	ret


	; IsStackedRegister workspace at ws+3159 length ws+5
f429_IsStackedRegister:
	ld (ws+3159), hl
	xor a
	ld (ws+3161), a
	ld iy,f2___main_s016c
	ld (ws+3162), iy
_05ac:
	ld de, (ws+3162)
	ld hl,f2___main_s016c+144
	and a
	sbc hl,de
	jp z,    _05b1
	ld hl, (ws+3162)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3159)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
	jp z,    _05b6
	ld ix, (ws+3162)
	ld a, (ix+8)
	ld (ws+3161), a
	jp end_f429_IsStackedRegister
_05b6:
	ld hl, (ws+3162)
	ld de,9
	add hl,de
	ld (ws+3162), hl
	jp    _05ac
_05b1:
end_f429_IsStackedRegister:
	ld a, (ws+3161)
	ret


	; CalculateBlockedRegisters workspace at ws+3124 length ws+6
f430_CalculateBlockedRegisters:
	ld (ws+3126), hl
	pop bc
	pop hl
	ld (ws+3124), hl
	push bc
	ld ix,0
	ld (ws+3128), ix
	ld d,h
	ld e,l
	ld hl, (ws+3126)
	and a
	sbc hl,de
	jp z,end_f430_CalculateBlockedRegist;rs
	ld hl, (ws+3124)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3124), hl
_05bc:
	ld de, (ws+3124)
	ld hl, (ws+3126)
	and a
	sbc hl,de
	jp z,    _05c1
	ld de, (ws+3128)
	ld ix, (ws+3124)
	ld l, (ix+26)
	ld h, (ix+27)
	ld a,e
	or l
	ld e,a
	ld a,d
	or h
	ld d,a
	ld l, (ix+30)
	ld h, (ix+31)
	ld a,e
	or l
	ld e,a
	ld a,d
	or h
	ld d,a
	ld l, (ix+28)
	ld h, (ix+29)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ws+3128), hl
	push ix
	pop de
	ld hl, (ws+3126)
	and a
	sbc hl,de
	jp z,   _05c1
	ld hl, (ws+3124)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3124), hl
	jp    _05bc
_05c1:
end_f430_CalculateBlockedRegist:   
	ld hl, (ws+3128)
	ret


	; BlockRegisters workspace at ws+3124 length ws+6
f432_BlockRegisters:
	ld (ws+3128), hl
	pop bc
	pop hl
	ld (ws+3126), hl
	pop hl
	ld (ws+3124), hl
	push bc
	ld d,h
	ld e,l
	ld hl, (ws+3126)
	and a
	sbc hl,de
	ret z
	ld hl, (ws+3124)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3124), hl
_05d1:
	ld de, (ws+3124)
	ld hl, (ws+3126)
	and a
	sbc hl,de
	ret z
	ld ix, (ws+3124)
	ld e, (ix+26)
	ld d, (ix+27)
	ld hl, (ws+3128)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+26), l
	ld (ix+27), h
	ld e, (ix+28)
	ld d, (ix+29)
	ld hl, (ws+3128)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+28), l
	ld (ix+29), h
	ld e, (ix+30)
	ld d, (ix+31)
	ld hl, (ws+3128)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+30), l
	ld (ix+31), h
	push ix
	pop de
	ld hl, (ws+3126)
	and a
	sbc hl,de
	ret z
	ld hl, (ws+3124)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3124), hl
	jp    _05d1

_c365:
	db 116,111,111,32,109,97,110,121,32,115,112,105,108,108,115,0


	; CreateSpill workspace at ws+3124 length ws+9
f435_CreateSpill:
	ld (ws+3128), hl
	pop bc
	pop hl
	ld (ws+3126), hl
	pop hl
	ld (ws+3124), hl
	push bc
	push hl
	pop ix
	ld a, (ix+64)
	ld (ws+3130), a
	cp 16
	jp nz,    _05f0
	ld hl,   _c365
	call f74_SimpleError
_05f0:
	ld hl, (ws+3124)
	ld bc,32
	add hl,bc
	ex de,hl
	ld a, (ws+3130)
	ld l,a
	ld h,0
	add hl,hl
	add hl,hl
	add hl,de
	ld (ws+3131), hl
	ld de, (ws+3126)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+3128)
	ld hl, (ws+3131)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	inc a
	ld ix, (ws+3124)
	ld (ix+64), a
	ret

_c366:
	db 116,111,111,32,109,97,110,121,32,114,101,108,111,97,100,115,0


	; CreateReload workspace at ws+3124 length ws+9
f436_CreateReload:
	ld (ws+3128), hl
	pop bc
	pop hl
	ld (ws+3126), hl
	pop hl
	ld (ws+3124), hl
	push bc
	push hl
	pop ix
	ld a, (ix+65)
	ld (ws+3130), a
	cp 16
	jp nz,    _05f5
	ld hl,   _c366
	call f74_SimpleError
_05f5:
	ld de, (ws+3124)
	ld hl,48
	add hl,de
	ex de,hl
	ld a, (ws+3130)
	ld l,a
	ld h,0
	add hl,hl
	add hl,hl
	add hl,de
	ld (ws+3131), hl
	ld de, (ws+3126)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+3128)
	ld hl, (ws+3131)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	inc a
	ld ix, (ws+3124)
	ld (ix+65), a
	ret


	; ShuffleRegisters workspace at ws+3075 length ws+9
f437_ShuffleRegisters:
	ld (ws+3075), hl
	ld ix,0
	ld (ws+3077), ix
	ld (ws+3079), ix
	ld (ws+3081), hl
	ld a,4
	ld (ws+3083), a
_05f6:
	ld a, (ws+3083)
	or a
	jp z,    _05fb
	ld de, (ws+3077)
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ws+3077), hl
	ld de, (ws+3079)
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ws+3079), hl
	ld a, (ws+3083)
	dec a
	ld (ws+3083), a
	ld hl, (ws+3081)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+3081), hl
	jp    _05f6
_05fb:
_05fc:
	ld hl, (ws+3075)
	ld (ws+3081), hl
	ld a,4
	ld (ws+3083), a
_05fe:
	ld a, (ws+3083)
	or a
	jp z,    _0603
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z,    _060a
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z,   _0603
_060a:
	ld hl, (ws+3081)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+3081), hl
	ld a, (ws+3083)
	dec a
	ld (ws+3083), a
	jp    _05fe
_0603:
	ld a, (ws+3083)
	or a
	jp z,    _0610
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl,0
	call f228_ArchEmitMove
	ld de, (ws+3079)
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3079), hl
	ld de,0
	ld hl, (ws+3081)
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _05fc
_0610:
	ld hl, (ws+3075)
	ld (ws+3081), hl
	ld a,4
	ld (ws+3083), a
_0611:
	ld a, (ws+3083)
	or a
	jp z,    _0616
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z,    _061f
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z,    _061f
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3079)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
	jp z,   _0616
_061f:
	ld hl, (ws+3081)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+3081), hl
	ld a, (ws+3083)
	dec a
	ld (ws+3083), a
	jp    _0611
_0616:
	ld a, (ws+3083)
	or a
	jp z,    _0626
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f228_ArchEmitMove
	ld de, (ws+3079)
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3079), hl
	ld de, (ws+3077)
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3077), hl
	ld de,0
	ld hl, (ws+3081)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _05fc
_0626:
	ld hl, (ws+3075)
	ld (ws+3081), hl
	ld a,4
	ld (ws+3083), a
_0627:
	ld a, (ws+3083)
	or a
	jp z,    _062c
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz,    _0633
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz,   _062c
_0633:
	ld hl, (ws+3081)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+3081), hl
	ld a, (ws+3083)
	dec a
	ld (ws+3083), a
	jp    _0627
_062c:
	ld a, (ws+3083)
	or a
	jp z,    _0639
	ld de,0
	push de
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f228_ArchEmitMove
	ld de, (ws+3077)
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3077), hl
	ld de,0
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _05fc
_0639:
	ld hl, (ws+3075)
	ld (ws+3081), hl
	ld a,4
	ld (ws+3083), a
_063a:
	ld a, (ws+3083)
	or a
	jp z,    _063f
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z,    _0646
	ld hl, (ws+3081)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz,   _063f
_0646:
	ld hl, (ws+3081)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+3081), hl
	ld a, (ws+3083)
	dec a
	ld (ws+3083), a
	jp    _063a
_063f:
	ld a, (ws+3083)
	or a
	ret z
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl,0
	call f228_ArchEmitMove
	ld de, (ws+3079)
	ld hl, (ws+3081)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3079), hl
	ld de,0
	ld hl, (ws+3081)
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _05fc


	; PrintNodes workspace at ws+3126 length ws+10
f438_PrintNodes:
	ld (ws+3126), hl
	ld hl, (ws+50)
	ld (ws+3128), hl
	ld hl, (ws+3126)
	call f67_PushNode
_064d:
	ld de, (ws+50)
	ld hl, (ws+3128)
	and a
	sbc hl,de
	ret z
	call f69_NextNode
	ld (ws+3132), hl
	ld a,h
	or l
	ret z
_0657:
	ld hl, (ws+3132)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	ld a,32
	call f7_print_char
	ld ix, (ws+3132)
	ld a, (ix+25)
	call f17_print_i8
	ld a,61
	call f7_print_char
	ld ix, (ws+3132)
	ld a, (ix+25)
	call f84_MidcodeName
	ld (ws+3134), hl
	call f9_print
	ld a,32
	call f7_print_char
	ld ix, (ws+3132)
	ld l, (ix+19)
	ld h, (ix+20)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	ld a,32
	call f7_print_char
	ld ix, (ws+3132)
	ld l, (ix+21)
	ld h, (ix+22)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	ld a,32
	call f7_print_char
	ld ix, (ws+3132)
	ld l, (ix+11)
	ld h, (ix+12)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	ld a,32
	call f7_print_char
	ld ix, (ws+3132)
	ld l, (ix+13)
	ld h, (ix+14)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	jp    _064d


	; IsSimpleValue workspace at ws+3150 length ws+9
f443_IsSimpleValue:
	ld (ws+3152), hl
	pop bc
	pop hl
	ld (ws+3150), hl
	push bc
	xor a
	ld (ws+3154), a
	push hl
	pop ix
	ld l, (ix+20)
	ld h, (ix+21)
	call f429_IsStackedRegister
	ld (ws+3155), a
	or a
	jp nz,    _0684
	ld ix, (ws+3150)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+3156), hl
	push hl
	pop ix
	ld a, (ix+25)
	cp 24
	jp nz,    _0689
	ld ix, (ws+3156)
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+3156), hl
_0689:
	ld ix, (ws+3156)
	ld l, (ix+21)
	ld h, (ix+22)
	call f429_IsStackedRegister
	ld (ws+3158), a
	ld ix, (ws+3156)
	ld l, (ix+11)
	ld h, (ix+12)
	ld a,h
	or l
	jp z,    _0690
	ld a, (ws+3158)
	or a
	jp nz,    _0690
	jp end_f443_IsSimpleValue
_0690:
	ld ix, (ws+3156)
	ld a, (ix+25)
	cp 42
	jp nz,    _0696
	ld hl, (ws+3156)
	push hl
	ld hl,10
	push hl
	ld hl, (ws+3152)
	call f34_MemCopy
	ld ix, (ws+3152)
	ld (ix+11), 42
	ld a,1
	ld (ws+3154), a
	jp    _0692
_0696:
	ld ix, (ws+3156)
	ld a, (ix+25)
	cp 40
	jp nz,    _069a
	ld hl, (ws+3156)
	ld e,(hl)
	inc hl
	ld d,(hl)
	inc hl
	push hl
	exx
	pop hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	exx
	ld hl, (ws+3152)
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
	ld ix, (ws+3152)
	ld (ix+11), 40
	ld a,1
	ld (ws+3154), a
_069a:
_0692:
_0684:
end_f443_IsSimpleValue:
	ld a, (ws+3154)
	ret


	; check_deref workspace at ws+3155 length ws+0
f445_check_deref:
	ld hl, (ws+3150)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3152)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	and a
	sbc hl,de
	ret nz
	ld ix, (ws+3150)
	ld e, (ix+5)
	ld d, (ix+6)
	ld l, (ix+8)
	ld h, (ix+9)
	add hl,de
	ld b,h
	ld c,l
	ld ix, (ws+3152)
	ld e, (ix+5)
	ld d, (ix+6)
	ld l, (ix+8)
	ld h, (ix+9)
	add hl,de
	and a
	sbc hl,bc
	ret nz
	ld hl, (ws+3150)
	inc hl
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	ld b,a
	ld hl, (ws+3152)
	inc hl
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	cp b
	ret nz
	ld a,1
	ld (ws+3154), a
	ret


	; SimpleValuesMatch workspace at ws+3150 length ws+5
f444_SimpleValuesMatch:
	ld (ws+3152), hl
	pop bc
	pop hl
	ld (ws+3150), hl
	push bc
	xor a
	ld (ws+3154), a
	push hl
	pop ix
	ld b, (ix+11)
	ld ix, (ws+3152)
	ld a, (ix+11)
	cp b
	jp z,    _069f
	jp end_f444_SimpleValuesMatch
_069f:
	ld ix, (ws+3150)
	ld a, (ix+11)
	cp 45
	jp nz,    _06ac
	call f445_check_deref
	jp    _06ab
_06ac:
	cp 46
	jp nz,    _06ad
	call f445_check_deref
	jp    _06ab
_06ad:
	cp 47
	jp nz,    _06ae
	call f445_check_deref
	jp    _06ab
_06ae:
	cp 48
	jp nz,    _06af
	call f445_check_deref
	jp    _06ab
_06af:
	cp 42
	jp nz,    _06b0
	call f445_check_deref
	jp    _06ab
_06b0:
	cp 40
	jp nz,    _06b1
	ld hl, (ws+3150)
	ld c,(hl)
	inc hl
	ld b,(hl)
	inc hl
	push hl
	exx
	pop hl
	ld c,(hl)
	inc hl
	ld b,(hl)
	exx
	ld hl, (ws+3152)
	ld e,(hl)
	inc hl
	ld d,(hl)
	inc hl
	push hl
	exx
	pop hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	exx
	ex de,hl
	exx
	ex de,hl
	exx
	ld e,c
	ld d,b
	exx
	ld e,c
	ld d,b
	exx
	call f498__cmpu4
	jp nz,    _06b6
	ld a,1
	ld (ws+3154), a
_06b6:
_06b1:
_06ab:
end_f444_SimpleValuesMatch:
	ld a, (ws+3154)
	ret


	; RewindRulePointers workspace at ws+3103 length ws+0
f448_RewindRulePointers:
	ld de,ws+3073
	push de
	ld hl,8
	call f26_MemZero
	ld bc,ws+3081
	push bc
	ld hl,16
	call f26_MemZero
	ld hl, (ws+3068)
	ld (ws+3081), hl
	ld hl, (ws+3064)
	push hl
	ld bc,ws+3081
	push bc
	ld hl,ws+3073
	call f428_PopulateMatchBuffer
	ld a,255
	ld (ws+3070), a
	ld iy,f2___main_s0586
	ld (ws+3097), iy
	ld ix,f2___main_s0587
	ld (ws+3099), ix
	ld de,f2___main_s0588-10
	ld (ws+3071), de
	ret


	; TestRule workspace at ws+3103 length ws+9
f449_TestRule:
	xor a
	ld (ws+3103), a
	ld hl, (ws+3071)
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z,    _06c6
	ld ix, (ws+3068)
	ld e, (ix+19)
	ld d, (ix+20)
	ld hl, (ws+3071)
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
	jp z,end_f449_TestRule
	jp    _06c2
_06c6:
	ld ix, (ws+3068)
	ld l, (ix+19)
	ld h, (ix+20)
	ld a,h
	or l
	jp nz, end_f449_TestRule
_06c2:
	ld hl,ws+3073
	ld (ws+3104), hl
	ld hl, (ws+3097)
	ld (ws+3106), hl
	ld ix, (ws+3071)
	ld a, (ix+7)
	ld (ws+3108), a
_06d1:
	ld a, (ws+3108)
	or a
	jp z,    _06d6
	ld hl, (ws+3104)
	ld a,(hl)
	ld (ws+3109), a
	inc hl
	ld (ws+3104), hl
	ld a, (ws+3108)
	and 1
	or a
	jp z,    _06db
	ld hl, (ws+3106)
	ld a,(hl)
	ld (ws+3110), a
	inc hl
	ld (ws+3106), hl
	ld a, (ws+3109)
	ld b,a
	ld a, (ws+3110)
	cp b
	jp nz, end_f449_TestRule
_06db:
	ld a, (ws+3108)
	srl a
	ld (ws+3108), a
	jp    _06d1
_06d6:
	ld a, (ws+3070)
	push af
	ld hl,ws+3081
	call f262_MatchPredicate
	ld (ws+3111), a
	ld hl, (ws+3071)
	ld a,(hl)
	and 1
	or a
	jp z,    _06e7
	ld a, (ws+3111)
	or a
	jp z,end_f449_TestRule
_06e7:
	ld a,1
	ld (ws+3103), a
end_f449_TestRule:
	ld a, (ws+3103)
	ret


	; ConvertNodeToFallback workspace at ws+3103 length ws+9
f450_ConvertNodeToFallback:
	ld hl, (ws+3068)
	ld (ws+3103), hl
	ld a,24
	call f83_AllocateNewNode
	ld (ws+3068), hl
	ld hl, (ws+3103)
	ld ix, (ws+3068)
	ld (ix+11), l
	ld (ix+12), h
	push hl
	pop ix
	ld l, (ix+17)
	ld h, (ix+18)
	ld ix, (ws+3068)
	ld (ix+17), l
	ld (ix+18), h
	ld l, (ix+17)
	ld h, (ix+18)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+3107), hl
	ld ix, (ws+3103)
	ld l, (ix+19)
	ld h, (ix+20)
	ld ix, (ws+3068)
	ld (ix+19), l
	ld (ix+20), h
	ld ix, (ws+3107)
	ld l, (ix+15)
	ld h, (ix+16)
	ld (ws+3109), hl
	xor a
	ld (ws+3111), a
_06f8:
	ld a, (ws+3111)
	cp 8
	ret z
	ld de, (ws+3109)
	inc de
	inc de
	inc de
	inc de
	ld a, (ws+3111)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3103)
	and a
	sbc hl,de
	jp nz,    _0702
	ld bc, (ws+3068)
	ld de, (ws+3109)
	inc de
	inc de
	inc de
	inc de
	ld a, (ws+3111)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld (hl),c
	inc hl
	ld (hl),b
_0702:
	ld a, (ws+3111)
	inc a
	ld (ws+3111), a
	jp    _06f8

_c368:
	db 117,110,109,97,116,99,104,101,100,32,105,110,115,116,114,117,99,116,105,111,110,58,32,0
_c369:
	db 112,114,111,100,117,99,105,110,103,32,0


	; CopyChildNodes workspace at ws+3103 length ws+4
f451_CopyChildNodes:
	ld ix, (ws+3071)
	ld a, (ix+8)
	ld (ws+3103), a
	ld a, (ix+9)
	ld (ws+3104), a
	xor a
	ld (ws+3055), a
_0724:
	ld a, (ws+3055)
	cp 8
	jp z,    _0729
	ld bc,ws+3081
	ld a, (ws+3055)
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3105), hl
	ld a, (ws+3103)
	and 1
	or a
	jp z,    _072e
	ld bc, (ws+3105)
	ld de, (ws+3064)
	inc de
	inc de
	inc de
	inc de
	ld a, (ws+3055)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld (hl),c
	inc hl
	ld (hl),b
	ld a, (ws+3104)
	and 1
	or a
	jp z,    _0733
	ld hl, (ws+3105)
	call f67_PushNode
	ld hl, (ws+3099)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld ix, (ws+3105)
	ld (ix+19), l
	ld (ix+20), h
	ld hl, (ws+3099)
	inc hl
	inc hl
	ld (ws+3099), hl
	ld hl, (ws+3064)
	ld (ix+17), l
	ld (ix+18), h
_0733:
_072e:
	ld a, (ws+3103)
	srl a
	ld (ws+3103), a
	ld a, (ws+3104)
	srl a
	ld (ws+3104), a
	ld a, (ws+3055)
	inc a
	ld (ws+3055), a
	jp    _0724
_0729:
	ld hl, (ws+3064)
	ld ix, (ws+3068)
	ld (ix+15), l
	ld (ix+16), h
	push ix
	pop hl
	ld ix, (ws+3064)
	ld (ix+24), l
	ld (ix+25), h
	ret


	; InstructionMatcher workspace at ws+3073 length ws+30
f447_InstructionMatcher:
	call f448_RewindRulePointers
_06e9:
	ld hl, (ws+3071)
	ld bc,10
	add hl,bc
	ld (ws+3071), hl
	ld a, (ws+3070)
	inc a
	ld (ws+3070), a
	ld d,h
	ld e,l
	ld hl,f2___main_s0588+1730
	and a
	sbc hl,de
	jp nz,    _06ef
	ld ix, (ws+3068)
	ld a, (ix+25)
	cp 24
	jp z,    _06f6
	ld ix, (ws+3068)
	ld l, (ix+17)
	ld h, (ix+18)
	ld a,h
	or l
	jp z,    _06f6
	call f450_ConvertNodeToFallback
	call f448_RewindRulePointers
	jp    _06e9
_06f6:
	ld hl, (ws+3053)
	call f438_PrintNodes
	call f72_StartError
	ld hl,   _c368
	call f9_print
	xor a
	ld (ws+3055), a
_0703:
	ld a, (ws+3055)
	cp 8
	jp z,    _0708
	ld de,ws+3073
	ld a, (ws+3055)
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
	call f17_print_i8
	ld a,32
	call f7_print_char
	ld a, (ws+3055)
	inc a
	ld (ws+3055), a
	jp    _0703
_0708:
	ld hl,   _c369
	call f9_print
	ld ix, (ws+3068)
	ld l, (ix+19)
	ld h, (ix+20)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f73_EndError
_06ef:
	call f449_TestRule
	ld (ws+3101), a
	or a
	jp nz,   _06ea
	ld ix, (ws+3071)
	ld a, (ix+7)
	ld (ws+3102), a
_070e:
	ld a, (ws+3102)
	or a
	jp z,    _0713
	ld a, (ws+3102)
	and 1
	or a
	jp z,    _0718
	ld hl, (ws+3097)
	inc hl
	ld (ws+3097), hl
_0718:
	ld a, (ws+3102)
	srl a
	ld (ws+3102), a
	jp    _070e
_0713:
	ld ix, (ws+3071)
	ld a, (ix+9)
	ld (ws+3102), a
_0719:
	ld a, (ws+3102)
	or a
	jp z,    _06e9
	ld a, (ws+3102)
	and 1
	or a
	jp z,    _0723
	ld hl, (ws+3099)
	inc hl
	inc hl
	ld (ws+3099), hl
_0723:
	ld a, (ws+3102)
	srl a
	ld (ws+3102), a
	jp    _0719
_06ea:
	ld a, (ws+3070)
	ld ix, (ws+3064)
	ld (ix+67), a
	ld hl, (ws+3071)
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ix+20), l
	ld (ix+21), h
	ld ix, (ws+3071)
	ld l, (ix+5)
	ld h, (ix+6)
	ld ix, (ws+3064)
	ld (ix+28), l
	ld (ix+29), h
	jp f451_CopyChildNodes


	; FindPreferredRegister workspace at ws+3124 length ws+26
f452_FindPreferredRegister:
	ld (ws+3124), hl
	ld hl, (ws+3064)
	push hl
	ld hl,ws+3128
	call f443_IsSimpleValue
	ld (ws+3140), a
	or a
	jp z,    _073d
	ld bc,ws+2807
	ld (ws+3141), bc
_073e:
	ld de, (ws+3141)
	ld hl,ws+2999
	and a
	sbc hl,de
	jp z,    _0743
	ld ix, (ws+3141)
	ld a, (ix+10)
	or a
	jp z,    _0748
	ld ix, (ws+3141)
	ld a, (ix+10)
	dec a
	ld (ix+10), a
_0748:
	ld hl, (ws+3141)
	ld de,12
	add hl,de
	ld (ws+3141), hl
	jp    _073e
_0743:
	ld bc,ws+2807
	ld (ws+3141), bc
	ld bc,32768
	ld (ws+3126), bc
_0749:
	ld de, (ws+3141)
	ld hl,ws+2999
	and a
	sbc hl,de
	jp z,    _074e
	ld bc,ws+3128
	push bc
	ld hl, (ws+3141)
	call f444_SimpleValuesMatch
	ld (ws+3143), a
	ld ix, (ws+3141)
	ld a, (ix+11)
	or a
	jp z,    _0757
	ld de, (ws+3126)
	ld hl, (ws+3124)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
	jp z,    _0757
	ld a, (ws+3143)
	or a
	jp z,    _0757
	ld ix, (ws+3141)
	ld (ix+10), 255
	jp end_f452_FindPreferredRegister
_0757:
	ld hl, (ws+3141)
	ld de,12
	add hl,de
	ld (ws+3141), hl
	ld hl, (ws+3126)
	srl h
	rr l
	ld (ws+3126), hl
	jp    _0749
_074e:
	ld bc,0
	ld (ws+3144), bc
	ld bc,ws+2807
	ld (ws+3141), bc
	ld hl,32768
	ld (ws+3126), hl
_075a:
	ld de, (ws+3141)
	ld hl,ws+2999
	and a
	sbc hl,de
	jp z,    _075f
	ld de, (ws+3126)
	ld hl, (ws+3124)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
	jp z,    _0764
	ld ix, (ws+3141)
	ld a, (ix+11)
	or a
	jp nz,    _0769
	ld hl, (ws+3141)
	ld (ws+3144), hl
	ld hl, (ws+3126)
	ld (ws+3146), hl
	jp    _075f
_0769:
	ld hl, (ws+3144)
	ld a,h
	or l
	jp nz,    _076e
	ld hl, (ws+3141)
	ld (ws+3144), hl
	ld hl, (ws+3126)
	ld (ws+3146), hl
	jp    _076a
_076e:
	ld ix, (ws+3141)
	ld a, (ix+10)
	ld ix, (ws+3144)
	ld b, (ix+10)
	cp b
	jp nc,    _0773
	ld hl, (ws+3141)
	ld (ws+3144), hl
	ld hl, (ws+3126)
	ld (ws+3146), hl
_0773:
_076a:
_0764:
	ld hl, (ws+3141)
	ld de,12
	add hl,de
	ld (ws+3141), hl
	ld hl, (ws+3126)
	srl h
	rr l
	ld (ws+3126), hl
	jp    _075a
_075f:
	ld hl, (ws+3144)
	ld a,h
	or l
	jp z,    _0778
	ld bc,ws+3128
	push bc
	ld de,12
	push de
	ld hl, (ws+3144)
	call f34_MemCopy
	ld ix, (ws+3144)
	ld (ix+10), 255
	ld hl, (ws+3146)
	ld (ws+3126), hl
	jp end_f452_FindPreferredRegister
_0778:
_073d:
	ld hl, (ws+3124)
	call f158_FindFirst
	ld (ws+3126), hl
end_f452_FindPreferredRegister:
	ld hl, (ws+3126)
	ret

_c370:
	db 112,114,111,100,117,99,101,114,58,32,0
_c371:
	db 99,111,110,115,117,109,101,114,58,32,0
_c372:
	db 110,111,100,101,58,32,0
_c373:
	db 112,114,111,100,117,99,101,114,46,112,114,111,100,117,99,97,98,108,101,95,114,101,103,115,61,0
_c374:
	db 112,114,111,100,117,99,101,114,46,111,117,116,112,117,116,95,114,101,103,115,61,0
_c375:
	db 110,111,100,101,46,100,101,115,105,114,101,100,95,114,101,103,61,0
_c376:
	db 99,111,110,115,117,109,101,114,46,105,110,112,117,116,95,114,101,103,115,61,0
_c377:
	db 99,111,109,112,97,116,105,98,108,101,61,0
_c378:
	db 114,101,103,105,115,116,101,114,32,97,108,108,111,99,97,116,105,111,110,32,100,101,97,100,108,111,99,107,58,32,0


	; deadlock workspace at ws+3124 length ws+2
f454_deadlock:
	ld (ws+3124), hl
	ld hl, (ws+3053)
	call f438_PrintNodes
	ld hl,   _c370
	call f9_print
	ld ix, (ws+3064)
	ld l, (ix+4)
	ld h, (ix+5)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	ld hl,   _c371
	call f9_print
	ld ix, (ws+3082)
	ld l, (ix+4)
	ld h, (ix+5)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	ld hl,   _c372
	call f9_print
	ld hl, (ws+3068)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	ld hl,   _c373
	call f9_print
	ld ix, (ws+3064)
	ld l, (ix+20)
	ld h, (ix+21)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	ld hl,   _c374
	call f9_print
	ld ix, (ws+3064)
	ld l, (ix+30)
	ld h, (ix+31)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	ld hl,   _c375
	call f9_print
	ld ix, (ws+3068)
	ld l, (ix+19)
	ld h, (ix+20)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	ld hl,   _c376
	call f9_print
	ld ix, (ws+3082)
	ld l, (ix+26)
	ld h, (ix+27)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	ld hl,   _c377
	call f9_print
	ld hl, (ws+3096)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	call f72_StartError
	ld hl,   _c378
	call f9_print
	ld hl, (ws+3124)
	call f9_print
	jp f73_EndError


_c379:
	db 112,114,111,100,117,99,101,114,0
_c380:
	db 99,111,110,115,117,109,101,114,0


	; AllocateRegister workspace at ws+3073 length ws+51
f453_AllocateRegister:
	ld ix, (ws+3064)
	ld l, (ix+20)
	ld h, (ix+21)
	call f429_IsStackedRegister
	ld (ws+3073), a
	or a
	jp z,    _077d
	ld ix, (ws+3068)
	ld e, (ix+19)
	ld d, (ix+20)
	ld ix, (ws+3064)
	ld l, (ix+20)
	ld h, (ix+21)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3074), hl
	ld a,h
	or l
	jp z,    _0782
	ld hl, (ws+3074)
	call f158_FindFirst
	ld (ws+3074), hl
	ld ix, (ws+3068)
	ld (ix+21), l
	ld (ix+22), h
	ld ix, (ws+3064)
	ld (ix+22), l
	ld (ix+23), h
	jp    _077e
_0782:
	ld ix, (ws+3064)
	ld l, (ix+20)
	ld h, (ix+21)
	call f158_FindFirst
	ld (ws+3078), hl
	ld ix, (ws+3064)
	ld (ix+22), l
	ld (ix+23), h
	ld ix, (ws+3068)
	ld l, (ix+19)
	ld h, (ix+20)
	call f158_FindFirst
	ld (ws+3080), hl
	ld ix, (ws+3068)
	ld (ix+21), l
	ld (ix+22), h
	ld hl, (ws+3064)
	push hl
	push hl
	pop ix
	ld l, (ix+22)
	ld h, (ix+23)
	push hl
	ld ix, (ws+3068)
	ld l, (ix+21)
	ld h, (ix+22)
	call f435_CreateSpill
_077e:
	ret
_077d:
	ld ix, (ws+3068)
	ld l, (ix+17)
	ld h, (ix+18)
	ld (ws+3082), hl
	push hl
	ld hl, (ws+3064)
	call f430_CalculateBlockedRegisters
	ld (ws+3086), hl
	ld ix, (ws+3068)
	ld e, (ix+19)
	ld d, (ix+20)
	ld ix, (ws+3064)
	ld l, (ix+20)
	ld h, (ix+21)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3074), hl
	ld b,h
	ld c,l
	ld de, (ws+3086)
	ld l, (ix+30)
	ld h, (ix+31)
	ld a,e
	or l
	ld e,a
	ld a,d
	or h
	ld d,a
	ld ix, (ws+3082)
	ld l, (ix+26)
	ld h, (ix+27)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,c
	and l
	ld l,a
	ld a,b
	and h
	ld h,a
	ld (ws+3088), hl
	ld a,h
	or l
	jp z,    _0787
	ld hl, (ws+3088)
	call f452_FindPreferredRegister
	ld (ws+3074), hl
	ld ix, (ws+3068)
	ld (ix+21), l
	ld (ix+22), h
	ld ix, (ws+3064)
	ld (ix+22), l
	ld (ix+23), h
	call f156_FindConflictingRegisters
	ld (ws+3086), hl
	ld ix, (ws+3082)
	ld e, (ix+26)
	ld d, (ix+27)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+26), l
	ld (ix+27), h
	push ix
	pop hl
	push hl
	ld hl, (ws+3064)
	push hl
	ld hl, (ws+3086)
	call f432_BlockRegisters
	ld ix, (ws+3064)
	ld e, (ix+30)
	ld d, (ix+31)
	ld hl, (ws+3086)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+30), l
	ld (ix+31), h
	ret
_0787:
	ld ix, (ws+3068)
	ld l, (ix+19)
	ld h, (ix+20)
	ld a,l
	and 255
	ld l,a
	ld a,h
	and 255
	ld h,a
	call f157_FindCompatibleRegisters
	ld (ws+3096), hl
	ld ix, (ws+3064)
	ld e, (ix+20)
	ld d, (ix+21)
	ld a,e
	and l
	ld c,a
	ld a,d
	and h
	ld b,a
	ld de, (ws+3086)
	ld l, (ix+30)
	ld h, (ix+31)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,c
	and l
	ld l,a
	ld a,b
	and h
	ld h,a
	ld (ws+3088), hl
	ld ix, (ws+3068)
	ld e, (ix+19)
	ld d, (ix+20)
	ld ix, (ws+3082)
	ld l, (ix+26)
	ld h, (ix+27)
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3098), hl
	ld hl, (ws+3088)
	ld a,h
	or l
	jp z,    _078e
	ld hl, (ws+3098)
	ld a,h
	or l
	jp z,    _078e
	ld hl, (ws+3088)
	call f158_FindFirst
	ld (ws+3100), hl
	ld ix, (ws+3064)
	ld (ix+22), l
	ld (ix+23), h
	ld hl, (ws+3098)
	call f158_FindFirst
	ld (ws+3102), hl
	ld ix, (ws+3068)
	ld (ix+21), l
	ld (ix+22), h
	ld l, (ix+21)
	ld h, (ix+22)
	call f156_FindConflictingRegisters
	ld (ws+3104), hl
	ld ix, (ws+3082)
	ld e, (ix+26)
	ld d, (ix+27)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+26), l
	ld (ix+27), h
	ld ix, (ws+3064)
	ld l, (ix+22)
	ld h, (ix+23)
	call f156_FindConflictingRegisters
	ld (ws+3086), hl
	ld hl, (ws+3082)
	push hl
	ld hl, (ws+3064)
	push hl
	ld hl, (ws+3086)
	call f432_BlockRegisters
	ld ix, (ws+3064)
	ld e, (ix+30)
	ld d, (ix+31)
	ld hl, (ws+3086)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+30), l
	ld (ix+31), h
	ld hl, (ws+3082)
	push hl
	ld l, (ix+22)
	ld h, (ix+23)
	push hl
	ld ix, (ws+3068)
	ld l, (ix+21)
	ld h, (ix+22)
	call f436_CreateReload
	ret
_078e:
	ld ix, (ws+3068)
	ld c, (ix+19)
	ld b, (ix+20)
	ld de, (ws+3086)
	ld ix, (ws+3082)
	ld l, (ix+26)
	ld h, (ix+27)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,c
	and l
	ld l,a
	ld a,b
	and h
	ld h,a
	ld (ws+3088), hl
	ld ix, (ws+3064)
	ld e, (ix+20)
	ld d, (ix+21)
	ld hl, (ws+3096)
	ld a,e
	and l
	ld e,a
	ld a,d
	and h
	ld d,a
	ld l, (ix+30)
	ld h, (ix+31)
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3098), hl
	ld hl, (ws+3088)
	ld a,h
	or l
	jp z,    _0796
	ld hl, (ws+3098)
	ld a,h
	or l
	jp z,    _0796
	ld hl, (ws+3098)
	call f158_FindFirst
	ld (ws+3108), hl
	ld ix, (ws+3064)
	ld (ix+22), l
	ld (ix+23), h
	ld hl, (ws+3088)
	call f158_FindFirst
	ld (ws+3110), hl
	ld ix, (ws+3068)
	ld (ix+21), l
	ld (ix+22), h
	ld l, (ix+21)
	ld h, (ix+22)
	call f156_FindConflictingRegisters
	ld (ws+3086), hl
	ld ix, (ws+3082)
	ld e, (ix+26)
	ld d, (ix+27)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+26), l
	ld (ix+27), h
	push ix
	pop hl
	push hl
	ld hl, (ws+3064)
	push hl
	ld hl, (ws+3086)
	call f432_BlockRegisters
	ld ix, (ws+3064)
	ld l, (ix+22)
	ld h, (ix+23)
	call f156_FindConflictingRegisters
	ld (ws+3114), hl
	ld ix, (ws+3064)
	ld e, (ix+30)
	ld d, (ix+31)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+30), l
	ld (ix+31), h
	push ix
	pop hl
	push hl
	ld l, (ix+22)
	ld h, (ix+23)
	push hl
	ld ix, (ws+3068)
	ld l, (ix+21)
	ld h, (ix+22)
	call f435_CreateSpill
	ret
_0796:
	ld ix, (ws+3064)
	ld e, (ix+20)
	ld d, (ix+21)
	ld hl, (ws+3096)
	ld a,e
	and l
	ld e,a
	ld a,d
	and h
	ld d,a
	ld l, (ix+30)
	ld h, (ix+31)
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3074), hl
	ld a,h
	or l
	jp nz,    _079c
	ld hl,   _c379
	call f454_deadlock
_079c:
	ld hl, (ws+3074)
	call f158_FindFirst
	ld (ws+3116), hl
	ld ix, (ws+3064)
	ld (ix+22), l
	ld (ix+23), h
	ld l, (ix+22)
	ld h, (ix+23)
	call f156_FindConflictingRegisters
	ld (ws+3118), hl
	ld ix, (ws+3064)
	ld e, (ix+30)
	ld d, (ix+31)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+30), l
	ld (ix+31), h
	push ix
	pop hl
	push hl
	ld l, (ix+22)
	ld h, (ix+23)
	push hl
	ld hl,0
	call f435_CreateSpill
	ld ix, (ws+3068)
	ld e, (ix+19)
	ld d, (ix+20)
	ld ix, (ws+3082)
	ld l, (ix+26)
	ld h, (ix+27)
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3074), hl
	ld a,h
	or l
	jp nz,    _07a1
	ld hl,   _c380
	call f454_deadlock
_07a1:
	ld hl, (ws+3074)
	call f158_FindFirst
	ld (ws+3120), hl
	ld ix, (ws+3068)
	ld (ix+21), l
	ld (ix+22), h
	ld l, (ix+21)
	ld h, (ix+22)
	call f156_FindConflictingRegisters
	ld (ws+3122), hl
	ld ix, (ws+3082)
	ld e, (ix+26)
	ld d, (ix+27)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+26), l
	ld (ix+27), h
	push ix
	pop hl
	push hl
	ld hl,0
	push hl
	ld ix, (ws+3068)
	ld l, (ix+21)
	ld h, (ix+22)
	call f436_CreateReload
	ret


	; UpdateProducedRegisters workspace at ws+3073 length ws+1
f455_UpdateProducedRegisters:
	xor a
	ld (ws+3055), a
_07a2:
	ld a, (ws+3055)
	cp 8
	ret z
	ld de, (ws+3064)
	inc de
	inc de
	inc de
	inc de
	ld a, (ws+3055)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3068), hl
	ld a,h
	or l
	jp z,    _07ae
	ld ix, (ws+3068)
	ld l, (ix+19)
	ld h, (ix+20)
	ld de,1
	add hl,de
	ld a,h
	or l
	jp nz,    _07ae
	ld ix, (ws+3064)
	ld l, (ix+22)
	ld h, (ix+23)
	ld ix, (ws+3068)
	ld (ix+19), l
	ld (ix+20), h
	xor a
	ld (ws+3073), a
_07b0:
	ld a, (ws+3073)
	cp 8
	jp z,    _07b5
	ld a, (ws+3055)
	ld b,a
	ld a, (ws+3073)
	cp b
	jp z,    _07ba
	ld de, (ws+3064)
	inc de
	inc de
	inc de
	inc de
	ld a, (ws+3073)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3068), hl
	ld a,h
	or l
	jp z,    _07bf
	ld ix, (ws+3068)
	ld e, (ix+19)
	ld d, (ix+20)
	ld ix, (ws+3064)
	ld l, (ix+22)
	ld h, (ix+23)
	ld a,l
	cpl
	ld l,a
	ld a,h
	cpl
	ld h,a
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld ix, (ws+3068)
	ld (ix+19), l
	ld (ix+20), h
_07bf:
_07ba:
	ld a, (ws+3073)
	inc a
	ld (ws+3073), a
	jp    _07b0
_07b5:
_07ae:
	ld a, (ws+3055)
	inc a
	ld (ws+3055), a
	jp    _07a2


	; EmitAndFreeInstructions workspace at ws+3073 length ws+2
f456_EmitAndFreeInstructions:
_07c0:
	ld hl, (ws+3058)
	ld (ws+3073), hl
	ld a,h
	or l
	jp nz,    _07c6
	ret
_07c6:
	ld hl, (ws+3058)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3058), hl
	ld hl, (ws+3073)
	ld de,48
	add hl,de
	call f437_ShuffleRegisters
	ld ix, (ws+3073)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	pop ix
	ld a, (ix+25)
	cp 18
	jp nz,    _07cb
	ld a,1
	ld (ws+2999), a
_07cb:
	ld ix, (ws+3073)
	ld a, (ix+67)
	push af
	push ix
	pop hl
	call f263_EmitOneInstruction
	ld hl, (ws+3073)
	ld bc,32
	add hl,bc
	call f437_ShuffleRegisters
	call f231_ArchEndInstruction
	ld ix, (ws+3073)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	pop ix
	ld a, (ix+25)
	cp 23
	jp nz,    _07d0
	xor a
	ld (ws+2999), a
_07d0:
	ld ix, (ws+3073)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	pop ix
	ld a, (ix+25)
	cp 24
	jp nz,    _07d5
	ld ix, (ws+3073)
	ld l, (ix+4)
	ld h, (ix+5)
	call f85_FreeNode
_07d5:
	ld hl, (ws+3073)
	call f155_FreeInstruction
	jp    _07c0


	; Generate workspace at ws+3053 length ws+20
f446_Generate:
	ld (ws+3053), hl
	ld ix,0
	ld (ws+3056), ix
	ld (ws+3058), ix
	ld hl, (ws+50)
	ld (ws+3060), hl
	ld hl, (ws+3053)
	call f67_PushNode
_06b7:
	ld de, (ws+50)
	ld hl, (ws+3060)
	and a
	sbc hl,de
	jp z,    _06bc
	call f154_AllocNewInstruction
	ld (ws+3064), hl
	ld hl, (ws+3056)
	ld a,h
	or l
	jp nz,    _06c1
	ld hl, (ws+3064)
	ld (ws+3056), hl
	ld (ws+3058), hl
	jp    _06bd
_06c1:
	ld de, (ws+3064)
	ld hl, (ws+3058)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+3058)
	ld hl, (ws+3064)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3064)
	ld (ws+3058), hl
_06bd:
	call f68_PopNode
	ld (ws+3068), hl
	call f447_InstructionMatcher
	ld ix, (ws+3064)
	ld l, (ix+20)
	ld h, (ix+21)
	ld a,h
	or l
	jp z,    _06b7
	call f453_AllocateRegister
	call f455_UpdateProducedRegisters
	jp    _06b7
_06bc:
	call f456_EmitAndFreeInstructions
	call f232_ArchEndGroup
	ld hl, (ws+3053)
	jp f70_Discard


_c381:
	db 110,111,100,101,32,115,116,97,99,107,32,111,118,101,114,102,108,111,119,0


	; PushNode workspace at ws+3140 length ws+2
f67_PushNode:
	ld (ws+3140), hl
	ld a,h
	or l
	ret z
	ld de, (ws+50)
	ld hl,ws+50
	and a
	sbc hl,de
	jp nz,    _07f5
	ld hl,   _c381
	call f74_SimpleError
_07f5:
	ld de, (ws+3140)
	ld hl, (ws+50)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+50)
	inc hl
	inc hl
	ld (ws+50), hl
	ret


	; PopNode workspace at ws+3140 length ws+2
f68_PopNode:
	ld hl, (ws+50)
	dec hl
	dec hl
	ld (ws+50), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ret


	; NextNode workspace at ws+3136 length ws+4
f69_NextNode:
	call f68_PopNode
	ld (ws+3136), hl
	ld a,h
	or l
	ret z
	ld ix, (ws+3136)
	ld l, (ix+11)
	ld h, (ix+12)
	call f67_PushNode
	ld ix, (ws+3136)
	ld l, (ix+13)
	ld h, (ix+14)
	call f67_PushNode
	ld hl, (ws+3136)
	ret


	; Discard workspace at ws+3073 length ws+8
f70_Discard:
	ld (ws+3073), hl
	ld hl, (ws+50)
	ld (ws+3075), hl
	ld hl, (ws+3073)
	call f67_PushNode
_07fb:
	ld de, (ws+50)
	ld hl, (ws+3075)
	and a
	sbc hl,de
	ret z
	call f69_NextNode
	ld (ws+3079), hl
	push hl
	pop ix
	ld a, (ix+25)
	cp 19
	jp nz,    _0802
	ld hl, (ws+3079)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
	jp    _0801
_0802:
	cp 12
	jp nz,    _0803
	ld hl, (ws+3079)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
	jp    _0801
_0803:
	cp 41
	jp nz,    _0804
	ld hl, (ws+3079)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
_0804:
_0801:
	ld hl, (ws+3079)
	call f85_FreeNode
	jp    _07fb


	; I_node workspace at ws+3053 length ws+13
f459_I_node:
	ld a,1
	ld (ws+3055), a
	ld bc,0
	ld (ws+3053), bc
_0805:
	ld a, (ws+3055)
	or a
	jp z,    _080a
	call f121_I_b8
	ld (ws+3057), a
	call f83_AllocateNewNode
	ld (ws+3060), hl
	ld hl, (ws+3053)
	ld ix, (ws+3060)
	ld (ix+23), l
	ld (ix+24), h
	push ix
	pop hl
	ld (ws+3053), hl
	ld de,f2___main_s01dd
	ld a, (ws+3057)
	dec a
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
	ld (ws+3062), a
	ld bc,f2___main_s01dc
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld e,(hl)
	inc hl
	ld d,(hl)
	push ix
	pop hl
	call f500__jpde
	ld a, (ws+3055)
	ld b,a
	ld de,f2___main_s01de
	ld a, (ws+3057)
	dec a
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
	add a,b
	dec a
	ld (ws+3055), a
	jp    _0805
_080a:
	ld bc,0
	ld (ws+3063), bc
_080b:
	ld hl, (ws+3053)
	ld a,h
	or l
	jp z,    _0810
	ld hl, (ws+3053)
	ld (ws+3060), hl
	push hl
	pop ix
	ld l, (ix+23)
	ld h, (ix+24)
	ld (ws+3053), hl
	ld de,f2___main_s01de
	ld ix, (ws+3060)
	ld a, (ix+25)
	dec a
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
	ld (ws+3065), a
	cp 1
	jp c,    _0815
	ld hl, (ws+3063)
	ld ix, (ws+3060)
	ld (ix+11), l
	ld (ix+12), h
	ld l, (ix+11)
	ld h, (ix+12)
	push hl
	pop ix
	ld l, (ix+23)
	ld h, (ix+24)
	ld (ws+3063), hl
_0815:
	ld a, (ws+3065)
	cp 2
	jp nz,    _081a
	ld ix, (ws+3060)
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ix+13), l
	ld (ix+14), h
	ld hl, (ws+3063)
	ld (ix+11), l
	ld (ix+12), h
	ld l, (ix+11)
	ld h, (ix+12)
	push hl
	pop ix
	ld l, (ix+23)
	ld h, (ix+24)
	ld (ws+3063), hl
_081a:
	ld hl, (ws+3063)
	ld ix, (ws+3060)
	ld (ix+23), l
	ld (ix+24), h
	push ix
	pop hl
	ld (ws+3063), hl
	jp    _080b
_0810:
	ld hl, (ws+3063)
	ret

_c382:
	db 100,117,112,108,105,99,97,116,101,32,115,117,98,114,105,100,32,48,120,0
_c383:
	db 32,97,116,32,48,120,0


	; AddSubr workspace at ws+3056 length ws+20
f460_AddSubr:
	ld (ws+3056), hl
	ld (ws+3060), hl
	ld bc,ws+3006
	ld (ws+3062), bc
_081b:
	ld hl, (ws+3060)
	ld bc,16
	and a
	sbc hl,bc
	jp c,    _0820
	ld hl, (ws+3062)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz,    _0825
	ld hl,34
	call f38_Alloc
	ld (ws+3064), hl
	ld d,h
	ld e,l
	ld hl, (ws+3062)
	ld (hl),e
	inc hl
	ld (hl),d
_0825:
	ld hl, (ws+3062)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3062), hl
	ld hl, (ws+3060)
	ld de,65520
	add hl,de
	ld (ws+3060), hl
	jp    _081b
_0820:
	ld de, (ws+3062)
	inc de
	inc de
	ld a, (ws+3060)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld (ws+3066), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z,    _082a
	call f72_StartError
	ld hl,   _c382
	call f9_print
	ld hl, (ws+3056)
	call f20_print_hex_i16
	ld hl,   _c383
	call f9_print
	ld hl,ws+2289
	call f55_FCBPos
	ld (ws+3068), hl
	exx
	ld (ws+3070), hl
	exx
	ld hl, (ws+3068)
	exx
	ld hl, (ws+3070)
	exx
	call f22_print_hex_i32
	call f73_EndError
_082a:
	ld hl,15
	call f38_Alloc
	ld (ws+3058), hl
	call f153_AllocSubrId
	ld (ws+3074), hl
	ld d,h
	ld e,l
	ld hl, (ws+3058)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+3058)
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3058)
	ret

_c384:
	db 117,110,107,110,111,119,110,32,115,117,98,114,105,100,32,0
_c385:
	db 32,97,116,32,48,120,0


	; FindSubr workspace at ws+3081 length ws+12
f71_FindSubr:
	ld (ws+3081), hl
	ld ix,ws+3006
	ld (ws+3085), ix
	ld (ws+3087), hl
_082b:
	ld hl, (ws+3087)
	ld bc,16
	and a
	sbc hl,bc
	jp c,    _0830
	ld hl, (ws+3085)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz,    _0835
	call f72_StartError
	ld hl,   _c384
	call f9_print
	ld hl, (ws+3081)
	call f20_print_hex_i16
	ld hl,   _c385
	call f9_print
	ld hl,ws+2289
	call f55_FCBPos
	ld (ws+3089), hl
	exx
	ld (ws+3091), hl
	exx
	ld hl, (ws+3089)
	exx
	ld hl, (ws+3091)
	exx
	call f22_print_hex_i32
	call f73_EndError
_0835:
	ld hl, (ws+3085)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3085), hl
	ld hl, (ws+3087)
	ld de,65520
	add hl,de
	ld (ws+3087), hl
	jp    _082b
_0830:
	ld de, (ws+3085)
	inc de
	inc de
	ld a, (ws+3087)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3083), hl
	ld hl, (ws+3083)
	ret


	; ReadN workspace at ws+3046 length ws+10
f461_ReadN:
	call f122_I_b16
	ld (ws+3048), hl
	call f460_AddSubr
	ld (ws+3052), hl
	call f126_I_countedstring
	ld (ws+3054), hl
	ld d,h
	ld e,l
	ld hl, (ws+3052)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3052)
	jp f116_EmitterDeclareSubroutine


	; ReadX workspace at ws+3046 length ws+12
f462_ReadX:
	call f122_I_b16
	ld (ws+3048), hl
	call f71_FindSubr
	ld (ws+3052), hl
	call f126_I_countedstring
	ld (ws+3056), hl
	ld hl, (ws+3052)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+3056)
	call f117_EmitterDeclareExternalSubr;utine
	ld hl, (ws+3056)
	jp f40_Free


	; ReadM workspace at ws+3046 length ws+7
f463_ReadM:
	call f459_I_node
	ld (ws+3048), hl
	push hl
	pop ix
	ld a, (ix+25)
	ld (ws+3050), a
	cp 4
	jp nz,    _083a
	ld hl, (ws+3048)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3051), hl
	ld hl, (ws+12)
	ld ix, (ws+3051)
	ld (ix+4), l
	ld (ix+5), h
	push ix
	pop hl
	ld (ws+12), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	call f10_print_nl
_083a:
	ld hl, (ws+3048)
	call f446_Generate
	ld a, (ws+3050)
	cp 5
	ret nz
	ld ix, (ws+12)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+12), hl
	ret

_c386:
	db 112,97,114,97,109,101,116,101,114,115,32,115,112,101,99,105,102,105,101,100,32,116,119,105,99,101,0


	; ReadParameters workspace at ws+3053 length ws+21
f464_ReadParameters:
	ld (ws+3054), hl
	pop bc
	pop af
	ld (ws+3053), a
	push bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z,    _0844
	ld hl,   _c386
	call f74_SimpleError
_0844:
	ld a, (ws+3053)
	ld l,a
	ld h,0
	add hl,hl
	call f38_Alloc
	ld (ws+3058), hl
	ld d,h
	ld e,l
	ld hl, (ws+3054)
	ld (hl),e
	inc hl
	ld (hl),d
_0845:
	ld a, (ws+3053)
	or a
	ret z
	ld hl,10
	call f38_Alloc
	ld (ws+3062), hl
	ld d,h
	ld e,l
	ld hl, (ws+3058)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3058)
	inc hl
	inc hl
	ld (ws+3058), hl
	call f122_I_b16
	ld (ws+3064), hl
	call f71_FindSubr
	ld (ws+3066), hl
	ld d,h
	ld e,l
	ld hl, (ws+3062)
	ld (hl),e
	inc hl
	ld (hl),d
	call f121_I_b8
	ld (ws+3068), a
	ld hl, (ws+3062)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl),a
	call f125_I_bsize
	ld (ws+3069), hl
	ld ix, (ws+3062)
	ld (ix+5), l
	ld (ix+6), h
	call f126_I_countedstring
	ld (ws+3071), hl
	ld ix, (ws+3062)
	ld (ix+8), l
	ld (ix+9), h
	call f121_I_b8
	ld (ws+3073), a
	ld ix, (ws+3062)
	ld (ix+7), a
	ld a, (ws+3053)
	dec a
	ld (ws+3053), a
	jp    _0845


	; ReadI workspace at ws+3046 length ws+7
f465_ReadI:
	call f122_I_b16
;	ld (ws+3046), hl
	call f71_FindSubr
	ld (ws+3050), hl
	call f121_I_b8
;	ld (ws+3052), a
	ld ix, (ws+3050)
	ld (ix+12), a
;	ld a, (ix+12)
	push af
	push ix
	pop hl
	ld bc,8
	add hl,bc
	call f464_ReadParameters
	ret


	; ReadO workspace at ws+3046 length ws+7
f466_ReadO:
	call f122_I_b16
;	ld (ws+3046), hl
	call f71_FindSubr
	ld (ws+3050), hl
	call f121_I_b8
;	ld (ws+3052), a
	ld ix, (ws+3050)
	ld (ix+13), a
;	ld a, (ix+13)
	push af
	push ix
	pop de
	ld hl,10
	add hl,de
	call f464_ReadParameters
	ret


	; ReadW workspace at ws+3046 length ws+12
f467_ReadW:
	call f122_I_b16
;	ld (ws+3046), hl
	call f71_FindSubr
	ld (ws+3050), hl
	call f121_I_b8
	ld (ws+3053), a
	call f125_I_bsize
	ld (ws+3056), hl
	ld hl, (ws+3050)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld a, (ws+3053)
	push af
	ld hl, (ws+3056)
	call f120_EmitterDeclareWorkspace
	ret


	; ReadR workspace at ws+3046 length ws+12
f468_ReadR:
	call f122_I_b16
;	ld (ws+3046), hl
	call f71_FindSubr
	ld (ws+3050), hl
	call f122_I_b16
;	ld (ws+3052), hl
	call f71_FindSubr
	ld (ws+3056), hl
	ld hl, (ws+3050)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+3056)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f118_EmitterReferenceSubroutine;yId
	ret


	; ReadF workspace at ws+3046 length ws+7
f469_ReadF:
	call f122_I_b16
;	ld (ws+3046), hl
	call f71_FindSubr
	ld (ws+3050), hl
	call f121_I_b8
;	ld (ws+3052), a
	ld ix, (ws+3050)
	ld (ix+14), a
	ret

_c387:
	db 117,110,115,117,112,112,111,114,116,101,100,32,114,101,99,111,114,100,32,48,120,0
_c388:
	db 32,97,116,32,48,120,0


	; ProcessFile workspace at ws+3040 length ws+6
f470_ProcessFile:
	ld de,ws+3006
	push de
	ld hl,34
	call f26_MemZero
_084b:
	call f121_I_b8
	ld (ws+3041), a
	cp 69
	ret z
	cp 78
	jp nz,    _084f
	call f461_ReadN
	jp    _084b
_084f:
	cp 88
	jp nz,    _0850
	call f462_ReadX
	jp    _084b
_0850:
	cp 77
	jp nz,    _0851
	call f463_ReadM
	jp    _084b
_0851:
	cp 73
	jp nz,    _0852
	call f465_ReadI
	jp    _084b
_0852:
	cp 79
	jp nz,    _0853
	call f466_ReadO
	jp    _084b
_0853:
	cp 87
	jp nz,    _0854
	call f467_ReadW
	jp    _084b
_0854:
	cp 82
	jp nz,    _0855
	call f468_ReadR
	jp    _084b
_0855:
	cp 70
	jp nz,    _0856
	call f469_ReadF
	jp    _084b
_0856:
	call f72_StartError
	ld hl,   _c387
	call f9_print
	ld a, (ws+3041)
	call f18_print_hex_i8
	ld hl,   _c388
	call f9_print
	ld hl,ws+2289
	call f55_FCBPos
	ld (ws+3042), hl
	exx
	ld (ws+3044), hl
	exx
	ld hl, (ws+3042)
	exx
	ld hl, (ws+3044)
	exx
	call f22_print_hex_i32
	call f73_EndError
	jp    _084b


_c389:
	db 107,66,32,102,114,101,101,10,0


	; PrintFreeMemory workspace at ws+3040 length ws+2
f471_PrintFreeMemory:
	call f41_GetFreeMemory
	ld (ws+3040), hl
	ld a,10
	call f478__lsr2
	call f16_print_i16
	ld hl,   _c389
	jp f9_print


_c390:
	db 115,121,110,116,97,120,32,101,114,114,111,114,58,32,99,111,119,98,101,32,91,45,73,112,97,116,104,93,32,60,105,110
db 102,105,108,101,62,32,60,111,117,116,102,105,108,101,62,10,0


	; SyntaxError workspace at ws+3046 length ws+0
f472_SyntaxError:
	ld hl,   _c390
	call f9_print
	jp f4_ExitWithError


	; ParseArguments workspace at ws+3040 length ws+6
f473_ParseArguments:
	call f27_ArgvInit
	call f28_ArgvNext
	ld (ws+8), hl
	call f28_ArgvNext
	ld (ws+10), hl
	call f28_ArgvNext
	ld (ws+3044), hl
	ld a,h
	or l
	jp nz,    f472_SyntaxError
	ld hl, (ws+8)
	ld a,h
	or l
	jp z,    f472_SyntaxError
	ld hl, (ws+10)
	ld a,h
	or l
	ret nz
	jp f472_SyntaxError

	end
