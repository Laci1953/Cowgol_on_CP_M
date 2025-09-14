	psect text

 global f263_EmitOneInstruction
 global f361_pop_return_address



	; Emitter workspace at ws+3117 length ws+0
f264_Emitter:
;end_f264_Emitter:
	ret


	; emit_0 workspace at ws+3117 length ws+0
f265_emit_0:
	ld hl, (ws+3082)
	ld a,(hl)
	push af
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	call f190_E_store8ic
;end_f265_emit_0:
	ret


	; emit_1 workspace at ws+3117 length ws+0
f266_emit_1:
	ld hl, (ws+3082)
	ld a,(hl)
	push af
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	call f190_E_store8ic
	ld hl, (ws+3082)
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
	ld a,8
	ex de,hl
	exx
	ex de,hl
	exx
	call f483__asr4
	ld a,l
	push af
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	inc a
	call f190_E_store8ic
;end_f266_emit_1:
	ret


	; emit_2 workspace at ws+3117 length ws+0
f267_emit_2:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	call f189_E_store8i
;end_f267_emit_2:
	ret


	; emit_3 workspace at ws+3117 length ws+8
f268_emit_3:
	ld hl, (ws+3084)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
;	ld (ws+3119), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	inc a
	call f189_E_store8i
	call f179_E_exx
	ld hl, (ws+3084)
	call f172_loreg
;	ld (ws+3121), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	add 2
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
;	ld (ws+3123), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	add 3
	call f189_E_store8i
	call f179_E_exx
;end_f268_emit_3:
	ret


	; emit_4 workspace at ws+3117 length ws+4
f269_emit_4:
	ld hl, (ws+3084)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
;	ld (ws+3119), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	inc a
	call f189_E_store8i
;end_f269_emit_4:
	ret


	; emit_5 workspace at ws+3117 length ws+0
f270_emit_5:
	ld bc,128
	push bc
	ld hl, (ws+3082)
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
	call f229_E_lxi
	ld bc,128
	push bc
	ld hl, (ws+3098)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f193_E_store16
	ld bc,128
	push bc
	ld hl, (ws+3082)
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
	ld a,16
	ex de,hl
	exx
	ex de,hl
	exx
	call f483__asr4
	call f229_E_lxi
	ld bc,128
	push bc
	ld hl, (ws+3098)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	inc hl
	inc hl
	call f193_E_store16
;end_f270_emit_5:
	ret


	; emit_6 workspace at ws+3117 length ws+0
f271_emit_6:
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	call f188_E_load8i
;end_f271_emit_6:
	ret


	; emit_7 workspace at ws+3117 length ws+4
f272_emit_7:
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3119), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	inc a
	call f188_E_load8i
;end_f272_emit_7:
	ret


	; emit_8 workspace at ws+3117 length ws+8
f273_emit_8:
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3119), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	inc a
	call f188_E_load8i
	call f179_E_exx
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3121), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	add 2
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3123), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	add 3
	call f188_E_load8i
	call f179_E_exx
;end_f273_emit_8:
	ret


	; emit_9 workspace at ws+3117 length ws+0
f274_emit_9:
	ld hl, (ws+3115)
	jp   f213_E_inc ;	call f213_E_inc
;end_f274_emit_9:
;	ret


	; emit_10 workspace at ws+3117 length ws+0
f275_emit_10:
	ld hl, (ws+3115)
	jp   f214_E_dec ;	call f214_E_dec
;end_f275_emit_10:
;	ret


	; emit_11 workspace at ws+3117 length ws+0
f276_emit_11:
	ld hl, (ws+3094)
	jp   f233_Call ;	call f233_Call
;end_f276_emit_11:
;	ret


	; emit_12 workspace at ws+3117 length ws+0
f277_emit_12:
	ld hl, (ws+3094)
	jp   f233_Call ;	call f233_Call
;end_f277_emit_12:
;	ret


	; emit_13 workspace at ws+3117 length ws+0
f278_emit_13:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+3082)
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
	exx
	push de
	exx
	push de
	ld hl, (ws+3094)
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
	call f260_beqc
;end_f278_emit_13:
	ret


	; emit_14 workspace at ws+3117 length ws+0
f279_emit_14:
	ld hl, (ws+3094)
	jp   f233_Call ;	call f233_Call
;end_f279_emit_14:
;	ret


	; emit_15 workspace at ws+3117 length ws+0
f280_emit_15:
	ld hl,1
	call f202_E_or
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp   f251_E_jumps_jm_jp ;	call f251_E_jumps_jm_jp
;end_f280_emit_15:
;	ret


	; emit_16 workspace at ws+3117 length ws+0
f281_emit_16:
	ld hl, (ws+3098)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f187_E_sta
;end_f281_emit_16:
	ret


	; emit_17 workspace at ws+3117 length ws+2
f282_emit_17:
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3117), hl
	ld h,7
	push hl
	ld hl, (ws+3117)
	call f223_E_bit
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	call f249_E_jumps_jnz_jz
;end_f282_emit_17:
	ret


	; emit_18 workspace at ws+3117 length ws+1
f283_emit_18:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
c01_04b5:
	ld a, (ws+3117)
	or a
	jp z, c01_04ba
	ld hl,1
	push hl
	call f216_E_add
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	jp c01_04b5
c01_04ba:
;end_f283_emit_18:
	ret


	; emit_19 workspace at ws+3117 length ws+2
f284_emit_19:
	call f179_E_exx
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3117), hl
	ld h,7
	push hl
	ld hl, (ws+3117)
	call f223_E_bit
	call f179_E_exx
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	call f249_E_jumps_jnz_jz
;end_f284_emit_19:
	ret


	; emit_20 workspace at ws+3117 length ws+1
f285_emit_20:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
c01_04bb:
	ld a, (ws+3117)
	or a
	jp z, c01_04c0
	ld hl, (ws+3115)
	call f221_E_srl
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	jp c01_04bb
c01_04c0:
;end_f285_emit_20:
	ret


	; emit_21 workspace at ws+3117 length ws+1
f286_emit_21:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
c01_04c1:
	ld a, (ws+3117)
	or a
	jp z, c01_04c6
	ld hl, (ws+3115)
	call f220_E_sra
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	jp c01_04c1
c01_04c6:
;end_f286_emit_21:
	ret


	; emit_22 workspace at ws+3117 length ws+1
f287_emit_22:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
c01_04c7:
	ld a, (ws+3117)
	or a
	jp z, c01_04cc
	ld hl, (ws+3115)
	call f213_E_inc
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	jp c01_04c7
c01_04cc:
;end_f287_emit_22:
	ret


	; emit_23 workspace at ws+3117 length ws+1
f288_emit_23:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
c01_04cd:
	ld a, (ws+3117)
	or a
	jp z, c01_04d2
	ld hl, (ws+3115)
	call f214_E_dec
	ld a, (ws+3117)
	inc a
	ld (ws+3117), a
	jp c01_04cd
c01_04d2:
;end_f288_emit_23:
	ret


	; emit_24 workspace at ws+3117 length ws+0
f289_emit_24:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3098)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f193_E_store16
;end_f289_emit_24:
	ret


	; emit_25 workspace at ws+3117 length ws+0
f290_emit_25:
	ld hl, (ws+3086)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f186_E_lda
;end_f290_emit_25:
	ret


	; emit_26 workspace at ws+3117 length ws+0
f291_emit_26:
	ld hl, (ws+3086)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f186_E_lda
;end_f291_emit_26:
	ret


	; emit_27 workspace at ws+3117 length ws+4
f292_emit_27:
	ld hl, (ws+3084)
	call f174_wordreg
