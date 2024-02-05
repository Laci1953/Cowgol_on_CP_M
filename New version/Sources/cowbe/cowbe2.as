	psect text

global f263_EmitOneInstruction
global f2___main_s0586
global f2___main_s0587
global f2___main_s0588

	; Emitter workspace at ws+3117 length ws+0
f264_Emitter:
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
	ret


	; emit_3 workspace at ws+3117 length ws+8
f268_emit_3:
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3117), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3119), hl
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
	ld (ws+3121), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	add 2
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3123), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	add 3
	call f189_E_store8i
	jp f179_E_exx


	; emit_4 workspace at ws+3117 length ws+4
f269_emit_4:
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3117), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3119), hl
	push hl
	ld hl, (ws+3104)
	push hl
	ld hl, (ws+3106)
	ld a,(hl)
	inc a
	call f189_E_store8i
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
	ret


	; emit_7 workspace at ws+3117 length ws+4
f272_emit_7:
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3117), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3119), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	inc a
	call f188_E_load8i
	ret


	; emit_8 workspace at ws+3117 length ws+8
f273_emit_8:
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3117), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3119), hl
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
	ld (ws+3121), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	add 2
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3123), hl
	push hl
	ld hl, (ws+3088)
	push hl
	ld hl, (ws+3090)
	ld a,(hl)
	add 3
	call f188_E_load8i
	jp f179_E_exx


	; emit_9 workspace at ws+3117 length ws+0
f274_emit_9:
	ld hl, (ws+3115)
	jp f213_E_inc


	; emit_10 workspace at ws+3117 length ws+0
f275_emit_10:
	ld hl, (ws+3115)
	jp f214_E_dec


	; emit_11 workspace at ws+3117 length ws+0
f276_emit_11:
	ld hl, (ws+3094)
	jp f233_Call


	; emit_12 workspace at ws+3117 length ws+0
f277_emit_12:
	ld hl, (ws+3094)
	jp f233_Call


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
	ret


	; emit_14 workspace at ws+3117 length ws+0
f279_emit_14:
	ld hl, (ws+3094)
	jp f233_Call


	; emit_15 workspace at ws+3117 length ws+0
f280_emit_15:
	ld hl,1
	call f202_E_or
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f251_E_jumps_jm_jp


	; emit_16 workspace at ws+3117 length ws+0
f281_emit_16:
	ld hl, (ws+3098)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f187_E_sta
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
	jp f249_E_jumps_jnz_jz


	; emit_18 workspace at ws+3117 length ws+1
f283_emit_18:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
_04b5:
	ld a, (ws+3117)
	or a
	ret z
	ld hl,1
	push hl
	call f216_E_add
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	jp    _04b5


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
	jp f249_E_jumps_jnz_jz


	; emit_20 workspace at ws+3117 length ws+1
f285_emit_20:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
_04bb:
	ld a, (ws+3117)
	or a
	ret z
	ld hl, (ws+3115)
	call f221_E_srl
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	jp    _04bb


	; emit_21 workspace at ws+3117 length ws+1
f286_emit_21:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
_04c1:
	ld a, (ws+3117)
	or a
	ret z
	ld hl, (ws+3115)
	call f220_E_sra
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	jp    _04c1


	; emit_22 workspace at ws+3117 length ws+1
f287_emit_22:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
_04c7:
	ld a, (ws+3117)
	or a
	ret z
	ld hl, (ws+3115)
	call f213_E_inc
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	jp    _04c7


	; emit_23 workspace at ws+3117 length ws+1
f288_emit_23:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
_04cd:
	ld a, (ws+3117)
	or a
	ret z
	ld hl, (ws+3115)
	call f214_E_dec
	ld a, (ws+3117)
	inc a
	ld (ws+3117), a
	jp    _04cd


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
	ret


	; emit_27 workspace at ws+3117 length ws+4
f292_emit_27:
	ld hl, (ws+3084)
	call f174_wordreg
	ld (ws+3117), hl
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
	ld (ws+3119), hl
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
	ret


	; emit_28 workspace at ws+3117 length ws+1
f293_emit_28:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
_04d3:
	ld a, (ws+3117)
	or a
	ret z
	ld bc,128
	push bc
	ld h,b
	ld l,c
	call f216_E_add
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	jp    _04d3


	; emit_29 workspace at ws+3117 length ws+4
f294_emit_29:
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3117), hl
	call f221_E_srl
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3119), hl
	jp f222_E_rr


	; emit_30 workspace at ws+3117 length ws+4
f295_emit_30:
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3117), hl
	call f220_E_sra
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3119), hl
	jp f222_E_rr


	; emit_31 workspace at ws+3117 length ws+0
f296_emit_31:
	ld hl, (ws+3115)
	jp f214_E_dec


_c313:
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
	ld hl,   _c313
	call f246_logic2i
	ret

_c314:
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
	ld hl,   _c314
	call f246_logic2i
	ret


	; emit_34 workspace at ws+3117 length ws+16
f299_emit_34:
	ld hl, (ws+3100)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz,    _04dd
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3117), hl
	call f183_E_storem
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3119), hl
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
	ld (ws+3121), hl
	call f183_E_storem
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3123), hl
	call f183_E_storem
	jp f179_E_exx
_04dd:
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3125), hl
	push hl
	ld hl, (ws+3100)
	push hl
	xor a
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3127), hl
	push hl
	ld hl, (ws+3100)
	push hl
	ld a,1
	call f189_E_store8i
	call f179_E_exx
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3129), hl
	push hl
	ld hl, (ws+3100)
	push hl
	ld a,2
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3131), hl
	push hl
	ld hl, (ws+3100)
	push hl
	ld a,3
	call f189_E_store8i
	jp f179_E_exx


	; emit_35 workspace at ws+3117 length ws+0
f300_emit_35:
	jp f234_CallI


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
	ret


	; emit_38 workspace at ws+3117 length ws+0
f302_emit_38:
	jp f234_CallI


	; emit_39 workspace at ws+3117 length ws+0
