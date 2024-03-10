 global f321_yy_reduce
 global f455_yy_accept
 global f454_yy_syntax_error
 global f453_yy_parse_failed



	; Reducer workspace at ws+1353 length ws+0
f322_Reducer:
;end_f322_Reducer:
	ret


	; reduce_0 workspace at ws+1353 length ws+2
f323_reduce_0:
	call f166_MidReturn
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f323_reduce_0:
	ret


	; reduce_1 workspace at ws+1353 length ws+0
f324_reduce_1:
	ld hl, (ws+12)
	push hl
	ld hl, (ws+1325)
	push hl
	ld hl, (ws+1317)
	call f272_InitVariable
	ld h,6
	push hl
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f324_reduce_1:
	ret


	; reduce_2 workspace at ws+1353 length ws+7
f325_reduce_2:
	ld hl, (ws+12)
	push hl
	ld hl, (ws+1333)
	push hl
	ld hl, (ws+1325)
	call f272_InitVariable
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1333)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f282_CheckExpressionType
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	ld bc,11
	add hl,bc
	ld a,(hl)
	ld (ws+1353), a
	ld hl, (ws+1333)
	push hl
	ld hl,0
	call f154_MidAddress
;	ld (ws+1354), hl
	ld a, (ws+1353)
	push af
	call f153_MidDeref
	ld (ws+1356), hl
	ld a, (ws+1353)
	push af
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1356)
	call f152_MidStore
;	ld (ws+1358), hl
	call f269_Generate
	ld h,6
	push hl
	ld hl,ws+1329
	call f314_yy_destructor
	ld b,2
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f325_reduce_2:
	ret
c01_c363:
	db 116,121,112,101,115,32,99,97,110,110,111,116,32,98,101,32,105,110,102,101,114,114,101,100,32,102,111,114,32,110,117,109,101
db 114,105,99,32,99,111,110,115,116,97,110,116,115,0
c01_c364:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,97,115,115,105,103,110,32,116,111,32,108,118,97,108,117,101,115,0


	; reduce_3 workspace at ws+1353 length ws+10
f326_reduce_3:
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1353), hl
	ld a,h
	or l
	jp nz, c01_066a
	ld hl,c01_c363
	call f82_SimpleError
c01_066a:
;c01_0666:
	ld hl, (ws+1353)
	call f241_IsScalar
	ld (ws+1355), a
	or a
	jp nz, c01_066f
	ld hl,c01_c364
	call f82_SimpleError
c01_066f:
;c01_066b:
	ld hl, (ws+12)
	push hl
	ld hl, (ws+1325)
	push hl
	ld hl, (ws+1353)
	call f272_InitVariable
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1325)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f282_CheckExpressionType
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	ld bc,11
	add hl,bc
	ld a,(hl)
	ld (ws+1356), a
	ld hl, (ws+1325)
	push hl
	ld hl,0
	call f154_MidAddress
	ld (ws+1357), hl
	ld a, (ws+1356)
	push af
	call f153_MidDeref
	ld (ws+1359), hl
	ld a, (ws+1356)
	push af
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1359)
	call f152_MidStore
	ld (ws+1361), hl
	call f269_Generate
	ld b,2
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f326_reduce_3:
	ret


	; reduce_4 workspace at ws+1353 length ws+11
f327_reduce_4:
	ld ix, (ws+1325)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1353), hl
	push ix
	pop hl
	call f244_UndoLValue
	ld (ws+1355), hl
	ld (ws+1357), hl
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1353)
	call f282_CheckExpressionType
	ld hl, (ws+1353)
	ld bc,11
	add hl,bc
	ld a,(hl)
	ld (ws+1359), a
	push af
	ld hl, (ws+1357)
	call f153_MidDeref
	ld (ws+1360), hl
	ld a, (ws+1359)
	push af
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1360)
	call f152_MidStore
;	ld (ws+1362), hl
	call f269_Generate
	ld b,2
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f327_reduce_4:
	ret


	; reduce_5 workspace at ws+1353 length ws+0
f328_reduce_5:
	ld hl, (ws+1325)
	call f298_TerminateNormalLoop
	ld d,10
	push de
	ld hl,ws+1317
	call f314_yy_destructor
	ld h,13
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f328_reduce_5:
	ret


	; reduce_6 workspace at ws+1353 length ws+4
f329_reduce_6:
	call f297_BeginNormalLoop
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld hl, (ws+20)
	call f159_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f329_reduce_6:
;	ret


	; reduce_7 workspace at ws+1353 length ws+0
f330_reduce_7:
	ld hl, (ws+1325)
	call f298_TerminateNormalLoop
	ld d,10
	push de
	ld hl,ws+1317
	call f314_yy_destructor
	ld h,13
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f330_reduce_7:
	ret


	; reduce_8 workspace at ws+1353 length ws+4
f331_reduce_8:
	call f297_BeginNormalLoop
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld hl, (ws+20)
	call f159_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f331_reduce_8:
;	ret


	; reduce_9 workspace at ws+1353 length ws+6
f332_reduce_9:
	ld hl, (ws+1321)
	ld (ws+1309), hl
	call f247_AllocLabel
;	ld (ws+1353), hl
	ld (ws+1355), hl
	call f247_AllocLabel
	ld (ws+1357), hl
	ld (ws+18), hl
	ld de, (ws+1355)
	ld hl, (ws+1317)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+18)
	ld hl, (ws+1317)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1355)
	ld ix, (ws+1317)
	ld (ix+4), l
	ld (ix+5), h
	push ix
	pop hl
	call f270_GenerateConditional
	ld de, (ws+18)
	ld hl, (ws+1309)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld h,13
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f332_reduce_9:
	ret
c01_c365:
	db 110,111,116,104,105,110,103,32,116,111,32,98,114,101,97,107,32,116,111,0


	; reduce_10 workspace at ws+1353 length ws+2
f333_reduce_10:
	ld hl, (ws+18)
	ld a,h
	or l
	jp nz, c01_0674
	ld hl,c01_c365
	call f82_SimpleError
c01_0674:
;c01_0670:
	ld hl, (ws+18)
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f333_reduce_10:
	ret
c01_c366:
	db 110,111,116,104,105,110,103,32,116,111,32,99,111,110,116,105,110,117,101,32,116,111,0


	; reduce_11 workspace at ws+1353 length ws+2
f334_reduce_11:
	ld hl, (ws+20)
	ld a,h
	or l
	jp nz, c01_0679
	ld hl,c01_c366
	call f82_SimpleError
c01_0679:
;c01_0675:
	ld hl, (ws+20)
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f334_reduce_11:
	ret


	; reduce_12 workspace at ws+1353 length ws+4
f335_reduce_12:
	ld hl, (ws+22)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+22)
	ld (ws+1355), hl
	push hl
	pop ix
	ld l, (ix+6)
	ld h, (ix+7)
	ld (ws+22), hl
	ld hl, (ws+1355)
	call f40_Free
	ld b,26
	push bc
	ld hl,ws+1329
	call f314_yy_destructor
	ld d,10
	push de
	ld hl,ws+1317
	call f314_yy_destructor
	ld h,12
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f335_reduce_12:
	ret


	; reduce_13 workspace at ws+1353 length ws+6
f336_reduce_13:
	ld hl,8
	call f75_InternalAlloc
;	ld (ws+1353), hl
	ld (ws+1355), hl
	ld hl, (ws+22)
	ld ix, (ws+1355)
	ld (ix+6), l
	ld (ix+7), h
	push ix
	pop hl
	ld (ws+22), hl
	call f247_AllocLabel
	ld (ws+1357), hl
	ld d,h
	ld e,l
	ld hl, (ws+22)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f336_reduce_13:
	ret


	; reduce_14 workspace at ws+1353 length ws+8
f337_reduce_14:
	call f247_AllocLabel
;	ld (ws+1353), hl
	ld (ws+1355), hl
	call f247_AllocLabel
	ld (ws+1357), hl
	ld (ws+1359), hl
	ld de, (ws+1355)
	ld hl, (ws+22)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1359)
	ld ix, (ws+22)
	ld (ix+4), l
	ld (ix+5), h
	ld hl, (ws+1313)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1359)
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1355)
	ld ix, (ws+1313)
	ld (ix+4), l
	ld (ix+5), h
	push ix
	pop hl
	jp   f270_GenerateConditional ;	call f270_GenerateConditional
;end_f337_reduce_14:
;	ret


	; reduce_15 workspace at ws+1353 length ws+2
f338_reduce_15:
	ld ix, (ws+22)
	ld l, (ix+4)
	ld h, (ix+5)
	call f159_MidLabel
;	ld (ws+1353), hl
	jp   f269_Generate ;	call f269_Generate
;end_f338_reduce_15:
;	ret


	; reduce_16 workspace at ws+1353 length ws+4
f339_reduce_16:
	ld hl, (ws+22)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld ix, (ws+22)
	ld l, (ix+4)
	ld h, (ix+5)
	call f159_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f339_reduce_16:
;	ret


	; reduce_17 workspace at ws+1353 length ws+4
f340_reduce_17:
	ld hl, (ws+22)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld ix, (ws+22)
	ld l, (ix+4)
	ld h, (ix+5)
	call f159_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f340_reduce_17:
;	ret


	; reduce_18 workspace at ws+1353 length ws+8
f341_reduce_18:
	ld ix, (ws+24)
	ld a, (ix+9)
	or a
	jp nz, c01_0680
;c01_0681:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_0680
;c01_067f:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
;	ld (ws+1353), hl
	call f269_Generate
c01_0680:
;c01_067a:
	ld hl, (ws+24)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
	ld (ws+1355), hl
	call f269_Generate
	ld ix, (ws+24)
	ld a, (ix+8)
	call f144_MidEndcase
	ld (ws+1357), hl
	call f269_Generate
	ld hl, (ws+24)
	ld (ws+1359), hl
	push hl
	pop ix
	ld l, (ix+6)
	ld h, (ix+7)
	ld (ws+24), hl
	ld hl, (ws+1359)
	call f40_Free
	ld d,10
	push de
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,64
	push af
	ld hl,ws+1317
	call f314_yy_destructor
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f341_reduce_18:
	ret
c01_c367:
	db 99,97,115,101,32,111,110,108,121,32,119,111,114,107,115,32,111,110,32,110,117,109,98,101,114,115,0


	; reduce_19 workspace at ws+1353 length ws+10
f342_reduce_19:
	ld hl,10
	call f75_InternalAlloc