;	ld (ws+3117), hl
	push hl
	ld hl, (ws+3098)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f193_E_store16
	call f179_E_exx
	ld hl, (ws+3084)
	call f174_wordreg
;	ld (ws+3119), hl
	push hl
	ld hl, (ws+3098)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	inc hl
	inc hl
	call f193_E_store16
	call f179_E_exx
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3098)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f147_RegCacheLeavesValue
;end_f292_emit_27:
	ret


	; emit_28 workspace at ws+3117 length ws+1
f293_emit_28:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
c01_04d3:
	ld a, (ws+3117)
	or a
	jp z, c01_04d8
	ld bc,128
	push bc
	ld h,b
	ld l,c
	call f216_E_add
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	jp c01_04d3
c01_04d8:
;end_f293_emit_28:
	ret


	; emit_29 workspace at ws+3117 length ws+4
f294_emit_29:
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3117), hl
	call f221_E_srl
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3119), hl
	jp   f222_E_rr ;	call f222_E_rr
;end_f294_emit_29:
;	ret


	; emit_30 workspace at ws+3117 length ws+4
f295_emit_30:
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3117), hl
	call f220_E_sra
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3119), hl
	jp   f222_E_rr ;	call f222_E_rr
;end_f295_emit_30:
;	ret


	; emit_31 workspace at ws+3117 length ws+0
f296_emit_31:
	ld hl, (ws+3115)
	jp   f214_E_dec ;	call f214_E_dec
;end_f296_emit_31:
;	ret
c01_c313:
	db 97,110,100,0


	; emit_32 workspace at ws+3117 length ws+0
f297_emit_32:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3094)
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
	push hl
	ld hl, (ws+3115)
	push hl
	ld hl,c01_c313
	call f246_logic2i
;end_f297_emit_32:
	ret
c01_c314:
	db 120,111,114,0


	; emit_33 workspace at ws+3117 length ws+0
f298_emit_33:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3094)
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
	push hl
	ld hl, (ws+3115)
	push hl
	ld hl,c01_c314
	call f246_logic2i
;end_f298_emit_33:
	ret


	; emit_34 workspace at ws+3117 length ws+16
f299_emit_34:
	ld hl, (ws+3100)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz, c01_04dd
	ld hl, (ws+3084)
	call f172_loreg
;	ld (ws+3117), hl
	call f183_E_storem
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3084)
	call f173_hireg
;	ld (ws+3119), hl
	call f183_E_storem
	ld hl,128
	call f213_E_inc
	ld hl,128
	call f180_E_push
	call f179_E_exx
	ld hl,128
	call f181_E_pop
	ld hl, (ws+3084)
	call f172_loreg
;	ld (ws+3121), hl
	call f183_E_storem
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3084)
	call f173_hireg
;	ld (ws+3123), hl
	call f183_E_storem
	call f179_E_exx
	jp c01_04d9
c01_04dd:
	ld hl, (ws+3084)
	call f172_loreg
;	ld (ws+3125), hl
	push hl
	ld hl, (ws+3100)
	push hl
	xor a
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
;	ld (ws+3127), hl
	push hl
	ld hl, (ws+3100)
	push hl
	ld a,1
	call f189_E_store8i
	call f179_E_exx
	ld hl, (ws+3084)
	call f172_loreg
;	ld (ws+3129), hl
	push hl
	ld hl, (ws+3100)
	push hl
	ld a,2
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
;	ld (ws+3131), hl
	push hl
	ld hl, (ws+3100)
	push hl
	ld a,3
	call f189_E_store8i
	call f179_E_exx
c01_04d9:
;end_f299_emit_34:
	ret


	; emit_35 workspace at ws+3117 length ws+0
f300_emit_35:
	jp   f234_CallI ;	call f234_CallI
;end_f300_emit_35:
;	ret


	; emit_36 workspace at ws+3117 length ws+0
f301_emit_36:
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3082)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f192_E_load16
;end_f301_emit_36:
	ret


	; emit_38 workspace at ws+3117 length ws+0
f302_emit_38:
	jp   f234_CallI ;	call f234_CallI
;end_f302_emit_38:
;	ret


	; emit_39 workspace at ws+3117 length ws+0
f303_emit_39:
	ld hl, (ws+3115)
	jp   f181_E_pop ;	call f181_E_pop
;end_f303_emit_39:
;	ret


	; emit_40 workspace at ws+3117 length ws+4
f304_emit_40:
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3119), hl
	push hl
	xor a
	call f194_E_mvi
;end_f304_emit_40:
	ret


	; emit_41 workspace at ws+3117 length ws+4
f305_emit_41:
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl,1
	push hl
	call f216_E_add
	ld hl,1
	push hl
	call f218_E_sbc
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3119), hl
	push hl
	ld hl,1
	call f177_E_mov
;end_f305_emit_41:
	ret


	; emit_42 workspace at ws+3117 length ws+8
f306_emit_42:
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl,1
	call f203_E_xor
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3119), hl
	push hl
	ld hl,1
	call f177_E_mov
	call f179_E_exx
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3121), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3123), hl
	push hl
	ld hl,1
	call f177_E_mov
	call f179_E_exx
;end_f306_emit_42:
	ret


	; emit_43 workspace at ws+3117 length ws+8
f307_emit_43:
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl,1
	push hl
	call f216_E_add
	ld hl,1
	push hl
	call f218_E_sbc
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3119), hl
	push hl
	ld hl,1
	call f177_E_mov
	call f179_E_exx
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3121), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3123), hl
	push hl
	ld hl,1
	call f177_E_mov
	call f179_E_exx
;end_f307_emit_43:
	ret


	; emit_44 workspace at ws+3117 length ws+0
f308_emit_44:
	call f179_E_exx
	ld bc,128
	push bc
	ld hl,0
	call f229_E_lxi
	call f179_E_exx
;end_f308_emit_44:
	ret


	; emit_45 workspace at ws+3117 length ws+0
f309_emit_45:
	ld de,1
	push de
	ld hl,32
	call f177_E_mov
	ld de,1
	push de
	ex de,hl
	call f216_E_add
	ld de,1
	push de
	ex de,hl
	call f218_E_sbc
	call f179_E_exx
	ld bc,64
	push bc
	ld hl,1
	call f177_E_mov
	ld de,32
	push de
	ld hl,1
	call f177_E_mov
	call f179_E_exx
;end_f309_emit_45:
	ret


	; emit_46 workspace at ws+3117 length ws+8
f310_emit_46:
	ld hl, (ws+3100)
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 96
	ld h,a
	ld a,h
	or l
	jp z, c01_04e2
	ld hl, (ws+3084)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl, (ws+3100)
	push hl
	xor a
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
;	ld (ws+3119), hl
	push hl
	ld hl, (ws+3100)
	push hl
	ld a,1
	call f189_E_store8i
	jp c01_04de
c01_04e2:
	ld hl, (ws+3084)
	call f172_loreg
;	ld (ws+3121), hl
	call f183_E_storem
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3084)
	call f173_hireg
;	ld (ws+3123), hl
	call f183_E_storem
c01_04de:
;end_f310_emit_46:
	ret


	; emit_47 workspace at ws+3117 length ws+0
f311_emit_47:
	ld hl, (ws+3115)
	jp   f181_E_pop ;	call f181_E_pop
;end_f311_emit_47:
;	ret


	; emit_48 workspace at ws+3117 length ws+0
f312_emit_48:
	ld hl, (ws+3088)
	jp   f191_E_loada ;	call f191_E_loada
;end_f312_emit_48:
;	ret


	; emit_49 workspace at ws+3117 length ws+0
