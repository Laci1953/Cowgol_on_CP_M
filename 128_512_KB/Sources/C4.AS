include w.mac

	psect text

	global	f321_yy_reduce_

	; reduce_0 workspace at ws+1353 length ws+2
f323_reduce_0:
	call f166_MidReturn
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_1 workspace at ws+1353 length ws+0
f324_reduce_1:
	ld hl, (current_subr)
	push hl
	ld hl, (ws+1325)
	push hl
	ld hl, (ws+1317)
	call f272_InitVariab;e
	ld h,6
	push hl
	ld hl,ws+1321
	call f314_yy_destruc;or
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


        ; reduce_2 workspace at ws+1353 length ws+7 CHANGED
f325_reduce_2:
        ld hl, (current_subr)		;current_subr
        push hl
        ld hl, (ws+1333)	;yyrhs[5].yy143
        push hl
        ld hl, (ws+1325)	;yyrhs[3].yy79
        call f272_InitVariab

        ld hl, (ws+1333)
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( vardata ),bc	;yyrhs[5].yy143.vardata
        ld hl, (ws+1317)	;yyrhs[1].yy139
        push hl
        ld hl, (vardata)
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
	ld	h,b
	ld	l,c		;HL=yyrhs[5].yy143.vardata.type
        call f282_CheckExpre
        ld hl, (ws+1317)
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
;        ld ( type139 ),bc
;        ld hl,( type139 )
	ld h,b
	ld l,c
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
;        ld ( type139width ),bc
;        ld a, (type139width)
	ld a,c
        ld (ws+1353), a		;w
        ld hl, (ws+1333)
        push hl
        ld hl,0
        call f154_MidAddress
;        ld (ws+1354), hl
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
;        ld (ws+1358), hl
        call f269_Generate
        ld h,6
        push hl
        ld hl,ws+1329
        call f314_yy_destruc
        ld d,2
        push de
        ld hl,ws+1321
        call f314_yy_destruc
        ld b,22
        push bc
        ld hl,ws+1313
        call f314_yy_destruc
        ret


;c01_c363:
; db 116,121,112,101,115,32,99,97,110,110,111,116,32,98,101,32,105,110,102,101
; db 114,114,101,100,32,102,111,114,32,110,117,109,101,114,105,99,32,99
; db 111,110,115,116,97,110,116,115,0
;c01_c364:
; db 121,111,117,32,99,97,110,32,111,110,108,121,32,97,115,115,105,103
; db 110,32,116,111,32,108,118,97,108,117,101,115,0


        ; reduce_3 workspace at ws+1353 length ws+10 CHANGED
f326_reduce_3:
        ld hl, (ws+1317)
;        ld (node139), hl
;        ld hl,( node139 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( type139 ),bc
        ld hl, (type139)
        ld a,h
        or l
        jp nz, c01_066a
;        ld hl,c01_c363
;        call f82_SimpleError
	ld a,15
	call SimpleErrorNr
c01_066a:
        ld hl, (type139)
        call f241_IsScalar
;        ld (ws+1355), a
        or a
        jp nz, c01_066f
;        ld hl,c01_c364
;        call f82_SimpleError
	ld a,16
	call SimpleErrorNr
c01_066f:
        ld hl, (current_subr)
        push hl
        ld hl, (ws+1325)
        push hl
        ld hl, (type139)
        call f272_InitVariab

        ld hl, (ws+1325)
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord		;BC=yyrhs[3].yy143.vardata
        ld ( vardata ),bc
        ld hl, (ws+1317)
        push hl
        ld hl, (vardata)
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
	ld	h,b
	ld	l,c		;HL=yyrhs[3].yy143.vardata.type
        call f282_CheckExpre
        ld hl,( type139 )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
;        ld ( type139width ),bc
;        ld a, (type139width)
	ld a,c
        ld (ws+1356), a
        ld hl, (ws+1325)
        push hl
        ld hl,0
        call f154_MidAddress
;        ld (ws+1357), hl
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
;        ld (ws+1361), hl
        call f269_Generate
        ld d,2
        push de
        ld hl,ws+1321
        call f314_yy_destruc
        ld b,22
        push bc
        ld hl,ws+1313
        call f314_yy_destruc
        ret

        ; reduce_4 workspace at ws+1353 length ws+11 CHANGED
f327_reduce_4:
        ld hl, (ws+1325)
        ld (node139), hl
;        ld hl,( node139 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1353 ),bc	;type
        ld hl, (ws+1325)
        call f244_UndoLValue
        ld (ws+1357), hl
        ld hl, (ws+1317)
        push hl
        ld hl, (ws+1353)
        call f282_CheckExpre
        ld hl,( ws+1353 )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld a,c
        ld ( ws+1359 ),a
;        ld a, (ws+1359)
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
;        ld (ws+1362), hl
        call f269_Generate
        ld h,2
        push hl
        ld hl,ws+1321
        call f314_yy_destruc
        ld d,22
        push de
        ld hl,ws+1313
        call f314_yy_destruc
        ret


	; reduce_5 workspace at ws+1353 length ws+0
f328_reduce_5:
	ld hl, (ws+1325)
	call f298_TerminateN;rmalLoop
	ld d,10
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ld h,13
	push hl
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_6 workspace at ws+1353 length ws+4
f329_reduce_6:
	call f297_BeginNorma;Loop
	ld (ws+1309), hl
	ld hl, (continue_label)
	call f159_MidLabel
;	ld (ws+1355), hl
;!!!	call f269_Generate
	jp f269_Generate ;!!!
;!!!	ret


	; reduce_7 workspace at ws+1353 length ws+0
f330_reduce_7:
	ld hl, (ws+1325)
	call f298_TerminateN;rmalLoop
	ld d,10
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ld h,13
	push hl
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_8 workspace at ws+1353 length ws+4
f331_reduce_8:
	call f297_BeginNorma;Loop
	ld (ws+1309), hl
	ld hl, (continue_label)
	call f159_MidLabel
;	ld (ws+1355), hl
;!!!	call f269_Generate
	jp f269_Generate ;!!!
;!!!	ret

        ; reduce_9 workspace at ws+1353 length ws+6 CHANGED
f332_reduce_9:
        ld hl, (ws+1321)
        ld (ws+1309), hl
        call f247_AllocLabel
        ld (ws+1355), hl
        call f247_AllocLabel
        ld (break_label), hl
        ld hl, (ws+1317)	;node139
        ld c,N_base
        ld de,( ws+1355 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1317 )
        ld c,N_base+2
        ld de,( break_label )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1317 )
        ld c,N_base+4
        ld de,( ws+1355 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1317)
        call f270_GenerateCo
        ld de, (break_label)
        ld hl, (ws+1309)
        inc hl
        inc hl
        ld (hl),e
        inc hl
        ld (hl),d
        ld a,13
        push af
        ld hl,ws+1313
        call f314_yy_destruc
        ret


;c01_c365:
;	db 110,111,116,104,105,110,103,32,116,111,32,98,114,101,97,107,32,116,111,0


	; reduce_10 workspace at ws+1353 length ws+2
f333_reduce_10:
	ld hl, (break_label)
	ld a,h
	or l
	jp nz, c01_0674
;	ld hl,c01_c365
;	call f82_SimpleError
	ld a,17
	call SimpleErrorNr
c01_0674:
	ld hl, (break_label)
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

;c01_c366:
;	db 110,111,116,104,105,110,103,32,116,111,32,99,111,110,116,105,110,117,101,32,116,111,0


	; reduce_11 workspace at ws+1353 length ws+2
f334_reduce_11:
	ld hl, (continue_label)
	ld a,h
	or l
	jp nz, c01_0679
;	ld hl,c01_c366
;	call f82_SimpleError
	ld a,18
	call SimpleErrorNr
c01_0679:
	ld hl, (continue_label)
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_12 workspace at ws+1353 length ws+4
f335_reduce_12:
	ld hl, (current_if)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (current_if)
	ld (ws+1355), hl
	push hl
	pop ix
	ld l, (ix+6)
	ld h, (ix+7)
	ld (current_if), hl
	ld hl, (ws+1355)
	call f40_Free
	ld b,26
	push bc
	ld hl,ws+1329
	call f314_yy_destruc;or
	ld d,10
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ld h,12
	push hl
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_13 workspace at ws+1353 length ws+6
f336_reduce_13:
	ld hl,8
	call f75_InternalAll;c
	ld (ws+1355), hl
	ld hl, (current_if)
	ld ix, (ws+1355)
	ld (ix+6), l
	ld (ix+7), h
	push ix
	pop hl
	ld (current_if), hl
	call f247_AllocLabel
;	ld (ws+1357), hl
	ld d,h
	ld e,l
	ld hl, (current_if)
	ld (hl),e
	inc hl
	ld (hl),d
	ret


        ; reduce_14 workspace at ws+1353 length ws+8 CHANGED
f337_reduce_14:
        call f247_AllocLabel
        ld (ws+1355), hl
        call f247_AllocLabel
        ld (ws+1359), hl
        ld de, (ws+1355)
        ld hl, (current_if)
        inc hl
        inc hl
        ld (hl),e
        inc hl
        ld (hl),d
        ld hl, (ws+1359)
        ld ix, (current_if)
        ld (ix+4), l
        ld (ix+5), h
        ld hl, (ws+1313)
        ld c,N_base
        ld de,( ws+1355 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1313 )
        ld c,N_base+2
        ld de,( ws+1359 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1313 )
        ld c,N_base+4
        ld de,( ws+1355 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1313)
;        call f270_GenerateCo
	jp f270_GenerateCo
;        ret


	; reduce_15 workspace at ws+1353 length ws+2
f338_reduce_15:
	ld ix, (current_if)
	ld l, (ix+4)
	ld h, (ix+5)
	call f159_MidLabel
;	ld (ws+1353), hl
;!!!	call f269_Generate
	jp f269_Generate ;!!!
;!!!	ret


	; reduce_16 workspace at ws+1353 length ws+4
f339_reduce_16:
	ld hl, (current_if)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld ix, (current_if)
	ld l, (ix+4)
	ld h, (ix+5)
	call f159_MidLabel
;	ld (ws+1355), hl
;!!!	call f269_Generate
	jp f269_Generate ;!!!
;!!!	ret


	; reduce_17 workspace at ws+1353 length ws+4
f340_reduce_17:
	ld hl, (current_if)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld ix, (current_if)
	ld l, (ix+4)
	ld h, (ix+5)
	call f159_MidLabel
;	ld (ws+1355), hl
;!!!	call f269_Generate
	jp f269_Generate ;!!!
;!!!	ret


	; reduce_18 workspace at ws+1353 length ws+8
f341_reduce_18:
	ld ix, (current_case)
	ld a, (ix+9)
	or a
	jp nz, c01_0680
	ld hl, (current_case)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_0680
	ld hl, (current_case)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
;	ld (ws+1353), hl
	call f269_Generate
c01_0680:
	ld hl, (current_case)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
;	ld (ws+1355), hl
	call f269_Generate
	ld ix, (current_case)
	ld a, (ix+8)
	call f144_MidEndcase