f303_emit_39:
	ld hl, (ws+3115)
	jp f181_E_pop


	; emit_40 workspace at ws+3117 length ws+4
f304_emit_40:
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3117), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3119), hl
	push hl
	xor a
	call f194_E_mvi
	ret


	; emit_41 workspace at ws+3117 length ws+4
f305_emit_41:
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3117), hl
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
	ld (ws+3119), hl
	push hl
	ld hl,1
	call f177_E_mov
	ret


	; emit_42 workspace at ws+3117 length ws+8
f306_emit_42:
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3117), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl,1
	call f203_E_xor
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3119), hl
	push hl
	ld hl,1
	call f177_E_mov
	call f179_E_exx
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3121), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3123), hl
	push hl
	ld hl,1
	call f177_E_mov
	jp f179_E_exx


	; emit_43 workspace at ws+3117 length ws+8
f307_emit_43:
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3117), hl
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
	ld (ws+3119), hl
	push hl
	ld hl,1
	call f177_E_mov
	call f179_E_exx
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3121), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3123), hl
	push hl
	ld hl,1
	call f177_E_mov
	jp f179_E_exx


	; emit_44 workspace at ws+3117 length ws+0
f308_emit_44:
	call f179_E_exx
	ld bc,128
	push bc
	ld hl,0
	call f229_E_lxi
	jp f179_E_exx


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
	jp f179_E_exx


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
	jp z,    _04e2
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3117), hl
	push hl
	ld hl, (ws+3100)
	push hl
	xor a
	call f189_E_store8i
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3119), hl
	push hl
	ld hl, (ws+3100)
	push hl
	ld a,1
	call f189_E_store8i
	ret
_04e2:
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3121), hl
	call f183_E_storem
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3084)
	call f173_hireg
	ld (ws+3123), hl
	jp f183_E_storem


	; emit_47 workspace at ws+3117 length ws+0
f311_emit_47:
	ld hl, (ws+3115)
	jp f181_E_pop


	; emit_48 workspace at ws+3117 length ws+0
f312_emit_48:
	ld hl, (ws+3088)
	jp f191_E_loada


	; emit_49 workspace at ws+3117 length ws+0
f313_emit_49:
	jp f234_CallI


	; emit_50 workspace at ws+3117 length ws+0
f314_emit_50:
	ld hl, (ws+3094)
	ld a,(hl)
	jp f205_E_addi


	; emit_51 workspace at ws+3117 length ws+0
f315_emit_51:
	ld hl, (ws+3094)
	ld a,(hl)
	jp f210_E_xori


	; emit_52 workspace at ws+3117 length ws+0
f316_emit_52:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+3094)
	ld a,(hl)
	call f253_bequ1c
	ret


	; emit_53 workspace at ws+3117 length ws+0
f317_emit_53:
	ld hl, (ws+3088)
	jp f191_E_loada


	; emit_54 workspace at ws+3117 length ws+1
f318_emit_54:
	ld hl, (ws+3094)
	ld a,(hl)
	ld (ws+3117), a
	or a
	jp nz,    _04e7
	ld hl,1
	call f202_E_or
	jp    _04e3
_04e7:
	ld a, (ws+3117)
	call f212_E_cpi
_04e3:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f250_E_jumps_jc_jnc


	; emit_55 workspace at ws+3117 length ws+0
f319_emit_55:
	ld hl, (ws+3082)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f186_E_lda
	ret

_c315:
	db 9,106,112,32,112,111,44,32,36,43,53,10,0


	; emit_56 workspace at ws+3117 length ws+0
f320_emit_56:
	ld hl, (ws+3094)
	ld a,(hl)
	call f207_E_subi
	ld hl,   _c315
	call f98_E
	ld a,128
	call f210_E_xori
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f251_E_jumps_jm_jp


	; emit_57 workspace at ws+3117 length ws+0
f321_emit_57:
	ld bc,0
	push bc
	ld hl, (ws+3115)
	call f228_ArchEmitMove
	ret


	; emit_58 workspace at ws+3117 length ws+0
f322_emit_58:
	ld hl, (ws+3094)
	jp f233_Call


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
	ret


	; emit_60 workspace at ws+3117 length ws+0
f324_emit_60:
	ld hl, (ws+3094)
	ld a,(hl)
	jp f211_E_andi


	; emit_63 workspace at ws+3117 length ws+0
f325_emit_63:
	ld hl, (ws+3100)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz,    _04ec
	ld hl,1
	jp f183_E_storem
_04ec:
	ld hl, (ws+3100)
	jp f184_E_stax


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
	ret


	; emit_65 workspace at ws+3117 length ws+0
f327_emit_65:
	ld hl, (ws+3094)
	ld a,(hl)
	jp f209_E_ori


_c316:
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
	ld hl,   _c316
	call f246_logic2i
	ret


	; emit_67 workspace at ws+3117 length ws+0
f329_emit_67:
	ld hl, (ws+3094)
	ld a,(hl)
	jp f207_E_subi


	; emit_68 workspace at ws+3117 length ws+8
f330_emit_68:
	ld hl, (ws+3082)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f151_RegCacheFindValue
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
	ret nz
	ld hl, (ws+3115)
	call f174_wordreg
	ld (ws+3121), hl
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
	ld (ws+3123), hl
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
	ret

_c317:
	db 9,106,112,32,112,111,44,32,36,43,53,10,0


	; emit_69 workspace at ws+3117 length ws+0
f331_emit_69:
	ld hl, (ws+3096)
	call f200_E_sub
	ld hl,   _c317
	call f98_E
	ld a,128
	call f210_E_xori
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f251_E_jumps_jm_jp


	; emit_70 workspace at ws+3117 length ws+0
f332_emit_70:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+3084)
	call f256_bequ2
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
	jp f250_E_jumps_jc_jnc


_c318:
	db 95,99,109,112,115,50,0


	; emit_72 workspace at ws+3117 length ws+0
