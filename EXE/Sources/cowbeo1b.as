	psect text

 global f78_PurgeAllFreeInstructions
 global f120_EmitterDeclareWorkspace
 global f121_I_b8
 global f122_I_b16
 global f125_I_bsize
 global f126_I_countedstring
 global f127_InputterOpenfile
 global f128_InputterClosefile
 global f140_RegCacheReset
 global f144_RegCacheLeavesConstant
 global f147_RegCacheLeavesValue
 global f148_RegCacheFindConstant
 global f151_RegCacheFindValue
 global f153_AllocSubrId
 global f154_AllocNewInstruction
 global f155_FreeInstruction
 global f156_FindConflictingRegisters
 global f157_FindCompatibleRegisters
 global f158_FindFirst
 global f162_E_symref
 global f163_R_flushall
 global f164_R_flush
 global f165_E_label
 global f167_E_jp
 global f168_E_jnz
 global f169_E_ret
 global f172_loreg
 global f173_hireg
 global f174_wordreg
 global f175_E_reg
 global f177_E_mov
 global f178_E_ex
 global f179_E_exx
 global f180_E_push
 global f181_E_pop
 global f182_E_loadm
 global f183_E_storem
 global f184_E_stax
 global f186_E_lda
 global f187_E_sta
 global f188_E_load8i
 global f189_E_store8i
 global f190_E_store8ic
 global f191_E_loada
 global f192_E_load16
 global f193_E_store16
 global f194_E_mvi
 global f196_E_cp
 global f198_E_cpl
 global f199_E_rcf
 global f200_E_sub
 global f201_E_and
 global f202_E_or
 global f203_E_xor
 global f205_E_addi
 global f207_E_subi
 global f209_E_ori
 global f210_E_xori
 global f211_E_andi
 global f212_E_cpi
 global f213_E_inc
 global f214_E_dec
 global f216_E_add
 global f217_E_adc
 global f218_E_sbc
 global f220_E_sra
 global f221_E_srl
 global f222_E_rr
 global f223_E_bit
 global f224_E_callhelper
 global f225_E_string
 global f228_ArchEmitMove
 global f229_E_lxi
 global f230_E_lxia
 global f231_ArchEndInstruction
 global f232_ArchEndGroup
 global f233_Call
 global f234_CallI
 global f243_E_dvrmu2
 global f244_E_dvrms2
 global f245_logic2
 global f246_logic2i
 global f249_E_jumps_jnz_jz
 global f250_E_jumps_jc_jnc
 global f251_E_jumps_jm_jp
 global f252_bequ1
 global f253_bequ1c
 global f255_bequ2c
 global f256_bequ2
 global f257_bequ4
 global f258_bequ4c
 global f260_beqc
 global f261_case2
 global f262_MatchPredicate
 global f2___main_s016c
 global f2___main_s01dc
 global f2___main_s01dd
 global f2___main_s01de


	; EmitterDeclareWorkspace workspace at ws+3058 length ws+5
f120_EmitterDeclareWorkspace:
	ld (ws+3061), hl
	pop bc
	pop af
	ld (ws+3060), a
	pop hl
	ld (ws+3058), hl
	push bc
	ld a,87
	call f86_WriteB8
	ld hl,5
	call f87_WriteB16
	ld hl, (ws+3058)
	call f87_WriteB16
	ld a, (ws+3060)
	call f86_WriteB8
	ld hl, (ws+3061)
	jp   f87_WriteB16 ;	call f87_WriteB16
;end_f120_EmitterDeclareWorkspac: 
;	ret


	; I_b8 workspace at ws+3089 length ws+2
f121_I_b8:
	ld hl,ws+2289
	call f61_FCBGetChar
;	ld (ws+3090), a
;	ld (ws+3089), a
;end_f121_I_b8:
;	ld a, (ws+3089)
	ret


	; I_b16 workspace at ws+3085 length ws+4
f122_I_b16:
	call f121_I_b8
;	ld (ws+3087), a
	ld l,a
	ld h,0
	ld (ws+3085), hl
	call f121_I_b8
;	ld (ws+3088), a
	ld de, (ws+3085)
	ld l,a
	ld h,0
	ld a,8
	call f479__asl2
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
;	ld (ws+3085), hl
;end_f122_I_b16:
;	ld hl, (ws+3085)
	ret


	; I_b32 workspace at ws+3074 length ws+8
f124_I_b32:
	call f122_I_b16
;	ld (ws+3078), hl
	exx
	ld hl,0
	exx
	ld (ws+3074), hl
	exx
	ld (ws+3076), hl
	exx
	call f122_I_b16
	ld (ws+3080), hl
	ld de, (ws+3074)
	exx
	ld de, (ws+3076)
	exx
	ld hl, (ws+3080)
	exx
	ld hl,0
	exx
	ld a,16
	call f482__asl4
	call f494__or4
	ld (ws+3074), hl
	exx
	ld (ws+3076), hl
	exx
;end_f124_I_b32:
	ld hl, (ws+3074)
	exx
	ld hl, (ws+3076)
	exx
	ret


	; I_bsize workspace at ws+3081 length ws+4
f125_I_bsize:
	call f122_I_b16
;	ld (ws+3083), hl
;	ld (ws+3081), hl
;end_f125_I_bsize:
;	ld hl, (ws+3081)
	ret


	; I_countedstring workspace at ws+3074 length ws+9
f126_I_countedstring:
	call f121_I_b8
	ld (ws+3076), a
	ld (ws+3077), a
	inc a
	ld l,a
	ld h,0
	call f38_Alloc
;	ld (ws+3078), hl
	ld (ws+3074), hl
	ld (ws+3080), hl
c01_01d1:
	ld a, (ws+3077)
	or a
	jp z, c01_01d6
	call f121_I_b8
	ld hl, (ws+3080)
	ld (hl),a
	inc hl
	ld (ws+3080), hl
	ld a, (ws+3077)
	dec a
	ld (ws+3077), a
	jp c01_01d1
c01_01d6:
	xor a
	ld hl, (ws+3080)
	ld (hl),a
;end_f126_I_countedstring:
	ld hl, (ws+3074)
	ret


	; InputterOpenfile workspace at ws+3040 length ws+3
f127_InputterOpenfile:
	ld (ws+3040), hl
	ld hl,ws+2289
	push hl
	ld hl, (ws+3040)
	call f50_FCBOpenIn
;	ld (ws+3042), a
	or a
	jp z, c01_01db
	ld hl, (ws+3040)
	call f75_CannotOpen
c01_01db:
;c01_01d7:
;end_f127_InputterOpenfile:
	ret


	; InputterClosefile workspace at ws+3040 length ws+2
f128_InputterClosefile:
	ld hl,ws+2289
	call f53_FCBClose
;	ld (ws+3040), a
;	ld (ws+3041), a
;end_f128_InputterClosefile:
	ret


	; ReadMid0 workspace at ws+3068 length ws+6
f129_ReadMid0:
	ld (ws+3066), hl
	call f124_I_b32
	ld (ws+3068), hl
	exx
	ld (ws+3070), hl
	exx
	ld de, (ws+3068)
	exx
	ld de, (ws+3070)
	exx
	ld hl, (ws+3066)
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
	call f122_I_b16
;	ld (ws+3072), hl
	ld ix, (ws+3066)
	ld (ix+4), l
	ld (ix+5), h
;end_f129_ReadMid0:
	ret


	; ReadMid1 workspace at ws+3068 length ws+10
f130_ReadMid1:
	ld (ws+3066), hl
	call f122_I_b16
;	ld (ws+3068), hl
	call f71_FindSubr
;	ld (ws+3070), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	call f121_I_b8
;	ld (ws+3072), a
	ld hl, (ws+3066)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl),a
	call f125_I_bsize
;	ld (ws+3073), hl
	ld ix, (ws+3066)
	ld (ix+5), l
	ld (ix+6), h
	call f121_I_b8
;	ld (ws+3075), a
	ld ix, (ws+3066)
	ld (ix+7), a
	call f125_I_bsize
;	ld (ws+3076), hl
	ld ix, (ws+3066)
	ld (ix+8), l
	ld (ix+9), h
;end_f130_ReadMid1:
	ret


	; ReadMid2 workspace at ws+3068 length ws+8
f131_ReadMid2:
	ld (ws+3066), hl
	call f122_I_b16
;	ld (ws+3068), hl
	call f71_FindSubr
;	ld (ws+3070), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	call f121_I_b8
;	ld (ws+3072), a
	ld hl, (ws+3066)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl),a
	call f125_I_bsize
;	ld (ws+3073), hl
	ld ix, (ws+3066)
	ld (ix+5), l
	ld (ix+6), h
	call f121_I_b8
;	ld (ws+3075), a
	ld ix, (ws+3066)
	ld (ix+7), a
;end_f131_ReadMid2:
	ret


	; ReadMid3 workspace at ws+3068 length ws+2
f132_ReadMid3:
	ld (ws+3066), hl
	call f122_I_b16
;	ld (ws+3068), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f132_ReadMid3:
	ret


	; ReadMid4 workspace at ws+3068 length ws+0
f133_ReadMid4:
	ld (ws+3066), hl
;end_f133_ReadMid4:
	ret


	; ReadMid5 workspace at ws+3068 length ws+1
f134_ReadMid5:
	ld (ws+3066), hl
	call f121_I_b8
;	ld (ws+3068), a
	ld hl, (ws+3066)
	ld (hl),a
;end_f134_ReadMid5:
	ret


	; ReadMid6 workspace at ws+3068 length ws+13
f135_ReadMid6:
	ld (ws+3066), hl
	call f122_I_b16
;	ld (ws+3068), hl
	call f71_FindSubr
;	ld (ws+3070), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	call f122_I_b16
;	ld (ws+3072), hl
	call f71_FindSubr
;	ld (ws+3074), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	call f121_I_b8
;	ld (ws+3076), a
	ld ix, (ws+3066)
	ld (ix+6), a
	call f125_I_bsize
;	ld (ws+3077), hl
	ld ix, (ws+3066)
	ld (ix+7), l
	ld (ix+8), h
	call f121_I_b8
;	ld (ws+3079), a
	ld ix, (ws+3066)
	ld (ix+9), a
	call f121_I_b8
;	ld (ws+3080), a
	ld ix, (ws+3066)
	ld (ix+10), a
;end_f135_ReadMid6:
	ret


	; ReadMid7 workspace at ws+3068 length ws+7
f136_ReadMid7:
	ld (ws+3066), hl
	call f122_I_b16
;	ld (ws+3068), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	call f122_I_b16
;	ld (ws+3070), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	call f122_I_b16
;	ld (ws+3072), hl
	ld ix, (ws+3066)
	ld (ix+4), l
	ld (ix+5), h
	call f121_I_b8
;	ld (ws+3074), a
	ld ix, (ws+3066)
	ld (ix+6), a
;end_f136_ReadMid7:
	ret


	; ReadMid8 workspace at ws+3068 length ws+4
f137_ReadMid8:
	ld (ws+3066), hl
	call f122_I_b16
;	ld (ws+3068), hl
	call f71_FindSubr
;	ld (ws+3070), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f137_ReadMid8:
	ret


	; ReadMid9 workspace at ws+3068 length ws+4
f138_ReadMid9:
	ld (ws+3066), hl
	call f124_I_b32
	ld (ws+3068), hl
	exx
	ld (ws+3070), hl
	exx
	ld de, (ws+3068)
	exx
	ld de, (ws+3070)
	exx
	ld hl, (ws+3066)
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
;end_f138_ReadMid9:
	ret


	; ReadMid10 workspace at ws+3068 length ws+2
f139_ReadMid10:
	ld (ws+3066), hl
	call f126_I_countedstring
;	ld (ws+3068), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f139_ReadMid10:
	ret
f2___main_s01dc:
	dw f129_ReadMid0
	dw f130_ReadMid1
	dw f131_ReadMid2
	dw f132_ReadMid3
	dw f133_ReadMid4
	dw f134_ReadMid5
	dw f135_ReadMid6
	dw f136_ReadMid7
	dw f137_ReadMid8
	dw f138_ReadMid9
	dw f139_ReadMid10