;	ld (ws+1353), hl
	ld (ws+1355), hl
	ld hl, (ws+24)
	ld ix, (ws+1355)
	ld (ix+6), l
	ld (ix+7), h
	ld hl, (ws+18)
	ld (ix+4), l
	ld (ix+5), h
	call f247_AllocLabel
	ld (ws+1357), hl
	ld d,h
	ld e,l
	ld hl, (ws+1355)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1355)
	ld (ws+24), hl
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
;	ld (ws+1359), a
	or a
	jp nz, c01_0686
	ld hl,c01_c367
	call f82_SimpleError
c01_0686:
;c01_0682:
	ld hl, (ws+1317)
	call f172_NodeWidth
;	ld (ws+1360), a
	ld ix, (ws+1355)
	ld (ix+8), a
	ld a, (ix+8)
	push af
	ld hl, (ws+1317)
	call f134_MidStartcase
	ld (ws+1361), hl
	call f269_Generate
	ld h,65
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f342_reduce_19:
	ret
c01_c368:
	db 119,104,101,110,32,101,108,115,101,32,109,117,115,116,32,103,111,32,108,97,115,116,0


	; reduce_20 workspace at ws+1353 length ws+8
f343_reduce_20:
	ld ix, (ws+24)
	ld a, (ix+9)
	or a
	jp z, c01_068b
	ld hl,c01_c368
	call f82_SimpleError
c01_068b:
;c01_0687:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_0690
	ld hl, (ws+24)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
	ld (ws+1355), hl
	call f269_Generate
c01_0690:
;c01_068c:
	call f247_AllocLabel
	ld (ws+1357), hl
	ld d,h
	ld e,l
	ld hl, (ws+24)
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix, (ws+24)
	ld a, (ix+8)
	push af
	ld hl, (ws+1317)
	exx
	ld hl, (ws+1319)
	exx
	exx
	push hl
	exx
	push hl
	push ix
	pop hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f128_MidWhencase
;	ld (ws+1359), hl
	call f269_Generate
	ld d,6
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f343_reduce_20:
	ret
c01_c369:
	db 111,110,108,121,32,111,110,101,32,119,104,101,110,32,101,108,115,101,32,97,108,108,111,119,101,100,0


	; reduce_21 workspace at ws+1353 length ws+4
f344_reduce_21:
	ld ix, (ws+24)
	ld a, (ix+9)
	or a
	jp z, c01_0695
	ld hl,c01_c369
	call f82_SimpleError
c01_0695:
;c01_0691:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_069a
	ld hl, (ws+24)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
	ld (ws+1355), hl
	call f269_Generate
c01_069a:
;c01_0696:
	ld de,0
	ld hl, (ws+24)
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix, (ws+24)
	ld (ix+9), 1
	ld a,9
	push af
	ld hl,ws+1317
	call f314_yy_destructor
	ld d,6
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f344_reduce_21:
	ret


	; reduce_22 workspace at ws+1353 length ws+0
f345_reduce_22:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f345_reduce_22:
	ret


	; reduce_23 workspace at ws+1353 length ws+0
f346_reduce_23:
	ld hl, (ws+1313)
	ld (ws+1309), hl
	jp   f299_Negate ;	call f299_Negate
;end_f346_reduce_23:
;	ret


	; reduce_24 workspace at ws+1353 length ws+2
f347_reduce_24:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld de,0
	push de
	push de
	push de
	xor a
	call f161_MidBand
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,46
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f347_reduce_24:
	ret


	; reduce_25 workspace at ws+1353 length ws+2
f348_reduce_25:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld de,0
	push de
	push de
	push de
	xor a
	call f135_MidBor
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,47
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f348_reduce_25:
	ret


	; reduce_26 workspace at ws+1353 length ws+2
f349_reduce_26:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	xor a
	call f300_ConditionalEq
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,54
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f349_reduce_26:
	ret


	; reduce_27 workspace at ws+1353 length ws+2
f350_reduce_27:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld a,1
	call f300_ConditionalEq
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,55
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f350_reduce_27:
	ret


	; reduce_28 workspace at ws+1353 length ws+2
f351_reduce_28:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	xor a
	call f301_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,50
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f351_reduce_28:
	ret


	; reduce_29 workspace at ws+1353 length ws+2
f352_reduce_29:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld a,1
	call f301_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,53
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f352_reduce_29:
	ret


	; reduce_30 workspace at ws+1353 length ws+2
f353_reduce_30:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	push hl
	xor a
	call f301_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,52
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f353_reduce_30:
	ret


	; reduce_31 workspace at ws+1353 length ws+2
f354_reduce_31:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	push hl
	ld a,1
	call f301_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,51
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f354_reduce_31:
	ret


	; reduce_32 workspace at ws+1353 length ws+2
f355_reduce_32:
	ld hl, (ws+1313)
	exx
	ld hl, (ws+1315)
	exx
	call f116_MidConstant
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f355_reduce_32:
	ret


	; reduce_33 workspace at ws+1353 length ws+0
f356_reduce_33:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f356_reduce_33:
	ret


	; reduce_34 workspace at ws+1353 length ws+0
f357_reduce_34:
	ld hl, (ws+1313)
	ld (ws+1309), hl
;end_f357_reduce_34:
	ret


	; reduce_35 workspace at ws+1353 length ws+2
f358_reduce_35:
	ld h,111
	push hl
	ld hl, (ws+1313)
	call f288_Expr1Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f358_reduce_35:
	ret


	; reduce_36 workspace at ws+1353 length ws+2
f359_reduce_36:
	ld a,106
	push af
	ld hl, (ws+1313)
	call f288_Expr1Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f359_reduce_36:
	ret


	; reduce_37 workspace at ws+1353 length ws+2
f360_reduce_37:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f289_ExprAdd
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,19
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f360_reduce_37:
	ret


	; reduce_38 workspace at ws+1353 length ws+2
f361_reduce_38:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f291_ExprSub
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,14
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f361_reduce_38:
	ret


	; reduce_39 workspace at ws+1353 length ws+2
f362_reduce_39:
	ld h,161
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,24
	push af
	ld hl,ws+1317
	call f314_yy_destructor
;end_f362_reduce_39:
	ret


	; reduce_40 workspace at ws+1353 length ws+2
f363_reduce_40:
	ld b,141
	push bc
	ld d,136
	push de
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,23
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f363_reduce_40:
	ret


	; reduce_41 workspace at ws+1353 length ws+2
f364_reduce_41:
	ld d,151
	push de
	ld a,146
	push af
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,18
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f364_reduce_41:
	ret


	; reduce_42 workspace at ws+1353 length ws+2
f365_reduce_42:
	ld h,176
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,49
	push af
	ld hl,ws+1317
	call f314_yy_destructor
;end_f365_reduce_42:
	ret


	; reduce_43 workspace at ws+1353 length ws+2
f366_reduce_43:
	ld d,166
	push de
	push de
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,59
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f366_reduce_43:
	ret


	; reduce_44 workspace at ws+1353 length ws+2
f367_reduce_44:
	ld h,171
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,48
	push af
	ld hl,ws+1317
	call f314_yy_destructor
;end_f367_reduce_44:
	ret


	; reduce_45 workspace at ws+1353 length ws+2
f368_reduce_45:
	ld d,116
	push de
	push de
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f296_ExprShift
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,56
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f368_reduce_45:
	ret


	; reduce_46 workspace at ws+1353 length ws+2
f369_reduce_46:
	ld a,126
	push af
	ld h,121
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f296_ExprShift
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,57
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f369_reduce_46:
	ret
c01_c370:
	db 99,97,115,116,32,98,101,116,119,101,101,110,32,112,111,105,110,116,101,114,32,97,110,100,32,110,111,110,45,112,111,105,110
db 116,101,114,32,111,102,32,100,105,102,102,101,114,101,110,116,32,115,105,122,101,0


	; reduce_47 workspace at ws+1353 length ws+5
f370_reduce_47:
	ld hl, (ws+1313)
	call f233_CheckNotPartialType
	ld ix, (ws+1321)
	ld a, (ix+13)
	cp 40
	jp z, c01_06a1
;c01_06a2:
	ld ix, (ws+1321)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld e, (ix+11)
	ld d, (ix+12)
	ld ix, (ws+1313)
	ld l, (ix+11)
	ld h, (ix+12)
	and a
	sbc hl,de
	jp z, c01_06a1
;c01_06a0:
	ld ix, (ws+1321)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	ld (ws+1353), a
	ld hl, (ws+1313)
	call f74_IsPtr
	ld (ws+1354), a
	ld a, (ws+1353)
	or a
	jp nz, c01_06a8
	ld a, (ws+1354)
	or a
	jp z, c01_06a9
c01_06a8:
	ld hl,c01_c370
	call f82_SimpleError
c01_06a9:
;c01_06a3:
	ld ix, (ws+1321)
	ld l, (ix+7)
	ld h, (ix+8)
	call f240_IsSNum
	ld (ws+1355), a
	ld hl, (ws+1313)
	ld bc,11
	add hl,bc
	ld a,(hl)
	push af
	ld hl, (ws+1321)
	push hl
	ld a, (ws+1355)
	call f184_MidCCast
;	ld (ws+1356), hl
	ld (ws+1309), hl
	jp c01_069b
c01_06a1:
	ld hl, (ws+1321)
	ld (ws+1309), hl
c01_069b:
	ld hl, (ws+1313)
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
	ld b,58
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f370_reduce_47:
	ret
c01_c371:
	db 121,111,117,32,99,97,110,110,111,116,32,116,97,107,101,32,116,104,101,32,97,100,100,114,101,115,115,32,111,102,32,115,99,97
db 108,97,114,32,118,97,114,105,97,98,108,101,115,0


	; reduce_48 workspace at ws+1353 length ws+5
f371_reduce_48:
	ld hl, (ws+1313)
	call f244_UndoLValue
;	ld (ws+1353), hl
	ld (ws+1309), hl
	push hl
	pop ix
	ld a, (ix+13)
	cp 42
	jp nz, c01_06af
	ld hl, (ws+1309)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1355), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f241_IsScalar
	ld (ws+1357), a
	or a
	jp z, c01_06b4
	ld hl,c01_c371
	call f82_SimpleError
c01_06b4:
;c01_06b0:
c01_06af:
;c01_06ab:
;end_f371_reduce_48:
	ret


	; reduce_49 workspace at ws+1353 length ws+2
f372_reduce_49:
	ld hl, (ws+1313)
	call f244_UndoLValue
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,59
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f372_reduce_49:
	ret


	; reduce_50 workspace at ws+1353 length ws+5
f373_reduce_50:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	ld (ws+1353), a
	or a
;	jp nz, c01_06b9
;	call f302_parser_i_bad_next_prev
;c01_06b9:
	call z,f302_parser_i_bad_next_prev