;	ld (ws+1357), hl
	call f269_Generate
	ld hl, (current_case)
	ld (ws+1359), hl
	push hl
	pop ix
	ld l, (ix+6)
	ld h, (ix+7)
	ld (current_case), hl
	ld hl, (ws+1359)
	call f40_Free
	ld d,10
	push de
	ld hl,ws+1321
	call f314_yy_destruc;or
	ld a,64
	push af
	ld hl,ws+1317
	call f314_yy_destruc;or
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

;c01_c367:
; db 99,97,115,101,32,111,110,108,121,32,119,111,114,107,115
; db 32,111,110,32,110,117,109,98,101,114,115,0


	; reduce_19 workspace at ws+1353 length ws+10
f342_reduce_19:
	ld hl,10
	call f75_InternalAll;c
	ld (ws+1355), hl
	ld hl, (current_case)
	ld ix, (ws+1355)
	ld (ix+6), l
	ld (ix+7), h
	ld hl, (break_label)
	ld (ix+4), l
	ld (ix+5), h
	call f247_AllocLabel
;	ld (ws+1357), hl
	ld d,h
	ld e,l
	ld hl, (ws+1355)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1355)
	ld (current_case), hl
	ld hl,(ws+1317)
	ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c
	call f239_IsNum
;	ld (ws+1359), a
	or a
	jp nz, c01_0686
;	ld hl,c01_c367
;	call f82_SimpleError
	ld a,19
	call SimpleErrorNr
c01_0686:
	ld hl, (ws+1317)
	call f172_NodeWidth
;	ld (ws+1360), a
	ld ix, (ws+1355)
	ld (ix+8), a
	ld a, (ix+8)
	push af
	ld hl, (ws+1317)
	call f134_MidStartca;e
;	ld (ws+1361), hl
	call f269_Generate
	ld h,65
	push hl
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

;c01_c368:
;	db 119,104,101,110,32,101,108,115,101,32,109,117,115,116,32,103,111,32,108,97,115,116,0


	; reduce_20 workspace at ws+1353 length ws+8
f343_reduce_20:
	ld ix, (current_case)
	ld a, (ix+9)
	or a
	jp z, c01_068b
;	ld hl,c01_c368
;	call f82_SimpleError
	ld a,20
	call SimpleErrorNr
c01_068b:
	ld hl, (current_case)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_0690
	ld hl, (current_case)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (current_case)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
;	ld (ws+1355), hl
	call f269_Generate
c01_0690:
	call f247_AllocLabel
;	ld (ws+1357), hl
	ld d,h
	ld e,l
	ld hl, (current_case)
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix, (current_case)
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
	call f128_MidWhencas;
;	ld (ws+1359), hl
	call f269_Generate
	ld d,6
	push de
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

;c01_c369:
; db 111,110,108,121,32,111,110,101,32,119,104,101,110,32,101
; db 108,115,101,32,97,108,108,111,119,101,100,0


	; reduce_21 workspace at ws+1353 length ws+4
f344_reduce_21:
	ld ix, (current_case)
	ld a, (ix+9)
	or a
	jp z, c01_0695
;	ld hl,c01_c369
;	call f82_SimpleError
	ld a,21
	call SimpleErrorNr
c01_0695:
	ld hl, (current_case)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_069a
	ld hl, (current_case)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (current_case)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
;	ld (ws+1355), hl
	call f269_Generate
c01_069a:
	ld de,0
	ld hl, (current_case)
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix, (current_case)
	ld (ix+9), 1
	ld a,9
	push af
	ld hl,ws+1317
	call f314_yy_destruc;or
	ld d,6
	push de
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_22 workspace at ws+1353 length ws+0
f345_reduce_22:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_23 workspace at ws+1353 length ws+0
f346_reduce_23:
	ld hl, (ws+1313)
	ld (ws+1309), hl
;!!!	call f299_Negate ;!!!
	jp f299_Negate ;!!!
;!!!	ret


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
	ld (ws+1309), hl
	ld h,46
	push hl
	ld hl,ws+1317
	call f314_yy_destruc;or
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
	ld (ws+1309), hl
	ld d,47
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_26 workspace at ws+1353 length ws+2
f349_reduce_26:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	xor a
	call f300_Conditiona;Eq
	ld (ws+1309), hl
	ld b,54
	push bc
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_27 workspace at ws+1353 length ws+2
f350_reduce_27:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld a,1
	call f300_Conditiona;Eq
	ld (ws+1309), hl
	ld h,55
	push hl
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_28 workspace at ws+1353 length ws+2
f351_reduce_28:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	xor a
	call f301_Conditiona;Lt
	ld (ws+1309), hl
	ld d,50
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_29 workspace at ws+1353 length ws+2
f352_reduce_29:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld a,1
	call f301_Conditiona;Lt
	ld (ws+1309), hl
	ld b,53
	push bc
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_30 workspace at ws+1353 length ws+2
f353_reduce_30:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	push hl
	xor a
	call f301_Conditiona;Lt
	ld (ws+1309), hl
	ld h,52
	push hl
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_31 workspace at ws+1353 length ws+2
f354_reduce_31:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	push hl
	ld a,1
	call f301_Conditiona;Lt
	ld (ws+1309), hl
	ld d,51
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_32 workspace at ws+1353 length ws+2
f355_reduce_32:
	ld hl, (ws+1313)
	exx
	ld hl, (ws+1315)
	exx
	call f116_MidConstan;
	ld (ws+1309), hl
	ret


	; reduce_33 workspace at ws+1353 length ws+0
f356_reduce_33:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_34 workspace at ws+1353 length ws+0
f357_reduce_34:
	ld hl, (ws+1313)
	ld (ws+1309), hl
	ret


	; reduce_35 workspace at ws+1353 length ws+2
f358_reduce_35:
	ld h,111
	push hl
	ld hl, (ws+1313)
	call f288_Expr1Simpl;
	ld (ws+1309), hl
	ret


	; reduce_36 workspace at ws+1353 length ws+2
f359_reduce_36:
	ld a,106
	push af
	ld hl, (ws+1313)
	call f288_Expr1Simpl;
	ld (ws+1309), hl
	ret


	; reduce_37 workspace at ws+1353 length ws+2
f360_reduce_37:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f289_ExprAdd
	ld (ws+1309), hl
	ld d,19
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_38 workspace at ws+1353 length ws+2
f361_reduce_38:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f291_ExprSub
	ld (ws+1309), hl
	ld b,14
	push bc
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_39 workspace at ws+1353 length ws+2
f362_reduce_39:
	ld h,161
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simpl;
	ld (ws+1309), hl
	ld a,24
	push af
	ld hl,ws+1317
	call f314_yy_destruc;or
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
	call f293_Expr2Simpl;
	ld (ws+1309), hl
	ld h,23
	push hl
	ld hl,ws+1317
	call f314_yy_destruc;or
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
	call f293_Expr2Simpl;
	ld (ws+1309), hl
	ld b,18
	push bc
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_42 workspace at ws+1353 length ws+2
f365_reduce_42:
	ld h,176
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simpl;
	ld (ws+1309), hl
	ld a,49
	push af
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_43 workspace at ws+1353 length ws+2
f366_reduce_43:
	ld d,166
	push de
	push de
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simpl;
	ld (ws+1309), hl
	ld b,59
	push bc
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_44 workspace at ws+1353 length ws+2
f367_reduce_44:
	ld h,171
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simpl;
	ld (ws+1309), hl
	ld a,48
	push af
	ld hl,ws+1317
	call f314_yy_destruc;or
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
	ld (ws+1309), hl
	ld b,56
	push bc
	ld hl,ws+1317
	call f314_yy_destruc;or
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
	ld (ws+1309), hl
	ld d,57
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret

;c01_c370:
; db 99,97,115,116,32,98,101,116,119,101,101,110,32,112,111,105,110,116,101
; db 114,32,97,110,100,32,110,111,110,45,112,111,105,110,116,101,114,32,111
; db 102,32,100,105,102,102,101,114,101,110,116,32,115,105,122,101,0

        ; reduce_47 workspace at ws+1355 length ws+5 CHANGED
f370_reduce_47:
        ld hl, (ws+1313)
        call f233_CheckNotPa
        ld hl, (ws+1321)
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( type139 ),bc
        ld hl,( ws+1321 )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        cp 40
        jp z, c01_3703
        ld hl,( type139 )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( type139width ),bc
        ld hl,( ws+1313 )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( type79width ),bc
        ld de, (type139width)
        ld hl, (type79width)
        and a
        sbc hl,de
        jp z, c01_3702
        ld hl, (type139)
        call f74_IsPtr
        ld (ws+1353), a
        ld hl, (ws+1313)
        call f74_IsPtr
        ld (ws+1354), a
        ld a, (ws+1353)
        or a
        jp nz, c01_3700
        ld a, (ws+1354)
        or a
        jp z, c01_3701
c01_3700:
;        ld hl,c01_c370
;        call f82_SimpleError
	ld a,22
	call SimpleErrorNr
c01_3701:
c01_3702:
        ld hl, (type139)
        call f240_IsSNum
        ld (ws+1355), a
        ld a, (type79width)
        push af
        ld hl, (ws+1321)
        push hl
        ld a, (ws+1355)
        call f184_MidCCast
        ld (ws+1309), hl
        jp c01_3704
c01_3703:
        ld hl, (ws+1321)
        ld (ws+1309), hl