f313_emit_49:
	jp   f234_CallI ;	call f234_CallI
;end_f313_emit_49:
;	ret


	; emit_50 workspace at ws+3117 length ws+0
f314_emit_50:
	ld hl, (ws+3094)
	ld a,(hl)
	jp   f205_E_addi ;	call f205_E_addi
;end_f314_emit_50:
;	ret


	; emit_51 workspace at ws+3117 length ws+0
f315_emit_51:
	ld hl, (ws+3094)
	ld a,(hl)
	jp   f210_E_xori ;	call f210_E_xori
;end_f315_emit_51:
;	ret


	; emit_52 workspace at ws+3117 length ws+0
f316_emit_52:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+3094)
	ld a,(hl)
	call f253_bequ1c
;end_f316_emit_52:
	ret


	; emit_53 workspace at ws+3117 length ws+0
f317_emit_53:
	ld hl, (ws+3088)
	jp   f191_E_loada ;	call f191_E_loada
;end_f317_emit_53:
;	ret


	; emit_54 workspace at ws+3117 length ws+1
f318_emit_54:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
	or a
	jp nz, c01_04e7
	ld hl,1
	call f202_E_or
	jp c01_04e3
c01_04e7:
	ld a, (ws+3117)
	call f212_E_cpi
c01_04e3:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp   f250_E_jumps_jc_jnc ;	call f250_E_jumps_jc_jnc
;end_f318_emit_54:
;	ret


	; emit_55 workspace at ws+3117 length ws+0
f319_emit_55:
	ld hl, (ws+3082)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f186_E_lda
;end_f319_emit_55:
	ret
c01_c315:
	db 9,106,112,32,112,111,44,32,36,43,53,10,0


	; emit_56 workspace at ws+3117 length ws+0
f320_emit_56:
	ld hl, (ws+3094)
	ld a,(hl)
	call f207_E_subi
	ld hl,c01_c315
	call f98_E
	ld a,128
	call f210_E_xori
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp   f251_E_jumps_jm_jp ;	call f251_E_jumps_jm_jp
;end_f320_emit_56:
;	ret


	; emit_57 workspace at ws+3117 length ws+0
f321_emit_57:
	ld bc,0
	push bc
	ld hl, (ws+3115)
	call f228_ArchEmitMove
;end_f321_emit_57:
	ret


	; emit_58 workspace at ws+3117 length ws+0
f322_emit_58:
	ld hl, (ws+3094)
	jp   f233_Call ;	call f233_Call
;end_f322_emit_58:
;	ret


	; emit_59 workspace at ws+3117 length ws+0
f323_emit_59:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+3094)
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
	call f255_bequ2c
;end_f323_emit_59:
	ret


	; emit_60 workspace at ws+3117 length ws+0
f324_emit_60:
	ld hl, (ws+3094)
	ld a,(hl)
	jp   f211_E_andi ;	call f211_E_andi
;end_f324_emit_60:
;	ret


	; emit_63 workspace at ws+3117 length ws+0
f325_emit_63:
	ld hl, (ws+3100)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz, c01_04ec
	ld hl,1
	call f183_E_storem
	jp c01_04e8
c01_04ec:
	ld hl, (ws+3100)
	call f184_E_stax
c01_04e8:
;end_f325_emit_63:
	ret


	; emit_64 workspace at ws+3117 length ws+0
f326_emit_64:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+3094)
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
	call f258_bequ4c
;end_f326_emit_64:
	ret


	; emit_65 workspace at ws+3117 length ws+0
f327_emit_65:
	ld hl, (ws+3094)
	ld a,(hl)
	jp   f209_E_ori ;	call f209_E_ori
;end_f327_emit_65:
;	ret
c01_c316:
	db 111,114,0


	; emit_66 workspace at ws+3117 length ws+0
f328_emit_66:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3094)
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
	push hl
	ld hl, (ws+3115)
	push hl
	ld hl,c01_c316
	call f246_logic2i
;end_f328_emit_66:
	ret


	; emit_67 workspace at ws+3117 length ws+0
f329_emit_67:
	ld hl, (ws+3094)
	ld a,(hl)
	jp   f207_E_subi ;	call f207_E_subi
;end_f329_emit_67:
;	ret


	; emit_68 workspace at ws+3117 length ws+8
f330_emit_68:
	ld hl, (ws+3082)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f151_RegCacheFindValue
;	ld (ws+3117), hl
;	ld (ws+3119), hl
	ld d,h
	ld e,l
	ld hl, (ws+3115)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
;	jp z, c01_04f1
;	ret
;c01_04f1:
	ret nz
;c01_04ed:
	ld hl, (ws+3115)
	call f174_wordreg
;	ld (ws+3121), hl
	push hl
	ld hl, (ws+3082)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f192_E_load16
	call f179_E_exx
	ld hl, (ws+3115)
	call f174_wordreg
;	ld (ws+3123), hl
	push hl
	ld hl, (ws+3082)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	inc hl
	inc hl
	call f192_E_load16
	call f179_E_exx
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3082)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f147_RegCacheLeavesValue
;end_f330_emit_68:
	ret
c01_c317:
	db 9,106,112,32,112,111,44,32,36,43,53,10,0


	; emit_69 workspace at ws+3117 length ws+0
f331_emit_69:
	ld hl, (ws+3096)
	call f200_E_sub
	ld hl,c01_c317
	call f98_E
	ld a,128
	call f210_E_xori
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp   f251_E_jumps_jm_jp ;	call f251_E_jumps_jm_jp
;end_f331_emit_69:
;	ret


	; emit_70 workspace at ws+3117 length ws+0
f332_emit_70:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+3084)
	call f256_bequ2
;end_f332_emit_70:
	ret


	; emit_71 workspace at ws+3117 length ws+0
f333_emit_71:
	call f199_E_rcf
	ld de,128
	push de
	ld hl, (ws+3096)
	call f218_E_sbc
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	call f250_E_jumps_jc_jnc
;end_f333_emit_71:
	ret
c01_c318:
	db 95,99,109,112,115,50,0


	; emit_72 workspace at ws+3117 length ws+0
f334_emit_72:
	ld hl,c01_c318
	call f224_E_callhelper
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp   f251_E_jumps_jm_jp ;	call f251_E_jumps_jm_jp
;end_f334_emit_72:
;	ret


	; emit_73 workspace at ws+3117 length ws+0
f335_emit_73:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp   f257_bequ4 ;	call f257_bequ4
;end_f335_emit_73:
;	ret
c01_c319:
	db 95,99,109,112,117,52,0


	; emit_74 workspace at ws+3117 length ws+0
f336_emit_74:
	ld hl,c01_c319
	call f224_E_callhelper
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp   f250_E_jumps_jc_jnc ;	call f250_E_jumps_jc_jnc
;end_f336_emit_74:
;	ret
c01_c320:
	db 95,99,109,112,115,52,0


	; emit_75 workspace at ws+3117 length ws+0
f337_emit_75:
	ld hl,c01_c320
	call f224_E_callhelper
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp   f251_E_jumps_jm_jp ;	call f251_E_jumps_jm_jp
;end_f337_emit_75:
;	ret


	; emit_78 workspace at ws+3117 length ws+0
f338_emit_78:
	call f179_E_exx
	ld hl, (ws+3084)
	call f180_E_push
	call f179_E_exx
	ld hl, (ws+3084)
	ld de,64512
	add hl,de
	ld a,h
	or l
	jp nz, c01_04f6
	call f178_E_ex
	jp c01_04f2
