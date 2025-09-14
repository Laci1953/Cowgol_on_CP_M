	; Reducer workspace at ws+1353 length ws+0
f324_Reducer::
;end_f324_Reducer:
	ret


	; reduce_0 workspace at ws+1353 length ws+2
f325_reduce_0:
	call f127_MidReturn
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f325_reduce_0:
	ret


	; reduce_1 workspace at ws+1353 length ws+0
f326_reduce_1:
	ld hl, (ws+12)
	push hl
	ld hl, (ws+1325)
	push hl
	ld hl, (ws+1317)
	call f272_InitVariable
	ld h,6
	push hl
	ld hl,ws+1321
	call f316_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f326_reduce_1:
	ret


	; reduce_2 workspace at ws+1353 length ws+7
f327_reduce_2:
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
	call f146_MidAddress
;	ld (ws+1354), hl
	ld a, (ws+1353)
	push af
	call f156_MidDeref
	ld (ws+1356), hl
	ld a, (ws+1353)
	push af
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1356)
	call f167_MidStore
;	ld (ws+1358), hl
	call f269_Generate
	ld h,6
	push hl
	ld hl,ws+1329
	call f316_yy_destructor
	ld b,2
	push bc
	ld hl,ws+1321
	call f316_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f327_reduce_2:
	ret


c01_c364:
	db 116,121,112,101,115,32,99,97,110,110,111,116,32,98,101,32,105,110,102,101,114,114,101,100,32,102,111,114,32,117,110,116,121
	db 112,101,100,32,99,111,110,115,116,97,110,116,115,0
c01_c365:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,97,115,115,105,103,110,32,115,99,97,108,97,114,115,0

	; reduce_3 workspace at ws+1353 length ws+10
f328_reduce_3:
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1353), hl
	ld a,h
	or l
	jp nz, c01_0681
	ld hl,c01_c364
	call f82_SimpleError
c01_0681:
;c01_067d:
	ld hl, (ws+1353)
	call f241_IsScalar
	ld (ws+1355), a
	or a
	jp nz, c01_0686
	ld hl,c01_c365
	call f82_SimpleError
c01_0686:
;c01_0682:
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
	call f146_MidAddress
	ld (ws+1357), hl
	ld a, (ws+1356)
	push af
	call f156_MidDeref
	ld (ws+1359), hl
	ld a, (ws+1356)
	push af
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1359)
	call f167_MidStore
	ld (ws+1361), hl
	call f269_Generate
	ld b,2
	push bc
	ld hl,ws+1321
	call f316_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f328_reduce_3:
	ret


	; reduce_4 workspace at ws+1353 length ws+11
f329_reduce_4:
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
	call f156_MidDeref
	ld (ws+1360), hl
	ld a, (ws+1359)
	push af
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1360)
	call f167_MidStore
;	ld (ws+1362), hl
	call f269_Generate
	ld b,2
	push bc
	ld hl,ws+1321
	call f316_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f329_reduce_4:
	ret


	; reduce_5 workspace at ws+1353 length ws+0
f330_reduce_5:
	ld hl, (ws+1325)
	call f300_TerminateNormalLoop
	ld d,10
	push de
	ld hl,ws+1317
	call f316_yy_destructor
	ld h,13
	push hl
	ld hl,ws+1313
	call f316_yy_destructor
;end_f330_reduce_5:
	ret


	; reduce_6 workspace at ws+1353 length ws+4
f331_reduce_6:
	call f299_BeginNormalLoop
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld hl, (ws+20)
	call f135_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f331_reduce_6:
;	ret


	; reduce_7 workspace at ws+1353 length ws+0
f332_reduce_7:
	ld hl, (ws+1325)
	call f300_TerminateNormalLoop
	ld d,10
	push de
	ld hl,ws+1317
	call f316_yy_destructor
	ld h,13
	push hl
	ld hl,ws+1313
	call f316_yy_destructor
;end_f332_reduce_7:
	ret


	; reduce_8 workspace at ws+1353 length ws+4
f333_reduce_8:
	call f299_BeginNormalLoop
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld hl, (ws+20)
	call f135_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f333_reduce_8:
;	ret


	; reduce_9 workspace at ws+1353 length ws+6
f334_reduce_9:
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
	call f316_yy_destructor
;end_f334_reduce_9:
	ret


c01_c366:
	db 110,111,116,104,105,110,103,32,116,111,32,98,114,101,97,107,32,116,111,0

	; reduce_10 workspace at ws+1353 length ws+2
f335_reduce_10:
	ld hl, (ws+18)
	ld a,h
	or l
	jp nz, c01_068b
	ld hl,c01_c366
	call f82_SimpleError
c01_068b:
;c01_0687:
	ld hl, (ws+18)
	call f130_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f335_reduce_10:
	ret


c01_c367:
	db 110,111,116,104,105,110,103,32,116,111,32,99,111,110,116,105,110,117,101,32,116,111,0

	; reduce_11 workspace at ws+1353 length ws+2
f336_reduce_11:
	ld hl, (ws+20)
	ld a,h
	or l
	jp nz, c01_0690
	ld hl,c01_c367
	call f82_SimpleError
c01_0690:
;c01_068c:
	ld hl, (ws+20)
	call f130_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f336_reduce_11:
	ret


	; reduce_12 workspace at ws+1353 length ws+4
f337_reduce_12:
	ld hl, (ws+22)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f135_MidLabel
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
	call f316_yy_destructor
	ld d,10
	push de
	ld hl,ws+1317
	call f316_yy_destructor
	ld h,12
	push hl
	ld hl,ws+1313
	call f316_yy_destructor
;end_f337_reduce_12:
	ret


	; reduce_13 workspace at ws+1353 length ws+6
f338_reduce_13:
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
;end_f338_reduce_13:
	ret


	; reduce_14 workspace at ws+1353 length ws+8
f339_reduce_14:
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
;end_f339_reduce_14:
;	ret


	; reduce_15 workspace at ws+1353 length ws+2
f340_reduce_15:
	ld ix, (ws+22)
	ld l, (ix+4)
	ld h, (ix+5)
	call f135_MidLabel
;	ld (ws+1353), hl
	jp   f269_Generate ;	call f269_Generate
;end_f340_reduce_15:
;	ret


	; reduce_16 workspace at ws+1353 length ws+4
f341_reduce_16:
	ld hl, (ws+22)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f130_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld ix, (ws+22)
	ld l, (ix+4)
	ld h, (ix+5)
	call f135_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f341_reduce_16:
;	ret


	; reduce_17 workspace at ws+1353 length ws+4
f342_reduce_17:
	ld hl, (ws+22)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f130_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld ix, (ws+22)
	ld l, (ix+4)
	ld h, (ix+5)
	call f135_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f342_reduce_17:
;	ret


	; reduce_18 workspace at ws+1353 length ws+8
f343_reduce_18:
	ld ix, (ws+24)
	ld a, (ix+7)
	or a
	jp nz, c01_0697
;c01_0698:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_0697
;c01_0696:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f135_MidLabel
;	ld (ws+1353), hl
	call f269_Generate
c01_0697:
;c01_0691:
	ld hl, (ws+24)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f135_MidLabel
	ld (ws+1355), hl
	call f269_Generate
	ld ix, (ws+24)
	ld a, (ix+6)
	call f133_MidEndcase
	ld (ws+1357), hl
	call f269_Generate
	ld hl, (ws+24)
	ld (ws+1359), hl
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+24), hl
	ld hl, (ws+1359)
	call f40_Free
	ld d,10
	push de
	ld hl,ws+1321
	call f316_yy_destructor
	ld a,65
	push af
	ld hl,ws+1317
	call f316_yy_destructor
	ld b,22
	push bc
	ld hl,ws+1313
	call f316_yy_destructor
;end_f343_reduce_18:
	ret


c01_c368:
	db 99,97,115,101,32,111,110,108,121,32,119,111,114,107,115,32,111,110,32,110,117,109,98,101,114,115,0

	; reduce_19 workspace at ws+1353 length ws+10
f344_reduce_19:
	ld hl,8
	call f75_InternalAlloc
;	ld (ws+1353), hl
	ld (ws+1355), hl
	ld hl, (ws+24)
	ld ix, (ws+1355)
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
	jp nz, c01_069d
	ld hl,c01_c368
	call f82_SimpleError
c01_069d:
;c01_0699:
	ld hl, (ws+1317)
	call f172_NodeWidth