f334_emit_72:
	ld hl,   _c318
	call f224_E_callhelper
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f251_E_jumps_jm_jp


	; emit_73 workspace at ws+3117 length ws+0
f335_emit_73:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f257_bequ4


_c319:
	db 95,99,109,112,117,52,0


	; emit_74 workspace at ws+3117 length ws+0
f336_emit_74:
	ld hl,   _c319
	call f224_E_callhelper
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f250_E_jumps_jc_jnc


_c320:
	db 95,99,109,112,115,52,0


	; emit_75 workspace at ws+3117 length ws+0
f337_emit_75:
	ld hl,   _c320
	call f224_E_callhelper
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f251_E_jumps_jm_jp


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
	jp nz,    _04f6
	call f178_E_ex
	jp    _04f2
_04f6:
	ld hl, (ws+3084)
	ld de,61440
	add hl,de
	ld a,h
	or l
	jp nz,    _04fa
	ld bc,8
	push bc
	ld hl,2
	call f177_E_mov
	ld de,16
	push de
	ld hl,4
	call f177_E_mov
_04fa:
_04f2:
	ld hl,512
	jp f181_E_pop


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
	jp nz,    _04ff
	ld hl,1
	call f202_E_or
	jp    _04fb
_04ff:
	ld hl, (ws+3078)
	ld a,(hl)
	call f212_E_cpi
_04fb:
	ld ix, (ws+3078)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f168_E_jnz


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
	ret

_c321:
	db 9,108,100,32,0


	; emit_88 workspace at ws+3117 length ws+0
f344_emit_88:
	ld hl, (ws+3115)
	call f164_R_flush
	ld hl,   _c321
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
	jp f95_E_nl


_c322:
	db 58,10,0


	; emit_89 workspace at ws+3117 length ws+0
f345_emit_89:
	ld hl, (ws+12)
	call f112_EmitterOpenStream
	ld hl, (ws+3078)
	push hl
	ld hl,0
	call f162_E_symref
	ld hl,   _c322
	jp f98_E


	; emit_90 workspace at ws+3117 length ws+0
f346_emit_90:
	jp f113_EmitterCloseStream


_c323:
	db 9,100,98,32,0


	; emit_91 workspace at ws+3117 length ws+0
f347_emit_91:
	ld hl,   _c323
	call f98_E
	ld hl, (ws+3078)
	ld a,(hl)
	call f101_E_u8
	jp f95_E_nl


_c324:
	db 9,100,119,32,0


	; emit_92 workspace at ws+3117 length ws+0
f348_emit_92:
	ld hl,   _c324
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
	jp f95_E_nl


_c325:
	db 9,100,119,111,114,100,32,0


	; emit_93 workspace at ws+3117 length ws+0
f349_emit_93:
	ld hl,   _c325
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
	jp f95_E_nl

_c326:
	db 9,100,119,32,0


	; emit_94 workspace at ws+3117 length ws+0
f350_emit_94:
	ld hl,   _c326
	call f98_E
	ld hl, (ws+3078)
	push hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	call f162_E_symref
	jp f95_E_nl


_c327:
	db 9,100,119,32,0


	; emit_95 workspace at ws+3117 length ws+0
f351_emit_95:
	ld hl,   _c327
	call f98_E
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f110_E_subref
	jp f95_E_nl


_c328:
	db 9,100,119,32,0


	; emit_96 workspace at ws+3117 length ws+0
f352_emit_96:
	ld hl,   _c328
	call f98_E
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f225_E_string
	jp f95_E_nl


	; emit_99 workspace at ws+3117 length ws+0
f353_emit_99:
	call f163_R_flushall
	jp f94_E_tab


	; emit_100 workspace at ws+3117 length ws+0
f354_emit_100:
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f98_E
	jp f92_E_space


	; emit_101 workspace at ws+3117 length ws+0
f355_emit_101:
	ld hl, (ws+3078)
	push hl
	ld hl,0
	call f162_E_symref
	jp f92_E_space


	; emit_102 workspace at ws+3117 length ws+0
f356_emit_102:
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f110_E_subref
	jp f92_E_space


	; emit_104 workspace at ws+3117 length ws+0
f357_emit_104:
	jp f95_E_nl


	; emit_106 workspace at ws+3117 length ws+0
f358_emit_106:
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp f165_E_label


	; emit_107 workspace at ws+3117 length ws+0
f359_emit_107:
	ld hl, (ws+3078)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp f167_E_jp


_c329:
	db 10,10,9,59,32,0
_c330:
	db 32,119,111,114,107,115,112,97,99,101,32,97,116,32,0
_c331:
	db 32,108,101,110,103,116,104,32,0
_c332:
	db 58,10,0


	; pop_return_address workspace at ws+3124 length ws+0
f361_pop_return_address:
	ld a, (ws+3119)
	or a
	ret nz
	ld hl,512
	call f181_E_pop
	ld a,1
	ld (ws+3119), a
	ret


	; emit_108 workspace at ws+3117 length ws+7
f360_emit_108:
	call f140_RegCacheReset
	ld hl, (ws+12)
	call f112_EmitterOpenStream
	ld hl,   _c329
	call f98_E
	ld hl, (ws+12)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f98_E
	ld hl,   _c330
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
	ld hl,   _c331
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
	ld hl,   _c332
	call f98_E
	ld ix, (ws+12)
	ld a, (ix+12)
	ld (ws+3117), a
	dec a
	ld (ws+3118), a
	xor a
	ld (ws+3119), a
_0505:
	ld a, (ws+3117)
	or a
	jp z,    _050a
	ld a, (ws+3117)
	dec a
	ld (ws+3117), a
	ld hl, (ws+12)
	push hl
	call f79_GetInputParameter
	ld (ws+3122), hl
	push hl
	pop ix
	ld a, (ix+7)
	cp 1
	jp nz,    _050c
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	cp b
	jp z,    _0511
	call f361_pop_return_address
	ld hl,1
	call f181_E_pop
_0511:
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f187_E_sta
	jp    _0505