c01_04f6:
	ld hl, (ws+3084)
	ld de,61440
	add hl,de
	ld a,h
	or l
	jp nz, c01_04fa
	ld bc,8
	push bc
	ld hl,2
	call f177_E_mov
	ld de,16
	push de
	ld hl,4
	call f177_E_mov
c01_04fa:
c01_04f2:
	ld hl,512
	jp   f181_E_pop ;	call f181_E_pop
;end_f338_emit_78:
;	ret


	; emit_79 workspace at ws+3117 length ws+0
f339_emit_79:
	ld hl, (ws+3078)
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
	ld a,h
	or l
	exx
	or h
	or l
	exx
	jp nz, c01_04ff
	ld hl,1
	call f202_E_or
	jp c01_04fb
c01_04ff:
	ld hl, (ws+3078)
	ld a,(hl)
	call f212_E_cpi
c01_04fb:
	ld ix, (ws+3078)
	ld l, (ix+4)
	ld h, (ix+5)
	jp   f168_E_jnz ;	call f168_E_jnz
;end_f339_emit_79:
;	ret


	; emit_80 workspace at ws+3117 length ws+0
f340_emit_80:
	ld hl, (ws+3078)
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
	push hl
	ld bc,256
	push bc
	ld ix, (ws+3078)
	ld l, (ix+4)
	ld h, (ix+5)
	call f261_case2
;end_f340_emit_80:
	ret


	; emit_81 workspace at ws+3117 length ws+0
f341_emit_81:
	ld hl, (ws+3078)
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
	push hl
	ld bc,256
	push bc
	ld ix, (ws+3078)
	ld l, (ix+4)
	ld h, (ix+5)
	call f261_case2
	ld hl, (ws+3078)
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
	ld a,16
	ex de,hl
	exx
	ex de,hl
	exx
	call f483__asr4
	push hl
	ld de,512
	push de
	ld ix, (ws+3078)
	ld l, (ix+4)
	ld h, (ix+5)
	call f261_case2
;end_f341_emit_81:
	ret


	; emit_85 workspace at ws+3117 length ws+2
f342_emit_85:
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3117), hl
	ld hl,1
	push hl
	ld hl, (ws+3117)
	call f177_E_mov
;end_f342_emit_85:
	ret


	; emit_86 workspace at ws+3117 length ws+2
f343_emit_86:
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3117), hl
	ld hl,1
	push hl
	ld hl, (ws+3117)
	call f177_E_mov
;end_f343_emit_86:
	ret
c01_c321:
	db 9,108,100,32,0


	; emit_88 workspace at ws+3117 length ws+0
f344_emit_88:
	ld hl, (ws+3115)
	call f164_R_flush
	ld hl,c01_c321
	call f98_E
	ld hl, (ws+3115)
	call f175_E_reg
	call f93_E_comma
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f225_E_string
	jp   f95_E_nl ;	call f95_E_nl
;end_f344_emit_88:
;	ret
c01_c322:
	db 58,10,0


	; emit_89 workspace at ws+3117 length ws+0
f345_emit_89:
	ld hl, (ws+12)
	call f112_EmitterOpenStream
	ld hl, (ws+3078)
	push hl
	ld hl,0
	call f162_E_symref
	ld hl,c01_c322
	call f98_E
;end_f345_emit_89:
	ret


	; emit_90 workspace at ws+3117 length ws+0
f346_emit_90:
	jp   f113_EmitterCloseStream ;	call f113_EmitterCloseStream
;end_f346_emit_90:
;	ret
c01_c323:
	db 9,100,98,32,0


	; emit_91 workspace at ws+3117 length ws+0
f347_emit_91:
	ld hl,c01_c323
	call f98_E
	ld hl, (ws+3078)
	ld a,(hl)
	call f101_E_u8
	jp   f95_E_nl ;	call f95_E_nl
;end_f347_emit_91:
;	ret
c01_c324:
	db 9,100,119,32,0


	; emit_92 workspace at ws+3117 length ws+0
f348_emit_92:
	ld hl,c01_c324
	call f98_E
	ld hl, (ws+3078)
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
	call f100_E_u16
	jp   f95_E_nl ;	call f95_E_nl
;end_f348_emit_92:
;	ret
c01_c325:
	db 9,100,119,111,114,100,32,0


	; emit_93 workspace at ws+3117 length ws+0
f349_emit_93:
	ld hl,c01_c325
	call f98_E
	ld hl, (ws+3078)
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
	call f99_E_u32
	jp   f95_E_nl ;	call f95_E_nl
;end_f349_emit_93:
;	ret
c01_c326:
	db 9,100,119,32,0


	; emit_94 workspace at ws+3117 length ws+0
f350_emit_94:
	ld hl,c01_c326
	call f98_E
	ld hl, (ws+3078)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f162_E_symref
	call f95_E_nl
;end_f350_emit_94:
	ret
c01_c327:
	db 9,100,119,32,0


	; emit_95 workspace at ws+3117 length ws+0
f351_emit_95:
	ld hl,c01_c327
	call f98_E
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f110_E_subref
	jp   f95_E_nl ;	call f95_E_nl
;end_f351_emit_95:
;	ret
c01_c328:
	db 9,100,119,32,0


	; emit_96 workspace at ws+3117 length ws+0
f352_emit_96:
	ld hl,c01_c328
	call f98_E
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f225_E_string
	jp   f95_E_nl ;	call f95_E_nl
;end_f352_emit_96:
;	ret


	; emit_99 workspace at ws+3117 length ws+0
f353_emit_99:
	call f163_R_flushall
	jp   f94_E_tab ;	call f94_E_tab
;end_f353_emit_99:
;	ret


	; emit_100 workspace at ws+3117 length ws+0
f354_emit_100:
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f98_E
	jp   f92_E_space ;	call f92_E_space
;end_f354_emit_100:
;	ret


	; emit_101 workspace at ws+3117 length ws+0
f355_emit_101:
	ld hl, (ws+3078)
	push hl
	ld hl,0
	call f162_E_symref
	call f92_E_space
;end_f355_emit_101:
	ret


	; emit_102 workspace at ws+3117 length ws+0
f356_emit_102:
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f110_E_subref
	jp   f92_E_space ;	call f92_E_space
;end_f356_emit_102:
;	ret


	; emit_104 workspace at ws+3117 length ws+0
f357_emit_104:
	jp   f95_E_nl ;	call f95_E_nl
;end_f357_emit_104:
;	ret


	; emit_106 workspace at ws+3117 length ws+0
f358_emit_106:
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp   f165_E_label ;	call f165_E_label
;end_f358_emit_106:
;	ret


	; emit_107 workspace at ws+3117 length ws+0
f359_emit_107:
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp   f167_E_jp ;	call f167_E_jp
;end_f359_emit_107:
;	ret
c01_c329:
	db 10,10,9,59,32,0
c01_c330:
	db 32,119,111,114,107,115,112,97,99,101,32,97,116,32,0
c01_c331:
	db 32,108,101,110,103,116,104,32,0
c01_c332:
	db 58,10,0


	; pop_return_address workspace at ws+3124 length ws+0
f361_pop_return_address:
	ld a, (ws+3119)
	or a
	jp nz, c01_0504
	ld hl,512
	call f181_E_pop
	ld a,1
	ld (ws+3119), a
c01_0504:
;c01_0500:
;end_f361_pop_return_address:
	ret


	; emit_108 workspace at ws+3117 length ws+7