f2___main_s01dd:
	db 4
	db 4
	db 4
	db 8
	db 8
	db 2
	db 9
	db 9
	db 9
	db 9
	db 9
	db 10
	db 1
	db 8
	db 4
	db 4
	db 4
	db 4
	db 10
	db 2
	db 8
	db 9
	db 4
	db 4
	db 4
	db 3
	db 3
	db 4
	db 8
	db 6
	db 6
	db 6
	db 6
	db 6
	db 6
	db 6
	db 6
	db 6
	db 6
	db 9
	db 10
	db 1
	db 8
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 7
	db 4
	db 4
	db 4
	db 4
	db 4
	db 0
	db 0
	db 0
	db 0
	db 0
	db 4
	db 4
	db 4
	db 4
	db 4
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 5
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
	db 4
f2___main_s01de:
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 2
	db 0
	db 0
	db 0
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 0
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 1
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2
	db 2


	; RegCacheReset workspace at ws+3124 length ws+0
f140_RegCacheReset:
	ld de,ws+2455
	push de
	ld hl,160
	call f26_MemZero
;end_f140_RegCacheReset:
	ret


	; RegCacheFlush workspace at ws+3177 length ws+4
f141_RegCacheFlush:
	ld (ws+3177), hl
	ld de,ws+2455
	ld (ws+3179), de
c01_01df:
	ld de, (ws+3179)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z, c01_01e4
	ld ix, (ws+3179)
	ld a, (ix+9)
	or a
	jp z, c01_01eb
;c01_01ec:
	ld de, (ws+3177)
	ld ix, (ws+3179)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
	jp z, c01_01eb
;c01_01ea:
	ld ix, (ws+3179)
	ld (ix+9), 0
c01_01eb:
;c01_01e5:
	ld hl, (ws+3179)
	ld bc,10
	add hl,bc
	ld (ws+3179), hl
	jp c01_01df
c01_01e4:
;end_f141_RegCacheFlush:
	ret


	; reg_i_find_empty_slot workspace at ws+3155 length ws+2
f143_reg_i_find_empty_slot:
	ld de,ws+2455
	ld (ws+3155), de
c01_01f8:
	ld de, (ws+3155)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z, c01_01fd
	ld ix, (ws+3155)
	ld a, (ix+9)
	or a
	jp nz, c01_0202
	jp end_f143_reg_i_find_empty_slot
c01_0202:
;c01_01fe:
	ld hl, (ws+3155)
	ld bc,10
	add hl,bc
	ld (ws+3155), hl
	jp c01_01f8
c01_01fd:
	ld iy,0
	ld (ws+3155), iy
end_f143_reg_i_find_empty_slot:
	ld hl, (ws+3155)
	ret


	; RegCacheLeavesConstant workspace at ws+3141 length ws+10
f144_RegCacheLeavesConstant:
	ld (ws+3143), hl
	exx
	ld (ws+3145), hl
	exx
	pop bc
	pop hl
	ld (ws+3141), hl
	push bc
	ld de,ws+2455
	ld (ws+3147), de
c01_0203:
	ld de, (ws+3147)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z, c01_0208
	ld ix, (ws+3147)
	ld a, (ix+9)
	cp 1
	jp nz, c01_020f
;c01_0210:
	ld hl, (ws+3147)
	inc hl
	inc hl
	inc hl
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
	ld hl, (ws+3143)
	exx
	ld hl, (ws+3145)
	exx
	call f498__cmpu4
	jp nz, c01_020f
;c01_020e:
	ld ix, (ws+3147)
	ld e, (ix+7)
	ld d, (ix+8)
	ld hl, (ws+3141)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+7), l
	ld (ix+8), h
	ret
c01_020f:
;c01_0209:
	ld hl, (ws+3147)
	ld bc,10
	add hl,bc
	ld (ws+3147), hl
	jp c01_0203
c01_0208:
	call f143_reg_i_find_empty_slot
;	ld (ws+3149), hl
	ld (ws+3147), hl
	ld a,h
	or l
	jp z, c01_0215
	ld ix, (ws+3147)
	ld (ix+9), 1
	ld de, (ws+3143)
	exx
	ld de, (ws+3145)
	exx
	push ix
	pop hl
	inc hl
	inc hl
	inc hl
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
	ld hl, (ws+3141)
	ld (ix+7), l
	ld (ix+8), h
c01_0215:
;c01_0211:
;end_f144_RegCacheLeavesConstant:
	ret


	; RegCacheLeavesValue workspace at ws+3145 length ws+10
f147_RegCacheLeavesValue:
	ld (ws+3149), hl
	pop bc
	pop hl
	ld (ws+3147), hl
	pop hl
	ld (ws+3145), hl
	push bc
	ld ix, (ws+3147)
	ld e, (ix+5)
	ld d, (ix+6)
	ld hl, (ws+3149)
	add hl,de
	ld (ws+3149), hl
	ld de,ws+2455
	ld (ws+3151), de
c01_022f:
	ld de, (ws+3151)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z, c01_0234
	ld ix, (ws+3151)
	ld a, (ix+9)
	cp 3
	jp nz, c01_023f
;c01_0242:
	ld hl, (ws+3151)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3147)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	and a
	sbc hl,de
	jp nz, c01_023f
;c01_0241:
	ld hl, (ws+3151)
	inc hl
	inc hl
	ld a,(hl)
	ld b,a
	ld hl, (ws+3147)
	inc hl
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	cp b
	jp nz, c01_023f
;c01_0240:
	ld hl, (ws+3151)
	inc hl
	inc hl
	inc hl
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
	ld hl, (ws+3149)
	exx
	ld hl,0
	exx
	call f498__cmpu4
	jp nz, c01_023f
;c01_023e:
	ld ix, (ws+3151)
	ld e, (ix+7)
	ld d, (ix+8)
	ld hl, (ws+3145)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ix+7), l
	ld (ix+8), h
	ret
c01_023f:
;c01_0235:
	ld hl, (ws+3151)
	ld bc,10
	add hl,bc
	ld (ws+3151), hl
	jp c01_022f
c01_0234:
	call f143_reg_i_find_empty_slot
;	ld (ws+3153), hl
	ld (ws+3151), hl
	ld a,h
	or l
	jp z, c01_0247
	ld ix, (ws+3151)
	ld (ix+9), 3
	ld hl, (ws+3147)
	ld e,(hl)
	inc hl
	ld d,(hl)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3147)
	inc hl
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),a
	ld hl, (ws+3149)
	exx
	ld hl,0
	exx
	ex de,hl
	exx
	ex de,hl
	exx
	push ix
	pop hl
	inc hl
	inc hl
	inc hl
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
	ld hl, (ws+3145)
	ld (ix+7), l
	ld (ix+8), h
c01_0247:
;c01_0243:
;end_f147_RegCacheLeavesValue:
	ret


	; RegCacheFindConstant workspace at ws+3141 length ws+8
f148_RegCacheFindConstant:
	ld (ws+3141), hl
	exx
	ld (ws+3143), hl
	exx
	ld iy,0
	ld (ws+3145), iy
	ld de,ws+2455
	ld (ws+3147), de
c01_0248:
	ld de, (ws+3147)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z, c01_024d
	ld ix, (ws+3147)
	ld a, (ix+9)
	cp 1
	jp nz, c01_0254
;c01_0255:
	ld hl, (ws+3147)
	inc hl
	inc hl
	inc hl
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
	ld hl, (ws+3141)
	exx
	ld hl, (ws+3143)
	exx
	call f498__cmpu4
	jp nz, c01_0254
;c01_0253:
	ld ix, (ws+3147)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+3145), hl
	jp end_f148_RegCacheFindConstant
c01_0254:
;c01_024e:
	ld hl, (ws+3147)
	ld bc,10
	add hl,bc
	ld (ws+3147), hl
	jp c01_0248
c01_024d:
end_f148_RegCacheFindConstant:
	ld hl, (ws+3145)
	ret


	; RegCacheFindValue workspace at ws+3145 length ws+8
f151_RegCacheFindValue:
	ld (ws+3147), hl
	pop bc
	pop hl
	ld (ws+3145), hl
	push bc
	ld iy,0
	ld (ws+3149), iy
	push hl
	pop ix
	ld e, (ix+5)
	ld d, (ix+6)
	ld hl, (ws+3147)
	add hl,de
	ld (ws+3147), hl
	ld de,ws+2455
	ld (ws+3151), de
c01_026a:
	ld de, (ws+3151)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z, c01_026f
	ld ix, (ws+3151)
	ld a, (ix+9)
	cp 3
	jp nz, c01_027a
;c01_027d:
	ld hl, (ws+3151)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3145)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	and a
	sbc hl,de
	jp nz, c01_027a
;c01_027c:
	ld hl, (ws+3151)
	inc hl
	inc hl
	ld a,(hl)
	ld b,a
	ld hl, (ws+3145)
	inc hl
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	cp b
	jp nz, c01_027a
;c01_027b:
	ld hl, (ws+3151)
	inc hl
	inc hl
	inc hl
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
	ld hl, (ws+3147)
	exx
	ld hl,0
	exx
	call f498__cmpu4
	jp nz, c01_027a
;c01_0279:
	ld ix, (ws+3151)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+3149), hl
	jp end_f151_RegCacheFindValue
c01_027a:
;c01_0270:
	ld hl, (ws+3151)
	ld bc,10
	add hl,bc
	ld (ws+3151), hl
	jp c01_026a
c01_026f:
end_f151_RegCacheFindValue:
	ld hl, (ws+3149)
	ret


	; AllocSubrId workspace at ws+3128 length ws+2
f153_AllocSubrId:
	ld hl, (ws+16)
	ld (ws+3128), hl
	inc hl
	ld (ws+16), hl
;end_f153_AllocSubrId:
	ld hl, (ws+3128)
	ret


	; AllocNewInstruction workspace at ws+3073 length ws+4
f154_AllocNewInstruction:
	ld hl, (ws+3000)
	ld a,h
	or l
	jp z, c01_0282
	ld hl, (ws+3000)
	ld (ws+3073), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3000), hl
	ld hl, (ws+3073)
	push hl
	ld d,0
	push de
	ld hl,68
	call f8_MemSet
	jp c01_027e
c01_0282:
	ld hl,68
	call f76_InternalAlloc
;	ld (ws+3075), hl
	ld (ws+3073), hl
c01_027e:
;end_f154_AllocNewInstruction:
	ld hl, (ws+3073)
	ret


	; FreeInstruction workspace at ws+3075 length ws+2
f155_FreeInstruction:
	ld (ws+3075), hl
	ld de, (ws+3000)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3075)
	ld (ws+3000), hl
;end_f155_FreeInstruction:
	ret


	; PurgeAllFreeInstructions workspace at ws+3136 length ws+2
f78_PurgeAllFreeInstructions:
c01_0283:
	ld hl, (ws+3000)
	ld a,h
	or l
	jp z, c01_0288
	ld hl, (ws+3000)
	ld (ws+3136), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3000), hl
	ld hl, (ws+3136)
	call f40_Free
	jp c01_0283
c01_0288:
;end_f78_PurgeAllFreeInstruction: 
	ret


	; FindConflictingRegisters workspace at ws+3177 length ws+6
f156_FindConflictingRegisters:
	ld (ws+3177), hl
	ld iy,0
	ld (ws+3179), iy
	ld ix,f2___main_s016c
	ld (ws+3181), ix
c01_0289:
	ld de, (ws+3181)
	ld hl,f2___main_s016c+144
	and a
	sbc hl,de
	jp z, c01_028e
	ld hl, (ws+3181)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3177)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
	jp z, c01_0293
	ld de, (ws+3179)
	ld ix, (ws+3181)
	ld l, (ix+4)
	ld h, (ix+5)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld (ws+3179), hl
c01_0293:
;c01_028f:
	ld hl, (ws+3181)
	ld de,9
	add hl,de
	ld (ws+3181), hl
	jp c01_0289
c01_028e:
;end_f156_FindConflictingRegiste:  
	ld hl, (ws+3179)
	ret


	; FindCompatibleRegisters workspace at ws+3124 length ws+6
f157_FindCompatibleRegisters:
	ld (ws+3124), hl
	ld bc,65535
	ld (ws+3126), bc
	ld ix,f2___main_s016c
	ld (ws+3128), ix
c01_0294:
	ld de, (ws+3128)
	ld hl,f2___main_s016c+144
	and a
	sbc hl,de
	jp z, c01_0299
	ld hl, (ws+3128)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+3124)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
	jp z, c01_029e
	ld de, (ws+3126)
	ld ix, (ws+3128)
	ld l, (ix+6)
	ld h, (ix+7)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld (ws+3126), hl