;c01_06b5:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+13)
	ld h, (ix+14)
	exx
	ld hl,0
	exx
	call f116_MidConstant
	ld (ws+1354), hl
	ld a,156
	push af
	ld hl, (ws+555)
	ld bc,11
	add hl,bc
	ld a,(hl)
	push af
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1354)
	call f183_MidC2Op
;	ld (ws+1356), hl
	ld (ws+1309), hl
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
;end_f373_reduce_50:
	ret


	; reduce_51 workspace at ws+1353 length ws+5
f374_reduce_51:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	ld (ws+1353), a
	or a
;	jp nz, c01_06be
;	call f302_parser_i_bad_next_prev
;c01_06be:
	call z,f302_parser_i_bad_next_prev
;c01_06ba:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+13)
	ld h, (ix+14)
	exx
	ld hl,0
	exx
	call f116_MidConstant
	ld (ws+1354), hl
	ld d,131
	push de
	ld hl, (ws+555)
	ld bc,11
	add hl,bc
	ld a,(hl)
	push af
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1354)
	call f183_MidC2Op
;	ld (ws+1356), hl
	ld (ws+1309), hl
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
;end_f374_reduce_51:
	ret


	; reduce_52 workspace at ws+1353 length ws+2
f375_reduce_52:
	ld ix, (ws+1313)
	ld l, (ix+11)
	ld h, (ix+12)
	exx
	ld hl,0
	exx
	call f116_MidConstant
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f375_reduce_52:
	ret
c01_c372:
	db 97,114,114,97,121,32,101,120,112,101,99,116,101,100,0


	; reduce_53 workspace at ws+1353 length ws+3
f376_reduce_53:
	ld hl, (ws+1313)
	call f237_IsArray
;	ld (ws+1353), a
	or a
	jp nz, c01_06c3
	ld hl,c01_c372
	call f82_SimpleError
c01_06c3:
;c01_06bf:
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	exx
	ld hl,0
	exx
	call f116_MidConstant
;	ld (ws+1354), hl
	ld (ws+1309), hl
;end_f376_reduce_53:
	ret
c01_c373:
	db 32,105,115,32,110,111,116,32,97,32,118,97,108,117,101,0


	; not_a_value workspace at ws+1363 length ws+0
f378_not_a_value:
	call f80_StartError
	ld ix, (ws+1313)
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c373
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f378_not_a_value:
;	ret


	; reduce_54 workspace at ws+1353 length ws+10
f377_reduce_54:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 7
	jp nz, c01_06c5
	ld hl, (ws+1313)
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
	call f116_MidConstant
;	ld (ws+1353), hl
	ld (ws+1309), hl
	jp c01_06c4
c01_06c5:
	cp 28
	jp nz, c01_06c6
	ld hl, (ws+1313)
	push hl
	ld hl,0
	call f154_MidAddress
	ld (ws+1355), hl
	ld (ws+1309), hl
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f273_MakePointerType
	ld (ws+1357), hl
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
	push ix
	pop hl
	call f243_MakeLValue
;	ld (ws+1359), hl
	ld (ws+1309), hl
	jp c01_06c4
c01_06c6:
	cp 30
	jp nz, c01_06c7
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld a, (ix+15)
	cp 6
	jp nz, c01_06cc
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f169_MidSubref
	ld (ws+1361), hl
	ld (ws+1309), hl
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+12)
	ld h, (ix+13)
	push hl
	pop ix
	ld l, (ix+10)
	ld h, (ix+11)
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_06c4 ; c01_06c8
c01_06cc:
	call f378_not_a_value
c01_06c8:
	jp c01_06c4
c01_06c7:
	call f378_not_a_value
c01_06c4:
;end_f377_reduce_54:
	ret
c01_c374:
	db 99,97,110,110,111,116,32,100,101,114,101,102,101,114,101,110,99,101,32,110,111,110,45,112,111,105,110,116,101,114,115,0


	; reduce_55 workspace at ws+1353 length ws+3
f379_reduce_55:
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
;	ld (ws+1353), a
	or a
	jp nz, c01_06d1
	ld hl,c01_c374
	call f82_SimpleError
c01_06d1:
;c01_06cd:
	ld hl, (ws+1317)
	call f243_MakeLValue
;	ld (ws+1354), hl
	ld (ws+1309), hl
	ld b,5
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f379_reduce_55:
	ret
c01_c375:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,105,110,100,101,120,32,97,110,32,97,114,114,97,121,44,32,110,111,116,32,97,32
db 0
c01_c376:
	db 97,114,114,97,121,32,105,110,100,105,99,101,115,32,109,117,115,116,32,98,101,32,110,117,109,98,101,114,115,0


	; reduce_56 workspace at ws+1353 length ws+27
f380_reduce_56:
	ld ix, (ws+1325)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1353), hl
	push ix
	pop hl
	call f246_MaybeUndoLValue
	ld (ws+1355), hl
	ld (ws+1357), hl
	ld hl, (ws+1353)
	call f237_IsArray
;	ld (ws+1359), a
	or a
	jp nz, c01_06d6
	call f80_StartError
	ld hl,c01_c375
	call f9_print
	ld ix, (ws+1353)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	call f81_EndError
c01_06d6:
;c01_06d2:
	ld hl, (ws+1317)
	push hl
	ld ix, (ws+1353)
	ld l, (ix+4)
	ld h, (ix+5)
	call f282_CheckExpressionType
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
	ld (ws+1360), a
	or a
	jp nz, c01_06db
	ld hl,c01_c376
	call f82_SimpleError
c01_06db:
;c01_06d7:
	ld hl, (ws+1353)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1361), hl
	ld hl, (ws+555)
	ld bc,11
	add hl,bc
	ld a,(hl)
	ld (ws+1363), a
	ld hl, (ws+555)
	add hl,bc
	ld a,(hl)
	push af
	ld hl, (ws+1317)
	push hl
	xor a
	call f184_MidCCast
	ld (ws+1364), hl
	ld ix, (ws+1361)
	ld l, (ix+13)
	ld h, (ix+14)
	exx
	ld hl,0
	exx
	call f116_MidConstant
	ld (ws+1366), hl
	ld h,161
	push hl
	ld a, (ws+1363)
	push af
	ld hl, (ws+1364)
	push hl
	ld hl, (ws+1366)
	call f183_MidC2Op
;	ld (ws+1368), hl
	ld (ws+1370), hl
	ld hl, (ws+555)
	ld ix, (ws+1370)
	ld (ix+7), l
	ld (ix+8), h
	ld d,156
	push de
	ld a, (ws+1363)
	push af
	ld hl, (ws+1357)
	push hl
	push ix
	pop hl
	call f183_MidC2Op
;	ld (ws+1372), hl
	ld (ws+1374), hl
	ld hl, (ws+1361)
	call f273_MakePointerType
;	ld (ws+1376), hl
	ld ix, (ws+1374)
	ld (ix+7), l
	ld (ix+8), h
	push ix
	pop hl
	call f243_MakeLValue
;	ld (ws+1378), hl
	ld (ws+1309), hl
	ld b,17
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f380_reduce_56:
	ret
c01_c377:
	db 32,105,115,32,110,111,116,32,97,32,114,101,99,111,114,100,32,111,114,32,112,111,105,110,116,101,114,32,116,111,32,97,32,114
db 101,99,111,114,100,0


	; BadType workspace at ws+1377 length ws+0
f382_BadType:
	call f80_StartError
	ld ix, (ws+1353)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c377
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f382_BadType:
;	ret
c01_c378:
	db 32,100,111,101,115,32,110,111,116,32,99,111,110,116,97,105,110,32,97,32,109,101,109,98,101,114,32,39,0
c01_c379:
	db 39,0


	; reduce_57 workspace at ws+1353 length ws+24
f381_reduce_57:
	ld ix, (ws+1321)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1353), hl
	push ix
	pop hl
	ld (ws+1355), hl
	ld hl, (ws+1355)
	call f245_IsLValue
	ld (ws+1357), a
	or a
	jp z, c01_06e0
	ld hl, (ws+1321)
	call f246_MaybeUndoLValue
;	ld (ws+1358), hl
	ld (ws+1355), hl
c01_06e1:
	ld hl, (ws+1353)
	call f74_IsPtr
;	ld (ws+1360), a
	or a
	jp z, c01_06dc ; c01_06e6
;c01_06e5:
	ld hl, (ws+1353)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	call f233_CheckNotPartialType
	ld hl, (ws+555)
	ld bc,11
	add hl,bc
	ld a,(hl)
	push af
	ld hl, (ws+1355)
	call f153_MidDeref
	ld (ws+1361), hl
	ld (ws+1355), hl
	jp c01_06e1
c01_06e6:
	jp c01_06dc
c01_06e0:
	ld hl, (ws+1353)
	call f74_IsPtr
;	ld (ws+1363), a
	or a
	jp z, c01_06ea
	ld hl, (ws+1353)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	jp c01_06dc
c01_06ea:
	call f382_BadType
c01_06dc:
	ld hl, (ws+1353)
	call f233_CheckNotPartialType
	ld hl, (ws+1353)
	call f242_IsRecord
;	ld (ws+1364), a
	or a
;	jp nz, c01_06ef
;	call f382_BadType
;c01_06ef:
	call z,f382_BadType
;c01_06eb:
	ld hl, (ws+1353)
	push hl
	ld hl, (ws+1313)
	call f228_LookupSymbol
;	ld (ws+1365), hl
	ld (ws+1367), hl
	ld a,h
	or l
	jp nz, c01_06f4
	call f80_StartError
	ld ix, (ws+1353)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c378
	call f9_print
	ld hl, (ws+1313)
	call f9_print
	ld hl,c01_c379
	call f9_print
	call f81_EndError
c01_06f4:
;c01_06f0:
	ld hl, (ws+1313)
	call f40_Free
	ld hl, (ws+1367)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+6)
	ld h, (ix+7)
	exx
	ld hl,0
	exx
	call f116_MidConstant
	ld (ws+1369), hl
	ld d,156
	push de
	ld hl, (ws+555)
	ld bc,11
	add hl,bc
	ld a,(hl)
	push af
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1369)
	call f183_MidC2Op
	ld (ws+1371), hl
	ld (ws+1309), hl
	ld hl, (ws+1367)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f273_MakePointerType
	ld (ws+1373), hl
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
	push ix
	pop hl
	call f243_MakeLValue
	ld (ws+1375), hl
	ld (ws+1309), hl
	ld h,8
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f381_reduce_57:
	ret


	; reduce_58 workspace at ws+1353 length ws+4