_050c:
	cp 2
	jp nz,    _0512
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	cp b
	jp z,    _0517
	call f361_pop_return_address
	ld hl,128
	call f181_E_pop
_0517:
	ld bc,128
	push bc
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f193_E_store16
	jp    _0505
_0512:
	cp 4
	jp nz,    _0505
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	cp b
	jp z,    _051d
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
	jp    _0505
_051d:
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
	jp    _0505
_050a:
	ld a, (ws+3119)
	or a
	ret z
	ld hl,512
	jp f180_E_push


_c333:
	db 101,110,100,95,0
_c334:
	db 58,10,0


	; push_return_address workspace at ws+3124 length ws+0
f363_push_return_address:
	ld a, (ws+3119)
	or a
	ret nz
	ld hl,512
	call f181_E_pop
	ld a,1
	ld (ws+3119), a
	ret


	; emit_109 workspace at ws+3117 length ws+7
f362_emit_109:
	call f163_R_flushall
	ld hl,   _c333
	call f98_E
	ld hl, (ws+12)
	call f110_E_subref
	ld hl,   _c334
	call f98_E
	xor a
	ld (ws+3117), a
	ld ix, (ws+12)
	ld a, (ix+13)
	ld (ws+3118), a
	xor a
	ld (ws+3119), a
_0528:
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	cp b
	jp z,    _052d
	ld hl, (ws+12)
	push hl
	ld a, (ws+3117)
	call f80_GetOutputParameter
	ld (ws+3122), hl
	push hl
	pop ix
	ld a, (ix+7)
	cp 1
	jp nz,    _052f
	ld hl, (ws+3122)
	push hl
	ld hl,0
	call f186_E_lda
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	dec a
	cp b
	jp z,    _052e
	call f363_push_return_address
	ld hl,1
	call f180_E_push
	jp    _052e
_052f:
	cp 2
	jp nz,    _0535
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
	jp z,     _052e
	call f363_push_return_address
	ld hl,128
	call f180_E_push
	jp    _052e
_0535:
	cp 4
	jp nz,    _053b
	ld a, (ws+3117)
	ld b,a
	ld a, (ws+3118)
	dec a
	cp b
	jp z,    _0540
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
	jp    _053c
_0540:
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
_053c:
_053b:
_052e:
	ld a, (ws+3117)
	inc a
	ld (ws+3117), a
	jp    _0528
_052d:
	ld a, (ws+3119)
	or a
	jp z,    _0545
	ld hl,512
	call f180_E_push
_0545:
	call f169_E_ret
	jp f113_EmitterCloseStream


	; emit_110 workspace at ws+3117 length ws+0
f364_emit_110:
	jp f234_CallI


	; emit_112 workspace at ws+3117 length ws+0
f365_emit_112:
	ld hl, (ws+3096)
	jp f180_E_push


	; emit_113 workspace at ws+3117 length ws+0
f366_emit_113:
	ld hl, (ws+3096)
	jp f180_E_push


	; emit_114 workspace at ws+3117 length ws+0
f367_emit_114:
	ld hl, (ws+3096)
	push hl
	ld hl,0
	call f228_ArchEmitMove
	ret

_c335:
	db 9,106,114,32,101,110,100,95,0
_c336:
	db 10,0


	; emit_115 workspace at ws+3117 length ws+0
f368_emit_115:
	ld ix, (ws+12)
	ld a, (ix+13)
	or a
	jp z, f169_E_ret
	ld hl,   _c335
	call f98_E
	ld hl, (ws+12)
	call f110_E_subref
	ld hl,   _c336
	jp f98_E


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
	jp nz,    _0551
	ld hl, (ws+3115)
	ld de,65535
	add hl,de
	ld a,h
	or l
	jp nz,    _0551
	ld hl,1
	jp f203_E_xor
_0551:
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3078)
	ld a,(hl)
	call f194_E_mvi
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
	ret

_c337:
	db 9,108,100,32,0


	; emit_119 workspace at ws+3117 length ws+0
f372_emit_119:
	ld hl, (ws+3115)
	call f164_R_flush
	ld hl,   _c337
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
	jp f95_E_nl


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
	ret nz
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
	jp nz,    _055e
	ld hl, (ws+3115)
	ld de,64512
	add hl,de
	ld a,h
	or l
	jp nz,    _055e
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
	jp    _0558
_055e:
	ld hl, (ws+3115)
	call f174_wordreg
	ld (ws+3121), hl
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
	ld (ws+3123), hl
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
_0558:
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
	ret


	; emit_121 workspace at ws+3117 length ws+0
f374_emit_121:
	ld hl, (ws+3084)
	jp f191_E_loada


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
	jp z,    _0564
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3117), hl
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
	ret
_0564:
	ld de, (ws+3084)
	ld hl, (ws+3115)
	and a
	sbc hl,de
	jp nz,    _0568
	ld hl,1
	call f182_E_loadm
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3121), hl
	call f182_E_loadm
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3123), hl
	push hl
	ld hl,1
	call f177_E_mov
	ret
_0568:
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3125), hl
	call f182_E_loadm
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3127), hl
	jp f182_E_loadm


	; emit_123 workspace at ws+3117 length ws+16
f376_emit_123:
	ld hl, (ws+3084)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz,    _056d
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3117), hl
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
	ld (ws+3121), hl
	call f182_E_loadm
	ld hl,128
	call f213_E_inc
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3123), hl
	call f182_E_loadm
	jp f179_E_exx
_056d:
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3125), hl
	push hl
	ld hl, (ws+3084)
	push hl
	xor a
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3127), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,1
	call f188_E_load8i
	call f179_E_exx
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3129), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,2
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3131), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,3
	call f188_E_load8i
	jp f179_E_exx


	; emit_124 workspace at ws+3117 length ws+8
f377_emit_124:
	ld hl, (ws+3115)
	call f172_loreg
	ld (ws+3117), hl
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
	ld (ws+3121), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,2
	call f188_E_load8i
	ld hl, (ws+3115)
	call f173_hireg
	ld (ws+3123), hl
	push hl
	ld hl, (ws+3084)
	push hl
	ld a,3
	call f188_E_load8i
	jp f179_E_exx


	; emit_125 workspace at ws+3117 length ws+0