c01_029e:
;c01_029a:
	ld hl, (ws+3128)
	ld de,9
	add hl,de
	ld (ws+3128), hl
	jp c01_0294
c01_0299:
;end_f157_FindCompatibleRegister: 
	ld hl, (ws+3126)
	ret


	; FindFirst workspace at ws+3150 length ws+4
f158_FindFirst:
	ld (ws+3150), hl
	ld iy,1
	ld (ws+3152), iy
c01_029f:
	ld hl, (ws+3152)
	ld a,h
	or l
	jp z, c01_02a4
	ld de, (ws+3150)
	ld hl, (ws+3152)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
	jp z, c01_02a9
	jp end_f158_FindFirst
c01_02a9:
;c01_02a5:
	ld hl, (ws+3152)
	add hl,hl
	ld (ws+3152), hl
	jp c01_029f
c01_02a4:
	ld bc,0
	ld (ws+3152), bc
end_f158_FindFirst:
	ld hl, (ws+3152)
	ret


	; E_symref workspace at ws+3145 length ws+4
f162_E_symref:
	ld (ws+3147), hl
	pop bc
	pop hl
	ld (ws+3145), hl
	push bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	cp 255
	jp nz, c01_02bf
	ld hl, (ws+3145)
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
	push hl
	ld hl, (ws+3145)
	inc hl
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	push af
	ld ix, (ws+3145)
	ld l, (ix+5)
	ld h, (ix+6)
	call f111_E_wsref
	ld hl, (ws+3147)
	ld a,h
	or l
	jp z, c01_02bb ; c01_02c4
;c01_02c3:
	ld hl, (ws+3147)
	call f103_E_i16
c01_02c4:
;c01_02c0:
	jp c01_02bb
c01_02bf:
	ld hl, (ws+3145)
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
	push hl
	ld hl, (ws+3145)
	inc hl
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	push af
	ld ix, (ws+3145)
	ld e, (ix+5)
	ld d, (ix+6)
	ld hl, (ws+3147)
	add hl,de
	call f111_E_wsref
c01_02bb:
;end_f162_E_symref:
	ret


	; R_flushall workspace at ws+3135 length ws+0
f163_R_flushall:
	ld hl,65535
	jp   f141_RegCacheFlush ;	call f141_RegCacheFlush
;end_f163_R_flushall:
;	ret


	; R_flush workspace at ws+3173 length ws+4
f164_R_flush:
	ld (ws+3173), hl
	call f156_FindConflictingRegisters
;	ld (ws+3175), hl
	jp   f141_RegCacheFlush ;	call f141_RegCacheFlush
;end_f164_R_flush:
;	ret
c01_c213:
	db 58,10,0


	; E_label workspace at ws+3117 length ws+2
f165_E_label:
	ld (ws+3117), hl
	call f163_R_flushall
	ld hl, (ws+3117)
	call f109_E_labelref
	ld hl,c01_c213
	jp   f98_E ;	call f98_E
;end_f165_E_label:
;	ret


	; E_jump workspace at ws+3131 length ws+4
f166_E_jump:
	ld (ws+3133), hl
	pop bc
	pop hl
	ld (ws+3131), hl
	push bc
	call f163_R_flushall
	call f94_E_tab
	ld hl, (ws+3131)
	call f98_E
	call f92_E_space
	ld hl, (ws+3133)
	call f109_E_labelref
	call f95_E_nl
;end_f166_E_jump:
	ret
c01_c214:
	db 106,114,0


	; E_jp workspace at ws+3129 length ws+;
f167_E_jp:
	ld (ws+3129), hl
	ld hl,c01_c214
	push hl
	ld hl, (ws+3129)
	call f166_E_jump
;end_f167_E_jp:
	ret
c01_c215:
	db 106,114,32,110,122,44,0


	; E_jnz workspace at ws+3127 length ws+2
f168_E_jnz:
	ld (ws+3127), hl
	ld hl,c01_c215
	push hl
	ld hl, (ws+3127)
	call f166_E_jump
;end_f168_E_jnz:
	ret
c01_c216:
	db 9,114,101,116,10,0


	; E_ret workspace at ws+3124 length ws+0
f169_E_ret:
	ld hl,c01_c216
	jp   f98_E ;	call f98_E
;end_f169_E_ret:
;	ret
c01_c217:
	db 99,97,108,108,32,0


	; E_call workspace at ws+3119 length ws+;
f170_E_call:
	ld (ws+3119), hl
	call f163_R_flushall
	call f94_E_tab
	ld hl,c01_c217
	call f98_E
	ld hl, (ws+3119)
	call f110_E_subref
	jp   f95_E_nl ;	call f95_E_nl
;end_f170_E_call:
;	ret
c01_c218:
	db 98,97,100,32,0


	; getreg workspace at ws+3175 length ws+8
f171_getreg:
	ld (ws+3179), hl
	pop bc
	pop hl
	ld (ws+3177), hl
	pop hl
	ld (ws+3175), hl
	push bc
	ld bc,0
	ld (ws+3181), bc
c01_02c5:
	ld hl, (ws+3175)
	ld a,h
	or l
	jp z, c01_02ca
	ld hl, (ws+3175)
	ld a,l
	and 1
	ld l,a
	ld a,h
	and 0
	ld h,a
	ld a,h
	or l
	jp z, c01_02cf
	ld hl, (ws+3177)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3181), hl
	jp end_f171_getreg
c01_02cf:
;c01_02cb:
	ld hl, (ws+3175)
	srl h
	rr l
	ld (ws+3175), hl
	ld hl, (ws+3177)
	inc hl
	inc hl
	ld (ws+3177), hl
	jp c01_02c5
c01_02ca:
	ld hl, (ws+3181)
	ld a,h
	or l
	jp nz, c01_02d4
	call f72_StartError
	ld hl,c01_c218
	call f9_print
	ld hl, (ws+3179)
	call f9_print
	ld a,32
	call f7_print_char
	ld hl, (ws+3175)
	call f20_print_hex_i16
	call f73_EndError
c01_02d4:
;c01_02d0:
end_f171_getreg:
	ld hl, (ws+3181)
	ret
f172_loreg_s02d5:
	dw 1
	dw 4
	dw 4
	dw 16
	dw 16
	dw 64
	dw 64
	dw 64
	dw 16
	dw 4
	dw 64
	dw 16
	dw 4
	dw 0
	dw 0
c01_c219:
	db 108,111,114,101,103,0


	; loreg workspace at ws+3169 length ws+6
f172_loreg:
	ld (ws+3169), hl
	push hl
	ld de,f172_loreg_s02d5
	push de
	ld hl,c01_c219
	call f171_getreg
;	ld (ws+3173), hl
;	ld (ws+3171), hl
;end_f172_loreg:
;	ld hl, (ws+3171)
	ret
f173_hireg_s02d6:
	dw 1
	dw 2
	dw 2
	dw 8
	dw 8
	dw 32
	dw 32
	dw 32
	dw 8
	dw 2
	dw 32
	dw 8
	dw 2
	dw 0
	dw 0
c01_c220:
	db 104,105,114,101,103,0


	; hireg workspace at ws+3169 length ws+6
f173_hireg:
	ld (ws+3169), hl
	push hl
	ld hl,f173_hireg_s02d6
	push hl
	ld hl,c01_c220
	call f171_getreg
;	ld (ws+3173), hl
;	ld (ws+3171), hl
;end_f173_hireg:
;	ld hl, (ws+3171)
	ret
f174_wordreg_s02d7:
	dw 1
	dw 512
	dw 512
	dw 256
	dw 256
	dw 128
	dw 128
	dw 128
	dw 256
	dw 512
	dw 128
	dw 256
	dw 512
	dw 8192
	dw 16384
c01_c221:
	db 119,111,114,100,114,101,103,0


	; wordreg workspace at ws+3125 length ws+6
f174_wordreg:
	ld (ws+3125), hl
	push hl
	ld bc,f174_wordreg_s02d7
	push bc
	ld hl,c01_c221
	call f171_getreg
;	ld (ws+3129), hl
;	ld (ws+3127), hl
;end_f174_wordreg:
;	ld hl, (ws+3127)
	ret
c01_c222:
	db 97,0
c01_c223:
	db 98,0
c01_c224:
	db 99,0
c01_c225:
	db 100,0
c01_c226:
	db 101,0
c01_c227:
	db 104,0
c01_c228:
	db 108,0
c01_c229:
	db 104,108,0
c01_c230:
	db 100,101,0
c01_c231:
	db 98,99,0
c01_c232:
	db 104,108,0
c01_c233:
	db 100,101,0
c01_c234:
	db 98,99,0
c01_c235:
	db 105,120,0
c01_c236:
	db 105,121,0
f175_E_reg_s02d8:
	dw c01_c222
	dw c01_c223
	dw c01_c224
	dw c01_c225
	dw c01_c226
	dw c01_c227
	dw c01_c228
	dw c01_c229
	dw c01_c230
	dw c01_c231
	dw c01_c232
	dw c01_c233
	dw c01_c234
	dw c01_c235
	dw c01_c236
c01_c237:
	db 98,97,100,32,114,101,103,32,0


	; E_reg workspace at ws+3173 length ws+4
f175_E_reg:
	ld (ws+3173), hl
	ld ix,f175_E_reg_s02d8
	ld (ws+3175), ix
c01_02d9:
	ld hl, (ws+3173)
	ld a,h
	or l
	jp z, c01_02de
	ld hl, (ws+3173)
	ld a,l
	and 1
	ld l,a
	ld a,h
	and 0
	ld h,a
	ld a,h
	or l
	jp z, c01_02e3
	ld hl, (ws+3175)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f98_E
	ret
c01_02e3:
;c01_02df:
	ld hl, (ws+3173)
	srl h
	rr l
	ld (ws+3173), hl
	ld hl, (ws+3175)
	inc hl
	inc hl
	ld (ws+3175), hl
	jp c01_02d9
c01_02de:
	call f72_StartError
	ld hl,c01_c237
	call f9_print
	ld hl, (ws+3173)
	call f20_print_hex_i16
	jp   f73_EndError ;	call f73_EndError
;end_f175_E_reg:
;	ret
c01_c238:
	db 97,102,0


	; E_stackref workspace at ws+3171 length ws+2
f176_E_stackref:
	ld (ws+3171), hl
	ld de,65535
	add hl,de
	ld a,h
	or l
	jp nz, c01_02e8
	ld hl,c01_c238
	call f98_E
	jp c01_02e4
c01_02e8:
	ld hl, (ws+3171)
	call f175_E_reg
c01_02e4:
;end_f176_E_stackref:
	ret
c01_c239:
	db 108,100,32,0


	; E_mov workspace at ws+3169 length ws+4
f177_E_mov:
	ld (ws+3171), hl
	pop bc
	pop hl
	ld (ws+3169), hl
	push bc
	call f164_R_flush
	call f94_E_tab
	ld hl,c01_c239
	call f98_E
	ld hl, (ws+3169)
	call f175_E_reg
	call f93_E_comma
	ld hl, (ws+3171)
	call f175_E_reg
	call f95_E_nl
;end_f177_E_mov:
	ret
c01_c240:
	db 9,101,120,32,100,101,44,104,108,10,0


	; E_ex workspace at ws+3169 length ws+0
f178_E_ex:
	ld hl,384
	call f164_R_flush
	ld hl,c01_c240
	jp   f98_E ;	call f98_E
;end_f178_E_ex:
;	ret
c01_c241:
	db 9,101,120,120,10,0


	; E_exx workspace at ws+3169 length ws+0
f179_E_exx:
	ld hl,896
	call f164_R_flush
	ld hl,c01_c241
	jp   f98_E ;	call f98_E
;end_f179_E_exx:
;	ret
c01_c242:
	db 9,112,117,115,104,32,0


	; E_push workspace at ws+3169 length ws+2
f180_E_push:
	ld (ws+3169), hl
	ld hl,c01_c242
	call f98_E
	ld hl, (ws+3169)
	call f176_E_stackref
	jp   f95_E_nl ;	call f95_E_nl
;end_f180_E_push:
;	ret
c01_c243:
	db 9,112,111,112,32,0


	; E_pop workspace at ws+3169 length ws+2