f383_reduce_58:
	ld hl, (ws+1313)
	call f168_MidString
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld hl, (ws+551)
	call f273_MakePointerType
	ld (ws+1355), hl
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
;end_f383_reduce_58:
	ret


	; reduce_59 workspace at ws+1353 length ws+0
f384_reduce_59:
	ld ix, (ws+1313)
	ld a, (ix+13)
	cp 40
;	jp z, c01_06f9
;	call f303_parser_i_constant_error
;c01_06f9:
	call nz,f303_parser_i_constant_error
;c01_06f5:
	ld hl, (ws+1313)
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
	ld (ws+1309), de
	exx
	ld (ws+1311), de
	exx
	ld hl, (ws+1313)
	jp   f69_Discard ;	call f69_Discard
;end_f384_reduce_59:
;	ret


	; reduce_60 workspace at ws+1353 length ws+0
f385_reduce_60:
	ld ix, (ws+1325)
	ld (ix+10), 7
	ld de, (ws+1317)
	exx
	ld de, (ws+1319)
	exx
	push ix
	pop hl
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
	ld b,2
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f385_reduce_60:
	ret
c01_c380:
	db 105,110,118,97,108,105,100,32,105,110,116,101,103,101,114,32,116,121,112,101,32,114,97,110,103,101,0


	; reduce_61 workspace at ws+1353 length ws+2
f386_reduce_61:
	ld hl, (ws+1325)
	exx
	ld hl, (ws+1327)
	exx
	ld de, (ws+1317)
	exx
	ld de, (ws+1319)
	exx
	call f487__cmps4
	jp m, c01_06fe
;c01_06fd:
	ld hl,c01_c380
	call f82_SimpleError
c01_06fe:
;c01_06fa:
	ld hl, (ws+1325)
	exx
	ld hl, (ws+1327)
	exx
	exx
	push hl
	exx
	push hl
	ld hl, (ws+1317)
	exx
	ld hl, (ws+1319)
	exx
	call f252_ArchGuessIntType
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,16
	push de
	ld hl,ws+1329
	call f314_yy_destructor
	ld h,45
	push hl
	ld hl,ws+1321
	call f314_yy_destructor
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f386_reduce_61:
	ret
c01_c381:
	db 101,120,112,101,99,116,101,100,32,0
c01_c382:
	db 32,116,111,32,98,101,32,97,32,116,121,112,101,0


	; reduce_62 workspace at ws+1353 length ws+6
f387_reduce_62:
	ld hl, (ws+1313)
	ld (ws+1353), hl
	push hl
	pop ix
	ld a, (ix+10)
	or a
	jp nz, c01_0703
	call f72_AllocNewType
	ld (ws+1355), hl
	ld (ws+1357), hl
	push hl
	pop ix
	ld (ix+15), 1
	ld ix, (ws+1353)
	ld (ix+10), 30
	ld d,h
	ld e,l
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	push ix
	pop hl
	ld ix, (ws+1357)
	ld (ix+7), l
	ld (ix+8), h
c01_0703:
;c01_06ff:
	ld ix, (ws+1353)
	ld a, (ix+10)
	cp 30
	jp z, c01_0708
	call f80_StartError
	ld hl,c01_c381
	call f9_print
	ld ix, (ws+1353)
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c382
	call f9_print
	call f81_EndError
c01_0708:
;c01_0704:
	ld hl, (ws+1353)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1309), hl
;end_f387_reduce_62:
	ret


	; reduce_63 workspace at ws+1353 length ws+2
f388_reduce_63:
	ld hl, (ws+1317)
	call f273_MakePointerType
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f388_reduce_63:
	ret


	; reduce_64 workspace at ws+1353 length ws+2
f389_reduce_64:
	ld hl, (ws+1325)
	push hl
	ld hl, (ws+1317)
	exx
	ld hl, (ws+1319)
	exx
	call f274_MakeArrayType
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,17
	push de
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f389_reduce_64:
	ret


	; reduce_65 workspace at ws+1353 length ws+2
f390_reduce_65:
	ld hl, (ws+1321)
	push hl
	ld hl,0
	call f274_MakeArrayType
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,17
	push de
	ld hl,ws+1317
	call f314_yy_destructor
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f390_reduce_65:
	ret
c01_c383:
	db 32,105,115,32,110,111,116,32,97,110,32,97,114,114,97,121,0


	; reduce_66 workspace at ws+1353 length ws+1
f391_reduce_66:
	ld hl, (ws+1313)
	call f237_IsArray
	ld (ws+1353), a
	or a
	jp nz, c01_070d
	call f80_StartError
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c383
	call f9_print
	call f81_EndError
c01_070d:
;c01_0709:
	ld ix, (ws+1313)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1309), hl
;end_f391_reduce_66:
	ret


	; reduce_67 workspace at ws+1353 length ws+4
f392_reduce_67:
	ld de,0
	push de
	ld hl, (ws+1325)
	push hl
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	call f231_AddAlias
	ld (ws+1353), hl
	ld (ws+1355), hl
	ld h,65
	push hl
	ld hl,ws+1321
	call f314_yy_destructor
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f392_reduce_67:
	ret


	; reduce_68 workspace at ws+1353 length ws+2
f393_reduce_68:
	ld de,0
	push de
	ld hl, (ws+1313)
	call f230_AddSymbol
	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f393_reduce_68:
	ret
c01_c384:
	db 115,121,109,98,111,108,32,39,0
c01_c385:
	db 39,32,110,111,116,32,102,111,117,110,100,0


	; reduce_69 workspace at ws+1353 length ws+6
f394_reduce_69:
	ld hl, (ws+1313)
	ld (ws+1353), hl
	ld de,0
	push de
	call f228_LookupSymbol
	ld (ws+1355), hl
	ld (ws+1357), hl
	ld a,h
	or l
	jp nz, c01_0712
	call f80_StartError
	ld hl,c01_c384
	call f9_print
	ld hl, (ws+1353)
	call f9_print
	ld hl,c01_c385
	call f9_print
	call f81_EndError
c01_0712:
;c01_070e:
	ld hl, (ws+1353)
	call f40_Free
	ld hl, (ws+1357)
	ld (ws+1309), hl
;end_f394_reduce_69:
	ret


	; reduce_70 workspace at ws+1353 length ws+8
f395_reduce_70:
	ld hl, (ws+1313)
	ld (ws+1353), hl
	ld de,0
	push de
	call f228_LookupSymbol
	ld (ws+1355), hl
	ld (ws+1357), hl
	ld a,h
	or l
	jp nz, c01_0717
	ld de,0
	push de
	ld hl, (ws+1353)
	call f230_AddSymbol
;	ld (ws+1359), hl
	ld (ws+1357), hl
	jp c01_0713
c01_0717:
	ld hl, (ws+1353)
	call f40_Free
c01_0713:
	ld hl, (ws+1357)
	ld (ws+1309), hl
;end_f395_reduce_70:
	ret
c01_c386:
	db 115,105,109,112,108,101,32,116,121,112,101,32,111,114,32,118,97,114,105,97,98,108,101,32,110,97,109,101,32,101,120,112,101
db 99,116,101,100,0


	; reduce_71 workspace at ws+1353 length ws+0
f396_reduce_71:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 28
	jp nz, c01_0719
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1309), hl
	jp c01_0718
c01_0719:
	cp 30
	jp nz, c01_071a
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1309), hl
	jp c01_0718
c01_071a:
	ld hl,c01_c386
	call f82_SimpleError
c01_0718:
;end_f396_reduce_71:
	ret


	; reduce_72 workspace at ws+1353 length ws+0
f397_reduce_72:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f397_reduce_72:
	ret
c01_c387:
	db 115,117,98,114,111,117,116,105,110,101,115,32,99,97,108,108,101,100,32,97,115,32,102,117,110,99,116,105,111,110,115,32,109
db 117,115,116,32,104,97,118,101,32,101,120,97,99,116,108,121,32,111,110,101,32,111,117,116,112,117,116,32,112,97,114,97,109,101
db 116,101,114,0


	; reduce_73 workspace at ws+1353 length ws+25
f398_reduce_73:
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	ld ix, (ws+28)
	ld (ix+11), 1
	call f304_i_check_sub_call_args
	ld ix, (ws+1353)
	ld a, (ix+27)
	cp 1
	jp z, c01_071f
	ld hl,c01_c387
	call f82_SimpleError
c01_071f:
;c01_071b:
	ld hl, (ws+1353)
	push hl
	xor a
	call f106_GetOutputParameter
	ld (ws+1355), hl
	ld (ws+1357), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld bc,11
	add hl,bc
	ld a,(hl)
	ld (ws+1359), a
	ld hl, (ws+12)
	inc hl
	inc hl
	inc hl
	inc hl
	push hl
	ld hl,0
	call f230_AddSymbol
;	ld (ws+1360), hl
	ld (ws+1362), hl
	ld hl, (ws+12)
	push hl
	ld hl, (ws+1362)
	push hl
	ld hl, (ws+1357)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f272_InitVariable
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+28)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1353)
	call f148_MidCall
;	ld (ws+1364), hl
	call f269_Generate
	ld a, (ws+1359)
	push af
	ld hl, (ws+1353)
	push hl
	ld hl, (ws+1357)
	push hl
	xor a
	call f121_MidPoparg
	ld (ws+1366), hl
	ld hl, (ws+1362)
	push hl
	ld hl,0
	call f154_MidAddress
;	ld (ws+1368), hl
	ld a, (ws+1359)
	push af
	call f153_MidDeref
	ld (ws+1370), hl
	ld a, (ws+1359)
	push af
	ld hl, (ws+1366)
	push hl
	ld hl, (ws+1370)
	call f152_MidStore
;	ld (ws+1372), hl
	call f269_Generate
	call f305_i_end_call
	ld hl, (ws+1362)
	push hl
	ld hl,0
	call f154_MidAddress
;	ld (ws+1374), hl
	ld a, (ws+1359)
	push af
	call f153_MidDeref
;	ld (ws+1376), hl
	ld (ws+1309), hl
	ld hl, (ws+1357)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
;end_f398_reduce_73:
	ret
c01_c388:
	db 115,117,98,114,111,117,116,105,110,101,32,114,101,113,117,105,114,101,115,32,111,117,116,112,117,116,32,97,114,103,117,109
db 101,110,116,115,0

	; reduce_74 workspace at ws+1353 length ws+4
f399_reduce_74:
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	call f304_i_check_sub_call_args
	ld ix, (ws+1353)
	ld a, (ix+27)
	or a
	jp z, c01_0724
	ld hl,c01_c388
	call f82_SimpleError