f378_emit_125:
	ld de,1
	push de
	ld hl, (ws+3084)
	call f216_E_add
	ret


	; emit_126 workspace at ws+3117 length ws+0
f379_emit_126:
	ld hl, (ws+3096)
	jp f200_E_sub


_c338:
	db 95,109,117,108,49,0


	; emit_127 workspace at ws+3117 length ws+0
f380_emit_127:
	ld hl,   _c338
	jp f224_E_callhelper


	; emit_128 workspace at ws+3117 length ws+0
f381_emit_128:
	jp f198_E_cpl


	; emit_129 workspace at ws+3117 length ws+0
f382_emit_129:
	ld hl,1
	call f203_E_xor
	ld hl, (ws+3084)
	jp f200_E_sub


	; emit_130 workspace at ws+3117 length ws+0
f383_emit_130:
	ld hl, (ws+3096)
	jp f202_E_or


	; emit_131 workspace at ws+3117 length ws+0
f384_emit_131:
	ld hl, (ws+3096)
	jp f201_E_and


	; emit_132 workspace at ws+3117 length ws+0
f385_emit_132:
	ld hl, (ws+3096)
	jp f203_E_xor


_c339:
	db 95,100,118,114,109,117,49,0


	; emit_133 workspace at ws+3117 length ws+0
f386_emit_133:
	ld hl,   _c339
	jp f224_E_callhelper


_c340:
	db 95,100,118,114,109,117,49,0


	; emit_134 workspace at ws+3117 length ws+0
f387_emit_134:
	ld hl,   _c340
	jp f224_E_callhelper


_c341:
	db 95,100,118,114,109,115,49,0


	; emit_135 workspace at ws+3117 length ws+0
f388_emit_135:
	ld hl,   _c341
	jp f224_E_callhelper


_c342:
	db 95,100,118,114,109,115,49,0


	; emit_136 workspace at ws+3117 length ws+0
f389_emit_136:
	ld hl,   _c342
	jp f224_E_callhelper


_c343:
	db 95,97,115,114,49,0


	; emit_137 workspace at ws+3117 length ws+0
f390_emit_137:
	ld hl,   _c343
	jp f224_E_callhelper


_c344:
	db 95,108,115,114,49,0


	; emit_138 workspace at ws+3117 length ws+0
f391_emit_138:
	ld hl,   _c344
	jp f224_E_callhelper


_c345:
	db 95,97,115,108,49,0


	; emit_139 workspace at ws+3117 length ws+0
f392_emit_139:
	ld hl,   _c345
	jp f224_E_callhelper


	; emit_140 workspace at ws+3117 length ws+4
f393_emit_140:
	ld hl, (ws+3084)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp z,    _0574
	ld hl, (ws+3096)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp z,    _0574
	ld hl, (ws+3096)
	ld de,65280
	add hl,de
	ld a,h
	or l
	jp nz,    _057a
	call f178_E_ex
	ld bc,128
	ld (ws+3096), bc
	jp    _0576
_057a:
	ld hl, (ws+3084)
	ld de,65280
	add hl,de
	ld a,h
	or l
	jp nz,    _057f
	call f178_E_ex
	jp    _057b
_057f:
	ld hl, (ws+3084)
	call f172_loreg
	ld (ws+3117), hl
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
_057b:
	ld bc,128
	ld (ws+3084), bc
_0576:
_0574:
	ld hl, (ws+3084)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz,    _0584
	ld bc,128
	push bc
	ld hl, (ws+3096)
	call f216_E_add
	ret
_0584:
	ld bc,128
	push bc
	ld hl, (ws+3084)
	call f216_E_add
	ret


	; emit_141 workspace at ws+3117 length ws+0
f394_emit_141:
	ld hl, (ws+3115)
	push hl
	ld hl, (ws+3096)
	call f216_E_add
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
	ret


	; emit_143 workspace at ws+3117 length ws+0
f396_emit_143:
	call f199_E_rcf
	ld de,128
	push de
	ld hl, (ws+3096)
	call f218_E_sbc
	ret


	; emit_144 workspace at ws+3117 length ws+0
f397_emit_144:
	jp f243_E_dvrmu2


	; emit_145 workspace at ws+3117 length ws+0
f398_emit_145:
	jp f243_E_dvrmu2


	; emit_146 workspace at ws+3117 length ws+0
f399_emit_146:
	jp f244_E_dvrms2


	; emit_147 workspace at ws+3117 length ws+0
f400_emit_147:
	jp f244_E_dvrms2


_c346:
	db 95,109,117,108,50,0


	; emit_148 workspace at ws+3117 length ws+0
f401_emit_148:
	ld hl,   _c346
	jp f224_E_callhelper


_c347:
	db 111,114,0


	; emit_149 workspace at ws+3117 length ws+0
f402_emit_149:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3096)
	push hl
	ld hl, (ws+3115)
	push hl
	ld hl,   _c347
	call f245_logic2
	ret

_c348:
	db 97,110,100,0


	; emit_150 workspace at ws+3117 length ws+0
f403_emit_150:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3096)
	push hl
	ld hl, (ws+3115)
	push hl
	ld hl,   _c348
	call f245_logic2
	ret

_c349:
	db 120,111,114,0


	; emit_151 workspace at ws+3117 length ws+0
f404_emit_151:
	ld hl, (ws+3084)
	push hl
	ld hl, (ws+3096)
	push hl
	ld hl, (ws+3115)
	push hl
	ld hl,   _c349
	call f245_logic2
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
	ld (ws+3123), hl
	push hl
	ld hl,1
	call f177_E_mov
	ret

_c350:
	db 95,108,115,114,50,0


	; emit_153 workspace at ws+3117 length ws+0
f406_emit_153:
	ld hl,   _c350
	jp f224_E_callhelper