f181_E_pop:
	ld (ws+3169), hl
	call f164_R_flush
	ld hl,c01_c243
	call f98_E
	ld hl, (ws+3169)
	call f176_E_stackref
	jp   f95_E_nl ;	call f95_E_nl
;end_f181_E_pop:
;	ret
c01_c244:
	db 9,108,100,32,0
c01_c245:
	db 44,40,104,108,41,10,0


	; E_loadm workspace at ws+3133 length ws+2
f182_E_loadm:
	ld (ws+3133), hl
	call f164_R_flush
	ld hl,c01_c244
	call f98_E
	ld hl, (ws+3133)
	call f175_E_reg
	ld hl,c01_c245
	jp   f98_E ;	call f98_E
;end_f182_E_loadm:
;	ret
c01_c246:
	db 9,108,100,32,40,104,108,41,44,0


	; E_storem workspace at ws+3133 length ws+2
f183_E_storem:
	ld (ws+3133), hl
	ld hl,c01_c246
	call f98_E
	ld hl, (ws+3133)
	call f175_E_reg
	jp   f95_E_nl ;	call f95_E_nl
;end_f183_E_storem:
;	ret
c01_c247:
	db 9,108,100,32,97,44,32,40,0
c01_c248:
	db 41,10,0


	; E_stax workspace at ws+3117 length ws+2
f184_E_stax:
	ld (ws+3117), hl
	ld hl,c01_c247
	call f98_E
	ld hl, (ws+3117)
	call f175_E_reg
	ld hl,c01_c248
	jp   f98_E ;	call f98_E
;end_f184_E_stax:
;	ret
c01_c249:
	db 9,108,100,32,97,44,32,40,0
c01_c250:
	db 41,10,0


	; E_ldax workspace at ws+3119 length ws+2
f185_E_ldax:
	ld (ws+3119), hl
	ld hl,1
	call f164_R_flush
	ld hl,c01_c249
	call f98_E
	ld hl, (ws+3119)
	call f175_E_reg
	ld hl,c01_c250
	jp   f98_E ;	call f98_E
;end_f185_E_ldax:
;	ret
c01_c251:
	db 9,108,100,32,97,44,32,40,0
c01_c252:
	db 41,10,0


	; E_lda workspace at ws+3124 length ws+8
f186_E_lda:
	ld (ws+3126), hl
	pop bc
	pop hl
	ld (ws+3124), hl
	push bc
	push hl
	ld hl, (ws+3126)
	call f151_RegCacheFindValue
;	ld (ws+3128), hl
;	ld (ws+3130), hl
	ld a,l
	and 1
	ld l,a
	ld a,h
	and 0
	ld h,a
	ld a,h
	or l
;	jp z, c01_02ed
;	ret
;c01_02ed:
	ret nz
;c01_02e9:
	ld hl,1
	call f164_R_flush
	ld hl,c01_c251
	call f98_E
	ld hl, (ws+3124)
	push hl
	ld hl, (ws+3126)
	call f162_E_symref
	ld hl,c01_c252
	call f98_E
	ld hl,1
	push hl
	ld hl, (ws+3124)
	push hl
	ld hl, (ws+3126)
	call f147_RegCacheLeavesValue
;end_f186_E_lda:
	ret
c01_c253:
	db 9,108,100,32,40,0
c01_c254:
	db 41,44,32,97,10,0


	; E_sta workspace at ws+3124 length ws+4
f187_E_sta:
	ld (ws+3126), hl
	pop bc
	pop hl
	ld (ws+3124), hl
	push bc
	ld hl,c01_c253
	call f98_E
	ld hl, (ws+3124)
	push hl
	ld hl, (ws+3126)
	call f162_E_symref
	ld hl,c01_c254
	call f98_E
	ld hl,1
	push hl
	ld hl, (ws+3124)
	push hl
	ld hl, (ws+3126)
	call f147_RegCacheLeavesValue
;end_f187_E_sta:
	ret
c01_c255:
	db 9,108,100,32,0
c01_c256:
	db 44,32,40,0
c01_c257:
	db 41,10,0


	; E_load8i workspace at ws+3133 length ws+5
f188_E_load8i:
	ld (ws+3137), a
	pop bc
	pop hl
	ld (ws+3135), hl
	pop hl
	ld (ws+3133), hl
	push bc
	call f164_R_flush
	ld hl,c01_c255
	call f98_E
	ld hl, (ws+3133)
	call f175_E_reg
	ld hl,c01_c256
	call f98_E
	ld hl, (ws+3135)
	call f175_E_reg
	ld a, (ws+3137)
	call f102_E_i8
	ld hl,c01_c257
	call f98_E
;end_f188_E_load8i:
	ret
c01_c258:
	db 9,108,100,32,40,0
c01_c259:
	db 41,44,32,0


	; E_store8i workspace at ws+3133 length ws+5
f189_E_store8i:
	ld (ws+3137), a
	pop bc
	pop hl
	ld (ws+3135), hl
	pop hl
	ld (ws+3133), hl
	push bc
	ld hl,c01_c258
	call f98_E
	ld hl, (ws+3135)
	call f175_E_reg
	ld a, (ws+3137)
	call f102_E_i8
	ld hl,c01_c259
	call f98_E
	ld hl, (ws+3133)
	call f175_E_reg
	call f95_E_nl
;end_f189_E_store8i:
	ret
c01_c260:
	db 9,108,100,32,40,0
c01_c261:
	db 41,44,32,0


	; E_store8ic workspace at ws+3117 length ws+4
f190_E_store8ic:
	ld (ws+3120), a
	pop bc
	pop hl
	ld (ws+3118), hl
	pop af
	ld (ws+3117), a
	push bc
	ld hl,c01_c260
	call f98_E
	ld hl, (ws+3118)
	call f175_E_reg
	ld a, (ws+3120)
	call f102_E_i8
	ld hl,c01_c261
	call f98_E
	ld a, (ws+3117)
	call f101_E_u8
	call f95_E_nl
;end_f190_E_store8ic:
	ret


	; E_loada workspace at ws+3117 length ws+2
f191_E_loada:
	ld (ws+3117), hl
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz, c01_02f2
	ld hl,1
	call f182_E_loadm
	jp c01_02ee
c01_02f2:
	ld hl, (ws+3117)
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 96
	ld h,a
	ld a,h
	or l
	jp z, c01_02f6
	ld hl,1
	push hl
	ld hl, (ws+3117)
	push hl
	xor a
	call f188_E_load8i
	jp c01_02ee
c01_02f6:
	ld hl, (ws+3117)
	call f185_E_ldax
c01_02ee:
;end_f191_E_loada:
	ret
c01_c262:
	db 9,108,100,32,0
c01_c263:
	db 44,32,40,0
c01_c264:
	db 41,10,0


	; E_load16 workspace at ws+3125 length ws+20
f192_E_load16:
	ld (ws+3129), hl
	pop bc
	pop hl
	ld (ws+3127), hl
	pop hl
	ld (ws+3125), hl
	push bc
	ld hl, (ws+3127)
	push hl
	ld hl, (ws+3129)
	call f151_RegCacheFindValue
;	ld (ws+3131), hl
	ld (ws+3133), hl
	ld d,h
	ld e,l
	ld hl, (ws+3125)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
;	jp z, c01_02fb
;	ret
;c01_02fb:
	ret nz
	ld hl, (ws+3133)
	ld a,h
	or l
	jp z, c01_02ff
	ld hl, (ws+3133)
	call f158_FindFirst
;	ld (ws+3135), hl
	ld (ws+3133), hl
	ld d,h
	ld e,l
	ld hl, (ws+3125)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 96
	ld h,a
	ld a,h
	or l
	jp z, c01_0304
	ld hl, (ws+3133)
	call f180_E_push
	ld hl, (ws+3125)
	call f181_E_pop
	ret  ;	jp c01_0300
c01_0304:
	ld hl, (ws+3125)
	call f173_hireg
	ld (ws+3137), hl
	ld hl, (ws+3133)
	call f173_hireg
	ld (ws+3139), hl
	ld hl, (ws+3137)
	push hl
	ld hl, (ws+3139)
	call f177_E_mov
	ld hl, (ws+3125)
	call f172_loreg
	ld (ws+3141), hl
	ld hl, (ws+3133)
	call f172_loreg
	ld (ws+3143), hl
	ld hl, (ws+3141)
	push hl
	ld hl, (ws+3143)
	call f177_E_mov
c01_0300:
	ret
c01_02ff:
;c01_02f7:
	ld hl, (ws+3125)
	call f164_R_flush
	ld hl,c01_c262
	call f98_E
	ld hl, (ws+3125)
	call f175_E_reg
	ld hl,c01_c263
	call f98_E
	ld hl, (ws+3127)
	push hl
	ld hl, (ws+3129)
	call f162_E_symref
	ld hl,c01_c264
	call f98_E
	ld hl, (ws+3125)
	push hl
	ld hl, (ws+3127)
	push hl
	ld hl, (ws+3129)
	call f147_RegCacheLeavesValue
;end_f192_E_load16:
	ret
c01_c265:
	db 9,108,100,32,40,0
c01_c266:
	db 41,44,32,0


	; E_store16 workspace at ws+3124 length ws+6
f193_E_store16:
	ld (ws+3128), hl
	pop bc
	pop hl
	ld (ws+3126), hl
	pop hl
	ld (ws+3124), hl
	push bc
	ld hl,c01_c265
	call f98_E
	ld hl, (ws+3126)
	push hl
	ld hl, (ws+3128)
	call f162_E_symref
	ld hl,c01_c266
	call f98_E
	ld hl, (ws+3124)
	call f175_E_reg
	call f95_E_nl
	ld hl, (ws+3124)
	push hl
	ld hl, (ws+3126)
	push hl
	ld hl, (ws+3128)
	call f147_RegCacheLeavesValue
;end_f193_E_store16:
	ret
c01_c267:
	db 109,118,105,32,119,105,116,104,32,49,54,45,98,105,116,32,114,101,103,0
c01_c268:
	db 9,108,100,32,0


	; E_mvi workspace at ws+3121 length ws+9
f194_E_mvi:
	ld (ws+3123), a
	pop bc
	pop hl
	ld (ws+3121), hl
	push bc
	ld a,l
	and 128
	ld l,a
	ld a,h
	and 3
	ld h,a
	ld a,h
	or l
	jp z, c01_0309
	ld hl,c01_c267
	call f74_SimpleError
c01_0309:
;c01_0305:
	ld a, (ws+3123)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	call f148_RegCacheFindConstant
;	ld (ws+3124), hl
	ld a,l
	and 111
	ld l,a
	ld a,h
	and 0
	ld h,a
	ld (ws+3126), hl
	ld d,h
	ld e,l
	ld hl, (ws+3121)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
;	jp z, c01_030e
;	ret
;c01_030e:
	ret nz
	ld hl, (ws+3126)
	ld a,h
	or l
	jp z, c01_0312
	ld hl, (ws+3126)
	call f158_FindFirst
	ld (ws+3128), hl
	ld hl, (ws+3121)
	push hl
	ld hl, (ws+3128)
	call f177_E_mov
	ret
c01_0312:
;c01_030a:
	ld hl, (ws+3121)
	call f164_R_flush
	ld hl,c01_c268
	call f98_E
	ld hl, (ws+3121)
	call f175_E_reg
	call f93_E_comma
	ld a, (ws+3123)
	call f101_E_u8
	call f95_E_nl
	ld hl, (ws+3121)
	push hl
	ld a, (ws+3123)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	call f144_RegCacheLeavesConstant
;end_f194_E_mvi:
	ret


	; E_alu workspace at ws+3147 length ws+4
f195_E_alu:
	ld (ws+3149), hl
	pop bc
	pop hl
	ld (ws+3147), hl
	push bc
	ld hl,1
	call f164_R_flush
	call f94_E_tab
	ld hl, (ws+3147)
	call f98_E
	call f92_E_space
	ld hl, (ws+3149)
	call f175_E_reg
	call f95_E_nl
;end_f195_E_alu:
	ret
c01_c269:
	db 9,99,112,32,0


	; E_cp workspace at ws+3121 length ws+2