c01_0724:
;c01_0720:
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+28)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1353)
	call f148_MidCall
	ld (ws+1355), hl
	call f269_Generate
	call f305_i_end_call
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f399_reduce_74:
	ret
c01_c389:
	db 116,111,111,32,109,97,110,121,32,111,117,116,112,117,116,32,97,114,103,117,109,101,110,116,115,0
c01_c390:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,97,115,115,105,103,110,32,116,111,32,108,118,97,108,117,101,115,0
c01_c391:
	db 116,111,111,32,102,101,119,32,111,117,116,112,117,116,32,97,114,103,117,109,101,110,116,115,0


	; reduce_75 workspace at ws+1353 length ws+24
f400_reduce_75:
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	call f304_i_check_sub_call_args
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+28)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1353)
	call f148_MidCall
	ld (ws+1355), hl
	call f269_Generate
	ld ix, (ws+1353)
	ld a, (ix+27)
	ld (ws+1357), a
	xor a
	ld (ws+1358), a
	ld hl, (ws+1329)
	ld (ws+1359), hl
c01_0725:
	ld hl, (ws+1359)
	ld a,h
	or l
	jp z, c01_072a
	ld a, (ws+1357)
	or a
	jp nz, c01_072f
	ld hl,c01_c389
	call f82_SimpleError
c01_072f:
;c01_072b:
	ld a, (ws+1357)
	dec a
	ld (ws+1357), a
	ld hl, (ws+1353)
	push hl
	call f106_GetOutputParameter
	ld (ws+1361), hl
	ld (ws+1363), hl
	ld ix, (ws+1359)
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+1365), hl
	ld (ix+9), 0
	ld (ix+10), 0
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+1359), hl
	ld ix, (ws+1365)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	ld (ws+1367), a
	or a
	jp nz, c01_0734
	ld hl,c01_c390
	call f82_SimpleError
c01_0734:
;c01_0730:
	ld hl, (ws+1363)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f273_MakePointerType
	ld (ws+1368), hl
	ld hl, (ws+1365)
	push hl
	ld hl, (ws+1368)
	call f282_CheckExpressionType
	ld hl, (ws+1363)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f233_CheckNotPartialType
	ld ix, (ws+1365)
	ld l, (ix+7)
	ld h, (ix+8)
	call f233_CheckNotPartialType
	ld hl, (ws+1363)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld bc,11
	add hl,bc
	ld a,(hl)
	ld (ws+1370), a
	push af
	ld hl, (ws+1353)
	push hl
	ld hl, (ws+1363)
	push hl
	ld a, (ws+1358)
	call f121_MidPoparg
	ld (ws+1371), hl
	ld a, (ws+1370)
	push af
	ld hl, (ws+1365)
	call f153_MidDeref
	ld (ws+1373), hl
	ld a, (ws+1370)
	push af
	ld hl, (ws+1371)
	push hl
	ld hl, (ws+1373)
	call f152_MidStore
	ld (ws+1375), hl
	call f269_Generate
	ld a, (ws+1358)
	inc a
	ld (ws+1358), a
	ld hl, (ws+1363)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1363), hl
	jp c01_0725
c01_072a:
	ld hl, (ws+1329)
	call f69_Discard
	ld a, (ws+1358)
	ld b,a
	ld ix, (ws+1353)
	ld a, (ix+27)
	cp b
	jp z, c01_0739
	ld hl,c01_c391
	call f82_SimpleError
c01_0739:
;c01_0735:
	call f305_i_end_call
	ld h,2
	push hl
	ld hl,ws+1325
	call f314_yy_destructor
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f400_reduce_75:
	ret
c01_c392:
	db 101,120,112,101,99,116,101,100,32,0
c01_c393:
	db 32,116,111,32,98,101,32,97,32,115,117,98,114,111,117,116,105,110,101,0


	; reduce_76 workspace at ws+1353 length ws+11
f401_reduce_76:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	call f238_IsSubroutine
	ld (ws+1353), a
	or a
	jp nz, c01_073e
	call f80_StartError
	ld hl,c01_c392
	call f9_print
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c393
	call f9_print
	call f81_EndError
c01_073e:
;c01_073a:
	ld hl,12
	call f75_InternalAlloc
;	ld (ws+1354), hl
	ld (ws+1356), hl
	ld hl, (ws+28)
	ld ix, (ws+1356)
	ld (ix+4), l
	ld (ix+5), h
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1358), hl
	push ix
	pop de
	ld hl, (ws+1356)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1358)
	ld hl, (ws+1356)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld h,d
	ld l,e
	push hl
	xor a
	call f105_GetInputParameter
;	ld (ws+1360), hl
	ld ix, (ws+1356)
	ld (ix+6), l
	ld (ix+7), h
	ld hl, (ws+1358)
	push hl
	xor a
	call f106_GetOutputParameter
;	ld (ws+1362), hl
	ld ix, (ws+1356)
	ld (ix+8), l
	ld (ix+9), h
	push ix
	pop hl
	ld (ws+28), hl
;end_f401_reduce_76:
	ret


	; reduce_77 workspace at ws+1353 length ws+0
f402_reduce_77:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f402_reduce_77:
	ret


	; reduce_78 workspace at ws+1353 length ws+2
f403_reduce_78:
	call f125_MidEnd
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f403_reduce_78:
	ret


	; reduce_79 workspace at ws+1353 length ws+0
f404_reduce_79:
	ld hl, (ws+1313)
	ld (ws+1309), hl
;end_f404_reduce_79:
	ret


	; reduce_80 workspace at ws+1353 length ws+0
f405_reduce_80:
	ld ix, (ws+1313)
	ld l, (ix+9)
	ld h, (ix+10)
	call f69_Discard
	ld hl, (ws+1321)
	ld ix, (ws+1313)
	ld (ix+9), l
	ld (ix+10), h
	push ix
	pop hl
	ld (ws+1309), hl
	ld h,45
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f405_reduce_80:
	ret
c01_c394:
	db 116,111,111,32,109,97,110,121,32,112,97,114,97,109,101,116,101,114,115,32,105,110,32,99,97,108,108,32,116,111,32,0


	; reduce_81 workspace at ws+1353 length ws+7
f406_reduce_81:
	ld ix, (ws+28)
	ld l, (ix+6)
	ld h, (ix+7)
	ld (ws+1353), hl
	ld a,h
	or l
	jp nz, c01_0743
	call f80_StartError
	ld hl,c01_c394
	call f9_print
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	call f81_EndError
c01_0743:
;c01_073f:
	ld ix, (ws+28)
	ld l, (ix+6)
	ld h, (ix+7)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld ix, (ws+28)
	ld (ix+6), l
	ld (ix+7), h
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1353)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f282_CheckExpressionType
	ld hl, (ws+1353)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f233_CheckNotPartialType
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	call f233_CheckNotPartialType
	ld ix, (ws+28)
	ld a, (ix+10)
	inc a
	ld (ix+10), a
	ld hl, (ws+1313)
	call f172_NodeWidth
	ld (ws+1355), a
	call f125_MidEnd
;	ld (ws+1356), hl
	ld a, (ws+1355)
	push af
	push hl
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1353)
	push hl
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld a, (ix+26)
	ld ix, (ws+28)
	ld b, (ix+10)
	sub b
	call f126_MidArg
;	ld (ws+1358), hl
	ld (ws+1309), hl
;end_f406_reduce_81:
	ret


	; reduce_82 workspace at ws+1353 length ws+2
f407_reduce_82:
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1325)
	call f139_MidPair
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,45
	push hl
	ld hl,ws+1321
	call f314_yy_destructor
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f407_reduce_82:
	ret


	; reduce_83 workspace at ws+1353 length ws+2
f408_reduce_83:
	ld hl, (ws+1313)
	push hl
	ld hl,0
	call f139_MidPair
	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f408_reduce_83:
	ret


	; reduce_84 workspace at ws+1353 length ws+2
f409_reduce_84:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	call f139_MidPair
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,45
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f409_reduce_84:
	ret


	; reduce_85 workspace at ws+1353 length ws+2
f410_reduce_85:
	ld hl, (ws+1313)
	call f244_UndoLValue
	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f410_reduce_85:
	ret


	; reduce_86 workspace at ws+1353 length ws+4
f411_reduce_86:
	ld ix, (ws+558)
	ld a, (ix+28)
	or 2
	ld (ix+28), a
	push ix
	pop hl
	call f217_EmitterEmitSubroutineFlags
	ld hl, (ws+558)
	ld (ws+12), hl
	call f120_MidStartsub
	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+12)
	call f129_MidEndsub
	ld (ws+1355), hl
	call f269_Generate
	ld hl, (ws+12)
	call f280_ReportWorkspaces
	ld hl, (ws+12)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+12), hl
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f411_reduce_86:
	ret
c01_c395:
	db 116,121,112,101,32,105,115,32,110,111,116,32,97,110,32,105,110,116,101,114,102,97,99,101,0


	; not_an_interface workspace at ws+1358 length ws+0
f413_not_an_interface:
	ld hl,c01_c395
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f413_not_an_interface:
;	ret


	; reduce_87 workspace at ws+1353 length ws+5
f412_reduce_87:
	ld hl, (ws+1313)
	call f238_IsSubroutine
	ld (ws+1353), a
	or a
;	jp nz, c01_0748
;	call f413_not_an_interface
;c01_0748:
	call z,f413_not_an_interface
;c01_0744:
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1354), hl
	push hl
	pop ix
	ld a, (ix+28)
	and 2
	or a
;	jp nz, c01_074d
;	call f413_not_an_interface
;c01_074d:
	call z,f413_not_an_interface
;c01_0749:
	ld ix, (ws+558)
	ld a, (ix+28)
	or 4
	ld (ix+28), a
	ld hl, (ws+1354)
	ld (ix+12), l
	ld (ix+13), h
	ld hl, (ws+1313)
	ld (ix+10), l
	ld (ix+11), h
	ld hl, (ws+12)
	push hl
	ld hl, (ws+1354)
	call f212_EmitterReferenceSubroutine
	ld hl, (ws+1354)
	push hl
	ld hl, (ws+558)
	call f212_EmitterReferenceSubroutine
	ld ix, (ws+1354)
	ld a, (ix+26)
	ld ix, (ws+558)
	ld (ix+26), a
	ld a, (ix+26)
	or a
	jp z, c01_0752
	ld ix, (ws+1354)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+558)
	call f278_CopyParameterList
c01_0752:
;c01_074e:
	ld ix, (ws+1354)
	ld a, (ix+27)
	ld ix, (ws+558)
	ld (ix+27), a
	ld a, (ix+27)
	or a
	jp z, c01_0757
	ld hl, (ws+1354)
	push hl
	xor a
	call f106_GetOutputParameter