f360_emit_108:
	call f140_RegCacheReset
	ld hl, (ws+12)
	call f112_EmitterOpenStream
	ld hl,c01_c329
	call f98_E
	ld hl, (ws+12)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f98_E
	ld hl,c01_c330
	call f98_E
	ld a,2
	call f89_E_b8
	ld hl, (ws+12)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f90_E_b16
	xor a
	call f89_E_b8
	ld hl,0
	call f90_E_b16
	ld hl,c01_c331
	call f98_E
	ld a,5
	call f89_E_b8
	ld hl, (ws+12)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f90_E_b16
	xor a
	call f89_E_b8
	call f95_E_nl
	ld a,4
	call f89_E_b8
	ld hl,c01_c332
	call f98_E
	ld ix, (ws+12)
	ld a, (ix+12)
	ld (ws+3117), a
	dec a
	ld (ws+3118), a
	xor a
	ld (ws+3119), a
c01_0505:
	ld a, (ws+3117)
	or a
	jp z, c01_050a
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	ld hl, (ws+12)
	push hl
	call f79_GetInputParameter
;	ld (ws+3120), hl
	ld (ws+3122), hl
	push hl
	pop ix
	ld a, (ix+7)
	cp 1
	jp nz, c01_050c
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	cp b
	jp z, c01_0511
	call f361_pop_return_address
	ld hl,1
	call f181_E_pop
c01_0511:
;c01_050d:
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f187_E_sta
	jp c01_0505 ; c01_050b
c01_050c:
	cp 2
	jp nz, c01_0512
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	cp b
	jp z, c01_0517
	call f361_pop_return_address
	ld hl,128
	call f181_E_pop
c01_0517:
;c01_0513:
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f193_E_store16
	jp c01_0505 ; c01_050b
c01_0512:
	cp 4
	jp nz, c01_0505 ; c01_0518
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	cp b
	jp z, c01_051d
	call f361_pop_return_address
	ld hl,128
	call f181_E_pop
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f193_E_store16
	ld hl,128
	call f181_E_pop
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,2
	call f193_E_store16
	jp c01_0505 ; c01_0519
c01_051d:
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f193_E_store16
	call f179_E_exx
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,2
	call f193_E_store16
	call f179_E_exx
	ld de,1024
	push de
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f147_RegCacheLeavesValue
c01_0519:
c01_0518:
c01_050b:
	jp c01_0505
c01_050a:
	ld a, (ws+3119)
	or a
	jp z, c01_0522
	ld hl,512
	call f180_E_push
c01_0522:
;c01_051e:
;end_f360_emit_108:
	ret
c01_c333:
	db 101,110,100,95,0
c01_c334:
	db 58,10,0


	; push_return_address workspace at ws+3124 length ws+0
f363_push_return_address:
	ld a, (ws+3119)
	or a
	jp nz, c01_0527
	ld hl,512
	call f181_E_pop
	ld a,1
	ld (ws+3119), a
c01_0527:
;c01_0523:
;end_f363_push_return_address:
	ret


	; emit_109 workspace at ws+3117 length ws+7
f362_emit_109:
	call f163_R_flushall
	ld hl,c01_c333
	call f98_E
	ld hl, (ws+12)
	call f110_E_subref
	ld hl,c01_c334
	call f98_E
	xor a
	ld (ws+3117), a
	ld ix, (ws+12)
	ld a, (ix+13)
	ld (ws+3118), a
	xor a
	ld (ws+3119), a
c01_0528:
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	cp b
	jp z, c01_052d
	ld hl, (ws+12)
	push hl
	ld a, (ws+3117)
	call f80_GetOutputParameter
;	ld (ws+3120), hl
	ld (ws+3122), hl
	push hl
	pop ix
	ld a, (ix+7)
	cp 1
	jp nz, c01_052f
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f186_E_lda
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	dec a
	cp b
	jp z, c01_052e ; c01_0534
;c01_0533:
	call f363_push_return_address
	ld hl,1
	call f180_E_push
c01_0534:
;c01_0530:
	jp c01_052e
c01_052f:
	cp 2
	jp nz, c01_0535
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f192_E_load16
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	dec a
	cp b
	jp z, c01_052e ; c01_053a
;c01_0539:
	call f363_push_return_address
	ld hl,128
	call f180_E_push
c01_053a:
;c01_0536:
	jp c01_052e
c01_0535:
	cp 4
	jp nz, c01_053b
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	dec a
	cp b
	jp z, c01_0540
	call f363_push_return_address
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,2
	call f192_E_load16
	ld hl,128
	call f180_E_push
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f192_E_load16
	ld hl,128
	call f180_E_push
	jp c01_053c
c01_0540:
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f192_E_load16
	call f179_E_exx
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,2
	call f192_E_load16
	call f179_E_exx
c01_053c:
c01_053b:
c01_052e:
	ld a, (ws+3117)
	inc a
	ld (ws+3117), a
	jp c01_0528
c01_052d:
	ld a, (ws+3119)
	or a
	jp z, c01_0545
	ld hl,512
	call f180_E_push
c01_0545:
;c01_0541:
	call f169_E_ret
	jp   f113_EmitterCloseStream ;	call f113_EmitterCloseStream
;end_f362_emit_109:
;	ret


	; emit_110 workspace at ws+3117 length ws+0
f364_emit_110:
	jp   f234_CallI ;	call f234_CallI
;end_f364_emit_110:
;	ret


	; emit_112 workspace at ws+3117 length ws+0
f365_emit_112:
	ld hl, (ws+3096)
	jp   f180_E_push ;	call f180_E_push
;end_f365_emit_112:
;	ret


	; emit_113 workspace at ws+3117 length ws+0
f366_emit_113:
	ld hl, (ws+3096)
	jp   f180_E_push ;	call f180_E_push
;end_f366_emit_113:
;	ret


	; emit_114 workspace at ws+3117 length ws+0
f367_emit_114:
	ld hl, (ws+3096)
	push hl
	ld hl,0
	call f228_ArchEmitMove
;end_f367_emit_114:
	ret
c01_c335:
	db 9,106,114,32,101,110,100,95,0
c01_c336:
	db 10,0


	; emit_115 workspace at ws+3117 length ws+0
f368_emit_115:
	ld ix, (ws+12)
	ld a, (ix+13)
	or a
	jp nz, c01_054a
	call f169_E_ret
	jp c01_0546
c01_054a:
	ld hl,c01_c335
	call f98_E
	ld hl, (ws+12)
	call f110_E_subref
	ld hl,c01_c336
	call f98_E
c01_0546:
;end_f368_emit_115:
	ret


	; emit_116 workspace at ws+3117 length ws+0
f369_emit_116:
	ld hl, (ws+3078)
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
	ld a,h
	or l
	exx
	or h
	or l
	exx
	jp nz, c01_0551
;c01_0552:
	ld hl, (ws+3115)
	ld de,65535
	add hl,de
	ld a,h
	or l
	jp nz, c01_0551
;c01_0550:
	ld hl,1
	call f203_E_xor
	jp c01_054b
c01_0551:
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3078)
	ld a,(hl)
	call f194_E_mvi
c01_054b:
;end_f369_emit_116:
	ret


	; emit_117 workspace at ws+3117 length ws+0
f370_emit_117:
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3078)
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
	call f229_E_lxi
;end_f370_emit_117:
	ret


	; emit_118 workspace at ws+3117 length ws+0
f371_emit_118:
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3078)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f230_E_lxia
;end_f371_emit_118:
	ret
c01_c337:
	db 9,108,100,32,0


	; emit_119 workspace at ws+3117 length ws+0
f372_emit_119:
	ld hl, (ws+3115)
	call f164_R_flush
	ld hl,c01_c337
	call f98_E
	ld hl, (ws+3115)
	call f175_E_reg
	call f93_E_comma
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f110_E_subref
	jp   f95_E_nl ;	call f95_E_nl