f196_E_cp:
	ld (ws+3121), hl
	ld hl,c01_c269
	call f98_E
	ld hl, (ws+3121)
	call f175_E_reg
	jp   f95_E_nl ;	call f95_E_nl
;end_f196_E_cp:
;	ret
c01_c271:
	db 9,99,112,108,10,0


	; E_cpl workspace at ws+3125 length ws+0
f198_E_cpl:
	ld hl,1
	call f164_R_flush
	ld hl,c01_c271
	jp   f98_E ;	call f98_E
;end_f198_E_cpl:
;	ret
c01_c272:
	db 9,97,110,100,32,97,10,0


	; E_rcf workspace at ws+3125 length ws+0
f199_E_rcf:
	ld hl,c01_c272
	jp   f98_E ;	call f98_E
;end_f199_E_rcf:
;	ret
c01_c273:
	db 115,117,98,0


	; E_sub workspace at ws+3117 length ws+2
f200_E_sub:
	ld (ws+3117), hl
	ld hl,c01_c273
	push hl
	ld hl, (ws+3117)
	call f195_E_alu
;end_f200_E_sub:
	ret
c01_c274:
	db 97,110,100,0


	; E_and workspace at ws+3117 length ws+2
f201_E_and:
	ld (ws+3117), hl
	ld hl,c01_c274
	push hl
	ld hl, (ws+3117)
	call f195_E_alu
;end_f201_E_and:
	ret
c01_c275:
	db 111,114,0


	; E_or workspace at ws+3127 length ws+2
f202_E_or:
	ld (ws+3127), hl
	ld hl,c01_c275
	push hl
	ld hl, (ws+3127)
	call f195_E_alu
;end_f202_E_or:
	ret
c01_c276:
	db 120,111,114,0


	; E_xor workspace at ws+3125 length ws+2
f203_E_xor:
	ld (ws+3125), hl
	ld hl,c01_c276
	push hl
	ld hl, (ws+3125)
	call f195_E_alu
	ld hl, (ws+3125)
	ld de,65535
	add hl,de
	ld a,h
	or l
	jp nz, c01_0317
	ld hl,1
	push hl
	and a
	sbc hl,hl
	exx
	sbc hl,hl
	exx
	call f144_RegCacheLeavesConstant
c01_0317:
;c01_0313:
;end_f203_E_xor:
	ret


	; E_alui workspace at ws+3143 length ws+3
f204_E_alui:
	ld (ws+3145), a
	pop bc
	pop hl
	ld (ws+3143), hl
	push bc
	ld hl,1
	call f164_R_flush
	call f94_E_tab
	ld hl, (ws+3143)
	call f98_E
	call f92_E_space
	ld a, (ws+3145)
	call f101_E_u8
	call f95_E_nl
;end_f204_E_alui:
	ret
c01_c277:
	db 97,100,100,0


	; E_addi workspace at ws+3117 length ws+1
f205_E_addi:
	ld (ws+3117), a
	ld hl,c01_c277
	push hl
	call f204_E_alui
;end_f205_E_addi:
	ret
c01_c279:
	db 115,117,98,0


	; E_subi workspace at ws+3127 length ws+1
f207_E_subi:
	ld (ws+3127), a
	ld hl,c01_c279
	push hl
	call f204_E_alui
;end_f207_E_subi:
	ret
c01_c281:
	db 111,114,0


	; E_ori workspace at ws+3117 length ws+1
f209_E_ori:
	ld (ws+3117), a
	ld hl,c01_c281
	push hl
	call f204_E_alui
;end_f209_E_ori:
	ret
c01_c282:
	db 120,111,114,0


	; E_xori workspace at ws+3117 length ws+1
f210_E_xori:
	ld (ws+3117), a
	ld hl,c01_c282
	push hl
	call f204_E_alui
;end_f210_E_xori:
	ret
c01_c283:
	db 97,110,100,0


	; E_andi workspace at ws+3117 length ws+1
f211_E_andi:
	ld (ws+3117), a
	ld hl,c01_c283
	push hl
	call f204_E_alui
;end_f211_E_andi:
	ret
c01_c284:
	db 9,99,112,32,0


	; E_cpi workspace at ws+3120 length ws+1
f212_E_cpi:
	ld (ws+3120), a
	ld hl,c01_c284
	call f98_E
	ld a, (ws+3120)
	call f101_E_u8
	jp   f95_E_nl ;	call f95_E_nl
;end_f212_E_cpi:
;	ret
c01_c285:
	db 9,105,110,99,32,0


	; E_inc workspace at ws+3133 length ws+2
f213_E_inc:
	ld (ws+3133), hl
	call f164_R_flush
	ld hl,c01_c285
	call f98_E
	ld hl, (ws+3133)
	call f175_E_reg
	jp   f95_E_nl ;	call f95_E_nl
;end_f213_E_inc:
;	ret
c01_c286:
	db 9,100,101,99,32,0


	; E_dec workspace at ws+3118 length ws+2
f214_E_dec:
	ld (ws+3118), hl
	call f164_R_flush
	ld hl,c01_c286
	call f98_E
	ld hl, (ws+3118)
	call f175_E_reg
	jp   f95_E_nl ;	call f95_E_nl
;end_f214_E_dec:
;	ret


	; E_alu2 workspace at ws+3131 length ws+6
f215_E_alu2:
	ld (ws+3135), hl
	pop bc
	pop hl
	ld (ws+3133), hl
	pop hl
	ld (ws+3131), hl
	push bc
	ld hl, (ws+3133)
	call f164_R_flush
	call f94_E_tab
	ld hl, (ws+3131)
	call f98_E
	call f92_E_space
	ld hl, (ws+3133)
	call f175_E_reg
	call f93_E_comma
	ld hl, (ws+3135)
	call f175_E_reg
	call f95_E_nl
;end_f215_E_alu2:
	ret
c01_c287:
	db 97,100,100,0


	; E_add workspace at ws+3127 length ws+4
f216_E_add:
	ld (ws+3129), hl
	pop bc
	pop hl
	ld (ws+3127), hl
	push bc
	ld hl,c01_c287
	push hl
	ld hl, (ws+3127)
	push hl
	ld hl, (ws+3129)
	call f215_E_alu2
;end_f216_E_add:
	ret
c01_c288:
	db 97,100,99,0


	; E_adc workspace at ws+3117 length ws+4
f217_E_adc:
	ld (ws+3119), hl
	pop bc
	pop hl
	ld (ws+3117), hl
	push bc
	ld hl,c01_c288
	push hl
	ld hl, (ws+3117)
	push hl
	ld hl, (ws+3119)
	call f215_E_alu2
;end_f217_E_adc:
	ret
c01_c289:
	db 115,98,99,0


	; E_sbc workspace at ws+3125 length ws+4
f218_E_sbc:
	ld (ws+3127), hl
	pop bc
	pop hl
	ld (ws+3125), hl
	push bc
	ld hl,c01_c289
	push hl
	ld hl, (ws+3125)
	push hl
	ld hl, (ws+3127)
	call f215_E_alu2
;end_f218_E_sbc:
	ret


	; E_shift workspace at ws+3123 length ws+4
f219_E_shift:
	ld (ws+3125), hl
	pop bc
	pop hl
	ld (ws+3123), hl
	push bc
	ld hl, (ws+3125)
	call f164_R_flush
	call f94_E_tab
	ld hl, (ws+3123)
	call f98_E
	call f92_E_space
	ld hl, (ws+3125)
	call f175_E_reg
	call f95_E_nl
;end_f219_E_shift:
	ret
c01_c290:
	db 115,114,97,0


	; E_sra workspace at ws+3121 length ws+2
f220_E_sra:
	ld (ws+3121), hl
	ld hl,c01_c290
	push hl
	ld hl, (ws+3121)
	call f219_E_shift
;end_f220_E_sra:
	ret
c01_c291:
	db 115,114,108,0


	; E_srl workspace at ws+3121 length ws+2
f221_E_srl:
	ld (ws+3121), hl
	ld hl,c01_c291
	push hl
	ld hl, (ws+3121)
	call f219_E_shift
;end_f221_E_srl:
	ret
c01_c292:
	db 114,114,0


	; E_rr workspace at ws+3121 length ws+2
f222_E_rr:
	ld (ws+3121), hl
	ld hl,c01_c292
	push hl
	ld hl, (ws+3121)
	call f219_E_shift
;end_f222_E_rr:
	ret
c01_c293:
	db 9,98,105,116,32,0


	; E_bit workspace at ws+3119 length ws+3
f223_E_bit:
	ld (ws+3120), hl
	pop bc
	pop af
	ld (ws+3119), a
	push bc
	ld hl,c01_c293
	call f98_E
	ld a, (ws+3119)
	call f101_E_u8
	call f93_E_comma
	ld hl, (ws+3120)
	call f175_E_reg
	call f95_E_nl
;end_f223_E_bit:
	ret
c01_c294:
	db 9,99,97,108,108,32,0


	; E_callhelper workspace at ws+3119 length ws+9
f224_E_callhelper:
	ld (ws+3119), hl
	ld hl, (ws+3002)
	ld (ws+3121), hl
c01_0318:
	ld hl, (ws+3121)
	ld a,h
	or l
	jp z, c01_031d
;c01_031c:
	ld hl, (ws+3121)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+3119)
	call f29_StrCmp
;	ld (ws+3123), a
	or a
;	jp nz, c01_0322
;	jp c01_031d
;c01_0322:
	jp z,c01_031d
;c01_031e:
	ld ix, (ws+3121)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+3121), hl
	jp c01_0318
c01_031d:
	ld hl, (ws+3121)
	ld a,h
	or l
	jp nz, c01_0327
	ld hl,6
	call f76_InternalAlloc
;	ld (ws+3124), hl
	ld (ws+3121), hl
	ld de, (ws+3119)
	ld (hl),e
	inc hl
	ld (hl),d
	call f153_AllocSubrId
;	ld (ws+3126), hl
	ld d,h
	ld e,l
	ld hl, (ws+3121)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+3002)
	ld ix, (ws+3121)
	ld (ix+4), l
	ld (ix+5), h
	push ix
	pop hl
	ld (ws+3002), hl
	push ix
	pop hl
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+3119)
	call f117_EmitterDeclareExternalSubr;utine
c01_0327:
;c01_0323:
	ld hl, (ws+12)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+3121)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f118_EmitterReferenceSubroutine;yId
	call f163_R_flushall
	ld hl,c01_c294
	call f98_E
	ld a,1
	call f89_E_b8
	ld hl, (ws+3121)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f90_E_b16
	jp   f95_E_nl ;	call f95_E_nl
;end_f224_E_callhelper:
;	ret
c01_c295:
	db 58,10,9,100,98,32,0
c01_c296:
	db 48,10,0


	; E_string workspace at ws+3117 length ws+5
f225_E_string:
	ld (ws+3117), hl
	ld hl, (ws+3004)
	ld (ws+3119), hl
	inc hl
	ld (ws+3004), hl
	ld hl, (ws+12)
	call f112_EmitterOpenStream
	ld a,3
	call f89_E_b8
	ld a,99
	call f89_E_b8
	ld hl, (ws+3119)
	call f100_E_u16
	ld hl,c01_c295
	call f98_E
c01_0328:
	ld hl, (ws+3117)
	ld a,(hl)
	ld (ws+3121), a
	or a
;	jp nz, c01_032e
;	jp c01_0329
;c01_032e:
	jp z,c01_0329
;c01_032a:
	ld hl, (ws+3117)
	inc hl
	ld (ws+3117), hl
	ld a, (ws+3121)
	call f101_E_u8
	call f93_E_comma
	jp c01_0328
c01_0329:
	ld hl,c01_c296
	call f98_E
	call f113_EmitterCloseStream
	ld a,3
	call f89_E_b8
	ld a,99
	call f89_E_b8
	ld hl, (ws+3119)
	jp   f100_E_u16 ;	call f100_E_u16
;end_f225_E_string:
;	ret


	; ArchEmitMove workspace at ws+3141 length ws+28
f228_ArchEmitMove:
	ld (ws+3143), hl
	pop bc
	pop hl
	ld (ws+3141), hl
	push bc
	ld a,h
	or l
	jp nz, c01_0333
	ld hl, (ws+3143)
	call f181_E_pop
	ld hl, (ws+3143)
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 28
	ld h,a
	ld a,h
	or l
	jp z, c01_032f ; c01_0338