;	ld (ws+1360), a
	ld ix, (ws+1355)
	ld (ix+6), a
	ld a, (ix+6)
	push af
	ld hl, (ws+1317)
	call f159_MidStartcase
	ld (ws+1361), hl
	call f269_Generate
	ld h,66
	push hl
	ld hl,ws+1313
	call f316_yy_destructor
;end_f344_reduce_19:
	ret


c01_c369:
	db 119,104,101,110,32,101,108,115,101,32,109,117,115,116,32,103,111,32,108,97,115,116,0

	; reduce_20 workspace at ws+1353 length ws+8
f345_reduce_20:
	ld ix, (ws+24)
	ld a, (ix+7)
	or a
	jp z, c01_06a2
;c01_06a1:
	ld hl,c01_c369
	call f82_SimpleError
c01_06a2:
;c01_069e:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_06a7
;c01_06a6:
	ld hl, (ws+24)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f130_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f135_MidLabel
	ld (ws+1355), hl
	call f269_Generate
c01_06a7:
;c01_06a3:
	call f247_AllocLabel
	ld (ws+1357), hl
	ld d,h
	ld e,l
	ld hl, (ws+24)
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix, (ws+24)
	ld a, (ix+6)
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
	call f154_MidWhencase
;	ld (ws+1359), hl
	call f269_Generate
	ld d,6
	push de
	ld hl,ws+1313
	call f316_yy_destructor
;end_f345_reduce_20:
	ret


c01_c370:
	db 111,110,108,121,32,111,110,101,32,119,104,101,110,32,101,108,115,101,32,97,108,108,111,119,101,100,0

	; reduce_21 workspace at ws+1353 length ws+4
f346_reduce_21:
	ld ix, (ws+24)
	ld a, (ix+7)
	or a
	jp z, c01_06ac
;c01_06ab:
	ld hl,c01_c370
	call f82_SimpleError
c01_06ac:
;c01_06a8:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_06b1
;c01_06b0:
	ld hl, (ws+24)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f130_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f135_MidLabel
	ld (ws+1355), hl
	call f269_Generate
c01_06b1:
;c01_06ad:
	ld de,0
	ld hl, (ws+24)
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix, (ws+24)
	ld (ix+7), 1
	ld a,9
	push af
	ld hl,ws+1317
	call f316_yy_destructor
	ld d,6
	push de
	ld hl,ws+1313
	call f316_yy_destructor
;end_f346_reduce_21:
	ret


	; reduce_22 workspace at ws+1353 length ws+0
f347_reduce_22:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld b,4
	push bc
	ld hl,ws+1313
	call f316_yy_destructor
;end_f347_reduce_22:
	ret


	; reduce_23 workspace at ws+1353 length ws+0
f348_reduce_23:
	ld hl, (ws+1313)
	ld (ws+1309), hl
	jp   f301_Negate ;	call f301_Negate
;end_f348_reduce_23:
;	ret


	; reduce_24 workspace at ws+1353 length ws+2
f349_reduce_24:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld de,0
	push de
	push de
	push de
	xor a
	call f155_MidBand
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,47
	push hl
	ld hl,ws+1317
	call f316_yy_destructor
;end_f349_reduce_24:
	ret


	; reduce_25 workspace at ws+1353 length ws+2
f350_reduce_25:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld de,0
	push de
	push de
	push de
	xor a
	call f119_MidBor
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,48
	push de
	ld hl,ws+1317
	call f316_yy_destructor
;end_f350_reduce_25:
	ret


	; reduce_26 workspace at ws+1353 length ws+2
f351_reduce_26:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	xor a
	call f302_ConditionalEq
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,55
	push bc
	ld hl,ws+1317
	call f316_yy_destructor
;end_f351_reduce_26:
	ret


	; reduce_27 workspace at ws+1353 length ws+2
f352_reduce_27:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld a,1
	call f302_ConditionalEq
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,56
	push hl
	ld hl,ws+1317
	call f316_yy_destructor
;end_f352_reduce_27:
	ret


	; reduce_28 workspace at ws+1353 length ws+2
f353_reduce_28:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	xor a
	call f303_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,51
	push de
	ld hl,ws+1317
	call f316_yy_destructor
;end_f353_reduce_28:
	ret


	; reduce_29 workspace at ws+1353 length ws+2
f354_reduce_29:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld a,1
	call f303_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,54
	push bc
	ld hl,ws+1317
	call f316_yy_destructor
;end_f354_reduce_29:
	ret


	; reduce_30 workspace at ws+1353 length ws+2
f355_reduce_30:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	push hl
	xor a
	call f303_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,53
	push hl
	ld hl,ws+1317
	call f316_yy_destructor
;end_f355_reduce_30:
	ret


	; reduce_31 workspace at ws+1353 length ws+2
f356_reduce_31:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	push hl
	ld a,1
	call f303_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,52
	push de
	ld hl,ws+1317
	call f316_yy_destructor
;end_f356_reduce_31:
	ret


	; reduce_32 workspace at ws+1353 length ws+2
f357_reduce_32:
	ld hl, (ws+1313)
	exx
	ld hl, (ws+1315)
	exx
	call f166_MidConstant
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f357_reduce_32:
	ret


	; reduce_33 workspace at ws+1353 length ws+0
f358_reduce_33:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld b,4
	push bc
	ld hl,ws+1313
	call f316_yy_destructor
;end_f358_reduce_33:
	ret


	; reduce_34 workspace at ws+1353 length ws+2
f359_reduce_34:
	and a
	sbc hl,hl
	exx
	sbc hl,hl
	exx
	call f166_MidConstant
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f359_reduce_34:
	ret


	; reduce_35 workspace at ws+1353 length ws+0
f360_reduce_35:
	ld hl, (ws+1313)
	ld (ws+1309), hl
;end_f360_reduce_35:
	ret


	; reduce_36 workspace at ws+1353 length ws+2
f361_reduce_36:
	ld h,111
	push hl
	ld hl, (ws+1313)
	call f290_Expr1Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f361_reduce_36:
	ret


	; reduce_37 workspace at ws+1353 length ws+2
f362_reduce_37:
	ld a,106
	push af
	ld hl, (ws+1313)
	call f290_Expr1Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f362_reduce_37:
	ret


	; reduce_38 workspace at ws+1353 length ws+2
f363_reduce_38:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f291_ExprAdd
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,19
	push de
	ld hl,ws+1317
	call f316_yy_destructor
;end_f363_reduce_38:
	ret


	; reduce_39 workspace at ws+1353 length ws+2
f364_reduce_39:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_ExprSub
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,14
	push bc
	ld hl,ws+1317
	call f316_yy_destructor
;end_f364_reduce_39:
	ret


	; reduce_40 workspace at ws+1353 length ws+2
f365_reduce_40:
	ld h,161
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f295_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,24
	push af
	ld hl,ws+1317
	call f316_yy_destructor
;end_f365_reduce_40:
	ret


	; reduce_41 workspace at ws+1353 length ws+2
f366_reduce_41:
	ld b,141
	push bc
	ld d,136
	push de
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f295_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,23
	push hl
	ld hl,ws+1317
	call f316_yy_destructor
;end_f366_reduce_41:
	ret


	; reduce_42 workspace at ws+1353 length ws+2
f367_reduce_42:
	ld d,151
	push de
	ld a,146
	push af
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f295_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,18
	push bc
	ld hl,ws+1317
	call f316_yy_destructor
;end_f367_reduce_42:
	ret


	; reduce_43 workspace at ws+1353 length ws+2
f368_reduce_43:
	ld h,176
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f295_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,50
	push af
	ld hl,ws+1317
	call f316_yy_destructor
;end_f368_reduce_43:
	ret


	; reduce_44 workspace at ws+1353 length ws+2
f369_reduce_44:
	ld d,166
	push de
	push de
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f295_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,60
	push bc
	ld hl,ws+1317
	call f316_yy_destructor
;end_f369_reduce_44:
	ret


	; reduce_45 workspace at ws+1353 length ws+2
f370_reduce_45:
	ld h,171
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f295_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,49
	push af
	ld hl,ws+1317
	call f316_yy_destructor
;end_f370_reduce_45:
	ret


	; reduce_46 workspace at ws+1353 length ws+2
f371_reduce_46:
	ld d,116
	push de
	push de
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f298_ExprShift
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,57
	push bc
	ld hl,ws+1317
	call f316_yy_destructor
;end_f371_reduce_46:
	ret


	; reduce_47 workspace at ws+1353 length ws+2