;	ld (ws+1356), hl
	push hl
	ld hl, (ws+558)
	call f278_CopyParameterList
c01_0757:
;c01_0753:
	ld hl, (ws+558)
	call f215_EmitterEmitInputParameters
	ld hl, (ws+558)
	call f216_EmitterEmitOutputParameter;
	ld hl, (ws+558)
	call f217_EmitterEmitSubroutineFlags
	ld d,68
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f412_reduce_87:
	ret


	; reduce_88 workspace at ws+1353 length ws+0
f414_reduce_88:
	ld ix, (ws+558)
	ld l, (ix+14)
	ld h, (ix+15)
	push hl
	ld hl, (ws+1317)
	call f210_EmitterDeclareExternalSubr;utine
	ld h,11
	push hl
	ld hl,ws+1325
	call f314_yy_destructor
	ld b,16
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,4
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f414_reduce_88:
	ret


	; reduce_89 workspace at ws+1353 length ws+8
f415_reduce_89:
	ld hl,29
	call f75_InternalAlloc
	ld (ws+1353), hl
	ld (ws+558), hl
	ld hl, (ws+12)
	inc hl
	inc hl
	inc hl
	inc hl
	ld ix, (ws+558)
	ld (ix+8), l
	ld (ix+9), h
	ld de, (ws+12)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	call f248_AllocSubrId
	ld (ws+1355), hl
	ld ix, (ws+558)
	ld (ix+14), l
	ld (ix+15), h
	call f72_AllocNewType
	ld (ws+1357), hl
	ld (ws+1359), hl
	push hl
	pop ix
	ld (ix+15), 6
	ld ix, (ws+555)
	ld l, (ix+11)
	ld h, (ix+12)
	ld ix, (ws+1359)
	ld (ix+11), l
	ld (ix+12), h
	ld ix, (ws+555)
	ld a, (ix+16)
	ld ix, (ws+1359)
	ld (ix+16), a
	ld ix, (ws+555)
	ld l, (ix+13)
	ld h, (ix+14)
	ld ix, (ws+1359)
	ld (ix+13), l
	ld (ix+14), h
	ld de, (ws+558)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	push ix
	pop hl
	push de
	pop ix
	ld (ix+10), l
	ld (ix+11), h
	ld h,d
	ld l,e
	push de
	pop ix
	ld (ix+12), l
	ld (ix+13), h
	ld ix, (ws+1313)
	ld (ix+10), 30
	ld de, (ws+1359)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	push ix
	pop hl
	push de
	pop ix
	ld (ix+7), l
	ld (ix+8), h
	ld de, (ws+1313)
	ld hl, (ws+558)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+558)
	call f209_EmitterDeclareSubroutine
	ld hl, (ws+1313)
	ld (ws+1309), hl
;end_f415_reduce_89:
	ret
c01_c396:
	db 110,111,116,32,97,32,115,117,98,114,111,117,116,105,110,101,0
c01_c397:
	db 115,117,98,114,111,117,116,105,110,101,32,97,108,114,101,97,100,121,32,105,109,112,108,101,109,101,110,116,101,100,0
c01_c398:
	db 99,97,110,110,111,116,32,105,109,112,108,101,109,101,110,116,32,115,117,98,114,111,117,116,105,110,101,32,104,101,114,101,0


	; reduce_90 workspace at ws+1353 length ws+1
f416_reduce_90:
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f238_IsSubroutine
	ld (ws+1353), a
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 30
	jp nz, c01_075d
	ld a, (ws+1353)
	or a
	jp nz, c01_075e
c01_075d:
	ld hl,c01_c396
	call f82_SimpleError
c01_075e:
;c01_0758:
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+558), hl
	push hl
	pop ix
	ld a, (ix+28)
	and 1
	or a
	jp z, c01_0764
	ld hl,c01_c397
	call f82_SimpleError
c01_0764:
;c01_0760:
	ld hl, (ws+558)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+12)
	and a
	sbc hl,de
	jp z, c01_0769
	ld hl,c01_c398
	call f82_SimpleError
c01_0769:
;c01_0765:
	ld d,25
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f416_reduce_90:
	ret


	; reduce_91 workspace at ws+1353 length ws+6
f417_reduce_91:
	ld hl,6
	call f75_InternalAlloc
	ld (ws+1353), hl
	ld (ws+1355), hl
	ld hl, (ws+30)
	ld ix, (ws+1355)
	ld (ix+4), l
	ld (ix+5), h
	ld de, (ws+18)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix,0
	ld (ws+18), ix
	ld de, (ws+20)
	ld hl, (ws+1355)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld (ws+20), ix
	ld hl, (ws+1355)
	ld (ws+30), hl
	ld hl, (ws+558)
	ld (ws+12), hl
	call f120_MidStartsub
	ld (ws+1357), hl
	call f269_Generate
	ld ix, (ws+12)
	ld a, (ix+28)
	or 1
	ld (ix+28), a
;end_f417_reduce_91:
	ret


	; reduce_92 workspace at ws+1353 length ws+6
f418_reduce_92:
	ld hl, (ws+12)
	call f129_MidEndsub
	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+12)
	call f280_ReportWorkspaces
	ld hl, (ws+30)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+18), hl
	ld hl, (ws+30)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+20), hl
	ld hl, (ws+30)
	ld (ws+1355), hl
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+30), hl
	ld hl, (ws+1355)
	call f40_Free
	ld hl, (ws+12)
	ld (ws+1357), hl
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+12), hl
	ld hl, (ws+1357)
	call f276_DestructSubroutineContents
	ld d,25
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f418_reduce_92:
	ret


	; reduce_93 workspace at ws+1353 length ws+0
f419_reduce_93:
	ld ix, (ws+558)
	ld (ix+27), 0
	push ix
	pop hl
	call f215_EmitterEmitInputParameters
	ld hl, (ws+558)
	jp   f216_EmitterEmitOutputParameter; ;	call f216_EmitterEmitOutputParameter;
;end_f419_reduce_93:
;	ret


	; reduce_94 workspace at ws+1353 length ws+1
f420_reduce_94:
	ld hl, (ws+1313)
	call f104_CountParameters
	ld (ws+1353), a
	ld ix, (ws+558)
	ld (ix+27), a
	push ix
	pop hl
	call f215_EmitterEmitInputParameters
	ld hl, (ws+558)
	call f216_EmitterEmitOutputParameter;
	ld h,6
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f420_reduce_94:
	ret


	; reduce_95 workspace at ws+1353 length ws+1
f421_reduce_95:
	ld hl, (ws+1313)
	call f104_CountParameters
	ld (ws+1353), a
	ld ix, (ws+558)
	ld (ix+26), a
;end_f421_reduce_95:
	ret


	; reduce_96 workspace at ws+1353 length ws+0
f422_reduce_96:
	ld ix,0
	ld (ws+1309), ix
	ld a,4
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f422_reduce_96:
	ret


	; reduce_97 workspace at ws+1353 length ws+0
f423_reduce_97:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld a,4
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f423_reduce_97:
	ret


	; reduce_98 workspace at ws+1353 length ws+0
f424_reduce_98:
	ld hl, (ws+1313)
	ld (ws+1309), hl
;end_f424_reduce_98:
	ret


	; reduce_99 workspace at ws+1353 length ws+0
f425_reduce_99:
	ld de, (ws+1313)
	ld hl, (ws+1321)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld (ix+4), e
	ld (ix+5), d
	ld hl, (ws+1321)
	ld (ws+1309), hl
	ld b,45
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f425_reduce_99:
	ret


	; reduce_100 workspace at ws+1353 length ws+2
f426_reduce_100:
	ld hl, (ws+558)
	inc hl
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, (ws+1321)
	call f230_AddSymbol
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld hl, (ws+558)
	push hl
	ld hl, (ws+1309)
	push hl
	ld hl, (ws+1313)
	call f272_InitVariable
	ld h,6
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f426_reduce_100:
	ret


	; reduce_101 workspace at ws+1353 length ws+2
f427_reduce_101:
	ld ix, (ws+26)
	ld l, (ix+11)
	ld h, (ix+12)
	push hl
	ld a, (ix+16)
	call f250_ArchAlignUp
	ld (ws+1353), hl
	ld ix, (ws+26)
	ld (ix+13), l
	ld (ix+14), h
	ld d,65
	push de
	ld hl,ws+1325
	call f314_yy_destructor
	ld a,10
	push af
	ld hl,ws+1317
	call f314_yy_destructor
	ld b,20
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f427_reduce_101:
	ret


	; reduce_102 workspace at ws+1353 length ws+2
f428_reduce_102:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 30
	jp nz, c01_076b
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+26), hl
	push hl
	pop ix
	ld a, (ix+15)
	cp 1
	jp z, c01_076a ; c01_0770
;c01_076f:
	call f306_SymbolRedeclarationError
c01_0770:
;c01_076c:
	jp c01_076a
c01_076b:
	or a
	jp nz, c01_0771
	call f72_AllocNewType
	ld (ws+1353), hl
	ld (ws+26), hl
	ld ix, (ws+1313)
	ld (ix+10), 30
	ld d,h
	ld e,l
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	push ix
	pop hl
	ld ix, (ws+26)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_076a
c01_0771:
	call f306_SymbolRedeclarationError
c01_076a:
	ld ix, (ws+26)
	ld (ix+15), 5
;end_f428_reduce_102:
	ret
c01_c399:
	db 32,105,115,32,110,111,116,32,97,32,114,101,99,111,114,100,32,116,121,112,101,0


	; reduce_103 workspace at ws+1353 length ws+1
f429_reduce_103:
	ld hl, (ws+1313)
	call f233_CheckNotPartialType
	ld hl, (ws+1313)
	call f242_IsRecord
	ld (ws+1353), a
	or a
	jp nz, c01_0776
	call f80_StartError
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c399
	call f9_print
	call f81_EndError
c01_0776:
;c01_0772:
	ld ix, (ws+1313)
	ld a, (ix+16)
	ld ix, (ws+26)
	ld (ix+16), a
	ld ix, (ws+1313)
	ld l, (ix+11)
	ld h, (ix+12)
	ld ix, (ws+26)
	ld (ix+11), l
	ld (ix+12), h
	ld hl, (ws+1313)
	ld (ix+4), l
	ld (ix+5), h
;end_f429_reduce_103:
	ret


	; reduce_104 workspace at ws+1353 length ws+2
f430_reduce_104:
	ld hl, (ws+1317)
	call f233_CheckNotPartialType
	ld ix, (ws+26)
	ld a, (ix+16)
	ld ix, (ws+1317)
	ld b, (ix+16)
	cp b
	jp nc, c01_077b