;c01_0337:
	call f179_E_exx
	ld hl, (ws+3143)
	call f181_E_pop
	call f179_E_exx
c01_0338:
;c01_0334:
	jp c01_032f
c01_0333:
	ld hl, (ws+3143)
	ld a,h
	or l
	jp nz, c01_033c
	ld hl, (ws+3141)
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 28
	ld h,a
	ld a,h
	or l
	jp z, c01_0341
	call f179_E_exx
	ld hl, (ws+3141)
	call f180_E_push
	call f179_E_exx
c01_0341:
;c01_033d:
	ld hl, (ws+3141)
	call f180_E_push
	jp c01_032f
c01_033c:
	ld hl, (ws+3141)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz, c01_034c
	ld hl, (ws+3143)
	ld de,65280
	add hl,de
	ld a,h
	or l
	jp z, c01_034a
c01_034c:
	ld hl, (ws+3141)
	ld de,65280
	add hl,de
	ld a,h
	or l
	jp nz, c01_034b
;c01_034e:
	ld hl, (ws+3143)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz, c01_034b
c01_034a:
	call f178_E_ex
	jp c01_032f
c01_034b:
	ld hl, (ws+3141)
	ld de,64512
	add hl,de
	ld a,h
	or l
	jp nz, c01_0359
	ld hl, (ws+3143)
	ld de,63488
	add hl,de
	ld a,h
	or l
	jp z, c01_0357
c01_0359:
	ld hl, (ws+3141)
	ld de,63488
	add hl,de
	ld a,h
	or l
	jp nz, c01_0358
;c01_035b:
	ld hl, (ws+3143)
	ld de,64512
	add hl,de
	ld a,h
	or l
	jp nz, c01_0358
c01_0357:
	call f178_E_ex
	call f179_E_exx
	call f178_E_ex
	call f179_E_exx
	jp c01_032f
c01_0358:
	ld de, (ws+3141)
	ld hl, (ws+3143)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 28
	ld h,a
	ld a,h
	or l
	jp z, c01_035f
	ld hl, (ws+3143)
	call f172_loreg
	ld (ws+3145), hl
	ld hl, (ws+3141)
	call f172_loreg
	ld (ws+3147), hl
	ld hl, (ws+3145)
	push hl
	ld hl, (ws+3147)
	call f177_E_mov
	ld hl, (ws+3143)
	call f173_hireg
	ld (ws+3149), hl
	ld hl, (ws+3141)
	call f173_hireg
	ld (ws+3151), hl
	ld hl, (ws+3149)
	push hl
	ld hl, (ws+3151)
	call f177_E_mov
	call f179_E_exx
	ld hl, (ws+3143)
	call f172_loreg
	ld (ws+3153), hl
	ld hl, (ws+3141)
	call f172_loreg
	ld (ws+3155), hl
	ld hl, (ws+3153)
	push hl
	ld hl, (ws+3155)
	call f177_E_mov
	ld hl, (ws+3143)
	call f173_hireg
	ld (ws+3157), hl
	ld hl, (ws+3141)
	call f173_hireg
	ld (ws+3159), hl
	ld hl, (ws+3157)
	push hl
	ld hl, (ws+3159)
	call f177_E_mov
	call f179_E_exx
	jp c01_032f
c01_035f:
	ld de, (ws+3141)
	ld hl, (ws+3143)
	ld a,e
	or l
	ld l,a
	ld a,d
	or h
	ld h,a
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 96
	ld h,a
	ld a,h
	or l
	jp z, c01_0363
	ld hl, (ws+3141)
	call f180_E_push
	ld hl, (ws+3143)
	call f181_E_pop
	jp c01_032f
c01_0363:
	ld hl, (ws+3141)
	ld a,l
	and 128
	ld l,a
	ld a,h
	and 3
	ld h,a
	ld a,h
	or l
	jp z, c01_0367
	ld hl, (ws+3143)
	call f173_hireg
	ld (ws+3161), hl
	ld hl, (ws+3141)
	call f173_hireg
	ld (ws+3163), hl
	ld hl, (ws+3161)
	push hl
	ld hl, (ws+3163)
	call f177_E_mov
	ld hl, (ws+3143)
	call f172_loreg
	ld (ws+3165), hl
	ld hl, (ws+3141)
	call f172_loreg
	ld (ws+3167), hl
	ld hl, (ws+3165)
	push hl
	ld hl, (ws+3167)
	call f177_E_mov
	jp c01_032f
c01_0367:
	ld hl, (ws+3143)
	push hl
	ld hl, (ws+3141)
	call f177_E_mov
c01_032f:
;end_f228_ArchEmitMove:
	ret
c01_c298:
	db 9,108,100,32,0


	; E_lxi workspace at ws+3127 length ws+14
f229_E_lxi:
	ld (ws+3129), hl
	pop bc
	pop hl
	ld (ws+3127), hl
	push bc
	ld hl, (ws+3129)
	exx
	ld hl,0
	exx
	call f148_RegCacheFindConstant
;	ld (ws+3131), hl
	ld a,l
	and 128
	ld l,a
	ld a,h
	and 99
	ld h,a
	ld (ws+3133), hl
	ld d,h
	ld e,l
	ld hl, (ws+3127)
	ld a,e
	and l
	ld l,a
	ld a,d
	and h
	ld h,a
	ld a,h
	or l
;	jp z, c01_036c
;	ret
;c01_036c:
	ret nz
	ld hl, (ws+3133)
	ld a,h
	or l
	jp z, c01_0370
	ld hl, (ws+3133)
	call f158_FindFirst
;	ld (ws+3135), hl
	ld (ws+3133), hl
	push hl
	ld hl, (ws+3127)
	call f228_ArchEmitMove
	ret
c01_0370:
;c01_0368:
	ld hl, (ws+3127)
	call f164_R_flush
	ld hl,c01_c298
	call f98_E
	ld hl, (ws+3127)
	call f175_E_reg
	call f93_E_comma
	ld hl, (ws+3129)
	call f100_E_u16
	call f95_E_nl
	ld hl, (ws+3127)
	push hl
	ld hl, (ws+3129)
	exx
	ld hl,0
	exx
	call f144_RegCacheLeavesConstant
	ld hl, (ws+3127)
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 96
	ld h,a
	ld a,h
	or l
	jp z, c01_0375
	ld hl, (ws+3127)
	call f172_loreg
;	ld (ws+3137), hl
	push hl
	ld a, (ws+3129)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	call f144_RegCacheLeavesConstant
	ld hl, (ws+3127)
	call f173_hireg
;	ld (ws+3139), hl
	push hl
	ld hl, (ws+3129)
	ld a,8
	call f478__lsr2
	ld a,l
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	call f144_RegCacheLeavesConstant
c01_0375:
;c01_0371:
;end_f229_E_lxi:
	ret
c01_c299:
	db 9,108,100,32,0


	; E_lxia workspace at ws+3117 length ws+6
f230_E_lxia:
	ld (ws+3121), hl
	pop bc
	pop hl
	ld (ws+3119), hl
	pop hl
	ld (ws+3117), hl
	push bc
	call f164_R_flush
	ld hl,c01_c299
	call f98_E
	ld hl, (ws+3117)
	call f175_E_reg
	call f93_E_comma
	ld hl, (ws+3119)
	push hl
	ld hl, (ws+3121)
	call f162_E_symref
	call f95_E_nl
;end_f230_E_lxia:
	ret


	; ArchEndInstruction workspace at ws+3075 length ws+0
f231_ArchEndInstruction:
;end_f231_ArchEndInstruction:
	ret


	; ArchEndGroup workspace at ws+3073 length ws+0
f232_ArchEndGroup:
;end_f232_ArchEndGroup:
	ret


	; Call workspace at ws+3117 length ws+2
f233_Call:
	ld (ws+3117), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp   f170_E_call ;	call f170_E_call
;end_f233_Call:
;	ret
c01_c300:
	db 95,106,112,100,101,0


	; CallI workspace at ws+3117 length ws+0
f234_CallI:
	ld hl,c01_c300
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f234_CallI:
;	ret


	; is_indexable_8bit workspace at ws+3142 length ws+5
f235_is_indexable_8bit:
	ld (ws+3142), hl
	exx
	ld (ws+3144), hl
	exx
	ld a,1
	ld (ws+3146), a
	ld de,65408
	exx
	ld de,65535
	exx
	call f499__cmps4
	jp m, c01_037f
;c01_0382:
	ld hl,127
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m, c01_037f
;c01_0381:
	ld hl, (ws+3142)
	exx
	ld hl, (ws+3144)
	exx
	ld de,65532
	exx
	ld de,65535
	exx
	call f499__cmps4
	jp m, c01_0380
;c01_0383:
	ld hl,4
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m, c01_0380
c01_037f:
	xor a
	ld (ws+3146), a
c01_0380:
;c01_0376:
;end_f235_is_indexable_8bit:
	ld a, (ws+3146)
	ret


	; is_indexable_16bit workspace at ws+3142 length ws+5
f237_is_indexable_16bit:
	ld (ws+3142), hl
	exx
	ld (ws+3144), hl
	exx
	ld a,1
	ld (ws+3146), a
	ld de,65408
	exx
	ld de,65535
	exx
	call f499__cmps4
	jp m, c01_038d
;c01_0390:
	ld hl,126
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m, c01_038d
;c01_038f:
	ld hl, (ws+3142)
	exx
	ld hl, (ws+3144)
	exx
	ld de,65533
	exx
	ld de,65535
	exx
	call f499__cmps4
	jp m, c01_038e
;c01_0391:
	ld hl,3
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m, c01_038e
c01_038d:
	xor a
	ld (ws+3146), a
c01_038e:
;c01_0384:
;end_f237_is_indexable_16bit:
	ld a, (ws+3146)
	ret


	; is_indexable_32bit workspace at ws+3142 length ws+5
f238_is_indexable_32bit:
	ld (ws+3142), hl
	exx
	ld (ws+3144), hl
	exx
	ld a,1
	ld (ws+3146), a
	ld de,65408
	exx
	ld de,65535
	exx
	call f499__cmps4
	jp m, c01_039b
;c01_039e:
	ld hl,124
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m, c01_039b
;c01_039d:
	ld hl, (ws+3142)
	exx
	ld hl, (ws+3144)
	exx
	ld de,65533
	exx
	ld de,65535
	exx
	call f499__cmps4
	jp m, c01_039c
;c01_039f:
	ld hl,3
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m, c01_039c
c01_039b:
	xor a
	ld (ws+3146), a
c01_039c:
;c01_0392:
;end_f238_is_indexable_32bit:
	ld a, (ws+3146)
	ret


	; is_small_positive workspace at ws+3142 length ws+5
f239_is_small_positive:
	ld (ws+3142), hl
	exx
	ld (ws+3144), hl
	exx
	and a
	sbc hl,hl
	exx
	sbc hl,hl
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp p, c01_03a6
;c01_03a7:
	ld hl, (ws+3142)
	exx
	ld hl, (ws+3144)
	exx
	ld de,5
	exx
	ld de,0
	exx
	call f499__cmps4
	jp p, c01_03a6
;c01_03a5:
	ld a,1
	ld (ws+3146), a
	jp c01_03a0
c01_03a6:
	xor a
	ld (ws+3146), a
c01_03a0:
;end_f239_is_small_positive:
	ld a, (ws+3146)
	ret


	; is_small_negative workspace at ws+3142 length ws+5
f240_is_small_negative:
	ld (ws+3142), hl
	exx
	ld (ws+3144), hl
	exx
	exx
	bit 7,h
	exx
	jp z, c01_03ae
;c01_03af:
	ld hl,65531
	exx
	ld hl,65535
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp p, c01_03ae
;c01_03ad:
	ld a,1
	ld (ws+3146), a
	jp c01_03a8
c01_03ae:
	xor a
	ld (ws+3146), a
c01_03a8:
;end_f240_is_small_negative:
	ld a, (ws+3146)
	ret


	; aluop2 workspace at ws+3125 length ws+22
f241_aluop2:
	ld (ws+3133), hl
	pop bc
	pop hl
	ld (ws+3131), hl
	pop hl
	ld (ws+3129), hl
	pop hl
	ld (ws+3127), hl
	pop hl
	ld (ws+3125), hl
	push bc
	call f172_loreg