_c351:
	db 95,97,115,114,50,0


	; emit_154 workspace at ws+3117 length ws+0
f407_emit_154:
	ld hl,   _c351
	jp f224_E_callhelper


_c352:
	db 95,97,115,108,50,0


	; emit_155 workspace at ws+3117 length ws+0
f408_emit_155:
	ld hl,   _c352
	jp f224_E_callhelper


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
	jp f179_E_exx


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
	jp f179_E_exx


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
	jp f179_E_exx


_c353:
	db 95,109,117,108,52,0


	; emit_159 workspace at ws+3117 length ws+0
f412_emit_159:
	ld hl,   _c353
	jp f224_E_callhelper


_c354:
	db 95,100,118,114,109,117,52,0


	; emit_160 workspace at ws+3117 length ws+0
f413_emit_160:
	ld hl,   _c354
	jp f224_E_callhelper


_c355:
	db 95,100,118,114,109,117,52,0


	; emit_161 workspace at ws+3117 length ws+0
f414_emit_161:
	ld hl,   _c355
	jp f224_E_callhelper


_c356:
	db 95,100,118,114,109,115,52,0


	; emit_162 workspace at ws+3117 length ws+0
f415_emit_162:
	ld hl,   _c356
	jp f224_E_callhelper


_c357:
	db 95,100,118,114,109,115,52,0


	; emit_163 workspace at ws+3117 length ws+0
f416_emit_163:
	ld hl,   _c357
	jp f224_E_callhelper


_c358:
	db 95,97,110,100,52,0


	; emit_164 workspace at ws+3117 length ws+0
f417_emit_164:
	ld hl,   _c358
	jp f224_E_callhelper


_c359:
	db 95,111,114,52,0


	; emit_165 workspace at ws+3117 length ws+0
f418_emit_165:
	ld hl,   _c359
	jp f224_E_callhelper


_c360:
	db 95,101,111,114,52,0


	; emit_166 workspace at ws+3117 length ws+0
f419_emit_166:
	ld hl,   _c360
	jp f224_E_callhelper


_c361:
	db 95,110,111,116,52,0


	; emit_167 workspace at ws+3117 length ws+0
f420_emit_167:
	ld hl,   _c361
	jp f224_E_callhelper


_c362:
	db 95,97,115,108,52,0


	; emit_168 workspace at ws+3117 length ws+0
f421_emit_168:
	ld hl,   _c362
	jp f224_E_callhelper


_c363:
	db 95,108,115,114,52,0


	; emit_169 workspace at ws+3117 length ws+0
f422_emit_169:
	ld hl,   _c363
	jp f224_E_callhelper


_c364:
	db 95,97,115,114,52,0


	; emit_170 workspace at ws+3117 length ws+0
f423_emit_170:
	ld hl,   _c364
	jp f224_E_callhelper


	; emit_171 workspace at ws+3117 length ws+0
f424_emit_171:
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+3084)
	call f252_bequ1
	ret


	; emit_172 workspace at ws+3117 length ws+0
f425_emit_172:
	ld hl, (ws+3096)
	call f196_E_cp
	ld ix, (ws+3076)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f250_E_jumps_jc_jnc


	; nop_emitter workspace at ws+3117 length ws+0
f426_nop_emitter:
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
_04aa:
	ld a, (ws+3114)
	or a
	jp z,    _04af
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
	jp z,    _04b4
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
_04b4:
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
	jp    _04aa
_04af:
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
	jp f500__jpde

f2___main_s0586:
	db 50
	db 40
	db 45
	db 158
	db 40
	db 51
	db 40
	db 46
	db 158
	db 40
	db 50
	db 45
	db 158
	db 40
	db 52
	db 47
	db 158
	db 40
	db 51
	db 46
	db 158
	db 40
	db 52
	db 40
	db 47
	db 42
	db 45
	db 158
	db 40
	db 46
	db 158
	db 40
	db 47
	db 158
	db 40
	db 157
	db 40
	db 132
	db 40
	db 29
	db 31
	db 43
	db 29
	db 32
	db 43
	db 56
	db 40
	db 40
	db 29
	db 33
	db 43
	db 62
	db 40
	db 50
	db 45
	db 42
	db 63
	db 40
	db 117
	db 40
	db 64
	db 40
	db 122
	db 40
	db 127
	db 40
	db 158
	db 40
	db 158
	db 40
	db 51
	db 46
	db 42
	db 92
	db 46
	db 42
	db 97
	db 47
	db 42
	db 52
	db 47
	db 42
	db 118
	db 40
	db 123
	db 40
	db 128
	db 40
	db 157
	db 40
	db 168
	db 40
	db 178
	db 40
	db 52
	db 47
	db 29
	db 33
	db 46
	db 42
	db 36
	db 29
	db 32
	db 37
	db 88
	db 88
	db 89
	db 89
	db 94
	db 94
	db 51
	db 46
	db 36
	db 92
	db 46
	db 29
	db 31
	db 157
	db 40
	db 177
	db 40
	db 57
	db 40
	db 97
	db 47
	db 67
	db 40
	db 45
	db 42
	db 62
	db 40
	db 38
	db 29
	db 43
	db 58
	db 40
	db 167
	db 40
	db 37
	db 38
	db 50
	db 45
	db 59
	db 40
	db 172
	db 40
	db 173
	db 40
	db 132
	db 40
	db 47
	db 42
	db 62
	db 58
	db 68
	db 63
	db 59
	db 69
	db 64
	db 72
	db 73
	db 74
	db 77
	db 78
	db 79
	db 82
	db 83
	db 84
	db 92
	db 97
	db 98
	db 41
	db 6
	db 15
	db 8
	db 9
	db 10
	db 13
	db 14
	db 12
	db 16
	db 17
	db 18
	db 19
	db 20
	db 21
	db 2
	db 23
	db 3
	db 26
	db 27
	db 4
	db 5
	db 29
	db 1
	db 31
	db 32
	db 33
	db 28
	db 40
	db 40
	db 42
	db 43
	db 40
	db 45
	db 46
	db 47
	db 47
	db 157
	db 132
	db 162
	db 107
	db 112
	db 172
	db 167
	db 177
	db 137
	db 147
	db 142
	db 152
	db 127
	db 122
	db 117
	db 158
	db 158
	db 113
	db 133
	db 138
	db 148
	db 143
	db 153
	db 163
	db 173
	db 168
	db 178
	db 108
	db 123
	db 128
	db 118
	db 159
	db 134
	db 114
	db 164
	db 139
	db 149
	db 144
	db 154
	db 169
	db 174
	db 179
	db 109
	db 119
	db 124
	db 129
	db 57
	db 67