f372_reduce_47:
	ld a,126
	push af
	ld h,121
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f298_ExprShift
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,58
	push de
	ld hl,ws+1317
	call f316_yy_destructor
;end_f372_reduce_47:
	ret


c01_c371:
	db 99,97,115,116,32,98,101,116,119,101,101,110,32,112,111,105,110,116,101,114,32,97,110,100,32,110,111,110,45,112,111,105,110
	db 116,101,114,32,111,102,32,100,105,102,102,101,114,101,110,116,32,115,105,122,101,0

	; reduce_48 workspace at ws+1353 length ws+5
f373_reduce_48:
	ld hl, (ws+1313)
	call f233_CheckNotPartialType
	ld ix, (ws+1321)
	ld a, (ix+13)
	cp 40
	jp z, c01_06b8
;c01_06b9:
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
	jp z, c01_06b8
;c01_06b7:
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
	jp nz, c01_06bf
	ld a, (ws+1354)
	or a
	jp z, c01_06c0
c01_06bf:
	ld hl,c01_c371
	call f82_SimpleError
c01_06c0:
;c01_06ba:
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
	jp c01_06b2
c01_06b8:
	ld hl, (ws+1321)
	ld (ws+1309), hl
c01_06b2:
	ld hl, (ws+1313)
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
	ld b,59
	push bc
	ld hl,ws+1317
	call f316_yy_destructor
;end_f373_reduce_48:
	ret


c01_c372:
	db 121,111,117,32,99,97,110,110,111,116,32,116,97,107,101,32,116,104,101,32,97,100,100,114,101,115,115,32,111,102,32,115,99,97
	db 108,97,114,32,118,97,114,105,97,98,108,101,115,0

	; reduce_49 workspace at ws+1353 length ws+5
f374_reduce_49:
	ld hl, (ws+1313)
	call f244_UndoLValue
;	ld (ws+1353), hl
	ld (ws+1309), hl
	push hl
	pop ix
	ld a, (ix+13)
	cp 42
	jp nz, c01_06c6
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
	jp z, c01_06cb
;c01_06ca:
	ld hl,c01_c372
	call f82_SimpleError
c01_06cb:
;c01_06c7:
c01_06c6:
;c01_06c2:
;end_f374_reduce_49:
	ret


	; reduce_50 workspace at ws+1353 length ws+2
f375_reduce_50:
	ld hl, (ws+1313)
	call f244_UndoLValue
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,60
	push hl
	ld hl,ws+1317
	call f316_yy_destructor
;end_f375_reduce_50:
	ret


	; reduce_51 workspace at ws+1353 length ws+5
f376_reduce_51:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	ld (ws+1353), a
	or a
;	jp nz, c01_06d0
;	call f304_parser_i_bad_next_prev
;c01_06d0:
	call z,f304_parser_i_bad_next_prev
;c01_06cc:
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
	call f166_MidConstant
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
;end_f376_reduce_51:
	ret


	; reduce_52 workspace at ws+1353 length ws+5
f377_reduce_52:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	ld (ws+1353), a
	or a
;	jp nz, c01_06d5
;	call f304_parser_i_bad_next_prev
;c01_06d5:
	call z,f304_parser_i_bad_next_prev
;c01_06d1:
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
	call f166_MidConstant
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
;end_f377_reduce_52:
	ret


	; reduce_53 workspace at ws+1353 length ws+2
f378_reduce_53:
	ld ix, (ws+1313)
	ld l, (ix+11)
	ld h, (ix+12)
	exx
	ld hl,0
	exx
	call f166_MidConstant
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f378_reduce_53:
	ret


c01_c373:
	db 97,114,114,97,121,32,101,120,112,101,99,116,101,100,0

	; reduce_54 workspace at ws+1353 length ws+3
f379_reduce_54:
	ld hl, (ws+1313)
	call f237_IsArray
;	ld (ws+1353), a
	or a
	jp nz, c01_06da
	ld hl,c01_c373
	call f82_SimpleError
c01_06da:
;c01_06d6:
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
	call f166_MidConstant
;	ld (ws+1354), hl
	ld (ws+1309), hl
;end_f379_reduce_54:
	ret


c01_c374:
	db 32,105,115,32,110,111,116,32,97,32,118,97,108,117,101,0

	; not_a_value workspace at ws+1363 length ws+0
f381_not_a_value:
	call f80_StartError
	ld ix, (ws+1313)
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c374
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f381_not_a_value:
;	ret


	; reduce_55 workspace at ws+1353 length ws+10
f380_reduce_55:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 7
	jp nz, c01_06dc
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
	call f166_MidConstant
;	ld (ws+1353), hl
	ld (ws+1309), hl
	jp c01_06db
c01_06dc:
	cp 28
	jp nz, c01_06dd
	ld hl, (ws+1313)
	push hl
	ld hl,0
	call f146_MidAddress
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
	jp c01_06db
c01_06dd:
	cp 30
	jp nz, c01_06de
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld a, (ix+15)
	cp 6
	jp nz, c01_06e3
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f111_MidSubref
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
	jp c01_06db ; c01_06df
c01_06e3:
	call f381_not_a_value
c01_06df:
	jp c01_06db
c01_06de:
	call f381_not_a_value
c01_06db:
;end_f380_reduce_55:
	ret


c01_c375:
	db 99,97,110,110,111,116,32,100,101,114,101,102,101,114,101,110,99,101,32,110,111,110,45,112,111,105,110,116,101,114,115,0

	; reduce_56 workspace at ws+1353 length ws+3
f382_reduce_56:
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
;	ld (ws+1353), a
	or a
	jp nz, c01_06e8
	ld hl,c01_c375
	call f82_SimpleError
c01_06e8:
;c01_06e4:
	ld hl, (ws+1317)
	call f243_MakeLValue
;	ld (ws+1354), hl
	ld (ws+1309), hl
	ld b,5
	push bc
	ld hl,ws+1313
	call f316_yy_destructor
;end_f382_reduce_56:
	ret


c01_c376:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,105,110,100,101,120,32,97,110,32,97,114,114,97,121,44,32,110,111,116,32,97,32
	db 0
c01_c377:
	db 97,114,114,97,121,32,105,110,100,105,99,101,115,32,109,117,115,116,32,98,101,32,110,117,109,98,101,114,115,0

	; reduce_57 workspace at ws+1353 length ws+27
f383_reduce_57:
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
	jp nz, c01_06ed
	call f80_StartError
	ld hl,c01_c376
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
c01_06ed:
;c01_06e9:
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
	jp nz, c01_06f2
	ld hl,c01_c377
	call f82_SimpleError
c01_06f2:
;c01_06ee:
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
	call f166_MidConstant
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
	call f316_yy_destructor
	ld a,5
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f383_reduce_57:
	ret


c01_c378:
	db 32,105,115,32,110,111,116,32,97,32,114,101,99,111,114,100,32,111,114,32,112,111,105,110,116,101,114,32,116,111,32,97,32,114
	db 101,99,111,114,100,0

	; BadType workspace at ws+1377 length ws+0
f385_BadType:
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
	jp   f81_EndError ;	call f81_EndError
;end_f385_BadType:
;	ret


c01_c379:
	db 32,100,111,101,115,32,110,111,116,32,99,111,110,116,97,105,110,32,97,32,109,101,109,98,101,114,32,39,0
c01_c380:
	db 39,0

	; reduce_58 workspace at ws+1353 length ws+24
f384_reduce_58:
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
	jp z, c01_06f7
;c01_06f6:
	ld hl, (ws+1321)
	call f246_MaybeUndoLValue
;	ld (ws+1358), hl
	ld (ws+1355), hl
c01_06f8:
	ld hl, (ws+1353)
	call f74_IsPtr
;	ld (ws+1360), a
	or a
	jp z, c01_06f3 ; c01_06fd
;c01_06fc:
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
	call f156_MidDeref
	ld (ws+1361), hl
	ld (ws+1355), hl
	jp c01_06f8
c01_06fd:
	jp c01_06f3
c01_06f7:
	ld hl, (ws+1353)
	call f74_IsPtr
;	ld (ws+1363), a
	or a
	jp z, c01_0701
;c01_0700:
	ld hl, (ws+1353)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	jp c01_06f3
c01_0701:
	call f385_BadType
c01_06f3:
	ld hl, (ws+1353)
	call f233_CheckNotPartialType
	ld hl, (ws+1353)
	call f242_IsRecord
;	ld (ws+1364), a
	or a