;	ld (ws+3135), hl
	ld de,1
	push de
	call f177_E_mov
	ld hl, (ws+3127)
	call f172_loreg
	ld (ws+3137), hl
	ld hl, (ws+3131)
	push hl
	ld hl, (ws+3137)
	call f195_E_alu
	ld hl, (ws+3129)
	call f172_loreg
;	ld (ws+3139), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3125)
	call f173_hireg
;	ld (ws+3141), hl
	ld de,1
	push de
	call f177_E_mov
	ld hl, (ws+3127)
	call f173_hireg
	ld (ws+3143), hl
	ld hl, (ws+3133)
	push hl
	ld hl, (ws+3143)
	call f195_E_alu
	ld hl, (ws+3129)
	call f173_hireg
;	ld (ws+3145), hl
	push hl
	ld hl,1
	call f177_E_mov
;end_f241_aluop2:
	ret


	; aluop2i workspace at ws+3125 length ws+18
f242_aluop2i:
	ld (ws+3133), hl
	pop bc
	pop hl
	ld (ws+3131), hl
	pop hl
	ld (ws+3129), hl
	pop hl
	ld (ws+3127), hl
	pop hl
	ld (ws+3125), hl
	push bc
	call f172_loreg
;	ld (ws+3135), hl
	ld de,1
	push de
	call f177_E_mov
	ld hl, (ws+3131)
	push hl
	ld a, (ws+3127)
	call f204_E_alui
	ld hl, (ws+3129)
	call f172_loreg
;	ld (ws+3137), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3125)
	call f173_hireg
;	ld (ws+3139), hl
	ld de,1
	push de
	call f177_E_mov
	ld hl, (ws+3133)
	push hl
	ld hl, (ws+3127)
	ld a,8
	call f478__lsr2
	ld a,l
	call f204_E_alui
	ld hl, (ws+3129)
	call f173_hireg
;	ld (ws+3141), hl
	push hl
	ld hl,1
	call f177_E_mov
;end_f242_aluop2i:
	ret
c01_c301:
	db 95,100,118,114,109,117,50,0


	; E_dvrmu2 workspace at ws+3117 length ws+0
f243_E_dvrmu2:
	ld hl,c01_c301
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f243_E_dvrmu2:
;	ret
c01_c302:
	db 95,100,118,114,109,115,50,0


	; E_dvrms2 workspace at ws+3117 length ws+0
f244_E_dvrms2:
	ld hl,c01_c302
	jp   f224_E_callhelper ;	call f224_E_callhelper
;end_f244_E_dvrms2:
;	ret


	; logic2 workspace at ws+3117 length ws+8
f245_logic2:
	ld (ws+3123), hl
	pop bc
	pop hl
	ld (ws+3121), hl
	pop hl
	ld (ws+3119), hl
	pop hl
	ld (ws+3117), hl
	push bc
	push hl
	ld hl, (ws+3119)
	push hl
	ld hl, (ws+3121)
	push hl
	ld hl, (ws+3123)
	push hl
	call f241_aluop2
;end_f245_logic2:
	ret


	; logic2i workspace at ws+3117 length ws+8
f246_logic2i:
	ld (ws+3123), hl
	pop bc
	pop hl
	ld (ws+3121), hl
	pop hl
	ld (ws+3119), hl
	pop hl
	ld (ws+3117), hl
	push bc
	push hl
	ld hl, (ws+3119)
	push hl
	ld hl, (ws+3121)
	push hl
	ld hl, (ws+3123)
	push hl
	call f242_aluop2i
;end_f246_logic2i:
	ret


	; E_jumps_with_fallthrough workspace at ws+3125 length ws+6
f247_E_jumps_with_fallthrough:
	ld (ws+3129), hl
	pop bc
	pop hl
	ld (ws+3127), hl
	pop hl
	ld (ws+3125), hl
	push bc
	ld hl, (ws+3129)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld ix, (ws+3129)
	ld l, (ix+4)
	ld h, (ix+5)
	and a
	sbc hl,de
	jp z, c01_03b4
	ld hl, (ws+3125)
	push hl
	ld hl, (ws+3129)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f166_E_jump
c01_03b4:
;c01_03b0:
	ld hl, (ws+3129)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld ix, (ws+3129)
	ld l, (ix+4)
	ld h, (ix+5)
	and a
	sbc hl,de
	jp z, c01_03b9
	ld hl, (ws+3127)
	push hl
	ld hl, (ws+3129)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f166_E_jump
c01_03b9:
;c01_03b5:
;end_f247_E_jumps_with_fallthrou:  
	ret
c01_c303:
	db 106,114,32,122,44,0
c01_c304:
	db 106,114,32,110,122,44,0


	; E_jumps_jz_jnz workspace at ws+3123 length ws+2
f248_E_jumps_jz_jnz:
	ld (ws+3123), hl
	ld hl,c01_c303
	push hl
	ld hl,c01_c304
	push hl
	ld hl, (ws+3123)
	call f247_E_jumps_with_fallthrough
;end_f248_E_jumps_jz_jnz:
	ret
c01_c305:
	db 106,114,32,110,122,44,0
c01_c306:
	db 106,114,32,122,44,0


	; E_jumps_jnz_jz workspace at ws+3119 length ws+2
f249_E_jumps_jnz_jz:
	ld (ws+3119), hl
	ld hl,c01_c305
	push hl
	ld hl,c01_c306
	push hl
	ld hl, (ws+3119)
	call f247_E_jumps_with_fallthrough
;end_f249_E_jumps_jnz_jz:
	ret
c01_c307:
	db 106,114,32,99,44,0
c01_c308:
	db 106,114,32,110,99,44,0


	; E_jumps_jc_jnc workspace at ws+3118 length ws+2
f250_E_jumps_jc_jnc:
	ld (ws+3118), hl
	ld hl,c01_c307
	push hl
	ld hl,c01_c308
	push hl
	ld hl, (ws+3118)
	call f247_E_jumps_with_fallthrough
;end_f250_E_jumps_jc_jnc:
	ret
c01_c309:
	db 106,112,32,109,44,0
c01_c310:
	db 106,112,32,112,44,0


	; E_jumps_jm_jp workspace at ws+3117 length ws+;
f251_E_jumps_jm_jp:
	ld (ws+3117), hl
	ld hl,c01_c309
	push hl
	ld hl,c01_c310
	push hl
	ld hl, (ws+3117)
	call f247_E_jumps_with_fallthrough
;end_f251_E_jumps_jm_jp:
	ret


	; bequ1 workspace at ws+3117 length ws+4
f252_bequ1:
	ld (ws+3119), hl
	pop bc
	pop hl
	ld (ws+3117), hl
	push bc
	ld hl, (ws+3119)
	call f196_E_cp
	ld hl, (ws+3117)
	call f248_E_jumps_jz_jnz
;end_f252_bequ1:
	ret


	; bequ1c workspace at ws+3117 length ws+3
f253_bequ1c:
	ld (ws+3119), a
	pop bc
	pop hl
	ld (ws+3117), hl
	push bc
	or a
	jp nz, c01_03be
	ld hl,1
	call f202_E_or
	jp c01_03ba
c01_03be:
	ld a, (ws+3119)
	call f212_E_cpi
c01_03ba:
	ld hl, (ws+3117)
	jp   f248_E_jumps_jz_jnz ;	call f248_E_jumps_jz_jnz
;end_f253_bequ1c:
;	ret


	; cmpeq2 workspace at ws+3123 length ws+2
f254_cmpeq2:
	ld (ws+3123), hl
	ld a,h
	or l
	jp z, c01_03c3
	ld bc,256
	push bc
	ld de, (ws+3123)
	xor a
	ld l,a
	ld h,a
	sbc hl,de
	call f229_E_lxi
	ld de,128
	push de
	ld hl,256
	call f216_E_add
c01_03c3:
;c01_03bf:
	ld bc,1
	push bc
	ld hl,32
	call f177_E_mov
	ld hl,64
	jp   f202_E_or ;	call f202_E_or
;end_f254_cmpeq2:
;	ret


	; bequ2c workspace at ws+3117 length ws+4
f255_bequ2c:
	ld (ws+3119), hl
	pop bc
	pop hl
	ld (ws+3117), hl
	push bc
	ld hl, (ws+3119)
	call f254_cmpeq2
	ld hl, (ws+3117)
	call f248_E_jumps_jz_jnz
;end_f255_bequ2c:
	ret


	; bequ2 workspace at ws+3117 length ws+4
f256_bequ2:
	ld (ws+3119), hl
	pop bc
	pop hl
	ld (ws+3117), hl
	push bc
	call f199_E_rcf
	ld de,128
	push de
	ld hl, (ws+3119)
	call f218_E_sbc
	ld hl, (ws+3117)
	call f248_E_jumps_jz_jnz
;end_f256_bequ2:
	ret
c01_c311:
	db 95,99,109,112,117,52,0


	; bequ4 workspace at ws+3117 length ws+2
f257_bequ4:
	ld (ws+3117), hl
	ld hl,c01_c311
	call f224_E_callhelper
	ld hl, (ws+3117)
	jp   f248_E_jumps_jz_jnz ;	call f248_E_jumps_jz_jnz
;end_f257_bequ4:
;	ret
c01_c312:
	db 106,114,32,110,122,44,0


	; bequ4c workspace at ws+3117 length ws+6
f258_bequ4c:
	ld (ws+3119), hl
	exx
	ld (ws+3121), hl
	exx
	pop bc
	pop hl
	ld (ws+3117), hl
	push bc
	ld hl, (ws+3119)
	exx
	ld hl, (ws+3121)
	exx
	ld a,h
	or l
	exx
	or h
	or l
	exx
	jp nz, c01_03c8
	ld bc,1
	push bc
	ld hl,32
	call f177_E_mov
	ld hl,64
	call f202_E_or
	call f179_E_exx
	ld hl,32
	call f202_E_or
	ld hl,64
	call f202_E_or
	jp c01_03c4
c01_03c8:
	call f199_E_rcf
	ld hl, (ws+3119)
	exx
	ld hl, (ws+3121)
	exx
	call f254_cmpeq2
	ld hl,c01_c312
	push hl
	ld hl, (ws+3117)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f166_E_jump
	call f179_E_exx
	ld hl, (ws+3119)
	exx
	ld hl, (ws+3121)
	exx
	ld a,16
	call f483__asr4
	call f254_cmpeq2
c01_03c4:
	call f179_E_exx
	ld hl, (ws+3117)
	jp   f248_E_jumps_jz_jnz ;	call f248_E_jumps_jz_jnz
;end_f258_bequ4c:
;	ret


	; beqc workspace at ws+3117 length ws+12
f260_beqc:
	ld (ws+3123), hl
	exx
	ld (ws+3125), hl
	exx
	pop bc
	pop hl
	ld (ws+3119), hl
	pop hl
	ld (ws+3121), hl
	pop hl
	ld (ws+3117), hl
	push bc
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3127), hl
	ld de, (ws+3119)
	exx
	ld de, (ws+3121)
	exx
	ld hl, (ws+3123)
	exx
	ld hl, (ws+3125)
	exx
	call f498__cmpu4
	jp nz, c01_03cd
	ld hl, (ws+3117)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3127), hl
c01_03cd:
;c01_03c9:
	ld de, (ws+3127)
	ld ix, (ws+3117)
	ld l, (ix+4)
	ld h, (ix+5)
	and a
	sbc hl,de
	jp z, c01_03d2
	ld hl, (ws+3127)
	call f167_E_jp
c01_03d2:
;c01_03ce:
;end_f260_beqc:
	ret


	; case2 workspace at ws+3117 length ws+10
f261_case2:
	ld (ws+3121), hl
	pop bc
	pop hl
	ld (ws+3119), hl
	pop hl
	ld (ws+3117), hl
	push bc
	ld de,256
	and a
	sbc hl,de
	jp nc, c01_03d7
;c01_03d6:
	ld hl, (ws+3119)
	call f172_loreg
;	ld (ws+3123), hl
	ld bc,1
	push bc
	call f177_E_mov
	ld hl, (ws+3117)
	ld a,h
	or l
	jp z, c01_03dc
	ld a, (ws+3117)
	call f207_E_subi
c01_03dc:
;c01_03d8:
	ld hl, (ws+3119)
	call f173_hireg
;	ld (ws+3125), hl
	call f202_E_or
	jp c01_03d3