;c01_077a:
	ld ix, (ws+1317)
	ld a, (ix+16)
	ld ix, (ws+26)
	ld (ix+16), a
c01_077b:
;c01_0777:
	ld ix, (ws+1329)
	ld (ix+10), 28
	ld hl,9
	call f75_InternalAlloc
	ld (ws+1353), hl
	ld d,h
	ld e,l
	ld hl, (ws+1329)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1317)
	ld hl, (ws+1329)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+26)
	push hl
	ld hl, (ws+1329)
	push hl
	ld hl, (ws+1325)
	call f254_ArchInitMember
	ld h,6
	push hl
	ld hl,ws+1321
	call f314_yy_destructor
	ld d,22
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f430_reduce_104:
	ret


	; reduce_105 workspace at ws+1353 length ws+0
f431_reduce_105:
	ld ix, (ws+26)
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+1309), hl
;end_f431_reduce_105:
	ret


	; reduce_106 workspace at ws+1353 length ws+0
f432_reduce_106:
	ld hl, (ws+1317)
	exx
	ld hl, (ws+1319)
	exx
	ld (ws+1309), hl
	ld a,16
	push af
	ld hl,ws+1321
	call f314_yy_destructor
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f432_reduce_106:
	ret


	; reduce_107 workspace at ws+1353 length ws+2
f433_reduce_107:
	ld hl, (ws+26)
	push hl
	ld hl, (ws+1313)
	call f230_AddSymbol
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld ix, (ws+26)
	ld a, (ix+6)
	inc a
	ld (ix+6), a
;end_f433_reduce_107:
	ret


	; reduce_108 workspace at ws+1353 length ws+2
f434_reduce_108:
	call f308_CheckEndOfInitialiser
	call f123_MidEndinit
	ld (ws+1353), hl
	call f269_Generate
	ld h,31
	push hl
	ld hl,ws+1325
	call f314_yy_destructor
	ld d,32
	push de
	ld hl,ws+1317
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f434_reduce_108:
	ret
c01_c400:
	db 115,116,97,116,105,99,32,105,110,105,116,105,97,108,105,115,101,114,115,32,111,110,108,121,32,119,111,114,107,32,111,110,32
db 97,114,114,97,121,115,32,111,114,32,114,101,99,111,114,100,115,0
c01_c401:
	db 121,111,117,32,99,97,110,39,116,32,115,116,97,116,105,99,97,108,108,121,32,105,110,105,116,105,97,108,105,115,101,32,97,110
db 32,105,110,104,101,114,105,116,101,100,32,114,101,99,111,114,100,0


	; reduce_109 workspace at ws+1353 length ws+10
f435_reduce_109:
	ld hl, (ws+1317)
	call f233_CheckNotPartialType
	ld ix, (ws+1325)
	ld (ix+10), 28
	ld hl,9
	call f75_InternalAlloc
	ld (ws+1353), hl
	ld d,h
	ld e,l
	ld hl, (ws+1325)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1317)
	ld hl, (ws+1325)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+12)
	ld hl, (ws+1325)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1325)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld (ix+8), 255
	call f247_AllocLabel
	ld (ws+1355), hl
	ld d,h
	ld e,l
	ld hl, (ws+1325)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld (ix+6), e
	ld (ix+7), d
	ld hl, (ws+1317)
	call f237_IsArray
	ld (ws+1357), a
	ld hl, (ws+1317)
	call f242_IsRecord
	ld (ws+1358), a
	ld a, (ws+1357)
	or a
	jp nz, c01_0782
;c01_0783:
	ld a, (ws+1358)
	or a
	jp nz, c01_0782
;c01_0781:
	ld hl,c01_c400
	call f82_SimpleError
c01_0782:
;c01_077c:
	ld hl, (ws+1317)
	call f242_IsRecord
;	ld (ws+1359), a
	or a
	jp z, c01_078a
;c01_078b:
	ld ix, (ws+1317)
	ld l, (ix+4)
	ld h, (ix+5)
	ld a,h
	or l
	jp z, c01_078a
;c01_0789:
	ld hl,c01_c401
	call f82_SimpleError
c01_078a:
;c01_0784:
	ld hl, (ws+1317)
	call f242_IsRecord
;	ld (ws+1360), a
	or a
	jp z, c01_0790
	ld hl, (ws+1317)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+560), hl
c01_0790:
;c01_078c:
	ld hl, (ws+1317)
	ld (ws+26), hl
	ld ix,0
	ld (ws+562), ix
	ld (ws+564), ix
	ld hl, (ws+1325)
	call f113_MidStartinit
	ld (ws+1361), hl
	call f269_Generate
	ld b,6
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld h,2
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f435_reduce_109:
	ret
c01_c402:
	db 105,110,105,116,105,97,108,105,115,101,114,32,109,117,115,116,32,98,101,32,97,110,32,110,117,109,98,101,114,0
c01_c403:
	db 105,110,105,116,105,97,108,105,115,101,114,32,109,117,115,116,32,98,101,32,97,32,115,116,114,105,110,103,0
c01_c404:
	db 105,110,105,116,105,97,108,105,115,101,114,32,111,102,32,119,114,111,110,103,32,116,121,112,101,0
c01_c405:
	db 105,110,105,116,105,97,108,105,115,101,114,32,111,102,32,119,114,111,110,103,32,116,121,112,101,0


	; reduce_110 workspace at ws+1353 length ws+16
f436_reduce_110:
	call f313_GetInitedMemberChecked
	ld (ws+1355), hl
	pop hl
	ld (ws+1353), hl
	ld ix, (ws+1355)
	ld a, (ix+16)
	call f311_AlignTo
	ld ix, (ws+1355)
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+1357), hl
	ld ix, (ws+1313)
	ld a, (ix+13)
	cp 40
	jp nz, c01_0792
	ld hl, (ws+1355)
	call f239_IsNum
;	ld (ws+1359), a
	or a
	jp nz, c01_0797
	ld hl,c01_c402
	call f82_SimpleError
c01_0797:
;c01_0793:
	ld a, (ws+1357)
	push af
	ld hl, (ws+1313)
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
	call f110_MidInit
;	ld (ws+1360), hl
	call f269_Generate
	jp c01_0791
c01_0792:
	cp 41
	jp nz, c01_0798
	ld hl, (ws+1355)
	call f74_IsPtr
;	ld (ws+1362), a
	or a
	jp z, c01_079e
	ld hl, (ws+1355)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+551)
	and a
	sbc hl,de
	jp z, c01_079f
c01_079e:
	ld hl,c01_c403
	call f82_SimpleError
c01_079f:
;c01_0799:
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f160_MidInitstring
;	ld (ws+1363), hl
	call f269_Generate
	jp c01_0791
c01_0798:
	cp 42
	jp nz, c01_07a1
	ld de, (ws+1355)
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	and a
	sbc hl,de
	jp z, c01_07a6
	ld hl,c01_c404
	call f82_SimpleError
c01_07a6:
;c01_07a2:
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f136_MidInitaddress
;	ld (ws+1365), hl
	call f269_Generate
	jp c01_0791
c01_07a1:
	cp 43
	jp nz, c01_07a7
	ld de, (ws+1355)
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	and a
	sbc hl,de
	jp z, c01_07ac
	ld hl,c01_c405
	call f82_SimpleError
c01_07ac:
;c01_07a8:
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f124_MidInitsubref
	ld (ws+1367), hl
	call f269_Generate
	jp c01_0791
c01_07a7:
	call f303_parser_i_constant_error
c01_0791:
	ld hl, (ws+1313)
	call f69_Discard
	ld de, (ws+562)
	ld hl, (ws+1357)
	add hl,de
	ld (ws+562), hl
	ld de, (ws+564)
	ld hl, (ws+1357)
	add hl,de
	ld (ws+564), hl
;end_f436_reduce_110:
	ret


	; reduce_111 workspace at ws+1353 length ws+0
f437_reduce_111:
	call f308_CheckEndOfInitialiser
	ld de, (ws+562)
	ld ix, (ws+1321)
	ld l, (ix+4)
	ld h, (ix+5)
	add hl,de
	ld (ws+562), hl
	push ix
	pop hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+26), hl
	push ix
	pop hl
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+560), hl
	push ix
	pop hl
	call f40_Free
	ld d,32
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f437_reduce_111:
	ret
c01_c406:
	db 98,114,97,99,101,100,32,105,110,105,116,105,97,108,105,115,101,100,32,99,97,110,32,111,110,108,121,32,105,110,105,116,105,97
db 108,105,115,101,32,97,114,114,97,121,115,32,111,114,32,114,101,99,111,114,100,115,0


	; reduce_112 workspace at ws+1353 length ws+8
f438_reduce_112:
	call f313_GetInitedMemberChecked
	ld (ws+1355), hl
	pop hl
	ld (ws+1353), hl
	ld ix, (ws+1355)
	ld a, (ix+16)
	call f311_AlignTo
	ld hl,6
	call f75_InternalAlloc
	ld (ws+1357), hl
	ld (ws+1309), hl
	ld de, (ws+26)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+560)
	ld hl, (ws+1309)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+562)
	ld ix, (ws+1309)
	ld (ix+4), l
	ld (ix+5), h
	ld hl, (ws+1355)
	ld (ws+26), hl
	ld ix,0
	ld (ws+562), ix
	call f242_IsRecord
;	ld (ws+1359), a
	or a
	jp z, c01_07b1
	ld hl, (ws+1355)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+560), hl
	jp c01_07ad
c01_07b1:
	ld hl, (ws+1355)
	call f237_IsArray
;	ld (ws+1360), a
	or a
	jp z, c01_07b5
	ld ix,0
	ld (ws+560), ix
	jp c01_07ad
c01_07b5:
	ld hl,c01_c406
	call f82_SimpleError
c01_07ad:
;end_f438_reduce_112:
	ret


	; reduce_113 workspace at ws+1353 length ws+2
f439_reduce_113:
	call f143_MidAsmend
	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f439_reduce_113:
	ret


	; reduce_114 workspace at ws+1353 length ws+2
f440_reduce_114:
	call f141_MidAsmstart
	ld (ws+1353), hl
	jp   f269_Generate ;	call f269_Generate
;end_f440_reduce_114:
;	ret


	; reduce_115 workspace at ws+1353 length ws+2
f441_reduce_115:
	ld hl, (ws+1313)
	call f163_MidAsmtext
	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+1313)
	jp   f40_Free ;	call f40_Free
;end_f441_reduce_115:
;	ret


	; reduce_116 workspace at ws+1353 length ws+2