;	jp nz, c01_0706
;	call f385_BadType
;c01_0706:
	call z,f385_BadType
;c01_0702:
	ld hl, (ws+1353)
	push hl
	ld hl, (ws+1313)
	call f228_LookupSymbol
;	ld (ws+1365), hl
	ld (ws+1367), hl
	ld a,h
	or l
	jp nz, c01_070b
	call f80_StartError
	ld ix, (ws+1353)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c379
	call f9_print
	ld hl, (ws+1313)
	call f9_print
	ld hl,c01_c380
	call f9_print
	call f81_EndError
c01_070b:
;c01_0707:
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
	call f166_MidConstant
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
	call f316_yy_destructor
;end_f384_reduce_58:
	ret


	; reduce_59 workspace at ws+1353 length ws+4
f386_reduce_59:
	ld hl, (ws+1313)
	call f124_MidString
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld hl, (ws+551)
	call f273_MakePointerType
	ld (ws+1355), hl
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
;end_f386_reduce_59:
	ret


	; reduce_60 workspace at ws+1353 length ws+0
f387_reduce_60:
	ld ix, (ws+1313)
	ld a, (ix+13)
	cp 40
	jp z, c01_0710
;c01_070f:
	call f305_parser_i_constant_error
c01_0710:
;c01_070c:
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
;end_f387_reduce_60:
;	ret


	; reduce_61 workspace at ws+1353 length ws+0
f388_reduce_61:
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
	call f316_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f388_reduce_61:
	ret


c01_c381:
	db 105,110,118,97,108,105,100,32,105,110,116,101,103,101,114,32,116,121,112,101,32,114,97,110,103,101,0

	; reduce_62 workspace at ws+1353 length ws+2
f389_reduce_62:
	ld hl, (ws+1325)
	exx
	ld hl, (ws+1327)
	exx
	ld de, (ws+1317)
	exx
	ld de, (ws+1319)
	exx
	call f490__cmps4
	jp m, c01_0715
;c01_0714:
	ld hl,c01_c381
	call f82_SimpleError
c01_0715:
;c01_0711:
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
	call f316_yy_destructor
	ld h,46
	push hl
	ld hl,ws+1321
	call f316_yy_destructor
	ld b,4
	push bc
	ld hl,ws+1313
	call f316_yy_destructor
;end_f389_reduce_62:
	ret


c01_c382:
	db 101,120,112,101,99,116,101,100,32,0
c01_c383:
	db 32,116,111,32,98,101,32,97,32,116,121,112,101,0

	; reduce_63 workspace at ws+1353 length ws+6
f390_reduce_63:
	ld hl, (ws+1313)
	ld (ws+1353), hl
	push hl
	pop ix
	ld a, (ix+10)
	or a
	jp nz, c01_071a
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
c01_071a:
;c01_0716:
	ld ix, (ws+1353)
	ld a, (ix+10)
	cp 30
	jp z, c01_071f
;c01_071e:
	call f80_StartError
	ld hl,c01_c382
	call f9_print
	ld ix, (ws+1353)
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c383
	call f9_print
	call f81_EndError
c01_071f:
;c01_071b:
	ld hl, (ws+1353)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1309), hl
;end_f390_reduce_63:
	ret


	; reduce_64 workspace at ws+1353 length ws+2
f391_reduce_64:
	ld hl, (ws+1317)
	call f273_MakePointerType
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,5
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f391_reduce_64:
	ret


	; reduce_65 workspace at ws+1353 length ws+2
f392_reduce_65:
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
	call f316_yy_destructor
	ld a,5
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f392_reduce_65:
	ret


	; reduce_66 workspace at ws+1353 length ws+2
f393_reduce_66:
	ld hl, (ws+1321)
	push hl
	ld hl,0
	call f274_MakeArrayType
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,17
	push de
	ld hl,ws+1317
	call f316_yy_destructor
	ld a,5
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f393_reduce_66:
	ret


c01_c384:
	db 32,105,115,32,110,111,116,32,97,110,32,97,114,114,97,121,0

	; reduce_67 workspace at ws+1353 length ws+1
f394_reduce_67:
	ld hl, (ws+1313)
	call f237_IsArray
	ld (ws+1353), a
	or a
	jp nz, c01_0724
	call f80_StartError
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c384
	call f9_print
	call f81_EndError
c01_0724:
;c01_0720:
	ld ix, (ws+1313)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1309), hl
;end_f394_reduce_67:
	ret


	; reduce_68 workspace at ws+1353 length ws+4
f395_reduce_68:
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
	ld h,66
	push hl
	ld hl,ws+1321
	call f316_yy_destructor
	ld b,22
	push bc
	ld hl,ws+1313
	call f316_yy_destructor
;end_f395_reduce_68:
	ret


	; reduce_69 workspace at ws+1353 length ws+2
f396_reduce_69:
	ld de,0
	push de
	ld hl, (ws+1313)
	call f230_AddSymbol
	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f396_reduce_69:
	ret


c01_c385:
	db 115,121,109,98,111,108,32,39,0
c01_c386:
	db 39,32,110,111,116,32,102,111,117,110,100,0

	; reduce_70 workspace at ws+1353 length ws+6
f397_reduce_70:
	ld hl, (ws+1313)
	ld (ws+1353), hl
	ld de,0
	push de
	call f228_LookupSymbol
	ld (ws+1355), hl
	ld (ws+1357), hl
	ld a,h
	or l
	jp nz, c01_0729
	call f80_StartError
	ld hl,c01_c385
	call f9_print
	ld hl, (ws+1353)
	call f9_print
	ld hl,c01_c386
	call f9_print
	call f81_EndError
c01_0729:
;c01_0725:
	ld hl, (ws+1353)
	call f40_Free
	ld hl, (ws+1357)
	ld (ws+1309), hl
;end_f397_reduce_70:
	ret


	; reduce_71 workspace at ws+1353 length ws+8
f398_reduce_71:
	ld hl, (ws+1313)
	ld (ws+1353), hl
	ld de,0
	push de
	call f228_LookupSymbol
	ld (ws+1355), hl
	ld (ws+1357), hl
	ld a,h
	or l
	jp nz, c01_072e
	ld de,0
	push de
	ld hl, (ws+1353)
	call f230_AddSymbol
;	ld (ws+1359), hl
	ld (ws+1357), hl
	jp c01_072a
c01_072e:
	ld hl, (ws+1353)
	call f40_Free
c01_072a:
	ld hl, (ws+1357)
	ld (ws+1309), hl
;end_f398_reduce_71:
	ret


c01_c387:
	db 115,105,109,112,108,101,32,116,121,112,101,32,111,114,32,118,97,114,105,97,98,108,101,32,110,97,109,101,32,101,120,112,101
	db 99,116,101,100,0

	; reduce_72 workspace at ws+1353 length ws+0
f399_reduce_72:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 28
	jp nz, c01_0730
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
	jp c01_072f
c01_0730:
	cp 30
	jp nz, c01_0731
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1309), hl
	jp c01_072f
c01_0731:
	ld hl,c01_c387
	call f82_SimpleError
c01_072f:
;end_f399_reduce_72:
	ret


	; reduce_73 workspace at ws+1353 length ws+0
f400_reduce_73:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f316_yy_destructor
;end_f400_reduce_73:
	ret


c01_c388:
	db 115,117,98,114,111,117,116,105,110,101,115,32,99,97,108,108,101,100,32,97,115,32,102,117,110,99,116,105,111,110,115,32,109
	db 117,115,116,32,104,97,118,101,32,101,120,97,99,116,108,121,32,111,110,101,32,111,117,116,112,117,116,32,112,97,114,97,109
	db 101,116,101,114,0

	; reduce_74 workspace at ws+1353 length ws+25
f401_reduce_74:
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
	call f306_i_check_sub_call_args
	ld ix, (ws+1353)
	ld a, (ix+27)
	cp 1
	jp z, c01_0736
;c01_0735:
	ld hl,c01_c388
	call f82_SimpleError
c01_0736:
;c01_0732:
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
	call f113_MidCall
;	ld (ws+1364), hl
	call f269_Generate
	ld a, (ws+1359)
	push af
	ld hl, (ws+1353)
	push hl
	ld hl, (ws+1357)
	push hl
	xor a
	call f122_MidPoparg
	ld (ws+1366), hl
	ld hl, (ws+1362)
	push hl
	ld hl,0
	call f146_MidAddress