c01_03d7:
	ld hl,128
	push hl
	ld de, (ws+3117)
	xor a
	ld l,a
	ld h,a
	sbc hl,de
	call f229_E_lxi
	ld hl,128
	push hl
	ld hl, (ws+3119)
	call f216_E_add
	ld bc,1
	push bc
	ld hl,32
	call f177_E_mov
	ld hl,64
	call f202_E_or
c01_03d3:
	ld hl, (ws+3121)
	jp   f168_E_jnz ;	call f168_E_jnz
;end_f261_case2:
;	ret


	; MatchPredicate workspace at ws+3112 length ws+30
f262_MatchPredicate:
	ld (ws+3113), hl
	pop bc
	pop af
	ld (ws+3112), a
	push bc
	push hl
	ld de,16
	push de
	ld hl,ws+3116
	call f34_MemCopy
	xor a
	ld (ws+3115), a
	ld a, (ws+3112)
	or a
	jp nz, c01_03de
	ld hl, (ws+3130)
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
	call f235_is_indexable_8bit
;	ld (ws+3132), a
	or a
	jp z, c01_03dd ; c01_03e3
;c01_03e2:
	ld a,1
	ld (ws+3115), a
c01_03e3:
;c01_03df:
	jp c01_03dd
c01_03de:
	cp 1
	jp nz, c01_03e4
	ld hl, (ws+3130)
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
	call f237_is_indexable_16bit
;	ld (ws+3133), a
	or a
	jp z, c01_03dd ; c01_03e9
;c01_03e8:
	ld a,1
	ld (ws+3115), a
c01_03e9:
;c01_03e5:
	jp c01_03dd
c01_03e4:
	cp 2
	jp nz, c01_03ea
	ld hl, (ws+3130)
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
	call f235_is_indexable_8bit
;	ld (ws+3134), a
	or a
	jp z, c01_03dd ; c01_03ef
;c01_03ee:
	ld a,1
	ld (ws+3115), a
c01_03ef:
;c01_03eb:
	jp c01_03dd
c01_03ea:
	cp 3
	jp nz, c01_03f0
	ld hl, (ws+3130)
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
	call f238_is_indexable_32bit
;	ld (ws+3135), a
	or a
	jp z, c01_03dd ; c01_03f5
;c01_03f4:
	ld a,1
	ld (ws+3115), a
c01_03f5:
;c01_03f1:
	jp c01_03dd
c01_03f0:
	cp 4
	jp nz, c01_03f6
	ld hl, (ws+3130)
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
	call f237_is_indexable_16bit
;	ld (ws+3136), a
	or a
	jp z, c01_03dd ; c01_03fb
;c01_03fa:
	ld a,1
	ld (ws+3115), a
c01_03fb:
;c01_03f7:
	jp c01_03dd
c01_03f6:
	cp 6
	jp nz, c01_03fc
	ld hl, (ws+3122)
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
	call f235_is_indexable_8bit
;	ld (ws+3137), a
	or a
	jp z, c01_03dd ; c01_0401
;c01_0400:
	ld a,1
	ld (ws+3115), a
c01_0401:
;c01_03fd:
	jp c01_03dd
c01_03fc:
	cp 7
	jp nz, c01_0402
	ld hl, (ws+3122)
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
	call f237_is_indexable_16bit
;	ld (ws+3138), a
	or a
	jp z, c01_03dd ; c01_0407
;c01_0406:
	ld a,1
	ld (ws+3115), a
c01_0407:
;c01_0403:
	jp c01_03dd
c01_0402:
	cp 8
	jp nz, c01_0408
	ld hl, (ws+3122)
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
	call f238_is_indexable_32bit
;	ld (ws+3139), a
	or a
	jp z, c01_03dd ; c01_040d
;c01_040c:
	ld a,1
	ld (ws+3115), a
c01_040d:
;c01_0409:
	jp c01_03dd
c01_0408:
	cp 9
	jp nz, c01_040e
	ld hl, (ws+3124)
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
	and a
	ld de,65535
	add hl,de
	ld a,h
	or l
	jp nz, c01_03dd ; c01_0413
	exx
	ld a,h
	or l
	exx
	jp nz, c01_03dd ; c01_0413
;c01_0412:
	ld a,1
	ld (ws+3115), a
c01_0413:
;c01_040f:
	jp c01_03dd
c01_040e:
	cp 10
	jp nz, c01_0414
	ld hl, (ws+3124)
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
	and a
	ld de,65535
	add hl,de
	ld a,h
	or l
	jp nz, c01_03dd ; c01_0419
	exx
	ld a,h
	or l
	exx
	jp nz, c01_03dd ; c01_0419
;c01_0418:
	ld a,1
	ld (ws+3115), a
c01_0419:
;c01_0415:
	jp c01_03dd
c01_0414:
	cp 15
	jp nz, c01_041a
	ld hl, (ws+3124)
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
	jp nz, c01_03dd ; c01_041f
;c01_041e:
	ld a,1
	ld (ws+3115), a
c01_041f:
;c01_041b:
	jp c01_03dd
c01_041a:
	cp 17
	jp nz, c01_0420
	ld hl, (ws+3124)
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
	jp nz, c01_03dd ; c01_0425
;c01_0424:
	ld a,1
	ld (ws+3115), a
c01_0425:
;c01_0421:
	jp c01_03dd
c01_0420:
	cp 18
	jp nz, c01_0426
	ld bc,5
	exx
	ld bc,0
	exx
	ld hl, (ws+3124)
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
	ld l,c
	ld h,b
	exx
	ld l,c
	ld h,b
	exx
	call f499__cmps4
	jp m, c01_03dd ; c01_042b
;c01_042a:
	ld a,1
	ld (ws+3115), a
c01_042b:
;c01_0427:
	jp c01_03dd
c01_0426:
	cp 19
	jp nz, c01_042c
	ld hl, (ws+3124)
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
	jp nz, c01_03dd ; c01_0431
;c01_0430:
	ld a,1
	ld (ws+3115), a
c01_0431:
;c01_042d:
	jp c01_03dd
c01_042c:
	cp 20
	jp nz, c01_0432
	ld bc,3
	exx
	ld bc,0
	exx
	ld hl, (ws+3124)
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
	ld l,c
	ld h,b
	exx
	ld l,c
	ld h,b
	exx
	call f499__cmps4
	jp m, c01_03dd ; c01_0437
;c01_0436:
	ld a,1
	ld (ws+3115), a
c01_0437:
;c01_0433:
	jp c01_03dd
c01_0432:
	cp 21
	jp nz, c01_0438
	ld bc,3
	exx
	ld bc,0
	exx
	ld hl, (ws+3124)
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
	ld l,c
	ld h,b
	exx
	ld l,c
	ld h,b
	exx
	call f499__cmps4
	jp m, c01_03dd ; c01_043d
;c01_043c:
	ld a,1
	ld (ws+3115), a
c01_043d:
;c01_0439:
	jp c01_03dd
c01_0438:
	cp 22
	jp nz, c01_043e
	ld hl, (ws+3124)
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
	call f239_is_small_positive
;	ld (ws+3140), a
	or a
	jp z, c01_03dd ; c01_0443
;c01_0442:
	ld a,1
	ld (ws+3115), a
c01_0443:
;c01_043f:
	jp c01_03dd
c01_043e:
	cp 23
	jp nz, c01_0444
	ld hl, (ws+3124)
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
	call f240_is_small_negative
;	ld (ws+3141), a
	or a
	jp z, c01_03dd ; c01_0449
;c01_0448:
	ld a,1
	ld (ws+3115), a
c01_0449:
;c01_0445:
	jp c01_03dd
c01_0444:
	cp 28
	jp nz, c01_044a
	ld bc,5
	exx
	ld bc,0
	exx
	ld hl, (ws+3124)
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
	ld l,c
	ld h,b
	exx
	ld l,c
	ld h,b
	exx
	call f499__cmps4
	jp m, c01_03dd ; c01_044f
;c01_044e:
	ld a,1
	ld (ws+3115), a
c01_044f:
;c01_044b:
	jp c01_03dd
c01_044a:
	cp 29
	jp nz, c01_0450
	ld hl, (ws+3124)
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
	and a
	ld de,65535
	add hl,de
	ld a,h
	or l
	jp nz, c01_03dd ; c01_0455
	exx
	ld a,h
	or l
	exx
	jp nz, c01_03dd ; c01_0455
;c01_0454:
	ld a,1
	ld (ws+3115), a
c01_0455:
;c01_0451:
	jp c01_03dd
c01_0450:
	cp 30
	jp nz, c01_0456
	ld hl, (ws+3124)
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
	and a
	ld de,65535
	add hl,de
	ld a,h
	or l
	jp nz, c01_03dd ; c01_045b
	exx
	ld a,h
	or l
	exx
	jp nz, c01_03dd ; c01_045b
;c01_045a:
	ld a,1
	ld (ws+3115), a
c01_045b:
;c01_0457:
	jp c01_03dd
c01_0456:
	cp 31
	jp nz, c01_045c
	ld hl, (ws+3124)
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
	and a
	ld de,1
	add hl,de
	ld a,h
	or l
	jp nz, c01_03dd ; c01_0461
	exx
	ld de,1
	add hl,de
	ld a,h
	or l
	exx
	jp nz, c01_03dd ; c01_0461
;c01_0460:
	ld a,1
	ld (ws+3115), a
c01_0461:
;c01_045d:
	jp c01_03dd
c01_045c:
	cp 37
	jp nz, c01_0462
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp nz, c01_03dd ; c01_0467
;c01_0466:
	ld a,1
	ld (ws+3115), a
c01_0467:
;c01_0463:
	jp c01_03dd
c01_0462:
	cp 39
	jp nz, c01_0468
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp z, c01_03dd ; c01_046d
;c01_046c:
	ld a,1
	ld (ws+3115), a
c01_046d:
;c01_0469:
	jp c01_03dd
c01_0468:
	cp 40
	jp nz, c01_046e
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp nz, c01_03dd ; c01_0473
;c01_0472:
	ld a,1
	ld (ws+3115), a
c01_0473:
;c01_046f:
	jp c01_03dd
c01_046e:
	cp 41
	jp nz, c01_0474
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp z, c01_03dd ; c01_0479
;c01_0478:
	ld a,1
	ld (ws+3115), a
c01_0479:
;c01_0475:
	jp c01_03dd
c01_0474:
	cp 42
	jp nz, c01_047a
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp nz, c01_03dd ; c01_047f
;c01_047e:
	ld a,1
	ld (ws+3115), a
c01_047f:
;c01_047b:
	jp c01_03dd
c01_047a:
	cp 43
	jp nz, c01_0480
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp z, c01_03dd ; c01_0485
;c01_0484:
	ld a,1
	ld (ws+3115), a
c01_0485:
;c01_0481:
	jp c01_03dd
c01_0480:
	cp 44
	jp nz, c01_0486
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp nz, c01_03dd ; c01_048b
;c01_048a:
	ld a,1
	ld (ws+3115), a
c01_048b:
;c01_0487:
	jp c01_03dd
c01_0486:
	cp 45
	jp nz, c01_048c
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp z, c01_03dd ; c01_0491
;c01_0490:
	ld a,1
	ld (ws+3115), a
c01_0491:
;c01_048d:
	jp c01_03dd
c01_048c:
	cp 47
	jp nz, c01_0492
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp z, c01_03dd ; c01_0497
;c01_0496:
	ld a,1
	ld (ws+3115), a
c01_0497:
;c01_0493:
	jp c01_03dd
c01_0492:
	cp 57
	jp nz, c01_0498
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp z, c01_03dd ; c01_049d
;c01_049c:
	ld a,1
	ld (ws+3115), a
c01_049d:
;c01_0499:
	jp c01_03dd
c01_0498:
	cp 61
	jp nz, c01_049e
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp nz, c01_03dd ; c01_04a3
;c01_04a2:
	ld a,1
	ld (ws+3115), a
c01_04a3:
;c01_049f:
	jp c01_03dd
c01_049e:
	cp 62
	jp nz, c01_04a4
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp nz, c01_04a9
	ld a,1
	ld (ws+3115), a
c01_04a9:
;c01_04a5:
c01_04a4:
c01_03dd:
;end_f262_MatchPredicate:
	ld a, (ws+3115)
	ret