c01_3704:
        ld hl,( ws+1309 )
        ld c,N_type
        ld de,( ws+1313 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld h,58
        push hl
        ld hl,ws+1317
        call f314_yy_destruc
        ret


;c01_c371:
; db 121,111,117,32,99,97,110,110,111,116,32,116,97,107,101,32,116,104,101
; db 32,97,100,100,114,101,115,115,32,111,102,32,115,99,97,108,97,114
; db 32,118,97,114,105,97,98,108,101,115,0

        ; reduce_48 workspace at ws+1353 length ws+5 CHANGED
f371_reduce_48:
        ld hl, (ws+1313)
        call f244_UndoLValue
        ld (ws+1309), hl
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        cp 42
        ret nz
        ld hl,( ws+1309 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord		;BC=sym.vardata
	ld h,b
	ld l,c			;HL=sym.vardata
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
	ld	h,b
	ld	l,c		;HL=sym.vardata.type

        call f241_IsScalar
        or a
        ret z
;       ld hl,c01_c371
;        jp f82_SimpleError
	ld a,23
	jp SimpleErrorNr


	; reduce_49 workspace at ws+1353 length ws+2
f372_reduce_49:
	ld hl, (ws+1313)
	call f244_UndoLValue
	ld (ws+1309), hl
	ld h,59
	push hl
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


        ; reduce_50 workspace at ws+1353 length ws+5 CHANGED
f373_reduce_50:
        ld hl, (ws+1313)
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( type139 ),bc
        ld hl, (type139)
        call f74_IsPtr
;        ld (ws+1353), a
        or a
        call z,f302_parser_i_b
        ld hl,( intptr_type )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( width ),bc
        ld hl,( type139 )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
;        ld ( element ),bc
;        ld hl,( element )
	ld h,b
	ld l,c
        ld c,T_stride
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
;        ld ( stride ),bc
;        ld hl, (stride)
	ld h,b
	ld l,c
        exx
        ld hl,0
        exx
        call f116_MidConstan
        ld (ws+1354), hl
        ld d,156
        push de
        ld a, (width)
        push af
        ld hl, (ws+1313)
        push hl
        ld hl, (ws+1354)
        call f183_MidC2Op
        ld (ws+1309), hl
        ld hl,( ws+1313 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( type139 ),bc
        ld hl,( ws+1309 )
        ld c,N_type
        ld de,( type139 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        jp _PutWord


        ; reduce_51 workspace at ws+1353 length ws+5 CHANGED
f374_reduce_51:
        ld hl, (ws+1313)
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( type139 ),bc
        ld hl, (type139)
        call f74_IsPtr
;        ld (ws+1353), a
        or a
        call z,f302_parser_i_b
        ld hl,( intptr_type )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( width ),bc
        ld hl,( type139 )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
;        ld ( element ),bc
;        ld hl,( element )
	ld h,b
	ld l,c
        ld c,T_stride
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
;        ld ( stride ),bc
;        ld hl, (stride)
	ld h,b
	ld l,c
        exx
        ld hl,0
        exx
        call f116_MidConstan
        ld (ws+1354), hl
        ld b,131
        push bc
        ld a, (width)
        push af
        ld hl, (ws+1313)
        push hl
        ld hl, (ws+1354)
        call f183_MidC2Op
        ld (ws+1309), hl
        ld hl,( ws+1313 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( type139 ),bc
        ld hl,( ws+1309 )
        ld c,N_type
        ld de,( type139 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        jp _PutWord

        ; reduce_52 workspace at ws+1353 length ws+2 CHANGED
f375_reduce_52:
        ld hl, (ws+1313)
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        exx
        ld hl,0
        exx
        call f116_MidConstan
        ld (ws+1309), hl
        ret


;c01_c372:
;	db 97,114,114,97,121,32,101,120,112,101,99,116,101,100,0

        ; reduce_53 workspace at ws+49583 length ws+3 CHANGED
f376_reduce_53:
        ld hl, (ws+1313)
        call f237_IsArray
;        ld (ws+1353), a
        or a
        jp nz, c01_06c3
;        ld hl,c01_c372
;        call f82_SimpleError
	ld a,24
	call SimpleErrorNr
c01_06c3:
        ld hl, (ws+1313)
        ld c,T_base+2
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        exx
        ld hl,0
        exx
        call f116_MidConstan
        ld (ws+1309), hl
        ret


c01_c373:
	db 32,105,115,32,110,111,116,32,97,32,118,97,108,117,101,0


        ; not_a_value workspace at ws+1363 length ws+0 CHANGED
f378_not_a_valu:
        call f80_StartError
        ld hl,( sym )
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c373
        call f9_print
        jp f81_EndError

        ; reduce_54 workspace at ws+1353 length ws+10 CHANGED
f377_reduce_54:
        ld hl, (ws+1313)
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetByte
        cp 7
        jp nz, c01_3770
        ld hl,( ws+1313 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( constant ),bc
        ld hl,( ws+1313 )
        ld c,S_base+2
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( constant +2),bc
        ld hl, (constant)
        exx
        ld hl, (constant+2)
        exx
        call f116_MidConstan
        ld (ws+1309), hl
        ret
c01_3770:
        cp 28
        jp nz, c01_3771
        ld hl, (ws+1313)
        push hl
        ld hl,0
        call f154_MidAddress
        ld (ws+1309), hl
        ld hl,( ws+1313 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c			;yyrhs[0].yy143.vardata
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
	ld	h,b
	ld	l,c		;HL=yyrhs[0].yy143.vardata.type
        call f273_MakePointe
        ld (type), hl
        ld hl, (ws+1309)
        ld c,N_type
        ld de,( type )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1309)
        call f243_MakeLValue
        ld (ws+1309), hl
        ret
c01_3771:
        cp 30
        jp nz, f378_not_a_valu
        ld hl,( ws+1313 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld (type),bc
	ld hl,(type)
        ld c,T_kind
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        cp 6
        jp nz, f378_not_a_valu
        ld hl,( type )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( subr ),bc
        ld hl, (subr)
        call f169_MidSubref
        ld (ws+1309), hl

;        ld ix, (subr)
;        ld l, (ix+12)
;        ld h, (ix+13)
;        push hl
;        pop ix
;        ld l, (ix+10)
;        ld h, (ix+11)
;        ld (type), hl
	ld hl,(subr)
	ld c,U_intfsubr
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c
	ld c,U_type
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
        ld (type), bc
        ld hl,( ws+1309 )
        ld c,N_type
        ld de,( type )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        jp _PutWord


;c01_c374:
; db 99,97,110,110,111,116,32,100,101,114,101,102,101,114,101,110,99,101
; db 32,110,111,110,45,112,111,105,110,116,101,114,115,0


        ; reduce_55 workspace at ws+1353 length ws+3 CHANGED
f379_reduce_55:
        ld hl, (ws+1317)
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f74_IsPtr
;        ld (ws+1353), a
        or a
        jp nz, c01_06d1
;        ld hl,c01_c374
;        call f82_SimpleError
	ld a,25
	call SimpleErrorNr
c01_06d1:
        ld hl, (ws+1317)
        call f243_MakeLValue
        ld (ws+1309), hl
        ld h,5
        push hl
        ld hl,ws+1313
        call f314_yy_destruc
        ret

c01_c375:
 db 121,111,117,32,99,97,110,32,111,110,108,121,32,105,110,100,101,120,32,97
 db 110,32,97,114,114,97,121,44,32,110,111,116,32,97,32,0
;c01_c376:
;        db 97,114,114,97,121,32,105,110,100,105,99,101,115,32,109,117,115,116,32,98,101,32,110,117,109,98,101,114,115,0


        ; reduce_56 workspace at ws+1353 length ws+27 CHANGED
f380_reduce_56:
        ld hl, (ws+1325)
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1353 ),bc
        ld hl, (ws+1325)
        call f246_MaybeUndoL
        ld (ws+1357), hl
        ld hl, (ws+1353)
        call f237_IsArray
;        ld (ws+1359), a
        or a
        jp nz, c01_06d6
        call f80_StartError
        ld hl,c01_c375
        call f9_print
        ld hl,( ws+1353 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f9_print_vp
        call f81_EndError
c01_06d6:
        ld hl,( ws+1353 )
        ld c,T_base+4
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( indextype ),bc
        ld hl, (ws+1317)
        push hl
        ld hl, (indextype)
        call f282_CheckExpre
        ld hl, (ws+1317)
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f239_IsNum
;        ld (ws+1360), a
        or a
        jp nz, c01_06db
;        ld hl,c01_c376
;        call f82_SimpleError
	ld a,26
	call SimpleErrorNr
c01_06db:
        ld hl,( ws+1353 )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1361 ),bc
        ld hl,( intptr_type )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld a,c
        ld ( ws+1363 ),a
        ld hl,( ws+1361 )
        ld c,T_stride
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( stride ),bc
        ld a, (ws+1363)
        push af
        ld hl, (ws+1317)
        push hl
        xor a
        call f184_MidCCast
        ld (ws+1364), hl
        ld hl, (stride)
        exx
        ld hl,0
        exx
        call f116_MidConstan
        ld (ws+1366), hl
        ld h,161
        push hl
        ld a, (ws+1363)
        push af
        ld hl, (ws+1364)
        push hl
        ld hl, (ws+1366)
        call f183_MidC2Op
        ld (ws+1370), hl
        ld c,N_type
        ld de,( intptr_type )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld d,156
        push de
        ld a, (ws+1363)
        push af
        ld hl, (ws+1357)
        push hl
        ld hl, (ws+1370)
        call f183_MidC2Op
        ld (ws+1374), hl
        ld hl, (ws+1361)
        call f273_MakePointe
        ld (ws+1376), hl
        ld hl, ( ws+1374 )
        ld c,N_type
        ld de,( ws+1376 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1374)
        call f243_MakeLValue
        ld (ws+1309), hl
        ld b,17
        push bc
        ld hl,ws+1321
        call f314_yy_destruc
        ld a,5
        push af
        ld hl,ws+1313
        call f314_yy_destruc
        ret


c01_c377:
 db 32,105,115,32,110,111,116,32,97,32,114,101,99,111,114,100,32,111,114,32,112,111
 db 105,110,116,101,114,32,116,111,32,97,32,114,101,99,111,114,100,0

        ; BadType workspace at ws+1377 length ws+0 CHANGED
f382_BadType:
        call f80_StartError
        ld hl,( ws+1353 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c377
        call f9_print
        jp f81_EndError


c01_c378:
 db 32,100,111,101,115,32,110,111,116,32,99,111,110,116,97,105,110
 db 32,97,32,109,101,109,98,101,114,32,39,0
c01_c379:
	db 39,0

        ; reduce_57 workspace at ws+1353 length ws+24 CHANGED
f381_reduce_57:
        ld hl, (ws+1321)
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1353 ),bc
        ld hl, (ws+1321)
        ld (ws+1355), hl
        ld hl,( intptr_type )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( width ),bc
        ld hl, (ws+1355)
        call f245_IsLValue
;        ld (ws+1357), a
        or a
        jp z, c01_06e0
        ld hl, (ws+1321)
        call f246_MaybeUndoL
        ld (ws+1355), hl
c01_06e1:
        ld hl, (ws+1353)
        call f74_IsPtr
;        ld (ws+1360), a
        or a
        jp z, c01_06e6
        ld hl,( ws+1353 )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1353 ),bc
        ld hl, (ws+1353)
        call f233_CheckNotPa
        ld a, (width)
        push af
        ld hl, (ws+1355)
        call f153_MidDeref
        ld (ws+1355), hl
        jp c01_06e1
c01_06e6:
        jp c01_06dc
c01_06e0:
        ld hl, (ws+1353)
        call f74_IsPtr
;        ld (ws+1363), a
        or a
        jp z, c01_06ea
        ld hl,( ws+1353 )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1353 ),bc
        jp c01_06dc
c01_06ea:
        call f382_BadType
c01_06dc:
        ld hl, (ws+1353)
        call f233_CheckNotPa
        ld hl, (ws+1353)
        call f242_IsRecord
;        ld (ws+1364), a
        or a
        jp nz, c01_06ef
        call f382_BadType
c01_06ef:
        ld hl, (ws+1353)
        push hl
        ld hl, (ws+1313)
        call f228_LookupSymb
        ld (ws+1367), hl
        ld a,h
        or l
        jp nz, c01_06f4
        call f80_StartError
        ld hl,( ws+1353 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c378
        call f9_print
        ld hl, (ws+1313)
        call f9_print_vp
        ld hl,c01_c379
        call f9_print
        call f81_EndError
c01_06f4:
        ld hl, (ws+1313)
;        call f40_Free
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_Free
        ld hl,( ws+1367 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( vardata ),bc
;        ld ix, (vardata)
;        ld l, (ix+6)
;        ld h, (ix+7)
	ld	h,b
	ld	l,c		;HL=member.vardata
	ld	c,V_offset
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
	ld	h,b
	ld	l,c
        exx
        ld hl,0
        exx
        call f116_MidConstan
        ld (ws+1369), hl
        ld h,156
        push hl
        ld a, (width)
        push af
        ld hl, (ws+1355)
        push hl
        ld hl, (ws+1369)
        call f183_MidC2Op
        ld (ws+1309), hl
        ld hl, (vardata)
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF


	call	_GetWord	;returns BC
	ld	h,b
	ld	l,c		;HL=member.vardata.type
        call f273_MakePointe
        ld (type139), hl
        ld hl,( ws+1309 )
        ld c,N_type
        ld de,( type139 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1309)
        call f243_MakeLValue
        ld (ws+1309), hl
        ld d,8
        push de
        ld hl,ws+1317
        call f314_yy_destruc
        ret

        ; reduce_58 workspace at ws+1353 length ws+4 CHANGED
f383_reduce_58:
        ld hl, (ws+1313)
        call f168_MidString
        ld (ws+1309), hl
        ld hl, (uint8_type)
        call f273_MakePointe
        ld (ws+1355), hl
        ld hl,( ws+1309 )
        ld c,N_type
        ld de,( ws+1355 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        jp _PutWord


        ; reduce_59 workspace at ws+1353 length ws+0 CHANGED
f384_reduce_59:
        ld hl, (ws+1313)
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        cp 40
        call nz, f303_parser_i_c
        ld hl,( ws+1313 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( constant ),bc
        ld hl,( ws+1313 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( constant +2),bc
        ld hl, (constant)
        exx
        ld hl, (constant+2)
        exx
        ld (ws+1309), hl
        exx
        ld (ws+1311), hl
        exx
        ld hl, (ws+1313)
        jp f69_Discard


        ; reduce_60 workspace at ws+1353 length ws+0 CHANGED
f385_reduce_60:
        ld hl, (ws+1325)
        ld c,S_kind
        ld a,7
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte
        ld hl, (ws+1317)
        exx
        ld hl, (ws+1319)
        exx
        ld (constant), hl
        exx
        ld (constant+2), hl
        exx
        ld hl,( ws+1325 )
        ld c,S_base
        ld de,( constant )
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1325 )
        ld c,S_base+2
        ld de,( constant +2)
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld h,2
        push hl
        ld hl,ws+1321
        call f314_yy_destruc
        ld d,22
        push de
        ld hl,ws+1313
        call f314_yy_destruc
        ret


;c01_c380:
; db 105,110,118,97,108,105,100,32,105,110,116,101,103,101,114,32,116
; db 121,112,101,32,114,97,110,103,101,0


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
;	ld hl,c01_c380
;	call f82_SimpleError
	ld a,27
	call SimpleErrorNr
c01_06fe:
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
	call f252_ArchGuessI;tType
	ld (ws+1309), hl
	ld d,16
	push de
	ld hl,ws+1329
	call f314_yy_destruc;or
	ld h,45
	push hl
	ld hl,ws+1321
	call f314_yy_destruc;or
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

c01_c381:
	db 101,120,112,101,99,116,101,100,32,0
c01_c382:
	db 32,116,111,32,98,101,32,97,32,116,121,112,101,0


        ; reduce_62 workspace at ws+1353 length ws+2 CHANGED
f387_reduce_62:
        ld hl, (ws+1313)
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetByte
        or a
        jp nz, c01_0703
        call f72_AllocNewTyp
        ld (type), hl
;        ld hl,( type )
        ld c,T_kind
        ld a,1
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutByte
        ld hl,( ws+1313 )
        ld c,S_kind
        ld a,30
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte
        ld hl,( ws+1313 )
        ld c,S_base
        ld de,( type )
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld hl,( type )
        ld c,T_symbol
        ld de,( ws+1313 )
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord
c01_0703:
        ld hl,( ws+1313 )
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetByte
        cp 30
        jp z, c01_0708
        call f80_StartError
        ld hl,c01_c381
        call f9_print
        ld hl,( ws+1313 )
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c382
        call f9_print
        call f81_EndError
c01_0708:
        ld hl,( ws+1313 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld (ws+1309), hl
        ret


	; reduce_63 workspace at ws+1353 length ws+2
f388_reduce_63:
	ld hl, (ws+1317)
	call f273_MakePointe;Type
	ld (ws+1309), hl
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_64 workspace at ws+1353 length ws+2
f389_reduce_64:
	ld hl, (ws+1325)
	push hl
	ld hl, (ws+1317)
	exx
	ld hl, (ws+1319)
	exx
	call f274_MakeArrayT;pe
	ld (ws+1309), hl
	ld d,17
	push de
	ld hl,ws+1321
	call f314_yy_destruc;or
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_65 workspace at ws+1353 length ws+2
f390_reduce_65:
	ld hl, (ws+1321)
	push hl
	ld hl,0
	call f274_MakeArrayT;pe
	ld (ws+1309), hl
	ld d,17
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

c01_c383:
	db 32,105,115,32,110,111,116,32,97,110,32,97,114,114,97,121,0


        ; reduce_66 workspace at ws+1353 length ws+1 CHANGED
f391_reduce_66:
        ld hl, (ws+1313)
        call f237_IsArray
;        ld (ws+1353), a
        or a
        jp nz, c01_070d
        call f80_StartError
        ld hl, (ws+1313)
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c383
        call f9_print
        call f81_EndError
c01_070d:
        ld hl,( ws+1313 )
        ld c,T_base+4
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld (ws+1309), hl
        ret


        ; reduce_67 workspace at ws+1353 length ws+4 CHANGED
f392_reduce_67:
        ld bc,0
        push bc
        ld hl, (ws+1325)
        push hl
        ld hl, (ws+1317)
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f231_AddAlias
;        ld (ws+1355), hl
        ld h,65
        push hl
        ld hl,ws+1321
        call f314_yy_destruc
        ld d,22
        push de
        ld hl,ws+1313
        call f314_yy_destruc
        ret



	; reduce_68 workspace at ws+1353 length ws+2
f393_reduce_68:
	ld de,0
	push de
	ld hl, (ws+1313)
	call f230_AddSymbol
	ld (ws+1309), hl
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
	call f228_LookupSymb;l
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
	ld hl, (ws+1353)
;	call f40_Free
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_Free
	ld hl, (ws+1357)
	ld (ws+1309), hl
	ret


	; reduce_70 workspace at ws+1353 length ws+8
f395_reduce_70:
	ld hl, (ws+1313)
	ld (ws+1353), hl
	ld de,0
	push de
	call f228_LookupSymb;l
	ld (ws+1357), hl
	ld a,h
	or l
	jp nz, c01_0717
	ld de,0
	push de
	ld hl, (ws+1353)
	call f230_AddSymbol
	ld (ws+1357), hl
	jp c01_0713
c01_0717:
	ld hl, (ws+1353)
;	call f40_Free
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_Free
c01_0713:
	ld hl, (ws+1357)
	ld (ws+1309), hl
	ret

;c01_c386:
; db 115,105,109,112,108,101,32,116,121,112,101,32,111,114,32,118,97,114,105,97,98,108,101
; db 32,110,97,109,101,32,101,120,112,101,99,116,101,100,0

        ; reduce_71 workspace at ws+1353 length ws+0 CHANGED
f396_reduce_71:
        ld hl, (ws+1313)
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetByte
        cp 28
        jp nz, c01_0719
        ld hl,( ws+1313 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c			;HL=yyrhs[0].yy143.vardata
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
;        ld (ws+1309), hl
	ld	(ws+1309),bc	;yylhs.yy79 := yyrhs[0].yy143.vardata.type;
        ret
c01_0719:
        cp 30
        jp nz, c01_071a
        ld hl,( ws+1313 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld (ws+1309), bc
        ret
c01_071a:
;        ld hl,c01_c386
;        jp f82_SimpleError
	ld a,28
	jp SimpleErrorNr


	; reduce_72 workspace at ws+1353 length ws+0
f397_reduce_72:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

;c01_c387:
; db 115,117,98,114,111,117,116,105,110,101,115,32,99,97,108,108,101,100,32,97,115,32
; db 102,117,110,99,116,105,111,110,115,32,109,117,115,116,32,104,97,118,101,32
; db 101,120,97,99,116,108,121,32,111,110,101,32,111,117,116,112,117,116,32
; db 112,97,114,97,109,101,116,101,114,0


        ; reduce_73 workspace at ws+1353 length ws+24 CHANGED
f398_reduce_73:
        ld hl, (current_call)
        inc hl
        inc hl
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a
        ld (ws+1353), hl	;intfsubr
        ld ix, (current_call)
        ld (ix+11), 1
        call f304_i_check_su

;        ld ix, (ws+1353)
;        ld a, (ix+27)
	ld hl,(ws+1353)
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

        cp 1
        jp z, c1c_0005
;        ld hl,c01_c387
;        call f82_SimpleError
	ld a,29
	call SimpleErrorNr
c1c_0005:
        ld hl, (ws+1353)
        push hl
        xor a
        call f106_GetOutputP
        ld (ws+1357), hl
;        ld hl,( ws+1357 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c			;HL=param.vardata
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
	ld	h,b
	ld	l,c
        ld (type), hl		;param.vardata.type
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( width ),bc
        ld hl, (current_subr)
;        inc hl
;        inc hl
;        inc hl
;        inc hl
        push hl			;&current_subr.namespace
        ld hl,0			;0 as string
        call f230_AddSymbol
        ld (ws+1362), hl
        ld hl, (current_subr)
        push hl
        ld hl, (ws+1362)
        push hl
        ld hl, (type)
        call f272_InitVariab
        ld hl, (ws+1313)
        push hl
        ld hl, (current_call)
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a
        push hl
        ld hl, (ws+1353)
        call f148_MidCall
;        ld (ws+1364), hl
        call f269_Generate
        ld a, (width)
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
;        ld (ws+1368), hl
        ld a, (width)
        push af
        call f153_MidDeref
        ld (ws+1370), hl
        ld a, (width)
        push af
        ld hl, (ws+1366)
        push hl
        ld hl, (ws+1370)
        call f152_MidStore
;        ld (ws+1372), hl
        call f269_Generate
        call f305_i_end_call
        ld hl, (ws+1362)
        push hl
        ld hl,0
        call f154_MidAddress
;        ld (ws+1374), hl
        ld a, (width)
        push af
        call f153_MidDeref
        ld (ws+1309), hl
        ld c,N_type
        ld de,( type )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        jp _PutWord


;c01_c388:
; db 115,117,98,114,111,117,116,105,110,101,32,114,101,113,117,105,114,101,115,32,111
; db 117,116,112,117,116,32,97,114,103,117,109,101,110,116,115,0


	; reduce_74 workspace at ws+1353 length ws+4
f399_reduce_74:
	ld hl, (current_call)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl	;intfsubr
	call f304_i_check_su;_call_args

;	ld ix, (ws+1353)
;	ld a, (ix+27)
	ld hl,(ws+1353)
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

	or a
	jp z, c01_0724
;	ld hl,c01_c388
;	call f82_SimpleError
	ld a,30
	call SimpleErrorNr
c01_0724:
	ld hl, (ws+1317)
	push hl
	ld hl, (current_call)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1353)
	call f148_MidCall
;	ld (ws+1355), hl
	call f269_Generate
	call f305_i_end_call
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

;c01_c389:
;        db 116,111,111,32,109,97,110,121,32,111,117,116,112,117,116
;	db 32,97,114,103,117,109,101,110,116,115,0
;c01_c390:
;        db 121,111,117,32,99,97,110,32,111,110,108,121,32,97,115,115
;	db 105,103,110,32,116,111,32,108,118,97,108,117,101,115,0
;c01_c391:
;        db 116,111,111,32,102,101,119,32,111,117,116,112,117,116,32
;	db 97,114,103,117,109,101,110,116,115,0


        ; reduce_75 workspace at ws+1353 length ws+24 CHANGED
f400_reduce_75:
        ld hl, (current_call)
        inc hl
        inc hl
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a
        ld (ws+1353), hl	;intfsubr
        call f304_i_check_su
        ld hl, (ws+1317)
        push hl
        ld hl, (current_call)
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a
        push hl
        ld hl, (ws+1353)
        call f148_MidCall
;        ld (ws+1355), hl
        call f269_Generate

;        ld ix, (ws+1353)
;        ld a, (ix+27)
	ld hl,(ws+1353)
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

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
;        ld hl,c01_c389
;        call f82_SimpleError
	ld a,31
	call SimpleErrorNr
c01_072f:
        ld a, (ws+1357)
        dec a
        ld (ws+1357), a
        ld hl, (ws+1353)
        push hl
        call f106_GetOutputP
        ld (ws+1363), hl	;param
        ld hl,( ws+1359 )
        ld c,N_left
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1365 ),bc
        ld hl,( ws+1359 )
        ld c,N_left
        ld de,0
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1359 )
        ld c,N_right
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1359 ),bc
        ld hl,( ws+1365 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( type ),bc
        ld hl, (type)
        call f74_IsPtr
;        ld (ws+1368), a
        or a
        jp nz, c01_0734
;        ld hl,c01_c390
;        call f82_SimpleError
	ld a,32
	call SimpleErrorNr
c01_0734:
        ld hl,( ws+1363 )	;param
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( vardata ),bc	;param.vardata
;        ld hl, (vardata)
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	h,b
	ld	l,c
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
	ld	(type79),bc	;type79=param.vardata.type
	ld	h,b
	ld	l,c		;HL=param.vardata.type
        call f273_MakePointe
        ld (ws+1368), hl
        ld hl, (ws+1365)
        push hl
        ld hl, (ws+1368)
        call f282_CheckExpre
;        ld hl, (vardata)
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	hl,(type79)	;param.vardata.type
        call f233_CheckNotPa
        ld hl, (type)
        call f233_CheckNotPa
;        ld hl, (vardata)
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
;        ld (type), hl
;        ld hl,( type )
	ld	hl,(type79)	;param.vardata.type
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        ld (ws+1370), a		;w := param.vardata.type.width as uint8;
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
;        ld (ws+1375), hl
        call f269_Generate
        ld a, (ws+1358)
        inc a
        ld (ws+1358), a
				;param := param.vardata.next_parameter;
;        ld ix, (vardata)
;        ld l, (ix+4)
;        ld h, (ix+5)
	ld	hl,(vardata)
	ld	c,V_nextparam
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
        ld (ws+1363), bc
        jp c01_0725
c01_072a:
        ld hl, (ws+1329)
        call f69_Discard
        ld a, (ws+1358)
        ld b,a

;        ld ix, (ws+1353)
;        ld a, (ix+27)
	push bc
	ld hl,(ws+1353)
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte
	pop bc

        cp b
        jp z, c01_0739
;        ld hl,c01_c391
;        call f82_SimpleError
	ld a,33
	call SimpleErrorNr
c01_0739:
        call f305_i_end_call
        ld h,2
        push hl
        ld hl,ws+1325
        call f314_yy_destruc
        ld d,22
        push de
        ld hl,ws+1313
        call f314_yy_destruc
        ret


c01_c392:
	db 101,120,112,101,99,116,101,100,32,0
c01_c393:
	db 32,116,111,32,98,101,32,97,32,115,117,98,114,111,117,116,105,110,101,0


        ; reduce_76 workspace at ws+1353 length ws+11 CHANGED
f401_reduce_76:
        ld hl, (ws+1313)
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( type139 ),bc
        ld hl, (type139)
        call f238_IsSubrouti
;        ld (ws+1353), a
        or a
        jp nz, c01_073e
        call f80_StartError
        ld hl,c01_c392
        call f9_print
        ld hl,( type139 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c393
        call f9_print
        call f81_EndError
c01_073e:
        ld hl,12
        call f75_InternalAll
        ld (ws+1356), hl
        ld hl, (current_call)
        ld ix, (ws+1356)
        ld (ix+4), l
        ld (ix+5), h
        ld hl,( type139 )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1358 ),bc
        ld de, (ws+1313)
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
        call f105_GetInputPa
;        ld (ws+1360), hl
        ld ix, (ws+1356)
        ld (ix+6), l
        ld (ix+7), h
        ld hl, (ws+1358)
        push hl
        xor a
        call f106_GetOutputP
;        ld (ws+1362), hl
        ld ix, (ws+1356)
        ld (ix+8), l
        ld (ix+9), h
        push ix
        pop hl
        ld (current_call), hl
        ret


	; reduce_77 workspace at ws+1353 length ws+0
f402_reduce_77:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_78 workspace at ws+1353 length ws+2
f403_reduce_78:
	call f125_MidEnd
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_79 workspace at ws+1353 length ws+0
f404_reduce_79:
	ld hl, (ws+1313)
	ld (ws+1309), hl
	ret

        ; reduce_80 workspace at ws+1353 length ws+2 CHANGED
f405_reduce_80:
        ld hl, (ws+1313)
        ld c,N_left
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f69_Discard
        ld hl, (ws+1321)
        ld (ws+1353), hl
        ld hl,( ws+1313 )
        ld c,N_left
        ld de,( ws+1353 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1313)
        ld (ws+1309), hl
        ld h,45
        push hl
        ld hl,ws+1317
        call f314_yy_destruc
        ret

c01_c394:
        db 116,111,111,32,109,97,110,121,32,112,97,114,97,109,101,116,101
	db 114,115,32,105,110,32,99,97,108,108,32,116,111,32,0

        ; reduce_81 workspace at ws+1353 length ws+7 CHANGED
f406_reduce_81:
        ld hl, (current_call)
        inc hl
        inc hl
        ld c,(hl)
        inc hl
        ld b,(hl)
	ld (intfsubr),bc
	inc hl
	inc hl
	inc hl
	ld c,(hl)
	inc hl
	ld b,(hl)
        ld (ws+1353), bc	;param
        ld a,b
        or c
        jp nz, c01_0743
        call f80_StartError
        ld hl,c01_c394
        call f9_print

;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a

	ld c,U_symbol
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c
        ld (sym), hl
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f9_print_vp
        call f81_EndError
c01_0743:
	ld hl,(ws+1353)		;param == current_call.input_parameter
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( vardata ),bc	;current_call.input_parameter.vardata
;        ld ix, (vardata)
;        ld l, (ix+4)
;        ld h, (ix+5)		;HL=vardata.next_parameter
	ld	h,b
	ld	l,c
	ld	c,V_nextparam
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC=current_call.input_parameter.vardata.next_parameter
        ld ix, (current_call)
        ld (ix+6), c
        ld (ix+7), b		;current_call.input_parameter := current_call.input_parameter.vardata.next_parameter;
        ld hl, (ws+1313)	;yyrhs[0].yy139
        push hl
        ld hl, (vardata)
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC=param.vardata.type
	ld	h,b
	ld	l,c
	ld	(type),hl	;type=param.vardata.type
        call f282_CheckExpre
;        ld hl, (vardata)
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
	ld	hl,(type)
        call f233_CheckNotPa
        ld hl, (ws+1313)
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f233_CheckNotPa
        ld ix, (current_call)
        ld a, (ix+10)
        inc a
        ld (ix+10), a
        ld hl, (ws+1313)
        call f172_NodeWidth
        ld (ws+1355), a
        call f125_MidEnd
;        ld (ws+1356), hl
        ld a, (ws+1355)
        push af
        push hl
        ld hl, (ws+1313)
        push hl
        ld hl, (current_call)
        inc hl
        inc hl
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a
        push hl
        ld hl, (ws+1353)
        push hl
;        ld hl, (current_call)
;        inc hl
;        inc hl
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
;        push hl
;        pop ix
;        ld a, (ix+26)
	ld hl,(intfsubr)
	ld c,U_numi
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte
        ld ix, (current_call)
        ld b, (ix+10)
        sub b
        call f126_MidArg
        ld (ws+1309), hl
        ret


	; reduce_82 workspace at ws+1353 length ws+2
f407_reduce_82:
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1325)
	call f139_MidPair
	ld (ws+1309), hl
	ld h,45
	push hl
	ld hl,ws+1321
	call f314_yy_destruc;or
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_83 workspace at ws+1353 length ws+2
f408_reduce_83:
	ld hl, (ws+1313)
	push hl
	ld hl,0
	call f139_MidPair
	ld (ws+1309), hl
	ret


	; reduce_84 workspace at ws+1353 length ws+2
f409_reduce_84:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	call f139_MidPair
	ld (ws+1309), hl
	ld h,45
	push hl
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_85 workspace at ws+1353 length ws+2
f410_reduce_85:
	ld hl, (ws+1313)
	call f244_UndoLValue
	ld (ws+1309), hl
	ret


	; reduce_86 workspace at ws+1353 length ws+4
f411_reduce_86:
;	ld ix, (preparing_subr)
;	ld a, (ix+28)
;	or 2
;	ld (ix+28), a
;	push ix
;	pop hl
	ld hl, (preparing_subr)
	ld c,U_flags
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte
	or 2
	ld hl, (preparing_subr)
	ld c,U_flags
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutByte
	ld hl, (preparing_subr)

	call f217_EmitterEmi;SubroutineFlags
	ld hl, (preparing_subr)
	ld (current_subr), hl
	call f120_MidStartsu;
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (current_subr)
	call f129_MidEndsub
;	ld (ws+1355), hl
	call f269_Generate
	ld hl, (current_subr)
	call f280_ReportWork;paces

;	ld hl, (current_subr)
;	inc hl
;	inc hl
;	ld a,(hl)
;	inc hl
;	ld h,(hl)
;	ld l,a
;	ld (current_subr), hl
	ld hl, (current_subr)
	ld c,U_parent
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld (current_subr),bc

	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

;c01_c395:
;	db 116,121,112,101,32,105,115,32,110,111,116,32,97,110,32,105,110,116,101,114,102,97,99,101,0


	; not_an_interface workspace at ws+1358 length ws+0
f413_not_an_int:      
;	ld hl,c01_c395
;!!!	call f82_SimpleError
;	jp f82_SimpleError ;!!!
;!!!	ret
	ld a,34
	jp SimpleErrorNr

	; reduce_87 workspace at ws+1353 length ws+5
f412_reduce_87:
	ld hl, (ws+1313)
	call f238_IsSubrouti;e
;	ld (ws+1353), a
	or a
	jp nz, c01_0748
	call f413_not_an_int;rface
c01_0748:
	ld hl, (ws+1313)
	ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c
	ld (ws+1354), hl	;intfsubr

;	push hl
;	pop ix
;	ld a, (ix+28)
	ld c,U_flags
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

	and 2
	or a
	jp nz, c01_074d
	call f413_not_an_int;rface
c01_074d:

	;preparing_subr.flags := preparing_subr.flags | SUB_IS_IMPLEMENTATION;

;	ld ix, (preparing_subr)
;	ld a, (ix+28)
;	or 4
;	ld (ix+28), a
	ld hl,(preparing_subr)
	ld c,U_flags
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte
	or 4
	ld hl,(preparing_subr)
	ld c,U_flags
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutByte

	;preparing_subr.intfsubr := intfsubr;

;	ld hl, (ws+1354)
;	ld (ix+12), l
;	ld (ix+13), h
	ld hl,(preparing_subr)
	ld de,(ws+1354)		;intfsubr
	ld c,U_intfsubr
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutWord

	;preparing_subr.type := yyrhs[0].yy79;

;	ld hl, (ws+1313)
;	ld (ix+10), l
;	ld (ix+11), h
	ld hl,(preparing_subr)
	ld de,(ws+1313)		;yyrhs[0].yy79
	ld c,U_type
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutWord

	ld hl, (current_subr)
	push hl
	ld hl, (ws+1354)
	call f212_EmitterRef;renceSubroutine
	ld hl, (ws+1354)
	push hl
	ld hl, (preparing_subr)
	call f212_EmitterRef;renceSubroutine

	;preparing_subr.num_input_parameters := intfsubr.num_input_parameters;

;	ld ix, (ws+1354)
;	ld a, (ix+26)
;	ld ix, (preparing_subr)
;	ld (ix+26), a
	ld hl,(ws+1354)
	ld c,U_numi
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte
	ld hl,(preparing_subr)
	ld c,U_numi
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	push af
	call _PutByte
	pop af

;	ld a, (ix+26)

	or a
	jp z, c01_0752

;	ld ix, (ws+1354)
;	ld l, (ix+4)
;	ld h, (ix+5)
;	push hl
	ld hl,(ws+1354)		;intfsubr
	ld c,U_namespace	;offset of namespace.first
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	push bc

	ld hl, (preparing_subr)
	call f278_CopyParame;erList
c01_0752:
	;preparing_subr.num_output_parameters := intfsubr.num_output_parameters;

;	ld ix, (ws+1354)
;	ld a, (ix+27)
;	ld ix, (preparing_subr)
;	ld (ix+27), a
	ld hl,(ws+1354)
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte
	ld hl,(preparing_subr)
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	push af
	call _PutByte
	pop af

;	ld a, (ix+27)

	or a
	jp z, c01_0757
	ld hl, (ws+1354)
	push hl
	xor a
	call f106_GetOutputP;rameter
;	ld (ws+1356), hl
	push hl
	ld hl, (preparing_subr)
	call f278_CopyParame;erList
c01_0757:
	ld hl, (preparing_subr)
	call f215_EmitterEmi;InputParameters
	ld hl, (preparing_subr)
	call f216_EmitterEmi;OutputParameter;
	ld hl, (preparing_subr)
	call f217_EmitterEmi;SubroutineFlags
	ld d,68
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_88 workspace at ws+1353 length ws+0
f414_reduce_88:
;	ld ix, (preparing_subr)
;	ld l, (ix+14)
;	ld h, (ix+15)
;	push hl
	ld hl,(preparing_subr)
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	push bc

	ld hl, (ws+1317)
	call f210_EmitterDec;areExternalSubr;utine
	ld h,11
	push hl
	ld hl,ws+1325
	call f314_yy_destruc;or
	ld b,16
	push bc
	ld hl,ws+1321
	call f314_yy_destruc;or
	ld a,4
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	global _ZeroFillType

_ZeroFillType:
	xor a
	ld b,17		;type size
1:	ld (hl),a
	inc hl
	djnz 1b
	ret


        ; reduce_89 workspace at ws+1353 length ws+8 CHANGED
f415_reduce_89:
        ld hl,tmp_type
        ld (ptmp_type), hl
        ld hl,SUBR_SIZE
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
        call f75_ExternalAl
        ld (preparing_subr), hl

	;preparing_subr.namespace.parent := &current_subr.namespace;

;        ld hl, (current_subr)
;        inc hl
;        inc hl
;        inc hl
;        inc hl
;        ld ix, (preparing_subr)
;        ld (ix+8), l
;        ld (ix+9), h
	ld hl,(preparing_subr)
	ld de,(current_subr)	;&current_subr.namespace
	ld c,U_namespace+4	;offset of namespace.parent
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutWord

	;preparing_subr.parent := current_subr;

;        ld de, (current_subr)
;        push ix
;        pop hl
;        inc hl
;        inc hl
;        ld (hl),e
;        inc hl
;        ld (hl),d
	ld hl,(preparing_subr)
	ld de,(current_subr)
	ld c,U_parent
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutWord

	;preparing_subr.id := AllocSubrId();

        call f248_AllocSubrI
;        ld (ws+1355), hl

;        ld ix, (preparing_subr)
;        ld (ix+14), l
;        ld (ix+15), h
	ex de,hl
	ld hl,(preparing_subr)
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutWord

        call f72_AllocNewTyp
        ld (ws+1359), hl	;type
        ld hl,( ptmp_type )
        call _ZeroFillType
        ld hl,( intptr_type )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( width ),bc
        ld hl,( intptr_type )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        ld ( alignment ),a
        ld hl,( intptr_type )
        ld c,T_stride
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( stride ),bc
        ld a,6
        ld (tmp_type+T_kind), a
        ld hl, (width)
        ld (tmp_type+T_width), hl
        ld a, (alignment)
        ld (tmp_type+T_alignment), a
        ld hl, (stride)
        ld (tmp_type+T_stride), hl
        ld hl, (preparing_subr)
        ld (tmp_type+T_base), hl
        ld de,( ptmp_type )
        ld hl,( ws+1359 )
        ld c, TYPE_SIZE
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _WriteMem

	;preparing_subr.type := type;

;        ld hl, (ws+1359)
;        ld ix, (preparing_subr)
;        ld (ix+10), l
;        ld (ix+11), h
	ld hl,(preparing_subr)
	ld de,(ws+1359)
	ld c,U_type
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutWord
	
	;preparing_subr.intfsubr := preparing_subr;

;        push ix
;        pop hl
;        ld (ix+12), l
;        ld (ix+13), h
	ld hl,(preparing_subr)
	ld de,(preparing_subr)
	ld c,U_intfsubr
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutWord

        ld hl, (ws+1313)
        ld (sym), hl
;        ld hl,( sym )
        ld c,S_kind
        ld a,30
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte
        ld hl,( sym )
        ld c,S_base
        ld de,( ws+1359 )
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1359 )
        ld c,T_symbol
        ld de,( sym )
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord

	;preparing_subr.symbol := yyrhs[0].yy143;

        ld de, (ws+1313)
;        ld hl, (preparing_subr)
;        ld (hl),e
;        inc hl
;        ld (hl),d
	ld hl,(preparing_subr)
	ld c,U_symbol
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutWord

        ld hl, (preparing_subr)
        call f209_EmitterDec
        ld hl, (ws+1313)
        ld (ws+1309), hl
        ret


;c01_c396:
;	db 110,111,116,32,97,32,115,117,98,114,111,117,116,105,110,101,0
;c01_c397:
;	db 115,117,98,114,111,117,116,105,110,101,32,97,108,114,101,97,100,121,32,105
; db 109,112,108,101,109,101,110,116,101,100,0
;c01_c398:
; db 99,97,110,110,111,116,32,105,109,112,108,101,109,101,110,116,32,115,117,98
; db 114,111,117,116,105,110,101,32,104,101,114,101,0


        ; reduce_90 workspace at ws+1353 length ws+1 CHANGED
f416_reduce_90:
        ld hl, (ws+1313)
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetByte
        ld ( kind ),a
        ld hl,( ws+1313 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( type ),bc
        ld hl, (type)
        call f238_IsSubrouti
        ld (ws+1353), a
        ld a, (kind)
        cp 30
        jp nz, c01_075d
        ld a, (ws+1353)
        or a
        jp nz, c01_075e
c01_075d:
;        ld hl,c01_c396
;        call f82_SimpleError
	ld a,35
	call SimpleErrorNr
c01_075e:
        ld hl,( type )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld (preparing_subr), hl

;        push hl
;        pop ix
;        ld a, (ix+28)
	ld hl,(preparing_subr)
	ld c,U_flags
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

        and 1
        or a
        jp z, c01_0764
;        ld hl,c01_c397
;        call f82_SimpleError
	ld a,36
	call SimpleErrorNr
c01_0764:
;        ld hl, (preparing_subr)
;        inc hl
;        inc hl
;        ld e,(hl)
;        inc hl
;        ld d,(hl)
;        ld hl, (current_subr)
;        and a
;        sbc hl,de
	ld hl,(preparing_subr)
	ld c,U_parent
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
        ld hl, (current_subr)
        and a
        sbc hl,bc

        jp z, c01_0769
;        ld hl,c01_c398
;        call f82_SimpleError
	ld a,37
	call SimpleErrorNr
c01_0769:
        ld h,25
        push hl
        ld hl,ws+1317
        call f314_yy_destruc
        ret


	; reduce_91 workspace at ws+1353 length ws+6
f417_reduce_91:
	ld hl,6
	call f75_InternalAll;c
	ld (ws+1355), hl
	ld hl, (current_subr_def)
	ld ix, (ws+1355)
	ld (ix+4), l
	ld (ix+5), h
	ld de, (break_label)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld bc,0
	ld (break_label), bc
	ld de, (continue_label)
	ld hl, (ws+1355)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld (continue_label), ix
	ld hl, (ws+1355)
	ld (current_subr_def), hl
	ld hl, (preparing_subr)
	ld (current_subr), hl
	call f120_MidStartsu;
;	ld (ws+1357), hl
	call f269_Generate

	;current_subr.flags := current_subr.flags | SUB_HAS_IMPL;

;	ld ix, (current_subr)
;	ld a, (ix+28)
;	or 1
;	ld (ix+28), a
	ld hl,(current_subr)
	ld c,U_flags
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte
	or 1
	ld hl,(current_subr)
	ld c,U_flags
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	jp _PutByte


	; reduce_92 workspace at ws+1353 length ws+6
f418_reduce_92:
	ld hl, (current_subr)
	call f129_MidEndsub
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (current_subr)
	call f280_ReportWork;paces
	ld hl, (current_subr_def)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (break_label), hl
	ld hl, (current_subr_def)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (continue_label), hl
	ld hl, (current_subr_def)
	ld (ws+1355), hl
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld (current_subr_def), hl
	ld hl, (ws+1355)
	call f40_Free
	ld hl, (current_subr)
	ld (ws+1357), hl	;subr

	;current_subr := subr.parent;

;	inc hl
;	inc hl
;	ld a,(hl)
;	inc hl
;	ld h,(hl)
;	ld l,a
;	ld (current_subr), hl
	ld c,U_parent
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld (current_subr),bc

	ld hl, (ws+1357)
	call f276_DestructSu;routineContents
	ld d,25
	push de
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_93 workspace at ws+1353 length ws+0
f419_reduce_93:

	;preparing_subr.num_output_parameters := 0;

;	ld ix, (preparing_subr)
;	ld (ix+27), 0
;	push ix
;	pop hl
	ld hl,(preparing_subr)
	xor a
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutByte
	ld hl,(preparing_subr)

	call f215_EmitterEmi;InputParameters
	ld hl, (preparing_subr)
;!!!	call f216_EmitterEmi;OutputParameter;
	jp f216_EmitterEmi;OutputParameter ;!!!
;!!!	ret


	; reduce_94 workspace at ws+1353 length ws+1
f420_reduce_94:
	ld hl, (ws+1313)
	call f104_CountParam;ters
;	ld (ws+1353), a

	;preparing_subr.num_output_parameters := CountParameters(yyrhs[0].yy143);

;	ld ix, (preparing_subr)
;	ld (ix+27), a
;	push ix
;	pop hl
	ld hl,(preparing_subr)
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutByte
	ld hl,(preparing_subr)

	call f215_EmitterEmi;InputParameters
	ld hl, (preparing_subr)
	call f216_EmitterEmi;OutputParameter;
	ld h,6
	push hl
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_95 workspace at ws+1353 length ws+1
f421_reduce_95:
	ld hl, (ws+1313)
	call f104_CountParam;ters
;	ld (ws+1353), a

	;preparing_subr.num_input_parameters := CountParameters(yyrhs[0].yy143);

;	ld ix, (preparing_subr)
;	ld (ix+26), a
	ld hl,(preparing_subr)
	ld c,U_numi
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	jp _PutByte


	; reduce_96 workspace at ws+1353 length ws+0
f422_reduce_96:
	ld bc,0
	ld (ws+1309), bc
	ld a,4
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_97 workspace at ws+1353 length ws+0
f423_reduce_97:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld a,4
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_98 workspace at ws+1353 length ws+0
f424_reduce_98:
	ld hl, (ws+1313)
	ld (ws+1309), hl
	ret


        ; reduce_99 workspace at ws+1353 length ws+0 CHANGED
f425_reduce_99:
        ld hl, (ws+1321)
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( vardata ),bc	;yyrhs[2].yy143.vardata
				;yyrhs[2].yy143.vardata.next_parameter := yyrhs[0].yy143;
;        ld hl, (ws+1313)	;yyrhs[0].yy143
;        ld ix, (vardata)
;        ld (ix+4), l
;        ld (ix+5), h
	ld	h,b
	ld	l,c		;HL=yyrhs[2].yy143.vardata
	ld	de,(ws+1313)	;yyrhs[0].yy143
	ld	c,V_nextparam
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_PutWord

        ld hl, (ws+1321)
        ld (ws+1309), hl
        ld d,45
        push de
        ld hl,ws+1317
        call f314_yy_destruc
        ret


	; reduce_100 workspace at ws+1353 length ws+2
f426_reduce_100:
	ld hl, (preparing_subr)	;&preparing_subr.namespace
;	inc hl
;	inc hl
;	inc hl
;	inc hl
	push hl
	ld hl, (ws+1321)
	call f230_AddSymbol
	ld (ws+1309), hl
	ld hl, (preparing_subr)
	push hl
	ld hl, (ws+1309)
	push hl
	ld hl, (ws+1313)
	call f272_InitVariab;e
	ld h,6
	push hl
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


        ; reduce_101 workspace at ws+1353 length ws+2 CHANGED
f427_reduce_101:
        ld hl,( current_type )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        ld ( alignment ),a
        ld hl,( current_type )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( width ),bc
        ld hl, (width)
        push hl
        ld a, (alignment)
        call f250_ArchAlignU
        ld (stride), hl
        ld hl,( current_type )
        ld c,T_stride
        ld de,( stride )
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord
        ld b,65
        push bc
        ld hl,ws+1325
        call f314_yy_destruc
        ld a,10
        push af
        ld hl,ws+1317
        call f314_yy_destruc
        ld h,20
        push hl
        ld hl,ws+1313
        call f314_yy_destruc
        ret

        ; reduce_102 workspace at ws+1353 length ws+2 CHANGED
f428_reduce_102:
        ld hl, (ws+1313)
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetByte
        cp 30
        jp nz, c01_076b
        ld hl,( ws+1313 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld (current_type), hl
        ld c,T_kind
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        cp 1
        jp z, c01_0770
        call f306_SymbolRede
c01_0770:
        jp c01_076a
c01_076b:
        or a
        jp nz, c01_0771
        call f72_AllocNewTyp
        ld (current_type), hl
        ld hl,( ws+1313 )
        ld c,S_kind
        ld a,30
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte
        ld hl,( ws+1313 )
        ld c,S_base
        ld de,( current_type )
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld hl,( current_type )
        ld c,T_symbol
        ld de,( ws+1313 )
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord
        jp c01_076a
c01_0771:
        call f306_SymbolRede
c01_076a:
        ld hl,( current_type )
        ld c,T_kind
        ld a,5
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        jp _PutByte


c01_c399:
	db 32,105,115,32,110,111,116,32,97,32,114,101,99,111,114,100,32,116,121,112,101,0

        ; reduce_103 workspace at ws+1353 length ws+1 CHANGED
f429_reduce_103:
        ld hl, (ws+1313)
        call f233_CheckNotPa
        ld hl, (ws+1313)
        call f242_IsRecord
;        ld (ws+1353), a
        or a
        jp nz, c01_0776
        call f80_StartError
        ld hl,( ws+1313 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c399
        call f9_print
        call f81_EndError
c01_0776:
			;current_type.alignment := yyrhs[0].yy79.alignment;
        ld hl,( ws+1313 )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        ld hl,( current_type )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutByte
			;current_type.width := yyrhs[0].yy79.width;
        ld hl,( ws+1313 )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( width ),bc
        ld hl,( current_type )
        ld c,T_width
        ld de,( width )
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord
			;current_type.recordtype.namespace.parent := &yyrhs[0].yy79.recordtype.namespace;
        ld hl,( current_type )
        ld c,T_base+4 ; #offset of recordtype.namespace.parent in Type
        ld de,( ws+1313 ) ;&yyrhs[0].yy79.recordtype.namespace;
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        jp _PutWord



        ; reduce_104 workspace at ws+1353 length ws+3 CHANGED
f430_reduce_104:
        ld hl, (ws+1317)
        call f233_CheckNotPa
        ld hl,( ws+1317 )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        ld ( alignment ),a
        ld hl,( current_type )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        ld ( align ),a
;        ld a, (align)
;        push af
;        ld a, (alignment)
;        ld b,a
;        pop af
	ld a, (alignment)
	ld b,a
	ld a, (align)
        cp b
        jp nc, c01_077b
        ld hl,( current_type )
        ld c,T_alignment
        ld a,( alignment )
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutByte
c01_077b:
        ld hl, (ws+1329)
        ld c,S_kind
        ld a,28
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte
        ld hl,VARDATA_SIZE
;        call f75_InternalAll
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	f75_ExternalAl
        ld (vardata), hl
        ld hl,( ws+1329 )
        ld c,S_base
        ld de,( vardata )
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
				;yyrhs[4].yy143.vardata.type := yyrhs[1].yy79;
        ld de, (ws+1317)
        ld hl, (vardata)
;        ld (hl),e
;        inc hl
;        ld (hl),d
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_PutWord

        ld hl, (current_type)
        push hl
        ld hl, (ws+1329)
        push hl
        ld hl, (ws+1325)
        call f254_ArchInitMe
        ld h,6
        push hl
        ld hl,ws+1321
        call f314_yy_destruc
        ld d,22
        push de
        ld hl,ws+1313
        call f314_yy_destruc
        ret


        ; reduce_105 workspace at ws+1353 length ws+0 CHANGED
f431_reduce_105:
        ld hl,( current_type )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld (ws+1309),bc
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
	call f314_yy_destruc;or
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


        ; reduce_107 workspace at ws+1353 length ws+3
f433_reduce_107:
        ld hl, (current_type)
        push hl
        ld hl, (ws+1313)
        call f230_AddSymbol
        ld (ws+1309), hl
        ld hl,( current_type )
        ld c,T_base+6		;#offset of recordtype.members
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        inc a
        ld hl,( current_type )
        ld c,T_base+6		;#offset of recordtype.members
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        jp _PutByte



	; reduce_108 workspace at ws+1353 length ws+2
f434_reduce_108:
	call f308_CheckEndOf;nitialiser
	call f123_MidEndinit
;	ld (ws+1353), hl
	call f269_Generate
	ld h,31
	push hl
	ld hl,ws+1325
	call f314_yy_destruc;or
	ld d,32
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

;c01_c400:
;	db 115,116,97,116,105,99,32,105,110,105,116,105,97,108,105,115,101,114,115,32,111
; db 110,108,121,32,119,111,114,107,32,111,110,32,97,114,114,97,121,115,32,111
; db 114,32,114,101,99,111,114,100,115,0
;c01_c401:
;	db 121,111,117,32,99,97,110,39,116,32,115,116,97,116,105,99,97,108,108,121,32,105
; db 110,105,116,105,97,108,105,115,101,32,97,110,32,105,110,104,101,114,105
; db 116,101,100,32,114,101,99,111,114,100,0

        ; reduce_109 workspace at ws+1353 length ws+10 CHANGED
f435_reduce_109:
        ld hl, (ws+1317)
        call f233_CheckNotPa
        ld hl,( ws+1325 )
        ld c,S_kind
        ld a,28
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte
        ld hl,VARDATA_SIZE
;        call f75_InternalAll
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	f75_ExternalAl
        ld (vardata), hl
				;yyrhs[3].yy143.vardata := InternalAlloc(@bytesof VarSymbol) as [VarSymbol];
        ld hl,( ws+1325 )			;yyrhs[3].yy143
        ld c,S_base
        ld de,( vardata )
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord

        ld de, (ws+1317)
;        ld hl, (vardata)
;        ld (hl),e
;        inc hl
;        ld (hl),d
	ld	(f214_vardatabuf+V_type),de	;yyrhs[3].yy143.vardata.type := yyrhs[1].yy79;

        ld de, (current_subr)
;        ld hl, (vardata)
;        inc hl
;        inc hl
;        ld (hl),e
;        inc hl
;        ld (hl),d
	ld	(f214_vardatabuf+V_subr),de	;yyrhs[3].yy143.vardata.subr := current_subr;

;        ld ix, (vardata)
;        ld (ix+8), 255
	ld	a,255
	ld	(f214_vardatabuf+V_wsid),a	;yyrhs[3].yy143.vardata.wsid := WSID_STATIC;

        call f247_AllocLabel
;        ld ix, (vardata)
;        ld (ix+6), l
;        ld (ix+7), h
	ld	(f214_vardatabuf+V_offset),hl	;yyrhs[3].yy143.vardata.offset := AllocLabel();

	ld	bc,0
	ld	(f214_vardatabuf+V_nextparam),bc;yyrhs[3].yy143.vardata.nextparam := 0;

						;now write the vardata
IF	CHECK_TYPE
	ld	b,VARDATA_TYPE
ENDIF
	ld	c,VARDATA_SIZE
	ld	de,f214_vardatabuf
	ld	hl,(vardata)
	call	_WriteMem

        ld hl, (ws+1317)
        call f237_IsArray
        ld (ws+1357), a
        ld hl, (ws+1317)
        call f242_IsRecord
        ld (ws+1358), a
        ld a, (ws+1357)
        or a
        jp nz, c01_4350
        ld a, (ws+1358)
        or a
        jp nz, c01_4350
;        ld hl,c01_c400
;        call f82_SimpleError
	ld a,38
	call SimpleErrorNr
c01_4350:
        ld hl, (ws+1317)
        call f242_IsRecord
;        ld (ws+1359), a
        or a
        jp z, c01_4352
        ld hl, (ws+1317)
        ld c,T_base+4
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld a,b
        or c
        jp z, c01_4351
;        ld hl,c01_c401
;        call f82_SimpleError
	ld a,39
	call SimpleErrorNr
c01_4351:
c01_4352:
        ld hl, (ws+1317)
        call f242_IsRecord
;        ld (ws+1360), a
        or a
        jp z, c01_4353
        ld hl,( ws+1317 )
        ld c,T_base+0
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld (current_member),bc
c01_4353:
        ld hl, (ws+1317)
        ld (current_type), hl
        ld hl,0
        ld (current_offset), hl
        ld (current_global_offset), hl
        ld hl, (ws+1325)
        call f113_MidStartin
;        ld (ws+1361), hl
        call f269_Generate
        ld h,6
        push hl
        ld hl,ws+1321
        call f314_yy_destruc
        ld d,2
        push de
        ld hl,ws+1313
        call f314_yy_destruc
        ret


;c01_c402:
;	db 105,110,105,116,105,97,108,105,115,101,114,32,109,117,115,116,32,98,101,32,97,110,32,110,117,109,98,101,114,0
;c01_c403:
;	db 105,110,105,116,105,97,108,105,115,101,114,32,109,117,115,116,32,98,101,32,97,32,115,116,114,105,110,103,0
;c01_c404:
;	db 105,110,105,116,105,97,108,105,115,101,114,32,111,102,32,119,114,111,110,103,32,116,121,112,101,0
;c01_c405:
;	db 105,110,105,116,105,97,108,105,115,101,114,32,111,102,32,119,114,111,110,103,32,116,121,112,101,0


        ; reduce_110 workspace at ws+1353 length ws+16 CHANGED
f436_reduce_110:
        call f313_GetInitedM
        ld (ws+1355), hl
        pop hl
        ld (ws+1353), hl
        ld hl,( ws+1355 )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        call f311_AlignTo
        ld hl,( ws+1355 )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld (ws+1357),bc
        ld hl, (ws+1313)
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        cp 40
        jp nz, c01_0792
        ld hl, (ws+1355)
        call f239_IsNum
        or a
        jp nz, c01_0797
;        ld hl,c01_c402
;        call f82_SimpleError
	ld a,40
	call SimpleErrorNr
c01_0797:
        ld hl,( ws+1313 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( constant ),bc
        ld hl,( ws+1313 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( constant +2),bc
        ld a, (ws+1357)
        push af
        ld hl, (constant)
        exx
        ld hl, (constant+2)
        exx
        call f110_MidInit
        call f269_Generate
        jp c01_0791
c01_0792:
        cp 41
        jp nz, c01_0798
        ld hl,( ws+1355 )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( element ),bc
        ld hl, (ws+1355)
        call f74_IsPtr
        or a
        jp z, c01_079e
        ld de, (element)
        ld hl, (uint8_type)
        and a
        sbc hl,de
        jp z, c01_079f
c01_079e:
;        ld hl,c01_c403
;        call f82_SimpleError
	ld a,41
	call SimpleErrorNr
c01_079f:
        ld hl,( ws+1313 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f160_MidInitstr
        call f269_Generate
        jp c01_0791
c01_0798:
        cp 42
        jp nz, c01_07a1
        ld hl,( ws+1313 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( type ),bc
        ld de, (ws+1355)
        ld hl, (type)
        and a
        sbc hl,de
        jp z, c01_07a6
;        ld hl,c01_c404
;        call f82_SimpleError
	ld a,42
	call SimpleErrorNr
c01_07a6:
        ld hl,( ws+1313 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( sym ),bc
        ld hl,( ws+1313 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( size ),bc
        ld hl, (sym)
        push hl
        ld hl, (size)
        call f136_MidInitadd
        call f269_Generate
        jp c01_0791
c01_07a1:
        cp 43
        jp nz, c01_07a7
        ld hl,( ws+1313 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( type ),bc
        ld de, (ws+1355)
        ld hl, (type)
        and a
        sbc hl,de
        jp z, c01_07ac
;        ld hl,c01_c405
;        call f82_SimpleError
	ld a,43
	call SimpleErrorNr
c01_07ac:
        ld hl,( ws+1313 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f124_MidInitsub
        call f269_Generate
        jp c01_0791
c01_07a7:
        call f303_parser_i_c
c01_0791:
        ld hl, (ws+1313)
        call f69_Discard
        ld de, (current_offset)
        ld hl, (ws+1357)
        add hl,de
        ld (current_offset), hl
        ld de, (current_global_offset)
        ld hl, (ws+1357)
        add hl,de
        ld (current_global_offset), hl
        ret


	; reduce_111 workspace at ws+1353 length ws+0
f437_reduce_111:
	call f308_CheckEndOf;nitialiser
	ld de, (current_offset)
	ld ix, (ws+1321)
	ld l, (ix+4)
	ld h, (ix+5)
	add hl,de
	ld (current_offset), hl
	push ix
	pop hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (current_type), hl
	push ix
	pop hl
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (current_member), hl
	push ix
	pop hl
	call f40_Free
	ld d,32
	push de
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret

;c01_c406:
;	db 98,114,97,99,101,100,32,105,110,105,116,105,97,108,105,115,101,100,32,99,97,110,32,111
; db 110,108,121,32,105,110,105,116,105,97,108,105,115,101,32,97,114,114,97,121,115,32
; db 111,114,32,114,101,99,111,114,100,115,0


        ; reduce_112 workspace at ws+1353 length ws+8 CHANGED
f438_reduce_112:
        call f313_GetInitedM
        ld (ws+1355), hl
        pop hl
        ld (ws+1353), hl
        ld hl,( ws+1355 )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        call f311_AlignTo
        ld hl,6
        call f75_InternalAll
        ld (ws+1309), hl
        ld de, (current_type)
        ld (hl),e
        inc hl
        ld (hl),d
        ld de, (current_member)
        ld hl, (ws+1309)
        inc hl
        inc hl
        ld (hl),e
        inc hl
        ld (hl),d
        ld hl, (current_offset)
        ld ix, (ws+1309)
        ld (ix+4), l
        ld (ix+5), h
        ld hl, (ws+1355)
        ld (current_type), hl
        ld bc,0
        ld (current_offset), bc
        call f242_IsRecord
        or a
        jp z, c01_07b1
        ld hl,( ws+1355 )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld (current_member),bc
	ret
c01_07b1:
        ld hl, (ws+1355)
        call f237_IsArray
        or a
        jp z, c01_07b5
        ld bc,0
        ld (current_member), bc
        ret
c01_07b5:
;        ld hl,c01_c406
;        jp f82_SimpleError
	ld a,44
	jp SimpleErrorNr


	; reduce_113 workspace at ws+1353 length ws+2
f439_reduce_113:
	call f143_MidAsmend
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_114 workspace at ws+1353 length ws+2
f440_reduce_114:
	call f141_MidAsmstar;
;	ld (ws+1353), hl
;!!!	call f269_Generate
	jp f269_Generate ;!!!
;!!!	ret


	; reduce_115 workspace at ws+1353 length ws+2
f441_reduce_115:
	ld hl, (ws+1313)
	call f163_MidAsmtext
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+1313)
;!!!	call f40_Free
;	jp f40_Free ;!!!
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	jp	_Free
;!!!	ret


	; reduce_116 workspace at ws+1353 length ws+2
f442_reduce_116:
	ld hl, (ws+1313)
	exx
	ld hl, (ws+1315)
	exx
	call f167_MidAsmvalu;
;	ld (ws+1353), hl
;!!!	call f269_Generate
	jp f269_Generate ;!!!
;!!!	ret

;c01_c407:
; db 121,111,117,32,99,97,110,32,111,110,108,121,32,101,109,105,116,32,114,101,102,101,114,101,110,99,101
; db 115,32,116,111,32,118,97,114,105,97,98,108,101,115,44,32,115,117,98,114,111,117,116,105,110,101,115
; db 44,32,111,114,32,99,111,110,115,116,97,110,116,115,0


	; bad_reference workspace at ws+1360 length ws+0
f444_bad_refere:   
;	ld hl,c01_c407
;!!!	call f82_SimpleError
;	jp f82_SimpleError ;!!!
;!!!	ret
	ld a,45
	jp SimpleErrorNr

        ; reduce_117 workspace at ws+1353 length ws+7 CHANGED
f443_reduce_117:
        ld hl, (ws+1313)
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetByte
        cp 30
        jp nz, c01_07b7
        ld hl,( ws+1313 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( type ),bc
        ld hl, (type)
        call f238_IsSubrouti
        or a
        jp z, f444_bad_refere
        ld hl,( type )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( subr ),bc
        ld hl, (current_subr)
        push hl
        ld hl, (subr)
        call f212_EmitterRef
        ld hl, (subr)
        call f114_MidAsmsubr
        jp f269_Generate
c01_07b7:
        cp 28
        jp nz, c01_07bd
        ld hl, (ws+1313)
        call f147_MidAsmsymb
        jp f269_Generate
c01_07bd:
        cp 7
        jp nz, f444_bad_refere
        ld hl,( ws+1313 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( constant ),bc
        ld hl,( ws+1313 )
        ld c,S_base+2
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( constant +2),bc
        ld hl, (constant)
        exx
        ld hl, (constant+2)
        exx
        call f167_MidAsmvalu
        jp f269_Generate


	; reduce_123 workspace at ws+1353 length ws+0
f445_reduce_123:
	ld b,26
	push bc
	ld hl,ws+1321
	call f314_yy_destruc;or
	ret


	; reduce_127 workspace at ws+1353 length ws+0
f446_reduce_127:
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_128 workspace at ws+1353 length ws+0
f447_reduce_128:
	ld h,25
	push hl
	ld hl,ws+1329
	call f314_yy_destruc;or
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_129 workspace at ws+1353 length ws+0
f448_reduce_129:
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_130 workspace at ws+1353 length ws+0
f449_reduce_130:
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destruc;or
	ret


	; reduce_136 workspace at ws+1353 length ws+0
f450_reduce_136:
	ld d,45
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_139 workspace at ws+1353 length ws+0
f451_reduce_139:
	ld d,45
	push de
	ld hl,ws+1317
	call f314_yy_destruc;or
	ret


	; reduce_default workspace at ws+1353 length ws+0
f452_reduce_def:    
	ret

f321_yy_reduce_:     
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
	dw f452_reduce_def
	dw f452_reduce_def
	dw f452_reduce_def
	dw f452_reduce_def
	dw f452_reduce_def
	dw f445_reduce_123
	dw f452_reduce_def
	dw f452_reduce_def
	dw f452_reduce_def
	dw f446_reduce_127
	dw f447_reduce_128
	dw f448_reduce_129
	dw f449_reduce_130
	dw f452_reduce_def
	dw f452_reduce_def
	dw f452_reduce_def
	dw f452_reduce_def
	dw f452_reduce_def
	dw f450_reduce_136
	dw f452_reduce_def
	dw f452_reduce_def
	dw f451_reduce_139
;-----------------------------------------