f442_reduce_116:
	ld hl, (ws+1313)
	exx
	ld hl, (ws+1315)
	exx
	call f167_MidAsmvalue
	ld (ws+1353), hl
	jp   f269_Generate ;	call f269_Generate
;end_f442_reduce_116:
;	ret
c01_c407:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,101,109,105,116,32,114,101,102,101,114,101,110,99,101,115,32,116,111,32,118
db 97,114,105,97,98,108,101,115,44,32,115,117,98,114,111,117,116,105,110,101,115,44,32,111,114,32,99,111,110,115,116,97,110,116
db 115,0


	; bad_reference workspace at ws+1360 length ws+0
f444_bad_reference:
	ld hl,c01_c407
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f444_bad_reference:
;	ret


	; reduce_117 workspace at ws+1353 length ws+7
f443_reduce_117:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 30
	jp nz, c01_07b7
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f238_IsSubroutine
	ld (ws+1353), a
	or a
	jp z, c01_07bc
	ld hl, (ws+12)
	push hl
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f212_EmitterReferenceSubroutine
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f114_MidAsmsubref
;	ld (ws+1354), hl
	call f269_Generate
	jp c01_07b6 ; c01_07b8
c01_07bc:
	call f444_bad_reference
c01_07b8:
	jp c01_07b6
c01_07b7:
	cp 28
	jp nz, c01_07bd
	ld hl, (ws+1313)
	call f147_MidAsmsymbol
;	ld (ws+1356), hl
	call f269_Generate
	jp c01_07b6
c01_07bd:
	cp 7
	jp nz, c01_07be
	ld hl, (ws+1313)
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
	call f167_MidAsmvalue
;	ld (ws+1358), hl
	call f269_Generate
	jp c01_07b6
c01_07be:
	call f444_bad_reference
c01_07b6:
;end_f443_reduce_117:
	ret


	; reduce_123 workspace at ws+1353 length ws+0
f445_reduce_123:
	ld b,26
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
;end_f445_reduce_123:
	ret


	; reduce_127 workspace at ws+1353 length ws+0
f446_reduce_127:
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f446_reduce_127:
	ret


	; reduce_128 workspace at ws+1353 length ws+0
f447_reduce_128:
	ld h,25
	push hl
	ld hl,ws+1329
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f447_reduce_128:
	ret


	; reduce_129 workspace at ws+1353 length ws+0
f448_reduce_129:
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f448_reduce_129:
	ret


	; reduce_130 workspace at ws+1353 length ws+0
f449_reduce_130:
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f449_reduce_130:
	ret


	; reduce_136 workspace at ws+1353 length ws+0
f450_reduce_136:
	ld d,45
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f450_reduce_136:
	ret


	; reduce_139 workspace at ws+1353 length ws+0
f451_reduce_139:
	ld d,45
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f451_reduce_139:
	ret


	; reduce_default workspace at ws+1353 length ws+0
f452_reduce_default:
;end_f452_reduce_default:
	ret
f321_yy_reduce_s07bf:
	dw f323_reduce_0
	dw f324_reduce_1
	dw f325_reduce_2
	dw f326_reduce_3
	dw f327_reduce_4
	dw f328_reduce_5
	dw f329_reduce_6
	dw f330_reduce_7
	dw f331_reduce_8
	dw f332_reduce_9
	dw f333_reduce_10
	dw f334_reduce_11
	dw f335_reduce_12
	dw f336_reduce_13
	dw f337_reduce_14
	dw f338_reduce_15
	dw f339_reduce_16
	dw f340_reduce_17
	dw f341_reduce_18
	dw f342_reduce_19
	dw f343_reduce_20
	dw f344_reduce_21
	dw f345_reduce_22
	dw f346_reduce_23
	dw f347_reduce_24
	dw f348_reduce_25
	dw f349_reduce_26
	dw f350_reduce_27
	dw f351_reduce_28
	dw f352_reduce_29
	dw f353_reduce_30
	dw f354_reduce_31
	dw f355_reduce_32
	dw f356_reduce_33
	dw f357_reduce_34
	dw f358_reduce_35
	dw f359_reduce_36
	dw f360_reduce_37
	dw f361_reduce_38
	dw f362_reduce_39
	dw f363_reduce_40
	dw f364_reduce_41
	dw f365_reduce_42
	dw f366_reduce_43
	dw f367_reduce_44
	dw f368_reduce_45
	dw f369_reduce_46
	dw f370_reduce_47
	dw f371_reduce_48
	dw f372_reduce_49
	dw f373_reduce_50
	dw f374_reduce_51
	dw f375_reduce_52
	dw f376_reduce_53
	dw f377_reduce_54
	dw f379_reduce_55
	dw f380_reduce_56
	dw f381_reduce_57
	dw f383_reduce_58
	dw f384_reduce_59
	dw f385_reduce_60
	dw f386_reduce_61
	dw f387_reduce_62
	dw f388_reduce_63
	dw f389_reduce_64
	dw f390_reduce_65
	dw f391_reduce_66
	dw f392_reduce_67
	dw f393_reduce_68
	dw f394_reduce_69
	dw f395_reduce_70
	dw f396_reduce_71
	dw f397_reduce_72
	dw f398_reduce_73
	dw f399_reduce_74
	dw f400_reduce_75
	dw f401_reduce_76
	dw f402_reduce_77
	dw f403_reduce_78
	dw f404_reduce_79
	dw f405_reduce_80
	dw f406_reduce_81
	dw f407_reduce_82
	dw f408_reduce_83
	dw f409_reduce_84
	dw f410_reduce_85
	dw f411_reduce_86
	dw f412_reduce_87
	dw f414_reduce_88
	dw f415_reduce_89
	dw f416_reduce_90
	dw f417_reduce_91
	dw f418_reduce_92
	dw f419_reduce_93
	dw f420_reduce_94
	dw f421_reduce_95
	dw f422_reduce_96
	dw f423_reduce_97
	dw f424_reduce_98
	dw f425_reduce_99
	dw f426_reduce_100
	dw f427_reduce_101
	dw f428_reduce_102
	dw f429_reduce_103
	dw f430_reduce_104
	dw f431_reduce_105
	dw f432_reduce_106
	dw f433_reduce_107
	dw f434_reduce_108
	dw f435_reduce_109
	dw f436_reduce_110
	dw f437_reduce_111
	dw f438_reduce_112
	dw f439_reduce_113
	dw f440_reduce_114
	dw f441_reduce_115
	dw f442_reduce_116
	dw f443_reduce_117
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f445_reduce_123
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f446_reduce_127
	dw f447_reduce_128
	dw f448_reduce_129
	dw f449_reduce_130
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f450_reduce_136
	dw f452_reduce_default
	dw f452_reduce_default
	dw f451_reduce_139


	; yy_reduce workspace at ws+1303 length ws+50
f321_yy_reduce:
	ld (ws+1305), a
	pop bc
	pop hl
	ld (ws+1303), hl
	push bc
	ld bc,f2___main_s065a
	ld a, (ws+1303)
	ld l,a
	ld h,0
	add hl,bc
	ld a,(hl)
	ld (ws+1308), a
	ld de, (ws+566)
	ld hl,ws+1268
	and a
	sbc hl,de
;	jp nz, c01_065f
;	call f318_yy_stack_overflow
;c01_065f:
	call z,f318_yy_stack_overflow
;c01_065b:
	ld iy,ws+1313
	ld (ws+1345), iy
	ld a, (ws+1308)
	ld (ws+1347), a
c01_0660:
	ld a, (ws+1347)
	or a
	jp z, c01_0665
	ld hl, (ws+566)
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, (ws+1345)
	call f320_CopyMinor
	ld hl, (ws+566)
	ld de,65529
	add hl,de
	ld (ws+566), hl
	ld hl, (ws+1345)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+1345), hl
	ld a, (ws+1347)
	dec a
	ld (ws+1347), a
	jp c01_0660
c01_0665:
	ld de,f321_yy_reduce_s07bf
	ld a, (ws+1303)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld e,(hl)
	inc hl
	ld d,(hl)
	call f488__jpde
	ld hl,ws+1309
	push hl
	ld hl, (ws+566)
	ld bc,10
	add hl,bc
	call f320_CopyMinor
	ld de,f2___main_s0659
	ld a, (ws+1303)
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
	ld (ws+1348), a
	ld hl, (ws+566)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1349), hl
	ld bc,f2___main_s0641
	ld a, (ws+1349)
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1306), hl
	ld hl,112
	ld de, (ws+1349)
	and a
	sbc hl,de
	jp c, c01_07c4
;c01_07c3:
	ld de,f2___main_s0640
	ld a, (ws+1349)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld a, (ws+1348)
	ld l,a
	ld h,0
	add hl,de
	ld (ws+1351), hl
	ld bc,0
	and a
	sbc hl,bc
	jp c, c01_07cd
;c01_07cf:
	ld hl, (ws+1351)
	ld de,1316
	and a
	sbc hl,de
	jp nc, c01_07cd
;c01_07ce:
	ld bc,f2___main_s063e
	ld hl, (ws+1351)
	add hl,bc
	ld a,(hl)
	ld b,a
	ld a, (ws+1348)
	cp b
	jp nz, c01_07cd
;c01_07cc:
	ld de,f2___main_s063d
	ld hl, (ws+1351)
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1306), hl
c01_07cd:
;c01_07c5:
c01_07c4:
;c01_07c0:
	ld de, (ws+566)
	ld hl,7
	add hl,de
	ld (ws+566), hl
	ld de, (ws+1306)
	ld hl, (ws+566)
	ld (hl),e
	inc hl
	ld (hl),d
	ld a, (ws+1348)
	ld hl, (ws+566)
	inc hl
	inc hl
	ld (hl),a
;end_f321_yy_reduce:
	ld hl, (ws+1306)
	ret


	; yy_parse_failed workspace at ws+1303 length ws+0
f453_yy_parse_failed:
	jp   f317_yy_pop_all_parser_stack ;	call f317_yy_pop_all_parser_stack
;end_f453_yy_parse_failed:
;	ret
c01_c408:
	db 117,110,101,120,112,101,99,116,101,100,32,0


	; yy_syntax_error workspace at ws+1303 length ws+3
f454_yy_syntax_error:
	ld (ws+1304), hl
	pop bc
	pop af
	ld (ws+1303), a
	push bc
	call f80_StartError
	ld hl,c01_c408
	call f9_print
	ld bc,f2___main_s0642
	ld a, (ws+1303)
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f454_yy_syntax_error:
;	ret


	; yy_accept workspace at ws+1303 length ws+0
f455_yy_accept:
;end_f455_yy_accept:
	ret