;	ld (ws+1368), hl
	ld a, (ws+1359)
	push af
	call f156_MidDeref
	ld (ws+1370), hl
	ld a, (ws+1359)
	push af
	ld hl, (ws+1366)
	push hl
	ld hl, (ws+1370)
	call f167_MidStore
;	ld (ws+1372), hl
	call f269_Generate
	call f307_i_end_call
	ld hl, (ws+1362)
	push hl
	ld hl,0
	call f146_MidAddress
;	ld (ws+1374), hl
	ld a, (ws+1359)
	push af
	call f156_MidDeref
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
;end_f401_reduce_74:
	ret


c01_c389:
	db 115,117,98,114,111,117,116,105,110,101,32,114,101,113,117,105,114,101,115,32,111,117,116,112,117,116,32,97,114,103,117,109
	db 101,110,116,115,0

	; reduce_75 workspace at ws+1353 length ws+4
f402_reduce_75:
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	call f306_i_check_sub_call_args
	ld ix, (ws+1353)
	ld a, (ix+27)
	or a
	jp z, c01_073b
;c01_073a:
	ld hl,c01_c389
	call f82_SimpleError
c01_073b:
;c01_0737:
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+28)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1353)
	call f113_MidCall
	ld (ws+1355), hl
	call f269_Generate
	call f307_i_end_call
	ld b,22
	push bc
	ld hl,ws+1313
	call f316_yy_destructor
;end_f402_reduce_75:
	ret


c01_c390:
	db 116,111,111,32,109,97,110,121,32,111,117,116,112,117,116,32,97,114,103,117,109,101,110,116,115,0
c01_c391:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,97,115,115,105,103,110,32,116,111,32,108,118,97,108,117,101,115,0
c01_c392:
	db 116,111,111,32,102,101,119,32,111,117,116,112,117,116,32,97,114,103,117,109,101,110,116,115,0

	; reduce_76 workspace at ws+1353 length ws+24
f403_reduce_76:
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	call f306_i_check_sub_call_args
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+28)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1353)
	call f113_MidCall
	ld (ws+1355), hl
	call f269_Generate
	ld ix, (ws+1353)
	ld a, (ix+27)
	ld (ws+1357), a
	xor a
	ld (ws+1358), a
	ld hl, (ws+1329)
	ld (ws+1359), hl
c01_073c:
	ld hl, (ws+1359)
	ld a,h
	or l
	jp z, c01_0741
;c01_0740:
	ld a, (ws+1357)
	or a
	jp nz, c01_0746
	ld hl,c01_c390
	call f82_SimpleError
c01_0746:
;c01_0742:
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
	jp nz, c01_074b
	ld hl,c01_c391
	call f82_SimpleError
c01_074b:
;c01_0747:
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
	call f122_MidPoparg
	ld (ws+1371), hl
	ld a, (ws+1370)
	push af
	ld hl, (ws+1365)
	call f156_MidDeref
	ld (ws+1373), hl
	ld a, (ws+1370)
	push af
	ld hl, (ws+1371)
	push hl
	ld hl, (ws+1373)
	call f167_MidStore
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
	jp c01_073c
c01_0741:
	ld hl, (ws+1329)
	call f69_Discard
	ld a, (ws+1358)
	ld b,a
	ld ix, (ws+1353)
	ld a, (ix+27)
	cp b
	jp z, c01_0750
;c01_074f:
	ld hl,c01_c392
	call f82_SimpleError
c01_0750:
;c01_074c:
	call f307_i_end_call
	ld h,2
	push hl
	ld hl,ws+1325
	call f316_yy_destructor
	ld b,22
	push bc
	ld hl,ws+1313
	call f316_yy_destructor
;end_f403_reduce_76:
	ret


c01_c393:
	db 101,120,112,101,99,116,101,100,32,0
c01_c394:
	db 32,116,111,32,98,101,32,97,32,115,117,98,114,111,117,116,105,110,101,0

	; reduce_77 workspace at ws+1353 length ws+11
f404_reduce_77:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	call f238_IsSubroutine
	ld (ws+1353), a
	or a
	jp nz, c01_0755
	call f80_StartError
	ld hl,c01_c393
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
	ld hl,c01_c394
	call f9_print
	call f81_EndError
c01_0755:
;c01_0751:
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
;end_f404_reduce_77:
	ret


	; reduce_78 workspace at ws+1353 length ws+0
f405_reduce_78:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f316_yy_destructor
;end_f405_reduce_78:
	ret


	; reduce_79 workspace at ws+1353 length ws+2
f406_reduce_79:
	call f163_MidEnd
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f316_yy_destructor
;end_f406_reduce_79:
	ret


	; reduce_80 workspace at ws+1353 length ws+0
f407_reduce_80:
	ld hl, (ws+1313)
	ld (ws+1309), hl
;end_f407_reduce_80:
	ret


	; reduce_81 workspace at ws+1353 length ws+0
f408_reduce_81:
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
	ld h,46
	push hl
	ld hl,ws+1317
	call f316_yy_destructor
;end_f408_reduce_81:
	ret


c01_c395:
	db 116,111,111,32,109,97,110,121,32,112,97,114,97,109,101,116,101,114,115,32,105,110,32,99,97,108,108,32,116,111,32,0

	; reduce_82 workspace at ws+1353 length ws+7
f409_reduce_82:
	ld ix, (ws+28)
	ld l, (ix+6)
	ld h, (ix+7)
	ld (ws+1353), hl
	ld a,h
	or l
	jp nz, c01_075a
	call f80_StartError
	ld hl,c01_c395
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
c01_075a:
;c01_0756:
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
	call f163_MidEnd
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
	call f123_MidArg
;	ld (ws+1358), hl
	ld (ws+1309), hl
;end_f409_reduce_82:
	ret


	; reduce_83 workspace at ws+1353 length ws+2
f410_reduce_83:
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1325)
	call f162_MidPair
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,46
	push hl
	ld hl,ws+1321
	call f316_yy_destructor
	ld d,4
	push de
	ld hl,ws+1313
	call f316_yy_destructor
;end_f410_reduce_83:
	ret


	; reduce_84 workspace at ws+1353 length ws+2
f411_reduce_84:
	ld hl, (ws+1313)
	push hl
	ld hl,0
	call f162_MidPair
	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f411_reduce_84:
	ret


	; reduce_85 workspace at ws+1353 length ws+2
f412_reduce_85:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	call f162_MidPair
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,46
	push hl
	ld hl,ws+1317
	call f316_yy_destructor
;end_f412_reduce_85:
	ret


	; reduce_86 workspace at ws+1353 length ws+2
f413_reduce_86:
	ld hl, (ws+1313)
	call f244_UndoLValue
	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f413_reduce_86:
	ret


	; reduce_87 workspace at ws+1353 length ws+4
f414_reduce_87:
	ld ix, (ws+558)
	ld a, (ix+28)
	or 2
	ld (ix+28), a
	push ix
	pop hl
	call f217_EmitterEmitSubroutineFlags
	ld hl, (ws+558)
	ld (ws+12), hl
	call f168_MidStartsub
	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+12)
	call f138_MidEndsub
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
	call f316_yy_destructor
;end_f414_reduce_87:
	ret


c01_c396:
	db 116,121,112,101,32,105,115,32,110,111,116,32,97,110,32,105,110,116,101,114,102,97,99,101,0

	; not_an_interface workspace at ws+1358 length ws+0
f416_not_an_interface:
	ld hl,c01_c396
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f416_not_an_interface:
;	ret


	; reduce_88 workspace at ws+1353 length ws+5
f415_reduce_88:
	ld hl, (ws+1313)
	call f238_IsSubroutine
	ld (ws+1353), a
	or a
;	jp nz, c01_075f
;	call f416_not_an_interface
;c01_075f:
	call z,f416_not_an_interface
;c01_075b:
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
;	jp nz, c01_0764
;	call f416_not_an_interface
;c01_0764:
	call z,f416_not_an_interface
;c01_0760:
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
	jp z, c01_0769
;c01_0768:
	ld ix, (ws+1354)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+558)
	call f278_CopyParameterList
c01_0769:
;c01_0765:
	ld ix, (ws+1354)
	ld a, (ix+27)
	ld ix, (ws+558)
	ld (ix+27), a
	ld a, (ix+27)
	or a
	jp z, c01_076e
;c01_076d:
	ld hl, (ws+1354)
	push hl
	xor a
	call f106_GetOutputParameter
;	ld (ws+1356), hl
	push hl
	ld hl, (ws+558)
	call f278_CopyParameterList