;end_f372_emit_119:
;	ret


	; emit_120 workspace at ws+3117 length ws+8
f373_emit_120:
	ld hl, (ws+3078)
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
	call f148_RegCacheFindConstant
;	ld (ws+3117), hl
	ld (ws+3119), hl
	ld d,h
	ld e,l
	ld hl, (ws+3115)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
;	jp z, c01_0557
;	ret
;c01_0557:
	ret nz
;c01_0553:
	ld hl, (ws+3078)
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
	ld a,h
	or l
	exx
	or h
	or l
	exx
	jp nz, c01_055e
;c01_055f:
	ld hl, (ws+3115)
	ld de,64512
	add hl,de
	ld a,h
	or l
	jp nz, c01_055e
;c01_055d:
	call f199_E_rcf
	ld bc,128
	push bc
	ld h,b
	ld l,c
	call f218_E_sbc
	call f179_E_exx
	ld bc,128
	push bc
	ld h,b
	ld l,c
	call f218_E_sbc
	call f179_E_exx
	jp c01_0558
c01_055e:
	ld hl, (ws+3115)
	call f174_wordreg
;	ld (ws+3121), hl
	push hl
	ld hl, (ws+3078)
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
	call f229_E_lxi
	call f179_E_exx
	ld hl, (ws+3115)
	call f174_wordreg
;	ld (ws+3123), hl
	push hl
	ld hl, (ws+3078)
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
	ld a,16
	ex de,hl
	exx
	ex de,hl
	exx
	call f483__asr4
	call f229_E_lxi
	call f179_E_exx
c01_0558:
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3078)
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
	call f144_RegCacheLeavesConstant
;end_f373_emit_120:
	ret


	; emit_121 workspace at ws+3117 length ws+0
f374_emit_121:
	ld hl, (ws+3084)
	jp   f191_E_loada ;	call f191_E_loada
;end_f374_emit_121:
;	ret


	; emit_122 workspace at ws+3117 length ws+12
f375_emit_122:
	ld hl, (ws+3084)
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 96
	ld h,a
	ld a,h
	or l
	jp z, c01_0564
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl, (ws+3084)
	push hl
	xor a
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3119), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,1
	call f188_E_load8i
	jp c01_0560
c01_0564:
	ld de, (ws+3084)
	ld hl, (ws+3115)
	and a
	sbc hl,de
	jp nz, c01_0568
	ld hl,1
	call f182_E_loadm
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3121), hl
	call f182_E_loadm
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3123), hl
	push hl
	ld hl,1
	call f177_E_mov
	jp c01_0560
c01_0568:
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3125), hl
	call f182_E_loadm
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3127), hl
	call f182_E_loadm
c01_0560:
;end_f375_emit_122:
	ret


	; emit_123 workspace at ws+3117 length ws+16
f376_emit_123:
	ld hl, (ws+3084)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz, c01_056d
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3117), hl
	call f182_E_loadm
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3119), hl
	call f182_E_loadm
	ld hl,128
	call f213_E_inc
	ld hl,128
	call f180_E_push
	call f179_E_exx
	ld hl,128
	call f181_E_pop
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3121), hl
	call f182_E_loadm
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3123), hl
	call f182_E_loadm
	call f179_E_exx
	jp c01_0569
c01_056d:
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3125), hl
	push hl
	ld hl, (ws+3084)
	push hl
	xor a
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3127), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,1
	call f188_E_load8i
	call f179_E_exx
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3129), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,2
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3131), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,3
	call f188_E_load8i
	call f179_E_exx
c01_0569:
;end_f376_emit_123:
	ret


	; emit_124 workspace at ws+3117 length ws+8
f377_emit_124:
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3117), hl
	push hl
	ld hl, (ws+3084)
	push hl
	xor a
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3119), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,1
	call f188_E_load8i
	call f179_E_exx
	ld hl, (ws+3115)
	call f172_loreg
;	ld (ws+3121), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,2
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3123), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,3
	call f188_E_load8i
	call f179_E_exx
;end_f377_emit_124:
	ret


	; emit_125 workspace at ws+3117 length ws+0
f378_emit_125:
	ld de,1
	push de
	ld hl, (ws+3084)
	call f216_E_add
;end_f378_emit_125:
	ret


	; emit_126 workspace at ws+3117 length ws+0
f379_emit_126:
	ld hl, (ws+3096)
	jp   f200_E_sub ;	call f200_E_sub
;end_f379_emit_126:
;	ret
c01_c338:
	db 95,109,117,108,49,0


	; emit_127 workspace at ws+3117 length ws+0
f380_emit_127:
	ld hl,c01_c338
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f380_emit_127:
;	ret


	; emit_128 workspace at ws+3117 length ws+0
f381_emit_128:
	jp   f198_E_cpl ;	call f198_E_cpl
;end_f381_emit_128:
;	ret


	; emit_129 workspace at ws+3117 length ws+0
f382_emit_129:
	ld hl,1
	call f203_E_xor
	ld hl, (ws+3084)
	jp   f200_E_sub ;	call f200_E_sub
;end_f382_emit_129:
;	ret


	; emit_130 workspace at ws+3117 length ws+0
f383_emit_130:
	ld hl, (ws+3096)
	jp   f202_E_or ;	call f202_E_or
;end_f383_emit_130:
;	ret


	; emit_131 workspace at ws+3117 length ws+0
f384_emit_131:
	ld hl, (ws+3096)
	jp   f201_E_and ;	call f201_E_and
;end_f384_emit_131:
;	ret


	; emit_132 workspace at ws+3117 length ws+0
f385_emit_132:
	ld hl, (ws+3096)
	jp   f203_E_xor ;	call f203_E_xor
;end_f385_emit_132:
;	ret
c01_c339:
	db 95,100,118,114,109,117,49,0


	; emit_133 workspace at ws+3117 length ws+0
f386_emit_133:
	ld hl,c01_c339
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f386_emit_133:
;	ret
c01_c340:
	db 95,100,118,114,109,117,49,0


	; emit_134 workspace at ws+3117 length ws+0
f387_emit_134:
	ld hl,c01_c340
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f387_emit_134:
;	ret
c01_c341:
	db 95,100,118,114,109,115,49,0


	; emit_135 workspace at ws+3117 length ws+0
f388_emit_135:
	ld hl,c01_c341
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f388_emit_135:
;	ret
c01_c342:
	db 95,100,118,114,109,115,49,0


	; emit_136 workspace at ws+3117 length ws+0
f389_emit_136:
	ld hl,c01_c342
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f389_emit_136:
;	ret
c01_c343:
	db 95,97,115,114,49,0


	; emit_137 workspace at ws+3117 length ws+0
f390_emit_137:
	ld hl,c01_c343
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f390_emit_137:
;	ret
c01_c344:
	db 95,108,115,114,49,0


	; emit_138 workspace at ws+3117 length ws+0
f391_emit_138:
	ld hl,c01_c344
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f391_emit_138:
;	ret
c01_c345:
	db 95,97,115,108,49,0


	; emit_139 workspace at ws+3117 length ws+0
f392_emit_139:
	ld hl,c01_c345
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f392_emit_139:
;	ret


	; emit_140 workspace at ws+3117 length ws+4
f393_emit_140:
	ld hl, (ws+3084)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp z, c01_0574
;c01_0575:
	ld hl, (ws+3096)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp z, c01_0574
;c01_0573:
	ld hl, (ws+3096)
	ld de,65280
	add hl,de
	ld a,h
	or l
	jp nz, c01_057a
	call f178_E_ex
	ld bc,128
	ld (ws+3096), bc
	jp c01_0576