f2___main_s0587:
	dw 24576
	dw 24576
	dw 43
	dw 24576
	dw 7168
	dw 24576
	dw 896
	dw 24576
	dw 24576
	dw 24576
	dw 24576
	dw 65535
	dw 65535
	dw 32768
	dw 1
	dw 32768
	dw 128
	dw 32768
	dw 1024
	dw 1
	dw 1
	dw 896
	dw 1
	dw 7168
	dw 65535
	dw 65535
	dw 65535
	dw 65535
	dw 25472
	dw 7168
	dw 128
	dw 65535
	dw 65535
	dw 65535
	dw 896
	dw 896
	dw 7168
	dw 24704
	dw 32768
	dw 1024
	dw 256
	dw 32768
	dw 128
	dw 256
	dw 1
	dw 1
	dw 1
	dw 1
	dw 128
	dw 128
	dw 896
	dw 24704
	dw 25472
	dw 32768
	dw 1
	dw 256
	dw 1
	dw 1
	dw 1
	dw 25472
	dw 1
	dw 1
	dw 32768
	dw 128
	dw 1
	dw 1
	dw 896
	dw 1024
	dw 1
	dw 896
	dw 1
	dw 1
	dw 42
	dw 768
	dw 128
	dw 128
	dw 768
	dw 128
	dw 256
	dw 2048
	dw 1024
	dw 1024
	dw 2048
	dw 1024
	dw 2048
	dw 1
	dw 256
	dw 7168
	dw 896
	dw 7168
	dw 1024
	dw 32768
	dw 256
	dw 32768
	dw 43
	dw 32768
	dw 896
	dw 32768
	dw 7168
	dw 25472
	dw 24704
	dw 24704
	dw 24576
	dw 42
	dw 1
	dw 1
	dw 42
	dw 8
	dw 32
	dw 1
	dw 42
	dw 1
	dw 42
	dw 1
	dw 42
	dw 1
	dw 42
	dw 32
	dw 8
	dw 32
	dw 8
	dw 32
	dw 8
	dw 32
	dw 8
	dw 1
	dw 2
	dw 1
	dw 2
	dw 1
	dw 2
	dw 896
	dw 896
	dw 65535
	dw 768
	dw 768
	dw 128
	dw 768
	dw 512
	dw 256
	dw 512
	dw 256
	dw 512
	dw 256
	dw 512
	dw 256
	dw 256
	dw 512
	dw 896
	dw 896
	dw 896
	dw 896
	dw 896
	dw 896
	dw 896
	dw 128
	dw 1
	dw 128
	dw 1
	dw 128
	dw 1
	dw 6144
	dw 1024
	dw 1024
	dw 6144
	dw 6144
	dw 4096
	dw 2048
	dw 4096
	dw 2048
	dw 4096
	dw 2048
	dw 4096
	dw 2048
	dw 4096
	dw 2048
	dw 2048
	dw 1024
	dw 2048
	dw 1024
	dw 2048
	dw 1024
	dw 1024
	dw 1024
	dw 1
	dw 1024
	dw 1
	dw 1024
	dw 1
	dw 42
	dw 1
	dw 1
	dw 42