c01_076e:
;c01_076a:
	ld hl, (ws+558)
	call f215_EmitterEmitInputParameters
	ld hl, (ws+558)
	call f216_EmitterEmitOutputParameter;
	ld hl, (ws+558)
	call f217_EmitterEmitSubroutineFlags
	ld d,69
	push de
	ld hl,ws+1317
	call f316_yy_destructor
;end_f415_reduce_88:
	ret


	; reduce_89 workspace at ws+1353 length ws+0
f417_reduce_89:
	ld ix, (ws+558)
	ld l, (ix+14)
	ld h, (ix+15)
	push hl
	ld hl, (ws+1317)
	call f210_EmitterDeclareExternalSubr;utine
	ld h,11
	push hl
	ld hl,ws+1325
	call f316_yy_destructor
	ld b,16
	push bc
	ld hl,ws+1321
	call f316_yy_destructor
	ld a,4
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f417_reduce_89:
	ret


	; reduce_90 workspace at ws+1353 length ws+8
f418_reduce_90:
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
;end_f418_reduce_90:
	ret


c01_c397:
	db 110,111,116,32,97,32,115,117,98,114,111,117,116,105,110,101,0
c01_c398:
	db 115,117,98,114,111,117,116,105,110,101,32,97,108,114,101,97,100,121,32,105,109,112,108,101,109,101,110,116,101,100,0
c01_c399:
	db 99,97,110,110,111,116,32,105,109,112,108,101,109,101,110,116,32,115,117,98,114,111,117,116,105,110,101,32,104,101,114,101,0

	; reduce_91 workspace at ws+1353 length ws+1
f419_reduce_91:
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
	jp nz, c01_0774
	ld a, (ws+1353)
	or a
	jp nz, c01_0775
c01_0774:
	ld hl,c01_c397
	call f82_SimpleError
c01_0775:
;c01_076f:
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
	jp z, c01_077b
;c01_077a:
	ld hl,c01_c398
	call f82_SimpleError
c01_077b:
;c01_0777:
	ld hl, (ws+558)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+12)
	and a
	sbc hl,de
	jp z, c01_0780
;c01_077f:
	ld hl,c01_c399
	call f82_SimpleError
c01_0780:
;c01_077c:
	ld d,25
	push de
	ld hl,ws+1317
	call f316_yy_destructor
;end_f419_reduce_91:
	ret


	; reduce_92 workspace at ws+1353 length ws+6
f420_reduce_92:
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
	call f168_MidStartsub
	ld (ws+1357), hl
	call f269_Generate
	ld ix, (ws+12)
	ld a, (ix+28)
	or 1
	ld (ix+28), a
;end_f420_reduce_92:
	ret


	; reduce_93 workspace at ws+1353 length ws+6
f421_reduce_93:
	ld hl, (ws+12)
	call f138_MidEndsub
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
	call f316_yy_destructor
;end_f421_reduce_93:
	ret


	; reduce_94 workspace at ws+1353 length ws+0
f422_reduce_94:
	ld ix, (ws+558)
	ld (ix+27), 0
	push ix
	pop hl
	call f215_EmitterEmitInputParameters
	ld hl, (ws+558)
	jp   f216_EmitterEmitOutputParameter; ;	call f216_EmitterEmitOutputParameter;
;end_f422_reduce_94:
;	ret


	; reduce_95 workspace at ws+1353 length ws+1
f423_reduce_95:
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
	call f316_yy_destructor
;end_f423_reduce_95:
	ret


	; reduce_96 workspace at ws+1353 length ws+1
f424_reduce_96:
	ld hl, (ws+1313)
	call f104_CountParameters
	ld (ws+1353), a
	ld ix, (ws+558)
	ld (ix+26), a
;end_f424_reduce_96:
	ret


	; reduce_97 workspace at ws+1353 length ws+0
f425_reduce_97:
	ld ix,0
	ld (ws+1309), ix
	ld a,4
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f425_reduce_97:
	ret


	; reduce_98 workspace at ws+1353 length ws+0
f426_reduce_98:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld a,4
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f426_reduce_98:
	ret


	; reduce_99 workspace at ws+1353 length ws+0
f427_reduce_99:
	ld hl, (ws+1313)
	ld (ws+1309), hl
;end_f427_reduce_99:
	ret


	; reduce_100 workspace at ws+1353 length ws+0
f428_reduce_100:
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
	ld b,46
	push bc
	ld hl,ws+1317
	call f316_yy_destructor
;end_f428_reduce_100:
	ret


	; reduce_101 workspace at ws+1353 length ws+2
f429_reduce_101:
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
	call f316_yy_destructor
;end_f429_reduce_101:
	ret


	; reduce_102 workspace at ws+1353 length ws+2
f430_reduce_102:
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
	ld d,66
	push de
	ld hl,ws+1325
	call f316_yy_destructor
	ld a,10
	push af
	ld hl,ws+1317
	call f316_yy_destructor
	ld b,20
	push bc
	ld hl,ws+1313
	call f316_yy_destructor
;end_f430_reduce_102:
	ret


	; reduce_103 workspace at ws+1353 length ws+2
f431_reduce_103:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 30
	jp nz, c01_0782
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
	jp z, c01_0781 ; c01_0787
;c01_0786:
	call f308_SymbolRedeclarationError
c01_0787:
;c01_0783:
	jp c01_0781
c01_0782:
	or a
	jp nz, c01_0788
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
	jp c01_0781
c01_0788:
	call f308_SymbolRedeclarationError
c01_0781:
	ld ix, (ws+26)
	ld (ix+15), 5
;end_f431_reduce_103:
	ret


c01_c400:
	db 32,105,115,32,110,111,116,32,97,32,114,101,99,111,114,100,32,116,121,112,101,0

	; reduce_104 workspace at ws+1353 length ws+1
f432_reduce_104:
	ld hl, (ws+1313)
	call f233_CheckNotPartialType
	ld hl, (ws+1313)
	call f242_IsRecord
	ld (ws+1353), a
	or a
	jp nz, c01_078d
	call f80_StartError
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c400
	call f9_print
	call f81_EndError
c01_078d:
;c01_0789:
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
;end_f432_reduce_104:
	ret


	; reduce_105 workspace at ws+1353 length ws+2
f433_reduce_105:
	ld hl, (ws+1317)
	call f233_CheckNotPartialType
	ld ix, (ws+26)
	ld a, (ix+16)
	ld ix, (ws+1317)
	ld b, (ix+16)
	cp b
	jp nc, c01_0792
;c01_0791:
	ld ix, (ws+1317)
	ld a, (ix+16)
	ld ix, (ws+26)
	ld (ix+16), a
c01_0792:
;c01_078e:
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
	call f316_yy_destructor
	ld d,22
	push de
	ld hl,ws+1313
	call f316_yy_destructor
;end_f433_reduce_105:
	ret


	; reduce_106 workspace at ws+1353 length ws+0
f434_reduce_106:
	ld ix, (ws+26)
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+1309), hl
;end_f434_reduce_106:
	ret


	; reduce_107 workspace at ws+1353 length ws+0
f435_reduce_107:
	ld hl, (ws+1317)
	exx
	ld hl, (ws+1319)
	exx
	ld (ws+1309), hl
	ld a,16
	push af
	ld hl,ws+1321
	call f316_yy_destructor
	ld b,4
	push bc
	ld hl,ws+1313
	call f316_yy_destructor
;end_f435_reduce_107:
	ret


	; reduce_108 workspace at ws+1353 length ws+2
f436_reduce_108:
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
;end_f436_reduce_108:
	ret


	; reduce_109 workspace at ws+1353 length ws+2
f437_reduce_109:
	call f310_CheckEndOfInitialiser
	call f114_MidEndinit
	ld (ws+1353), hl
	call f269_Generate
	ld h,31
	push hl
	ld hl,ws+1325
	call f316_yy_destructor
	ld d,32
	push de
	ld hl,ws+1317
	call f316_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f437_reduce_109:
	ret


c01_c401:
	db 115,116,97,116,105,99,32,105,110,105,116,105,97,108,105,115,101,114,115,32,111,110,108,121,32,119,111,114,107,32,111,110,32
	db 97,114,114,97,121,115,32,111,114,32,114,101,99,111,114,100,115,0
c01_c402:
	db 121,111,117,32,99,97,110,39,116,32,115,116,97,116,105,99,97,108,108,121,32,105,110,105,116,105,97,108,105,115,101,32,97,110
	db 32,105,110,104,101,114,105,116,101,100,32,114,101,99,111,114,100,0

	; reduce_110 workspace at ws+1353 length ws+10