c01_057a:
	ld hl, (ws+3084)
	ld de,65280
	add hl,de
	ld a,h
	or l
	jp nz, c01_057f
	call f178_E_ex
	jp c01_057b
c01_057f:
	ld hl, (ws+3084)
	call f172_loreg
;	ld (ws+3117), hl
	ld de,64
	push de
	call f177_E_mov
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3119), hl
	ld hl,32
	push hl
	ld hl, (ws+3119)
	call f177_E_mov
c01_057b:
	ld bc,128
	ld (ws+3084), bc
c01_0576:
c01_0574:
;c01_056e:
	ld hl, (ws+3084)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz, c01_0584
	ld bc,128
	push bc
	ld hl, (ws+3096)
	call f216_E_add
	jp c01_0580
c01_0584:
	ld bc,128
	push bc
	ld hl, (ws+3084)
	call f216_E_add
c01_0580:
;end_f393_emit_140:
	ret


	; emit_141 workspace at ws+3117 length ws+0
f394_emit_141:
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3096)
	call f216_E_add
;end_f394_emit_141:
	ret


	; emit_142 workspace at ws+3117 length ws+0
f395_emit_142:
	ld hl,1
	call f203_E_xor
	ld de,64
	push de
	ld hl,1
	call f177_E_mov
	ld bc,32
	push bc
	ld hl,1
	call f177_E_mov
	ld de,128
	push de
	ld hl, (ws+3084)
	call f218_E_sbc
;end_f395_emit_142:
	ret


	; emit_143 workspace at ws+3117 length ws+0
f396_emit_143:
	call f199_E_rcf
	ld de,128
	push de
	ld hl, (ws+3096)
	call f218_E_sbc
;end_f396_emit_143:
	ret


	; emit_144 workspace at ws+3117 length ws+0
f397_emit_144:
	jp   f243_E_dvrmu2 ;	call f243_E_dvrmu2
;end_f397_emit_144:
;	ret


	; emit_145 workspace at ws+3117 length ws+0
f398_emit_145:
	jp   f243_E_dvrmu2 ;	call f243_E_dvrmu2
;end_f398_emit_145:
;	ret


	; emit_146 workspace at ws+3117 length ws+0
f399_emit_146:
	jp   f244_E_dvrms2 ;	call f244_E_dvrms2
;end_f399_emit_146:
;	ret


	; emit_147 workspace at ws+3117 length ws+0
f400_emit_147:
	jp   f244_E_dvrms2 ;	call f244_E_dvrms2
;end_f400_emit_147:
;	ret
c01_c346:
	db 95,109,117,108,50,0


	; emit_148 workspace at ws+3117 length ws+0
f401_emit_148:
	ld hl,c01_c346
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f401_emit_148:
;	ret
c01_c347:
	db 111,114,0


	; emit_149 workspace at ws+3117 length ws+0
f402_emit_149:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3096)
	push hl
	ld hl, (ws+3115)
	push hl
	ld hl,c01_c347
	call f245_logic2
;end_f402_emit_149:
	ret
c01_c348:
	db 97,110,100,0


	; emit_150 workspace at ws+3117 length ws+0
f403_emit_150:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3096)
	push hl
	ld hl, (ws+3115)
	push hl
	ld hl,c01_c348
	call f245_logic2
;end_f403_emit_150:
	ret
c01_c349:
	db 120,111,114,0


	; emit_151 workspace at ws+3117 length ws+0
f404_emit_151:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3096)
	push hl
	ld hl, (ws+3115)
	push hl
	ld hl,c01_c349
	call f245_logic2
;end_f404_emit_151:
	ret


	; emit_152 workspace at ws+3117 length ws+8
f405_emit_152:
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3117), hl
	ld hl,1
	push hl
	ld hl, (ws+3117)
	call f177_E_mov
	call f198_E_cpl
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3119), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3121), hl
	ld hl,1
	push hl
	ld hl, (ws+3121)
	call f177_E_mov
	call f198_E_cpl
	ld hl, (ws+3115)
	call f173_hireg
;	ld (ws+3123), hl
	push hl
	ld hl,1
	call f177_E_mov
;end_f405_emit_152:
	ret
c01_c350:
	db 95,108,115,114,50,0


	; emit_153 workspace at ws+3117 length ws+0
f406_emit_153:
	ld hl,c01_c350
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f406_emit_153:
;	ret
c01_c351:
	db 95,97,115,114,50,0


	; emit_154 workspace at ws+3117 length ws+0
f407_emit_154:
	ld hl,c01_c351
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f407_emit_154:
;	ret
c01_c352:
	db 95,97,115,108,50,0


	; emit_155 workspace at ws+3117 length ws+0
f408_emit_155:
	ld hl,c01_c352
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f408_emit_155:
;	ret


	; emit_156 workspace at ws+3117 length ws+0
f409_emit_156:
	ld de,128
	push de
	ld hl, (ws+3084)
	call f216_E_add
	call f179_E_exx
	ld de,128
	push de
	ld hl, (ws+3084)
	call f217_E_adc
	call f179_E_exx
;end_f409_emit_156:
	ret


	; emit_157 workspace at ws+3117 length ws+0
f410_emit_157:
	call f199_E_rcf
	ld de,128
	push de
	ld hl, (ws+3096)
	call f218_E_sbc
	call f179_E_exx
	ld de,128
	push de
	ld hl, (ws+3096)
	call f218_E_sbc
	call f179_E_exx
;end_f410_emit_157:
	ret


	; emit_158 workspace at ws+3117 length ws+0
f411_emit_158:
	ld hl,1
	call f203_E_xor
	ld bc,32
	push bc
	ld hl,1
	call f177_E_mov
	ld de,64
	push de
	ld hl,1
	call f177_E_mov
	ld bc,128
	push bc
	ld hl, (ws+3084)
	call f218_E_sbc
	call f179_E_exx
	ld de,32
	push de
	ld hl,1
	call f177_E_mov
	ld bc,64
	push bc
	ld hl,1
	call f177_E_mov
	ld de,128
	push de
	ld hl, (ws+3084)
	call f218_E_sbc
	call f179_E_exx
;end_f411_emit_158:
	ret
c01_c353:
	db 95,109,117,108,52,0


	; emit_159 workspace at ws+3117 length ws+0
f412_emit_159:
	ld hl,c01_c353
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f412_emit_159:
;	ret
c01_c354:
	db 95,100,118,114,109,117,52,0


	; emit_160 workspace at ws+3117 length ws+0
f413_emit_160:
	ld hl,c01_c354
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f413_emit_160:
;	ret
c01_c355:
	db 95,100,118,114,109,117,52,0


	; emit_161 workspace at ws+3117 length ws+0
f414_emit_161:
	ld hl,c01_c355
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f414_emit_161:
;	ret
c01_c356:
	db 95,100,118,114,109,115,52,0


	; emit_162 workspace at ws+3117 length ws+0
f415_emit_162:
	ld hl,c01_c356
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f415_emit_162:
;	ret
c01_c357:
	db 95,100,118,114,109,115,52,0


	; emit_163 workspace at ws+3117 length ws+0
f416_emit_163:
	ld hl,c01_c357
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f416_emit_163:
;	ret
c01_c358:
	db 95,97,110,100,52,0


	; emit_164 workspace at ws+3117 length ws+0
f417_emit_164:
	ld hl,c01_c358
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f417_emit_164:
;	ret
c01_c359:
	db 95,111,114,52,0


	; emit_165 workspace at ws+3117 length ws+0
f418_emit_165:
	ld hl,c01_c359
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f418_emit_165:
;	ret
c01_c360:
	db 95,101,111,114,52,0


	; emit_166 workspace at ws+3117 length ws+0