f2___main_s0588:
	db 1
	dw 0
	dw 0
	dw 0
	db 179
	db 243
	db 64
	db 1
	dw 0
	dw 0
	dw 1
	db 179
	db 243
	db 64
	db 1
	dw 0
	dw 0
	dw 0
	db 177
	db 243
	db 66
	db 1
	dw 0
	dw 0
	dw 0
	db 177
	db 243
	db 66
	db 1
	dw 0
	dw 0
	dw 1
	db 177
	db 243
	db 66
	db 0
	dw 0
	dw 0
	dw 1248
	db 51
	db 51
	db 0
	db 1
	dw 43
	dw 43
	dw 0
	db 11
	db 15
	db 4
	db 1
	dw 25472
	dw 896
	dw 0
	db 11
	db 15
	db 4
	db 1
	dw 7168
	dw 7168
	dw 0
	db 11
	db 15
	db 4
	db 1
	dw 43
	dw 43
	dw 0
	db 17
	db 19
	db 2
	db 1
	dw 43
	dw 43
	dw 0
	db 17
	db 19
	db 2
	db 0
	dw 0
	dw 0
	dw 32766
	db 19
	db 31
	db 12
	db 0
	dw 0
	dw 0
	dw 31519
	db 19
	db 31
	db 12
	db 0
	dw 0
	dw 0
	dw 65535
	db 19
	db 19
	db 0
	db 0
	dw 0
	dw 0
	dw 31519
	db 19
	db 31
	db 12
	db 1
	dw 0
	dw 0
	dw 65535
	db 17
	db 19
	db 2
	db 0
	dw 0
	dw 0
	dw 0
	db 49
	db 51
	db 2
	db 1
	dw 0
	dw 0
	dw 65535
	db 17
	db 19
	db 2
	db 1
	dw 43
	dw 1
	dw 0
	db 17
	db 19
	db 2
	db 1
	dw 0
	dw 0
	dw 65535
	db 17
	db 19
	db 2
	db 1
	dw 43
	dw 43
	dw 0
	db 17
	db 19
	db 2
	db 1
	dw 43
	dw 43
	dw 0
	db 17
	db 19
	db 2
	db 1
	dw 25472
	dw 25472
	dw 0
	db 17
	db 19
	db 2
	db 1
	dw 25472
	dw 25472
	dw 0
	db 17
	db 19
	db 2
	db 0
	dw 0
	dw 0
	dw 0
	db 49
	db 51
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 7
	db 7
	db 0
	db 0
	dw 43
	dw 1
	dw 0
	db 7
	db 7
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 49
	db 51
	db 2
	db 1
	dw 25472
	dw 128
	dw 0
	db 17
	db 19
	db 2
	db 1
	dw 25472
	dw 25472
	dw 0
	db 17
	db 19
	db 2
	db 1
	dw 25472
	dw 25472
	dw 0
	db 17
	db 19
	db 2
	db 1
	dw 43
	dw 43
	dw 0
	db 17
	db 19
	db 2
	db 0
	dw 25472
	dw 896
	dw 1
	db 17
	db 19
	db 2
	db 0
	dw 25472
	dw 896
	dw 1
	db 17
	db 19
	db 2
	db 0
	dw 0
	dw 0
	dw 0
	db 17
	db 51
	db 34
	db 0
	dw 0
	dw 0
	dw 29191
	db 3
	db 31
	db 28
	db 0
	dw 25472
	dw 25472
	dw 0
	db 3
	db 3
	db 0
	db 1
	dw 43
	dw 1
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 29191
	db 3
	db 31
	db 28
	db 1
	dw 25472
	dw 25472
	dw 0
	db 1
	db 1
	db 0
	db 1
	dw 25472
	dw 896
	dw 0
	db 1
	db 3
	db 2
	db 1
	dw 25472
	dw 896
	dw 0
	db 1
	db 3
	db 2
	db 1
	dw 7168
	dw 7168
	dw 0
	db 1
	db 3
	db 2
	db 1
	dw 7168
	dw 7168
	dw 0
	db 1
	db 3
	db 2
	db 1
	dw 7168
	dw 1024
	dw 0
	db 1
	db 3
	db 2
	db 1
	dw 7168
	dw 1024
	dw 1
	db 1
	db 3
	db 2
	db 0
	dw 0
	dw 0
	dw 1
	db 17
	db 51
	db 34
	db 1
	dw 43
	dw 43
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 43
	dw 1
	dw 0
	db 3
	db 7
	db 4
	db 0
	dw 0
	dw 0
	dw 30438
	db 3
	db 31
	db 28
	db 0
	dw 43
	dw 1
	dw 0
	db 17
	db 19
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 17
	db 19
	db 2
	db 0
	dw 0
	dw 0
	dw 65535
	db 17
	db 19
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 3
	db 7
	db 4
	db 0
	dw 0
	dw 0
	dw 65535
	db 17
	db 19
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 3
	db 3
	db 0
	db 0
	dw 0
	dw 0
	dw 65535
	db 17
	db 19
	db 2
	db 1
	dw 7168
	dw 7168
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 32767
	db 17
	db 19
	db 2
	db 0
	dw 0
	dw 0
	dw 65535
	db 17
	db 19
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 17
	db 19
	db 2
	db 1
	dw 25472
	dw 128
	dw 0
	db 1
	db 1
	db 0
	db 1
	dw 7168
	dw 1024
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 17
	db 51
	db 34
	db 0
	dw 0
	dw 0
	dw 65535
	db 17
	db 19
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 17
	db 19
	db 2
	db 0
	dw 25472
	dw 896
	dw 1
	db 17
	db 19
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 17
	db 19
	db 2
	db 0
	dw 7168
	dw 7168
	dw 0
	db 3
	db 3
	db 0
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 19
	db 18
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 19
	db 18
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 19
	db 18
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 19
	db 18
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 19
	db 18
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 19
	db 18
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 19
	db 18
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 3
	db 2
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 3
	db 2
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 3
	db 2
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 3
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 3
	db 2
	db 0
	dw 25472
	dw 128
	dw 0
	db 1
	db 3
	db 2
	db 0
	dw 25472
	dw 896
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 1
	db 0
	db 0
	dw 0
	dw 0
	dw 30439
	db 1
	db 19
	db 18
	db 0
	dw 32768
	dw 32768
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 32768
	dw 32768
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 32768
	dw 32768
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 32768
	dw 32768
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 1
	db 0
	db 0
	dw 43
	dw 43
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 25472
	dw 25472
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 25472
	dw 25472
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 25472
	dw 25472
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 7168
	dw 7168
	dw 0
	db 1
	db 1
	db 0
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 3
	db 2
	db 0
	dw 25472
	dw 896
	dw 1
	db 1
	db 3
	db 2
	db 0
	dw 7168
	dw 6144
	dw 0
	db 1
	db 3
	db 2
	db 0
	dw 7168
	dw 1024
	dw 0
	db 1
	db 3
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 1
	dw 4614
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 3
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 3
	db 2
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 32
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 32
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 8
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 1
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 1
	dw 4614
	db 1
	db 19
	db 18
	db 0
	dw 43
	dw 1
	dw 4614
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 128
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 24576
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 128
	dw 1
	db 1
	db 3
	db 2
	db 0
	dw 25472
	dw 128
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 512
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 128
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 512
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 256
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 128
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 896
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 896
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 896
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 896
	dw 1
	db 1
	db 3
	db 2
	db 0
	dw 25472
	dw 128
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 128
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 25472
	dw 128
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 1024
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 1024
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 1024
	dw 1
	db 1
	db 3
	db 2
	db 0
	dw 7168
	dw 1024
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 4096
	dw 1249
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 1024
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 4096
	dw 1249
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 2048
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 1024
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 1024
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 1024
	dw 1
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 1024
	dw 1
	db 1
	db 3
	db 2
	db 0
	dw 7168
	dw 1024
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 1024
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 7168
	dw 1024
	dw 0
	db 1
	db 19
	db 18
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 19
	db 18
	db 0
	dw 0
	dw 0
	dw 65535
	db 1
	db 19
	db 18

	end