f438_reduce_110:
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
	jp nz, c01_0799
;c01_079a:
	ld a, (ws+1358)
	or a
	jp nz, c01_0799
;c01_0798:
	ld hl,c01_c401
	call f82_SimpleError
c01_0799:
;c01_0793:
	ld hl, (ws+1317)
	call f242_IsRecord
;	ld (ws+1359), a
	or a
	jp z, c01_07a1
;c01_07a2:
	ld ix, (ws+1317)
	ld l, (ix+4)
	ld h, (ix+5)
	ld a,h
	or l
	jp z, c01_07a1
;c01_07a0:
	ld hl,c01_c402
	call f82_SimpleError
c01_07a1:
;c01_079b:
	ld hl, (ws+1317)
	call f242_IsRecord
;	ld (ws+1360), a
	or a
	jp z, c01_07a7
;c01_07a6:
	ld hl, (ws+1317)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+560), hl
c01_07a7:
;c01_07a3:
	ld hl, (ws+1317)
	ld (ws+26), hl
	ld ix,0
	ld (ws+562), ix
	ld (ws+564), ix
	ld hl, (ws+1325)
	call f112_MidStartinit
	ld (ws+1361), hl
	call f269_Generate
	ld b,6
	push bc
	ld hl,ws+1321
	call f316_yy_destructor
	ld h,2
	push hl
	ld hl,ws+1313
	call f316_yy_destructor
;end_f438_reduce_110:
	ret


c01_c403:
	db 105,110,105,116,105,97,108,105,115,101,114,32,109,117,115,116,32,98,101,32,97,110,32,110,117,109,98,101,114,0
c01_c404:
	db 105,110,105,116,105,97,108,105,115,101,114,32,109,117,115,116,32,98,101,32,97,32,115,116,114,105,110,103,0
c01_c405:
	db 105,110,105,116,105,97,108,105,115,101,114,32,111,102,32,119,114,111,110,103,32,116,121,112,101,0
c01_c406:
	db 105,110,105,116,105,97,108,105,115,101,114,32,111,102,32,119,114,111,110,103,32,116,121,112,101,0

	; reduce_111 workspace at ws+1353 length ws+16
f439_reduce_111:
	call f315_GetInitedMemberChecked
	ld (ws+1355), hl
	pop hl
	ld (ws+1353), hl
	ld ix, (ws+1355)
	ld a, (ix+16)
	call f313_AlignTo
	ld ix, (ws+1355)
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+1357), hl
	ld ix, (ws+1313)
	ld a, (ix+13)
	cp 40
	jp nz, c01_07a9
	ld hl, (ws+1355)
	call f239_IsNum
;	ld (ws+1359), a
	or a
	jp nz, c01_07ae
	ld hl,c01_c403
	call f82_SimpleError
c01_07ae:
;c01_07aa:
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
	call f116_MidInit
;	ld (ws+1360), hl
	call f269_Generate
	jp c01_07a8
c01_07a9:
	cp 41
	jp nz, c01_07af
	ld hl, (ws+1355)
	call f74_IsPtr
;	ld (ws+1362), a
	or a
	jp z, c01_07b5
;c01_07b7:
	ld hl, (ws+1355)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+551)
	and a
	sbc hl,de
	jp z, c01_07b6
c01_07b5:
	ld hl,c01_c404
	call f82_SimpleError
c01_07b6:
;c01_07b0:
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f136_MidInitstring
;	ld (ws+1363), hl
	call f269_Generate
	jp c01_07a8
c01_07af:
	cp 42
	jp nz, c01_07b8
	ld de, (ws+1355)
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	and a
	sbc hl,de
	jp z, c01_07bd
;c01_07bc:
	ld hl,c01_c405
	call f82_SimpleError
c01_07bd:
;c01_07b9:
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
	call f140_MidInitaddress
;	ld (ws+1365), hl
	call f269_Generate
	jp c01_07a8
c01_07b8:
	cp 43
	jp nz, c01_07be
	ld de, (ws+1355)
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	and a
	sbc hl,de
	jp z, c01_07c3
;c01_07c2:
	ld hl,c01_c406
	call f82_SimpleError
c01_07c3:
;c01_07bf:
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f131_MidInitsubref
	ld (ws+1367), hl
	call f269_Generate
	jp c01_07a8
c01_07be:
	call f305_parser_i_constant_error
c01_07a8:
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
;end_f439_reduce_111:
	ret


	; reduce_112 workspace at ws+1353 length ws+0
f440_reduce_112:
	call f310_CheckEndOfInitialiser
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
	call f316_yy_destructor
;end_f440_reduce_112:
	ret


c01_c407:
	db 98,114,97,99,101,100,32,105,110,105,116,105,97,108,105,115,101,100,32,99,97,110,32,111,110,108,121,32,105,110,105,116,105,97
	db 108,105,115,101,32,97,114,114,97,121,115,32,111,114,32,114,101,99,111,114,100,115,0

	; reduce_113 workspace at ws+1353 length ws+8
f441_reduce_113:
	call f315_GetInitedMemberChecked
	ld (ws+1355), hl
	pop hl
	ld (ws+1353), hl
	ld ix, (ws+1355)
	ld a, (ix+16)
	call f313_AlignTo
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
	jp z, c01_07c8
;c01_07c7:
	ld hl, (ws+1355)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+560), hl
	jp c01_07c4
c01_07c8:
	ld hl, (ws+1355)
	call f237_IsArray
;	ld (ws+1360), a
	or a
	jp z, c01_07cc
;c01_07cb:
	ld ix,0
	ld (ws+560), ix
	jp c01_07c4
c01_07cc:
	ld hl,c01_c407
	call f82_SimpleError
c01_07c4:
;end_f441_reduce_113:
	ret


	; reduce_114 workspace at ws+1353 length ws+2
f442_reduce_114:
	call f148_MidAsmend
	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f442_reduce_114:
	ret


	; reduce_115 workspace at ws+1353 length ws+2
f443_reduce_115:
	call f143_MidAsmstart
	ld (ws+1353), hl
	jp   f269_Generate ;	call f269_Generate
;end_f443_reduce_115:
;	ret


	; reduce_116 workspace at ws+1353 length ws+2
f444_reduce_116:
	ld hl, (ws+1313)
	call f158_MidAsmtext
	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+1313)
	jp   f40_Free ;	call f40_Free
;end_f444_reduce_116:
;	ret


	; reduce_117 workspace at ws+1353 length ws+2
f445_reduce_117:
	ld hl, (ws+1313)
	exx
	ld hl, (ws+1315)
	exx
	call f142_MidAsmvalue
	ld (ws+1353), hl
	jp   f269_Generate ;	call f269_Generate
;end_f445_reduce_117:
;	ret


c01_c408:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,101,109,105,116,32,114,101,102,101,114,101,110,99,101,115,32,116,111,32,118
	db 97,114,105,97,98,108,101,115,44,32,115,117,98,114,111,117,116,105,110,101,115,44,32,111,114,32,99,111,110,115,116,97,110,116
	db 115,0

	; bad_reference workspace at ws+1360 length ws+0
f447_bad_reference:
	ld hl,c01_c408
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f447_bad_reference:
;	ret


	; reduce_118 workspace at ws+1353 length ws+7
f446_reduce_118:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 30
	jp nz, c01_07ce
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f238_IsSubroutine
	ld (ws+1353), a
	or a
	jp z, c01_07d3
;c01_07d2:
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
	call f169_MidAsmsubref
;	ld (ws+1354), hl
	call f269_Generate
	jp c01_07cd ; c01_07cf
c01_07d3:
	call f447_bad_reference
c01_07cf:
	jp c01_07cd
c01_07ce:
	cp 28
	jp nz, c01_07d4
	ld hl, (ws+1313)
	call f128_MidAsmsymbol
;	ld (ws+1356), hl
	call f269_Generate
	jp c01_07cd
c01_07d4:
	cp 7
	jp nz, c01_07d5
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
	call f142_MidAsmvalue
;	ld (ws+1358), hl
	call f269_Generate
	jp c01_07cd
c01_07d5:
	call f447_bad_reference
c01_07cd:
;end_f446_reduce_118:
	ret


	; reduce_124 workspace at ws+1353 length ws+0
f448_reduce_124:
	ld b,26
	push bc
	ld hl,ws+1321
	call f316_yy_destructor