f419_emit_166:
	ld hl,c01_c360
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f419_emit_166:
;	ret
c01_c361:
	db 95,110,111,116,52,0


	; emit_167 workspace at ws+3117 length ws+0
f420_emit_167:
	ld hl,c01_c361
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f420_emit_167:
;	ret
c01_c362:
	db 95,97,115,108,52,0


	; emit_168 workspace at ws+3117 length ws+0
f421_emit_168:
	ld hl,c01_c362
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f421_emit_168:
;	ret
c01_c363:
	db 95,108,115,114,52,0


	; emit_169 workspace at ws+3117 length ws+0
f422_emit_169:
	ld hl,c01_c363
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f422_emit_169:
;	ret
c01_c364:
	db 95,97,115,114,52,0


	; emit_170 workspace at ws+3117 length ws+0
f423_emit_170:
	ld hl,c01_c364
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f423_emit_170:
;	ret


	; emit_171 workspace at ws+3117 length ws+0
f424_emit_171:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+3084)
	call f252_bequ1
;end_f424_emit_171:
	ret


	; emit_172 workspace at ws+3117 length ws+0
f425_emit_172:
	ld hl, (ws+3096)
	call f196_E_cp
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp   f250_E_jumps_jc_jnc ;	call f250_E_jumps_jc_jnc
;end_f425_emit_172:
;	ret


	; nop_emitter workspace at ws+3117 length ws+0
f426_nop_emitter:
;end_f426_nop_emitter:
	ret
f263_EmitOneInstruction_s0585:
	dw f265_emit_0
	dw f266_emit_1
	dw f267_emit_2
	dw f268_emit_3
	dw f269_emit_4
	dw f270_emit_5
	dw f271_emit_6
	dw f272_emit_7
	dw f273_emit_8
	dw f274_emit_9
	dw f275_emit_10
	dw f276_emit_11
	dw f277_emit_12
	dw f278_emit_13
	dw f279_emit_14
	dw f280_emit_15
	dw f281_emit_16
	dw f282_emit_17
	dw f283_emit_18
	dw f284_emit_19
	dw f285_emit_20
	dw f286_emit_21
	dw f287_emit_22
	dw f288_emit_23
	dw f289_emit_24
	dw f290_emit_25
	dw f291_emit_26
	dw f292_emit_27
	dw f293_emit_28
	dw f294_emit_29
	dw f295_emit_30
	dw f296_emit_31
	dw f297_emit_32
	dw f298_emit_33
	dw f299_emit_34
	dw f300_emit_35
	dw f301_emit_36
	dw f426_nop_emitter
	dw f302_emit_38
	dw f303_emit_39
	dw f304_emit_40
	dw f305_emit_41
	dw f306_emit_42
	dw f307_emit_43
	dw f308_emit_44
	dw f309_emit_45
	dw f310_emit_46
	dw f311_emit_47
	dw f312_emit_48
	dw f313_emit_49
	dw f314_emit_50
	dw f315_emit_51
	dw f316_emit_52
	dw f317_emit_53
	dw f318_emit_54
	dw f319_emit_55
	dw f320_emit_56
	dw f321_emit_57
	dw f322_emit_58
	dw f323_emit_59
	dw f324_emit_60
	dw f426_nop_emitter
	dw f426_nop_emitter
	dw f325_emit_63
	dw f326_emit_64
	dw f327_emit_65
	dw f328_emit_66
	dw f329_emit_67
	dw f330_emit_68
	dw f331_emit_69
	dw f332_emit_70
	dw f333_emit_71
	dw f334_emit_72
	dw f335_emit_73
	dw f336_emit_74
	dw f337_emit_75
	dw f426_nop_emitter
	dw f426_nop_emitter
	dw f338_emit_78
	dw f339_emit_79
	dw f340_emit_80
	dw f341_emit_81
	dw f426_nop_emitter
	dw f426_nop_emitter
	dw f426_nop_emitter
	dw f342_emit_85
	dw f343_emit_86
	dw f426_nop_emitter
	dw f344_emit_88
	dw f345_emit_89
	dw f346_emit_90
	dw f347_emit_91
	dw f348_emit_92
	dw f349_emit_93
	dw f350_emit_94
	dw f351_emit_95
	dw f352_emit_96
	dw f426_nop_emitter
	dw f426_nop_emitter
	dw f353_emit_99
	dw f354_emit_100
	dw f355_emit_101
	dw f356_emit_102
	dw f426_nop_emitter
	dw f357_emit_104
	dw f426_nop_emitter
	dw f358_emit_106
	dw f359_emit_107
	dw f360_emit_108
	dw f362_emit_109
	dw f364_emit_110
	dw f426_nop_emitter
	dw f365_emit_112
	dw f366_emit_113
	dw f367_emit_114
	dw f368_emit_115
	dw f369_emit_116
	dw f370_emit_117
	dw f371_emit_118
	dw f372_emit_119
	dw f373_emit_120
	dw f374_emit_121
	dw f375_emit_122
	dw f376_emit_123
	dw f377_emit_124
	dw f378_emit_125
	dw f379_emit_126
	dw f380_emit_127
	dw f381_emit_128
	dw f382_emit_129
	dw f383_emit_130
	dw f384_emit_131
	dw f385_emit_132
	dw f386_emit_133
	dw f387_emit_134
	dw f388_emit_135
	dw f389_emit_136
	dw f390_emit_137
	dw f391_emit_138
	dw f392_emit_139
	dw f393_emit_140
	dw f394_emit_141
	dw f395_emit_142
	dw f396_emit_143
	dw f397_emit_144
	dw f398_emit_145
	dw f399_emit_146
	dw f400_emit_147
	dw f401_emit_148
	dw f402_emit_149
	dw f403_emit_150
	dw f404_emit_151
	dw f405_emit_152
	dw f406_emit_153
	dw f407_emit_154
	dw f408_emit_155
	dw f409_emit_156
	dw f410_emit_157
	dw f411_emit_158
	dw f412_emit_159
	dw f413_emit_160
	dw f414_emit_161
	dw f415_emit_162
	dw f416_emit_163
	dw f417_emit_164
	dw f418_emit_165
	dw f419_emit_166
	dw f420_emit_167
	dw f421_emit_168
	dw f422_emit_169
	dw f423_emit_170
	dw f424_emit_171
	dw f425_emit_172


	; EmitOneInstruction workspace at ws+3075 length ws+42
f263_EmitOneInstruction:
	ld (ws+3076), hl
	pop bc
	pop af
	ld (ws+3075), a
	push bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+3110), hl
	ld ix,ws+3078
	ld (ws+3112), ix
	ld a,8
	ld (ws+3114), a
c01_04aa:
	ld a, (ws+3114)
	or a
	jp z, c01_04af
	ld hl, (ws+3110)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3112)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3112)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_04b4
	ld hl, (ws+3112)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld e, (ix+21)
	ld d, (ix+22)
	ld hl, (ws+3112)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
c01_04b4:
;c01_04b0:
	ld hl, (ws+3110)
	inc hl
	inc hl
	ld (ws+3110), hl
	ld hl, (ws+3112)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+3112), hl
	ld a, (ws+3114)
	dec a
	ld (ws+3114), a
	jp c01_04aa
c01_04af:
	ld ix, (ws+3076)
	ld l, (ix+22)
	ld h, (ix+23)
	ld (ws+3115), hl
	ld bc,f263_EmitOneInstruction_s0585
	ld a, (ws+3075)
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld e,(hl)
	inc hl
	ld d,(hl)
	call f500__jpde
;end_f263_EmitOneInstruction:
	ret