;end_f448_reduce_124:
	ret


	; reduce_128 workspace at ws+1353 length ws+0
f449_reduce_128:
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f449_reduce_128:
	ret


	; reduce_129 workspace at ws+1353 length ws+0
f450_reduce_129:
	ld h,25
	push hl
	ld hl,ws+1329
	call f316_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f450_reduce_129:
	ret


	; reduce_130 workspace at ws+1353 length ws+0
f451_reduce_130:
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f451_reduce_130:
	ret


	; reduce_131 workspace at ws+1353 length ws+0
f452_reduce_131:
	ld a,22
	push af
	ld hl,ws+1313
	call f316_yy_destructor
;end_f452_reduce_131:
	ret


	; reduce_137 workspace at ws+1353 length ws+0
f453_reduce_137:
	ld d,46
	push de
	ld hl,ws+1317
	call f316_yy_destructor
;end_f453_reduce_137:
	ret


	; reduce_140 workspace at ws+1353 length ws+0
f454_reduce_140:
	ld d,46
	push de
	ld hl,ws+1317
	call f316_yy_destructor
;end_f454_reduce_140:
	ret


	; reduce_default workspace at ws+1353 length ws+0
f455_reduce_default:
;end_f455_reduce_default:
	ret

f323_yy_reduce_s07d6:
	dw f325_reduce_0
	dw f326_reduce_1
	dw f327_reduce_2
	dw f328_reduce_3
	dw f329_reduce_4
	dw f330_reduce_5
	dw f331_reduce_6
	dw f332_reduce_7
	dw f333_reduce_8
	dw f334_reduce_9
	dw f335_reduce_10
	dw f336_reduce_11
	dw f337_reduce_12
	dw f338_reduce_13
	dw f339_reduce_14
	dw f340_reduce_15
	dw f341_reduce_16
	dw f342_reduce_17
	dw f343_reduce_18
	dw f344_reduce_19
	dw f345_reduce_20
	dw f346_reduce_21
	dw f347_reduce_22
	dw f348_reduce_23
	dw f349_reduce_24
	dw f350_reduce_25
	dw f351_reduce_26
	dw f352_reduce_27
	dw f353_reduce_28
	dw f354_reduce_29
	dw f355_reduce_30
	dw f356_reduce_31
	dw f357_reduce_32
	dw f358_reduce_33
	dw f359_reduce_34
	dw f360_reduce_35
	dw f361_reduce_36
	dw f362_reduce_37
	dw f363_reduce_38
	dw f364_reduce_39
	dw f365_reduce_40
	dw f366_reduce_41
	dw f367_reduce_42
	dw f368_reduce_43
	dw f369_reduce_44
	dw f370_reduce_45
	dw f371_reduce_46
	dw f372_reduce_47
	dw f373_reduce_48
	dw f374_reduce_49
	dw f375_reduce_50
	dw f376_reduce_51
	dw f377_reduce_52
	dw f378_reduce_53
	dw f379_reduce_54
	dw f380_reduce_55
	dw f382_reduce_56
	dw f383_reduce_57
	dw f384_reduce_58
	dw f386_reduce_59
	dw f387_reduce_60
	dw f388_reduce_61
	dw f389_reduce_62
	dw f390_reduce_63
	dw f391_reduce_64
	dw f392_reduce_65
	dw f393_reduce_66
	dw f394_reduce_67
	dw f395_reduce_68
	dw f396_reduce_69
	dw f397_reduce_70
	dw f398_reduce_71
	dw f399_reduce_72
	dw f400_reduce_73
	dw f401_reduce_74
	dw f402_reduce_75
	dw f403_reduce_76
	dw f404_reduce_77
	dw f405_reduce_78
	dw f406_reduce_79
	dw f407_reduce_80
	dw f408_reduce_81
	dw f409_reduce_82
	dw f410_reduce_83
	dw f411_reduce_84
	dw f412_reduce_85
	dw f413_reduce_86
	dw f414_reduce_87
	dw f415_reduce_88
	dw f417_reduce_89
	dw f418_reduce_90
	dw f419_reduce_91
	dw f420_reduce_92
	dw f421_reduce_93
	dw f422_reduce_94
	dw f423_reduce_95
	dw f424_reduce_96
	dw f425_reduce_97
	dw f426_reduce_98
	dw f427_reduce_99
	dw f428_reduce_100
	dw f429_reduce_101
	dw f430_reduce_102
	dw f431_reduce_103
	dw f432_reduce_104
	dw f433_reduce_105
	dw f434_reduce_106
	dw f435_reduce_107
	dw f436_reduce_108
	dw f437_reduce_109
	dw f438_reduce_110
	dw f439_reduce_111
	dw f440_reduce_112
	dw f441_reduce_113
	dw f442_reduce_114
	dw f443_reduce_115
	dw f444_reduce_116
	dw f445_reduce_117
	dw f446_reduce_118
	dw f455_reduce_default
	dw f455_reduce_default
	dw f455_reduce_default
	dw f455_reduce_default
	dw f455_reduce_default
	dw f448_reduce_124
	dw f455_reduce_default
	dw f455_reduce_default
	dw f455_reduce_default
	dw f449_reduce_128
	dw f450_reduce_129
	dw f451_reduce_130
	dw f452_reduce_131
	dw f455_reduce_default
	dw f455_reduce_default
	dw f455_reduce_default
	dw f455_reduce_default
	dw f455_reduce_default
	dw f453_reduce_137
	dw f455_reduce_default
	dw f455_reduce_default
	dw f454_reduce_140


	; yy_reduce workspace at ws+1303 length ws+50
f323_yy_reduce::
	ld (ws+1305), a
	pop bc
	pop hl
	ld (ws+1303), hl
	push bc
	ld bc,f2___main_s0671
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
;	jp nz, c01_0676
;	call f320_yy_stack_overflow
;c01_0676:
	call z,f320_yy_stack_overflow
;c01_0672:
	ld iy,ws+1313
	ld (ws+1345), iy
	ld a, (ws+1308)
	ld (ws+1347), a
c01_0677:
	ld a, (ws+1347)
	or a
	jp z, c01_067c
;c01_067b:
	ld hl, (ws+566)
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, (ws+1345)
	call f322_CopyMinor
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
	jp c01_0677
c01_067c:
	ld de,f323_yy_reduce_s07d6
	ld a, (ws+1303)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld e,(hl)
	inc hl
	ld d,(hl)
	call f491__jpde
	ld hl,ws+1309
	push hl
	ld hl, (ws+566)
	ld bc,10
	add hl,bc
	call f322_CopyMinor
	ld de,f2___main_s0670
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
	ld bc,f2___main_s0658
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
	jp c, c01_07db
;c01_07da:
	ld de,f2___main_s0657
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
	jp c, c01_07e4
;c01_07e6:
	ld hl, (ws+1351)
	ld de,1291
	and a
	sbc hl,de
	jp nc, c01_07e4
;c01_07e5:
	ld bc,f2___main_s0655
	ld hl, (ws+1351)
	add hl,bc
	ld a,(hl)
	ld b,a
	ld a, (ws+1348)
	cp b
	jp nz, c01_07e4
;c01_07e3:
	ld de,f2___main_s0654
	ld hl, (ws+1351)
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1306), hl
c01_07e4:
;c01_07dc:
c01_07db:
;c01_07d7:
	ld de, (ws+566)
	ld hl,7
	add hl,de
	ld (ws+566), hl
	ld de, (ws+1306)
	ld (hl),e
	inc hl
	ld (hl),d
	ld a, (ws+1348)
	ld hl, (ws+566)
	inc hl
	inc hl
	ld (hl),a
;end_f323_yy_reduce:
	ld hl, (ws+1306)
	ret


	; yy_parse_failed workspace at ws+1303 length ws+0
f456_yy_parse_failed::
	jp   f319_yy_pop_all_parser_stack ;	call f319_yy_pop_all_parser_stack
;end_f456_yy_parse_failed:
;	ret


c01_c409:
	db 117,110,101,120,112,101,99,116,101,100,32,0

	; yy_syntax_error workspace at ws+1303 length ws+3
f457_yy_syntax_error::
	ld (ws+1304), hl
	pop bc
	pop af
	ld (ws+1303), a
	push bc
	call f80_StartError
	ld hl,c01_c409
	call f9_print
	ld bc,f2___main_s0659
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
;end_f457_yy_syntax_error:
;	ret


	; yy_accept workspace at ws+1303 length ws+0
f458_yy_accept::
;end_f458_yy_accept:
	ret

