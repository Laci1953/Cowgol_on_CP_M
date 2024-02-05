TRACE_OUT	equ	1

	psect text

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
global f112_EmitterOpenStream
global f113_EmitterCloseStream
global f114_EmitterOpenfile
global f115_EmitterClosefile
global f116_EmitterDeclareSubroutine
global f117_EmitterDeclareExternalSubr
global f118_EmitterReferenceSubroutine
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
global f263_EmitOneInstruction
global f2___main_s01dc
global f2___main_s01dd
global f2___main_s01de
global f2___main_s0586
global f2___main_s0587
global f2___main_s0588
global f78_PurgeAllFreeInstructions

IF	TRACE_OUT

Offset:	defw	0
TraceMsg:defm	'Out: '
	defb	0
;
;	A = byte written to output file
;
_TraceA:
	push	af
	ld	de,(Offset)
	ld	a,d
	call	Bin2Hex		;A=B,C = chars to type
	out (1),a		;high
	ld	a,c		;low
	out (1),a
	ld	a,e
	call	Bin2Hex		;A=B,C = chars to type
	out (1),a		;high
	ld	a,c		;low
	out (1),a
	ld	a,' '
	out (1),a
	inc	de
	ld	(Offset),de
	ld	de,TraceMsg
loopt:	ld	a,(de)
	or	a
	jr	z,printA
	inc	de
	out (1),a
	jr	loopt
printA:
	pop	af
	call	Bin2Hex		;A=B,C = chars to type
	out (1),a		;high
	ld	a,c		;low
	out (1),a
crlf:
	ld	a,0DH
	out (1),a
	ld	a,0AH
	out (1),a
	ret
;
;	address to be traced is on the stack
;
_TraceEnabled:	defb	0
_TraceStack:
	ld	a,(_TraceEnabled)
	or	a
	ret	nz
	pop	hl
	pop	de
	ld	a,"O"
	out (1),a
	ld	a,'@'
	out (1),a
	ld	a,d
	call	Bin2Hex		;A=B,C = chars to type
	out (1),a		;high
	ld	a,c		;low
	out (1),a
	ld	a,e
	call	Bin2Hex		;A=B,C = chars to type
	out (1),a		;high
	ld	a,c		;low
	out (1),a
	ld	a,' '
	out (1),a
	push	de
	push	hl
	ret

ENDIF

	; WriteB8 workspace at ws+3184 length ws+1
f86_WriteB8:
	ld (ws+3184), a
	ld de,ws+54
	push de
	call f62_FCBPutChar
	ret


	; WriteB16 workspace at ws+3182 length ws+2
f87_WriteB16:
	ld (ws+3182), hl
	ld a,l
	call f86_WriteB8
	ld a, (ws+3183)
	jp f86_WriteB8


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
	ld b,a
	ld a, (ws+3181)
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
	ret


	; E_b8 workspace at ws+3180 length ws+1
f89_E_b8:
	ld (ws+3180), a
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(ws+3180)
	call	_TraceA
ENDIF
	ld hl, (ws+2286)
	ld a,h
	or l
	ret z
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
	ret nz
	xor a
	jp f88_FlushCurrentStream


	; E_b16 workspace at ws+3154 length ws+2
f90_E_b16:
	ld (ws+3154), hl
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
	ld hl,(ws+3154)
ENDIF
	ld a, l			;low
	call f89_E_b8
	ld	a,(ws+3155)	;high
IF	TRACE_OUT
	call f89_E_b8
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f89_E_b8	
ENDIF


	; E_space workspace at ws+3151 length ws+0
f92_E_space:
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
ENDIF
	ld a,32
IF	TRACE_OUT
	call f89_E_b8
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f89_E_b8	
ENDIF


	; E_comma workspace at ws+3173 length ws+0
f93_E_comma:
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
ENDIF
	ld a,44
IF	TRACE_OUT
	call f89_E_b8
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f89_E_b8	
ENDIF


	; E_tab workspace at ws+3173 length ws+0
f94_E_tab:
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
ENDIF
	ld a,9
IF	TRACE_OUT
	call f89_E_b8
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f89_E_b8	
ENDIF


	; E_nl workspace at ws+3173 length ws+0
f95_E_nl:
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
ENDIF
	ld a,10
IF	TRACE_OUT
	call f89_E_b8
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f89_E_b8	
ENDIF


	; E workspace at ws+3177 length ws+3
f98_E:
	ld (ws+3177), hl
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
ENDIF
_0190:
	ld hl, (ws+3177)
	ld a,(hl)
	ld (ws+3179), a
	inc hl
	ld (ws+3177), hl
	or a
IF	TRACE_OUT
	jr nz,1f
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
1:
ELSE
	ret z
ENDIF
	ld a, (ws+3179)
	call f89_E_b8
	jp    _0190


	; E_u32 workspace at ws+3153 length ws+23
f99_E_u32:
	push hl
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
ENDIF
	pop ix			;low
	exx
	ld (ws+3153), hl	;high
	exx
	ld de,(ws+3153)		;DE,IX
	ld iy,ws+3157
	ld (ws+3169), iy
	call clcn32
_0197:
	ld hl, (ws+3169)
	ld a,(hl)
	or a
IF	TRACE_OUT
	jr nz,1f
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
1:
ELSE
	ret z
ENDIF
	call f89_E_b8
	ld hl, (ws+3169)
	inc hl
	ld (ws+3169), hl
	jp    _0197


	; E_u16 workspace at ws+3151 length ws+2
f100_E_u16:
IF	TRACE_OUT
	ld	(ws+3151),hl
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
	ld	hl,(ws+3151)
ENDIF
	exx
	ld hl,0
	exx
IF	TRACE_OUT
	call f99_E_u32
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp	f99_E_u32
ENDIF


	; E_u8 workspace at ws+3146 length ws+1
f101_E_u8:
IF	TRACE_OUT
	ld 	(ws+3146),a
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
	ld	a,(ws+3146)
ENDIF
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
IF	TRACE_OUT
	call f99_E_u32
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp	f99_E_u32
ENDIF


	; E_i8 workspace at ws+3138 length ws+1
f102_E_i8:
	ld (ws+3138), a
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
	ld	a,(ws+3138)
ENDIF
	or a
	jp p,    _01a2
	ld a,45
	call f89_E_b8
	ld a, (ws+3138)
	ld b,a
	xor a
	sub b
	ld (ws+3138), a
	jp    _019e
_01a2:
	ld a,43
	call f89_E_b8
_019e:
	ld a, (ws+3138)
IF	TRACE_OUT
	call f101_E_u8
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f101_E_u8	
ENDIF


	; E_i16 workspace at ws+3149 length ws+2
f103_E_i16:
	ld (ws+3149), hl
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
	ld	hl,(ws+3149)
ENDIF
	bit 7,h
	jp z,    _01a7
	ld a,45
	call f89_E_b8
	ld de, (ws+3149)
	xor a
	ld l,a
	ld h,a
	sbc hl,de
	ld (ws+3149), hl
	jp    _01a3
_01a7:
	ld a,43
	call f89_E_b8
_01a3:
	ld hl, (ws+3149)
IF	TRACE_OUT
	call f100_E_u16
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f100_E_u16	
ENDIF


	; E_h workspace at ws+3156 length ws+15
f105_E_h:
	ld (ws+3160), a		;width
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
ENDIF
	pop hl			;ret
	pop bc			;low
	pop de			;high
	push hl			;ret back to stack
	ld hl,ws+3161
	call U32toHexaAscii	;HL=addr of ending zero
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
_01ad:
	ld a, (ws+3170)
	or a
	jp z,    _01b2
	ld a,48
	call f89_E_b8
	ld a, (ws+3170)
	dec a
	ld (ws+3170), a
	jp    _01ad
_01b2:
	ld hl,ws+3161
IF	TRACE_OUT
	call f98_E
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f98_E	
ENDIF


	; E_h16 workspace at ws+3154 length ws+2
f107_E_h16:
IF	TRACE_OUT
	ld 	(ws+3154),hl
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
	ld	hl,(ws+3154)
ENDIF
	exx
	ld hl,0
	exx
	exx
	push hl
	exx
	push hl
	ld a,4
	call f105_E_h
IF	TRACE_OUT
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
ENDIF
	ret


	; E_labelref workspace at ws+3135 length ws+2
f109_E_labelref:
	ld (ws+3135), hl
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
ENDIF
	ld a,3
	call f89_E_b8
	ld hl, (ws+3135)
IF	TRACE_OUT
	call f107_E_h16
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f107_E_h16	
ENDIF


	; E_subref workspace at ws+3124 length ws+2
f110_E_subref:
	ld (ws+3124), hl
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
	ld	hl,(ws+3124)
ENDIF
	ld d,h
	ld e,l
	ld hl, (ws+12)
	and a
	sbc hl,de
	jp nz,    _01b7
	ld a,4
IF	TRACE_OUT
	call f89_E_b8
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f89_E_b8	
ENDIF
_01b7:
	ld a,1
	call f89_E_b8
	ld hl, (ws+3124)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
IF	TRACE_OUT
	call f90_E_b16
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f90_E_b16	
ENDIF


_c210:
	db 95,115,0

	; E_wsref workspace at ws+3149 length ws+5
f111_E_wsref:
	ld (ws+3152), hl
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
ENDIF
	pop bc
	pop af
	ld (ws+3151), a
	pop hl
	ld (ws+3149), hl
	push bc
	cp 255
	jp nz,    _01bc
	ld a,1
	call f89_E_b8
	ld hl, (ws+3149)
	call f90_E_b16
	ld hl,   _c210
	call f98_E
	ld hl, (ws+3152)
IF	TRACE_OUT
	call f107_E_h16
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f107_E_h16	
ENDIF
_01bc:
	ld a,2
	call f89_E_b8
	ld hl, (ws+3149)
	call f90_E_b16
	ld a, (ws+3151)
	call f89_E_b8
	ld hl, (ws+3152)
IF	TRACE_OUT
	call f90_E_b16
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f90_E_b16	
ENDIF


	; EmitterOpenStream workspace at ws+3124 length ws+2
f112_EmitterOpenStream:
	ld (ws+3124), hl
	ld hl, (ws+2286)
	ld a,h
	or l
	jp nz,    _01c1
	ld ix,ws+2270
	ld (ws+2286), ix
	xor a
	ld (ws+2288), a
	jp    _01bd
_01c1:
	xor a
	call f88_FlushCurrentStream
	ld hl, (ws+2286)
	inc hl
	inc hl
	ld (ws+2286), hl
	ld a, (ws+2288)
	inc a
	ld (ws+2288), a
_01bd:
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
	ret


	; EmitterCloseStream workspace at ws+3124 length ws+0
f113_EmitterCloseStream:
	ld a,128
	call f88_FlushCurrentStream
	ld de, (ws+2286)
	ld hl,ws+2270
	and a
	sbc hl,de
	jp nz,    _01c6
	ld de,0
	ld (ws+2286), de
	ret
_01c6:
	ld hl, (ws+2286)
	dec hl
	dec hl
	ld (ws+2286), hl
	ld a, (ws+2288)
	dec a
	ld (ws+2288), a
	ret


_c211:
	db 99,97,110,110,111,116,32,111,112,101,110,32,111,117,116,112,117,116,32,102,105,108,101,0

	; EmitterOpenfile workspace at ws+3040 length ws+3
f114_EmitterOpenfile:
	ld (ws+3040), hl
	ld bc,ws+54
	push bc
	call f52_FCBOpenOut
	ld (ws+3042), a
	or a
	ret z
	ld hl,   _c211
	jp f74_SimpleError


_c212:
	db 99,97,110,110,111,116,32,99,108,111,115,101,32,111,117,116,112,117,116,32,102,105,108,101,0

	; EmitterClosefile workspace at ws+3040 length ws+1
f115_EmitterClosefile:
	ld a,69
	call f86_WriteB8
	ld hl,0
	call f87_WriteB16
	ld hl,ws+54
	call f53_FCBClose
	ld (ws+3040), a
	or a
	ret z
	ld hl,   _c212
	jp f74_SimpleError


	; EmitterDeclareSubroutine workspace at ws+3056 length ws+6
f116_EmitterDeclareSubroutine:
	ld (ws+3056), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f32_StrLen
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
	jp f87_WriteB16


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
	jp f87_WriteB16


	; I_b8 workspace at ws+3089 length ws+2
f121_I_b8:
	ld hl,ws+2289
	jp f61_FCBGetChar


	; I_b16 workspace at ws+3085 length ws+4
f122_I_b16:
	call f121_I_b8
	ld (ws+3087), a
	ld l,a
	ld h,0
	ld (ws+3085), hl
	call f121_I_b8
	ld (ws+3088), a
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
	ret


	; I_b32 workspace at ws+3074 length ws+8
f124_I_b32:
	call f122_I_b16
	ld (ws+3078), hl
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
	ld hl, (ws+3074)
	exx
	ld hl, (ws+3076)
	exx
	ret


	; I_bsize workspace at ws+3081 length ws+4
f125_I_bsize:
	jp f122_I_b16


	; I_countedstring workspace at ws+3074 length ws+9
f126_I_countedstring:
	call f121_I_b8
	ld (ws+3077), a
	inc a
	ld l,a
	ld h,0
	call f38_Alloc
	ld (ws+3074), hl
	ld (ws+3080), hl
_01d1:
	ld a, (ws+3077)
	or a
	jp z,    _01d6
	call f121_I_b8
	ld (ws+3082), a
	ld hl, (ws+3080)
	ld (hl),a
	inc hl
	ld (ws+3080), hl
	ld a, (ws+3077)
	dec a
	ld (ws+3077), a
	jp    _01d1
_01d6:
	xor a
	ld hl, (ws+3080)
	ld (hl),a
	ld hl, (ws+3074)
	ret


	; InputterOpenfile workspace at ws+3040 length ws+3
f127_InputterOpenfile:
	ld (ws+3040), hl
	ld hl,ws+2289
	push hl
	ld hl, (ws+3040)
	call f50_FCBOpenIn
	ld (ws+3042), a
	or a
	ret z
	ld hl, (ws+3040)
	jp f75_CannotOpen


	; InputterClosefile workspace at ws+3040 length ws+2
f128_InputterClosefile:
	ld hl,ws+2289
	jp f53_FCBClose


	; ReadMid0 workspace at ws+3068 length ws+4
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
	ret


	; ReadMid1 workspace at ws+3068 length ws+7
f130_ReadMid1:
	ld (ws+3066), hl
	call f122_I_b16
	ld (ws+3068), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	call f122_I_b16
	ld (ws+3070), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	call f122_I_b16
	ld (ws+3072), hl
	ld ix, (ws+3066)
	ld (ix+4), l
	ld (ix+5), h
	call f121_I_b8
	ld (ws+3074), a
	ld ix, (ws+3066)
	ld (ix+6), a
	ret


	; ReadMid2 workspace at ws+3068 length ws+10
f131_ReadMid2:
	ld (ws+3066), hl
	call f122_I_b16
	ld (ws+3068), hl
	call f71_FindSubr
	ld (ws+3070), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	call f121_I_b8
	ld (ws+3072), a
	ld hl, (ws+3066)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl),a
	call f125_I_bsize
	ld (ws+3073), hl
	ld ix, (ws+3066)
	ld (ix+5), l
	ld (ix+6), h
	call f121_I_b8
	ld (ws+3075), a
	ld ix, (ws+3066)
	ld (ix+7), a
	call f125_I_bsize
	ld (ws+3076), hl
	ld ix, (ws+3066)
	ld (ix+8), l
	ld (ix+9), h
	ret


	; ReadMid3 workspace at ws+3068 length ws+8
f132_ReadMid3:
	ld (ws+3066), hl
	call f122_I_b16
	ld (ws+3068), hl
	call f71_FindSubr
	ld (ws+3070), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	call f121_I_b8
	ld (ws+3072), a
	ld hl, (ws+3066)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl),a
	call f125_I_bsize
	ld (ws+3073), hl
	ld ix, (ws+3066)
	ld (ix+5), l
	ld (ix+6), h
	call f121_I_b8
	ld (ws+3075), a
	ld ix, (ws+3066)
	ld (ix+7), a
	ret


	; ReadMid4 workspace at ws+3068 length ws+4
f133_ReadMid4:
	ld (ws+3066), hl
	call f122_I_b16
	ld (ws+3068), hl
	call f71_FindSubr
	ld (ws+3070), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	ret


	; ReadMid5 workspace at ws+3068 length ws+0
f134_ReadMid5:
	ret


	; ReadMid6 workspace at ws+3068 length ws+13
f135_ReadMid6:
	ld (ws+3066), hl
	call f122_I_b16
	ld (ws+3068), hl
	call f71_FindSubr
	ld (ws+3070), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	call f122_I_b16
	ld (ws+3072), hl
	call f71_FindSubr
	ld (ws+3074), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	call f121_I_b8
	ld (ws+3076), a
	ld ix, (ws+3066)
	ld (ix+6), a
	call f125_I_bsize
	ld (ws+3077), hl
	ld ix, (ws+3066)
	ld (ix+7), l
	ld (ix+8), h
	call f121_I_b8
	ld (ws+3079), a
	ld ix, (ws+3066)
	ld (ix+9), a
	call f121_I_b8
	ld (ws+3080), a
	ld ix, (ws+3066)
	ld (ix+10), a
	ret


	; ReadMid7 workspace at ws+3068 length ws+6
f136_ReadMid7:
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
	ld (ws+3072), hl
	ld ix, (ws+3066)
	ld (ix+4), l
	ld (ix+5), h
	ret


	; ReadMid8 workspace at ws+3068 length ws+2
f137_ReadMid8:
	ld (ws+3066), hl
	call f126_I_countedstring
	ld (ws+3068), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
	ret


	; ReadMid9 workspace at ws+3068 length ws+1
f138_ReadMid9:
	ld (ws+3066), hl
	call f121_I_b8
	ld (ws+3068), a
	ld hl, (ws+3066)
	ld (hl),a
	ret


	; ReadMid10 workspace at ws+3068 length ws+2
f139_ReadMid10:
	ld (ws+3066), hl
	call f122_I_b16
	ld (ws+3068), hl
	ld d,h
	ld e,l
	ld hl, (ws+3066)
	ld (hl),e
	inc hl
	ld (hl),d
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
	db 5
	db 5
	db 5
	db 4
	db 4
	db 3
	db 0
	db 0
	db 0
	db 0
	db 0
	db 8
	db 2
	db 4
	db 5
	db 5
	db 5
	db 5
	db 8
	db 3
	db 4
	db 0
	db 5
	db 5
	db 5
	db 10
	db 10
	db 5
	db 4
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
	db 0
	db 8
	db 2
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
	db 5
	db 5
	db 5
	db 5
	db 5
	db 7
	db 7
	db 7
	db 7
	db 7
	db 5
	db 5
	db 5
	db 5
	db 5
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
	db 9
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
	ret


	; RegCacheFlush workspace at ws+3177 length ws+4
f141_RegCacheFlush:
	ld (ws+3177), hl
	ld de,ws+2455
	ld (ws+3179), de
_01df:
	ld de, (ws+3179)
	ld hl,ws+2615
	and a
	sbc hl,de
	ret z
	ld ix, (ws+3179)
	ld a, (ix+9)
	or a
	jp z,    _01eb
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
	jp z,    _01eb
	ld ix, (ws+3179)
	ld (ix+9), 0
_01eb:
	ld hl, (ws+3179)
	ld bc,10
	add hl,bc
	ld (ws+3179), hl
	jp    _01df


	; reg_i_find_empty_slot workspace at ws+3155 length ws+2
f143_reg_i_find_empty_slot:
	ld de,ws+2455
	ld (ws+3155), de
_01f8:
	ld de, (ws+3155)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z,    _01fd
	ld ix, (ws+3155)
	ld a, (ix+9)
	or a
	jp nz,    _0202
	jp end_f143_reg_i_find_empty_slot
_0202:
	ld hl, (ws+3155)
	ld bc,10
	add hl,bc
	ld (ws+3155), hl
	jp    _01f8
_01fd:
	ld bc,0
	ld (ws+3155), bc
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
_0203:
	ld de, (ws+3147)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z,    _0208
	ld ix, (ws+3147)
	ld a, (ix+9)
	cp 1
	jp nz,    _020f
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
	jp nz,    _020f
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
_020f:
	ld hl, (ws+3147)
	ld bc,10
	add hl,bc
	ld (ws+3147), hl
	jp    _0203
_0208:
	call f143_reg_i_find_empty_slot
	ld (ws+3147), hl
	ld a,h
	or l
	ret z
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
_022f:
	ld de, (ws+3151)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z,    _0234
	ld ix, (ws+3151)
	ld a, (ix+9)
	cp 3
	jp nz,    _023f
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
	jp nz,    _023f
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
	jp nz,    _023f
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
	jp nz,    _023f
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
_023f:
	ld hl, (ws+3151)
	ld bc,10
	add hl,bc
	ld (ws+3151), hl
	jp    _022f
_0234:
	call f143_reg_i_find_empty_slot
	ld (ws+3151), hl
	ld a,h
	or l
	ret z
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
	ret


	; RegCacheFindConstant workspace at ws+3141 length ws+8
f148_RegCacheFindConstant:
	ld (ws+3141), hl
	exx
	ld (ws+3143), hl
	exx
	ld bc,0
	ld (ws+3145), bc
	ld de,ws+2455
	ld (ws+3147), de
_0248:
	ld de, (ws+3147)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z,    _024d
	ld ix, (ws+3147)
	ld a, (ix+9)
	cp 1
	jp nz,    _0254
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
	jp nz,    _0254
	ld ix, (ws+3147)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+3145), hl
	jp end_f148_RegCacheFindConstant
_0254:
	ld hl, (ws+3147)
	ld bc,10
	add hl,bc
	ld (ws+3147), hl
	jp    _0248
_024d:
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
	ld bc,0
	ld (ws+3149), bc
	push hl
	pop ix
	ld e, (ix+5)
	ld d, (ix+6)
	ld hl, (ws+3147)
	add hl,de
	ld (ws+3147), hl
	ld de,ws+2455
	ld (ws+3151), de
_026a:
	ld de, (ws+3151)
	ld hl,ws+2615
	and a
	sbc hl,de
	jp z,    _026f
	ld ix, (ws+3151)
	ld a, (ix+9)
	cp 3
	jp nz,    _027a
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
	jp nz,    _027a
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
	jp nz,    _027a
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
	jp nz,    _027a
	ld ix, (ws+3151)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+3149), hl
	jp end_f151_RegCacheFindValue
_027a:
	ld hl, (ws+3151)
	ld bc,10
	add hl,bc
	ld (ws+3151), hl
	jp    _026a
_026f:
end_f151_RegCacheFindValue:
	ld hl, (ws+3149)
	ret


	; AllocSubrId workspace at ws+3128 length ws+2
f153_AllocSubrId:
	ld hl, (ws+16)
	ld (ws+3128), hl
	inc hl
	ld (ws+16), hl
	ld hl, (ws+3128)
	ret


	; AllocNewInstruction workspace at ws+3073 length ws+4
f154_AllocNewInstruction:
	ld hl, (ws+3000)
	ld a,h
	or l
	jp z,    _0282
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
	jp    _027e
_0282:
	ld hl,68
	call f76_InternalAlloc
	ld (ws+3073), hl
_027e:
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
	ret


	; PurgeAllFreeInstructions workspace at ws+3136 length ws+2
f78_PurgeAllFreeInstructions:
_0283:
	ld hl, (ws+3000)
	ld a,h
	or l
	ret z
	ld hl, (ws+3000)
	ld (ws+3136), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3000), hl
	ld hl, (ws+3136)
	call f40_Free
	jp    _0283


	; FindConflictingRegisters workspace at ws+3177 length ws+6
f156_FindConflictingRegisters:
	ld (ws+3177), hl
	ld iy,0
	ld (ws+3179), iy
	ld ix,f2___main_s016c
	ld (ws+3181), ix
_0289:
	ld de, (ws+3181)
	ld hl,f2___main_s016c+144
	and a
	sbc hl,de
	jp z,    _028e
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
	jp z,    _0293
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
_0293:
	ld hl, (ws+3181)
	ld de,9
	add hl,de
	ld (ws+3181), hl
	jp    _0289
_028e:
	ld hl, (ws+3179)
	ret


	; FindCompatibleRegisters workspace at ws+3124 length ws+6
f157_FindCompatibleRegisters:
	ld (ws+3124), hl
	ld bc,65535
	ld (ws+3126), bc
	ld ix,f2___main_s016c
	ld (ws+3128), ix
_0294:
	ld de, (ws+3128)
	ld hl,f2___main_s016c+144
	and a
	sbc hl,de
	jp z,    _0299
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
	jp z,    _029e
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
_029e:
	ld hl, (ws+3128)
	ld de,9
	add hl,de
	ld (ws+3128), hl
	jp    _0294
_0299:
	ld hl, (ws+3126)
	ret


	; FindFirst workspace at ws+3150 length ws+4
f158_FindFirst:
	ld (ws+3150), hl
	ld iy,1
	ld (ws+3152), iy
_029f:
	ld hl, (ws+3152)
	ld a,h
	or l
	jp z,    _02a4
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
	jp z,    _02a9
	jp end_f158_FindFirst
_02a9:
	ld hl, (ws+3152)
	add hl,hl
	ld (ws+3152), hl
	jp    _029f
_02a4:
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
	jp nz,    _02bf
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
	ret z
	ld hl, (ws+3147)
	call f103_E_i16
	ret
_02bf:
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
	ret


	; R_flushall workspace at ws+3135 length ws+0
f163_R_flushall:
	ld hl,65535
	jp f141_RegCacheFlush


	; R_flush workspace at ws+3173 length ws+4
f164_R_flush:
	ld (ws+3173), hl
	call f156_FindConflictingRegisters
	ld (ws+3175), hl
	jp f141_RegCacheFlush


_c213:
	db 58,10,0

	; E_label workspace at ws+3117 length ws+2
f165_E_label:
	ld (ws+3117), hl
	call f163_R_flushall
	ld hl, (ws+3117)
	call f109_E_labelref
	ld hl,   _c213
	jp f98_E


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
	jp f95_E_nl


_c214:
	db 106,114,0

	; E_jp workspace at ws+3129 length ws+;
f167_E_jp:
	ld (ws+3129), hl
	ld hl,   _c214
	push hl
	ld hl, (ws+3129)
	call f166_E_jump
	ret


_c215:
	db 106,114,32,110,122,44,0

	; E_jnz workspace at ws+3127 length ws+2
f168_E_jnz:
	ld (ws+3127), hl
	ld hl,   _c215
	push hl
	ld hl, (ws+3127)
	call f166_E_jump
	ret

_c216:
	db 9,114,101,116,10,0

	; E_ret workspace at ws+3124 length ws+0
f169_E_ret:
	ld hl,   _c216
	jp f98_E


_c217:
	db 99,97,108,108,32,0

	; E_call workspace at ws+3119 length ws+;
f170_E_call:
	ld (ws+3119), hl
	call f163_R_flushall
	call f94_E_tab
	ld hl,   _c217
	call f98_E
	ld hl, (ws+3119)
	call f110_E_subref
	jp f95_E_nl


_c218:
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
_02c5:
	ld hl, (ws+3175)
	ld a,h
	or l
	jp z,    _02ca
	ld hl, (ws+3175)
	ld a,l
	and 1
	ld l,a
	ld a,h
	and 0
	ld h,a
	ld a,h
	or l
	jp z,    _02cf
	ld hl, (ws+3177)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3181), hl
	jp end_f171_getreg
_02cf:
	ld hl, (ws+3175)
	srl h
	rr l
	ld (ws+3175), hl
	ld hl, (ws+3177)
	inc hl
	inc hl
	ld (ws+3177), hl
	jp    _02c5
_02ca:
	ld hl, (ws+3181)
	ld a,h
	or l
	jp nz,    _02d4
	call f72_StartError
	ld hl,   _c218
	call f9_print
	ld hl, (ws+3179)
	call f9_print
	ld a,32
	call f7_print_char
	ld hl, (ws+3175)
	call f20_print_hex_i16
	call f73_EndError
_02d4:
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
_c219:
	db 108,111,114,101,103,0


	; loreg workspace at ws+3169 length ws+6
f172_loreg:
	ld (ws+3169), hl
	push hl
	ld de,f172_loreg_s02d5
	push de
	ld hl,   _c219
	call f171_getreg
	ld (ws+3171), hl
end_f172_loreg:
	ld hl, (ws+3171)
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
_c220:
	db 104,105,114,101,103,0


	; hireg workspace at ws+3169 length ws+6
f173_hireg:
	ld (ws+3169), hl
	push hl
	ld hl,f173_hireg_s02d6
	push hl
	ld hl,   _c220
	call f171_getreg
	ld (ws+3171), hl
	ld hl, (ws+3171)
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

_c221:
	db 119,111,114,100,114,101,103,0


	; wordreg workspace at ws+3125 length ws+6
f174_wordreg:
	push hl
	ld bc,f174_wordreg_s02d7
	push bc
	ld hl,   _c221
	call f171_getreg
	ret

_c222:
	db 97,0
_c223:
	db 98,0
_c224:
	db 99,0
_c225:
	db 100,0
_c226:
	db 101,0
_c227:
	db 104,0
_c228:
	db 108,0
_c229:
	db 104,108,0
_c230:
	db 100,101,0
_c231:
	db 98,99,0
_c232:
	db 104,108,0
_c233:
	db 100,101,0
_c234:
	db 98,99,0
_c235:
	db 105,120,0
_c236:
	db 105,121,0

f175_E_reg_s02d8:
	dw    _c222
	dw    _c223
	dw    _c224
	dw    _c225
	dw    _c226
	dw    _c227
	dw    _c228
	dw    _c229
	dw    _c230
	dw    _c231
	dw    _c232
	dw    _c233
	dw    _c234
	dw    _c235
	dw    _c236

_c237:
	db 98,97,100,32,114,101,103,32,0


	; E_reg workspace at ws+3173 length ws+4
f175_E_reg:
	ld (ws+3173), hl
	ld bc,f175_E_reg_s02d8
	ld (ws+3175), bc
_02d9:
	ld hl, (ws+3173)
	ld a,h
	or l
	jp z,    _02de
	ld hl, (ws+3173)
	ld a,l
	and 1
	ld l,a
	ld a,h
	and 0
	ld h,a
	ld a,h
	or l
	jp z,    _02e3
	ld hl, (ws+3175)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f98_E
	ret
_02e3:
	ld hl, (ws+3173)
	srl h
	rr l
	ld (ws+3173), hl
	ld hl, (ws+3175)
	inc hl
	inc hl
	ld (ws+3175), hl
	jp    _02d9
_02de:
	call f72_StartError
	ld hl,   _c237
	call f9_print
	ld hl, (ws+3173)
	call f20_print_hex_i16
	jp f73_EndError


_c238:
	db 97,102,0


	; E_stackref workspace at ws+3171 length ws+2
f176_E_stackref:
	ld (ws+3171), hl
	ld de,65535
	add hl,de
	ld a,h
	or l
	jp nz,    _02e8
	ld hl,   _c238
	jp f98_E
_02e8:
	ld hl, (ws+3171)
	jp f175_E_reg


_c239:
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
	ld hl,   _c239
	call f98_E
	ld hl, (ws+3169)
	call f175_E_reg
	call f93_E_comma
	ld hl, (ws+3171)
	call f175_E_reg
	jp f95_E_nl


_c240:
	db 9,101,120,32,100,101,44,104,108,10,0

	; E_ex workspace at ws+3169 length ws+0
f178_E_ex:
	ld hl,384
	call f164_R_flush
	ld hl,   _c240
	jp f98_E


_c241:
	db 9,101,120,120,10,0

	; E_exx workspace at ws+3169 length ws+0
f179_E_exx:
	ld hl,896
	call f164_R_flush
	ld hl,   _c241
	jp f98_E


_c242:
	db 9,112,117,115,104,32,0

	; E_push workspace at ws+3169 length ws+2
f180_E_push:
	ld (ws+3169), hl
	ld hl,   _c242
	call f98_E
	ld hl, (ws+3169)
	call f176_E_stackref
	jp f95_E_nl


_c243:
	db 9,112,111,112,32,0


	; E_pop workspace at ws+3169 length ws+2
f181_E_pop:
	ld (ws+3169), hl
	call f164_R_flush
	ld hl,   _c243
	call f98_E
	ld hl, (ws+3169)
	call f176_E_stackref
	jp f95_E_nl


_c244:
	db 9,108,100,32,0
_c245:
	db 44,40,104,108,41,10,0


	; E_loadm workspace at ws+3133 length ws+2
f182_E_loadm:
	ld (ws+3133), hl
	call f164_R_flush
	ld hl,   _c244
	call f98_E
	ld hl, (ws+3133)
	call f175_E_reg
	ld hl,   _c245
	jp f98_E


_c246:
	db 9,108,100,32,40,104,108,41,44,0


	; E_storem workspace at ws+3133 length ws+2
f183_E_storem:
	ld (ws+3133), hl
	ld hl,   _c246
	call f98_E
	ld hl, (ws+3133)
	call f175_E_reg
	jp f95_E_nl


_c247:
	db 9,108,100,32,97,44,32,40,0
_c248:
	db 41,10,0


	; E_stax workspace at ws+3117 length ws+2
f184_E_stax:
	ld (ws+3117), hl
	ld hl,   _c247
	call f98_E
	ld hl, (ws+3117)
	call f175_E_reg
	ld hl,   _c248
	jp f98_E


_c249:
	db 9,108,100,32,40,0
_c250:
	db 41,44,32,97,10,0


	; E_ldax workspace at ws+3119 length ws+2
f185_E_ldax:
	ld (ws+3119), hl
	ld hl,1
	call f164_R_flush
	ld hl,   _c249
	call f98_E
	ld hl, (ws+3119)
	call f175_E_reg
	ld hl,   _c250
	call f98_E
	jp f95_E_nl


_c251:
	db 9,108,100,32,97,44,32,40,0
_c252:
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
	ld (ws+3130), hl
	ld a,l
	and 1
	ld l,a
	ld a,h
	and 0
	ld h,a
	ld a,h
	or l
	ret nz
	ld hl,1
	call f164_R_flush
	ld hl,   _c251
	call f98_E
	ld hl, (ws+3124)
	push hl
	ld hl, (ws+3126)
	call f162_E_symref
	ld hl,   _c252
	call f98_E
	ld hl,1
	push hl
	ld hl, (ws+3124)
	push hl
	ld hl, (ws+3126)
	call f147_RegCacheLeavesValue
	ret

_c253:
	db 9,108,100,32,40,0
_c254:
	db 41,44,32,97,10,0


	; E_sta workspace at ws+3124 length ws+4
f187_E_sta:
	ld (ws+3126), hl
	pop bc
	pop hl
	ld (ws+3124), hl
	push bc
	ld hl,   _c253
	call f98_E
	ld hl, (ws+3124)
	push hl
	ld hl, (ws+3126)
	call f162_E_symref
	ld hl,   _c254
	call f98_E
	ld hl,1
	push hl
	ld hl, (ws+3124)
	push hl
	ld hl, (ws+3126)
	call f147_RegCacheLeavesValue
	ret

_c255:
	db 9,108,100,32,0
_c256:
	db 44,32,40,0
_c257:
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
	ld hl,   _c255
	call f98_E
	ld hl, (ws+3133)
	call f175_E_reg
	ld hl,   _c256
	call f98_E
	ld hl, (ws+3135)
	call f175_E_reg
	ld a, (ws+3137)
	call f102_E_i8
	ld hl,   _c257
	jp f98_E


_c258:
	db 9,108,100,32,40,0
_c259:
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
	ld hl,   _c258
	call f98_E
	ld hl, (ws+3135)
	call f175_E_reg
	ld a, (ws+3137)
	call f102_E_i8
	ld hl,   _c259
	call f98_E
	ld hl, (ws+3133)
	call f175_E_reg
	jp f95_E_nl


_c260:
	db 9,108,100,32,40,0
_c261:
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
	ld hl,   _c260
	call f98_E
	ld hl, (ws+3118)
	call f175_E_reg
	ld a, (ws+3120)
	call f102_E_i8
	ld hl,   _c261
	call f98_E
	ld a, (ws+3117)
	call f101_E_u8
	jp f95_E_nl


	; E_loada workspace at ws+3117 length ws+2
f191_E_loada:
	ld (ws+3117), hl
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz,    _02f2
	ld hl,1
	jp f182_E_loadm
_02f2:
	ld hl, (ws+3117)
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 96
	ld h,a
	ld a,h
	or l
	jp z,    _02f6
	ld hl,1
	push hl
	ld hl, (ws+3117)
	push hl
	xor a
	call f188_E_load8i
	ret
_02f6:
	ld hl, (ws+3117)
	jp f185_E_ldax


_c262:
	db 9,108,100,32,0
_c263:
	db 44,32,40,0
_c264:
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
	ret nz
	ld hl, (ws+3133)
	ld a,h
	or l
	jp z,    _02ff
	ld hl, (ws+3133)
	call f158_FindFirst
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
	jp z,    _0304
	ld hl, (ws+3133)
	call f180_E_push
	ld hl, (ws+3125)
	jp f181_E_pop
_0304:
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
	ret
_02ff:
	ld hl, (ws+3125)
	call f164_R_flush
	ld hl,   _c262
	call f98_E
	ld hl, (ws+3125)
	call f175_E_reg
	ld hl,   _c263
	call f98_E
	ld hl, (ws+3127)
	push hl
	ld hl, (ws+3129)
	call f162_E_symref
	ld hl,   _c264
	call f98_E
	ld hl, (ws+3125)
	push hl
	ld hl, (ws+3127)
	push hl
	ld hl, (ws+3129)
	call f147_RegCacheLeavesValue
	ret

_c265:
	db 9,108,100,32,40,0
_c266:
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
	ld hl,   _c265
	call f98_E
	ld hl, (ws+3126)
	push hl
	ld hl, (ws+3128)
	call f162_E_symref
	ld hl,   _c266
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
	ret

_c267:
	db 109,118,105,32,119,105,116,104,32,49,54,45,98,105,116,32,114,101,103,0
_c268:
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
	jp z,    _0309
	ld hl,   _c267
	call f74_SimpleError
_0309:
	ld a, (ws+3123)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	call f148_RegCacheFindConstant
	ld (ws+3124), hl
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
	ret nz
	ld hl, (ws+3126)
	ld a,h
	or l
	jp z,    _0312
	ld hl, (ws+3126)
	call f158_FindFirst
	ld (ws+3128), hl
	ld hl, (ws+3121)
	push hl
	ld hl, (ws+3128)
	call f177_E_mov
	ret
_0312:
	ld hl, (ws+3121)
	call f164_R_flush
	ld hl,   _c268
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
	jp f95_E_nl


_c269:
	db 9,99,112,32,0


	; E_cp workspace at ws+3121 length ws+2
f196_E_cp:
	ld (ws+3121), hl
	ld hl,   _c269
	call f98_E
	ld hl, (ws+3121)
	call f175_E_reg
	jp f95_E_nl


_c271:
	db 9,99,112,108,10,0


	; E_cpl workspace at ws+3125 length ws+0
f198_E_cpl:
	ld hl,1
	call f164_R_flush
	ld hl,   _c271
	jp f98_E


_c272:
	db 9,97,110,100,32,97,10,0


	; E_rcf workspace at ws+3125 length ws+0
f199_E_rcf:
	ld hl,   _c272
	jp f98_E


_c273:
	db 115,117,98,0


	; E_sub workspace at ws+3117 length ws+2
f200_E_sub:
	ld (ws+3117), hl
	ld hl,   _c273
	push hl
	ld hl, (ws+3117)
	call f195_E_alu
	ret

_c274:
	db 97,110,100,0


	; E_and workspace at ws+3117 length ws+2
f201_E_and:
	ld (ws+3117), hl
	ld hl,   _c274
	push hl
	ld hl, (ws+3117)
	call f195_E_alu
	ret

_c275:
	db 111,114,0


	; E_or workspace at ws+3127 length ws+2
f202_E_or:
	ld (ws+3127), hl
	ld hl,   _c275
	push hl
	ld hl, (ws+3127)
	call f195_E_alu
	ret

_c276:
	db 120,111,114,0


	; E_xor workspace at ws+3125 length ws+2
f203_E_xor:
	ld (ws+3125), hl
	ld hl,   _c276
	push hl
	ld hl, (ws+3125)
	call f195_E_alu
	ld hl, (ws+3125)
	ld de,65535
	add hl,de
	ld a,h
	or l
	ret nz
	ld hl,1
	push hl
	and a
	sbc hl,hl
	exx
	sbc hl,hl
	exx
	call f144_RegCacheLeavesConstant
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
	jp f95_E_nl


_c277:
	db 97,100,100,0


	; E_addi workspace at ws+3117 length ws+1
f205_E_addi:
	ld (ws+3117), a
	ld hl,   _c277
	push hl
	call f204_E_alui
	ret

_c279:
	db 115,117,98,0


	; E_subi workspace at ws+3127 length ws+1
f207_E_subi:
	ld (ws+3127), a
	ld hl,   _c279
	push hl
	call f204_E_alui
	ret

_c281:
	db 111,114,0


	; E_ori workspace at ws+3117 length ws+1
f209_E_ori:
	ld (ws+3117), a
	ld hl,   _c281
	push hl
	call f204_E_alui
	ret

_c282:
	db 120,111,114,0


	; E_xori workspace at ws+3117 length ws+1
f210_E_xori:
	ld (ws+3117), a
	ld hl,   _c282
	push hl
	call f204_E_alui
	ret

_c283:
	db 97,110,100,0


	; E_andi workspace at ws+3117 length ws+1
f211_E_andi:
	ld (ws+3117), a
	ld hl,   _c283
	push hl
	call f204_E_alui
	ret

_c284:
	db 9,99,112,32,0


	; E_cpi workspace at ws+3120 length ws+1
f212_E_cpi:
	ld (ws+3120), a
	ld hl,   _c284
	call f98_E
	ld a, (ws+3120)
	call f101_E_u8
	jp f95_E_nl


_c285:
	db 9,105,110,99,32,0


	; E_inc workspace at ws+3133 length ws+2
f213_E_inc:
	ld (ws+3133), hl
	call f164_R_flush
	ld hl,   _c285
	call f98_E
	ld hl, (ws+3133)
	call f175_E_reg
	jp f95_E_nl


_c286:
	db 9,100,101,99,32,0


	; E_dec workspace at ws+3118 length ws+2
f214_E_dec:
	ld (ws+3118), hl
	call f164_R_flush
	ld hl,   _c286
	call f98_E
	ld hl, (ws+3118)
	call f175_E_reg
	jp f95_E_nl


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
	jp f95_E_nl


_c287:
	db 97,100,100,0


	; E_add workspace at ws+3127 length ws+4
f216_E_add:
	ld (ws+3129), hl
	pop bc
	pop hl
	ld (ws+3127), hl
	push bc
	ld hl,   _c287
	push hl
	ld hl, (ws+3127)
	push hl
	ld hl, (ws+3129)
	call f215_E_alu2
	ret

_c288:
	db 97,100,99,0


	; E_adc workspace at ws+3117 length ws+4
f217_E_adc:
	ld (ws+3119), hl
	pop bc
	pop hl
	ld (ws+3117), hl
	push bc
	ld hl,   _c288
	push hl
	ld hl, (ws+3117)
	push hl
	ld hl, (ws+3119)
	call f215_E_alu2
	ret

_c289:
	db 115,98,99,0


	; E_sbc workspace at ws+3125 length ws+4
f218_E_sbc:
	ld (ws+3127), hl
	pop bc
	pop hl
	ld (ws+3125), hl
	push bc
	ld hl,   _c289
	push hl
	ld hl, (ws+3125)
	push hl
	ld hl, (ws+3127)
	call f215_E_alu2
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
	jp f95_E_nl


_c290:
	db 115,114,97,0


	; E_sra workspace at ws+3121 length ws+2
f220_E_sra:
	ld (ws+3121), hl
	ld hl,   _c290
	push hl
	ld hl, (ws+3121)
	call f219_E_shift
	ret

_c291:
	db 115,114,108,0


	; E_srl workspace at ws+3121 length ws+2
f221_E_srl:
	ld (ws+3121), hl
	ld hl,   _c291
	push hl
	ld hl, (ws+3121)
	call f219_E_shift
	ret

_c292:
	db 114,114,0


	; E_rr workspace at ws+3121 length ws+2
f222_E_rr:
	ld (ws+3121), hl
	ld hl,   _c292
	push hl
	ld hl, (ws+3121)
	call f219_E_shift
	ret

_c293:
	db 9,98,105,116,32,0


	; E_bit workspace at ws+3119 length ws+3
f223_E_bit:
	ld (ws+3120), hl
	pop bc
	pop af
	ld (ws+3119), a
	push bc
	ld hl,   _c293
	call f98_E
	ld a, (ws+3119)
	call f101_E_u8
	call f93_E_comma
	ld hl, (ws+3120)
	call f175_E_reg
	jp f95_E_nl


_c294:
	db 9,99,97,108,108,32,0


	; E_callhelper workspace at ws+3119 leng;h ws+9
f224_E_callhelper:
	ld (ws+3119), hl
	ld hl, (ws+3002)
	ld (ws+3121), hl
_0318:
	ld hl, (ws+3121)
	ld a,h
	or l
	jp z,    _031d
	ld hl, (ws+3121)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+3119)
	call f29_StrCmp
	ld (ws+3123), a
	or a
	jp nz,    _0322
	jp    _031d
_0322:
	ld ix, (ws+3121)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+3121), hl
	jp    _0318
_031d:
	ld hl, (ws+3121)
	ld a,h
	or l
	jp nz,    _0327
	ld hl,6
	call f76_InternalAlloc
	ld (ws+3121), hl
	ld de, (ws+3119)
	ld (hl),e
	inc hl
	ld (hl),d
	call f153_AllocSubrId
	ld (ws+3126), hl
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
_0327:
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
	ld hl,   _c294
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
	jp f95_E_nl


_c295:
	db 58,10,9,100,98,32,0
_c296:
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
	ld hl,   _c295
	call f98_E
_0328:
	ld hl, (ws+3117)
	ld a,(hl)
	ld (ws+3121), a
	or a
	jp nz,    _032e
	jp    _0329
_032e:
	ld hl, (ws+3117)
	inc hl
	ld (ws+3117), hl
	ld a, (ws+3121)
	call f101_E_u8
	call f93_E_comma
	jp    _0328
_0329:
	ld hl,   _c296
	call f98_E
	call f113_EmitterCloseStream
	ld a,3
	call f89_E_b8
	ld a,99
	call f89_E_b8
	ld hl, (ws+3119)
	jp f100_E_u16


	; ArchEmitMove workspace at ws+3141 length ws+28
f228_ArchEmitMove:
	ld (ws+3143), hl
	pop bc
	pop hl
	ld (ws+3141), hl
	push bc
	ld a,h
	or l
	jp nz,    _0333
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
	ret z
	call f179_E_exx
	ld hl, (ws+3143)
	call f181_E_pop
	jp f179_E_exx
_0333:
	ld hl, (ws+3143)
	ld a,h
	or l
	jp nz,    _033c
	ld hl, (ws+3141)
	ld a,l
	and 0
	ld l,a
	ld a,h
	and 28
	ld h,a
	ld a,h
	or l
	jp z,    _0341
	call f179_E_exx
	ld hl, (ws+3141)
	call f180_E_push
	call f179_E_exx
_0341:
	ld hl, (ws+3141)
	jp f180_E_push
_033c:
	ld hl, (ws+3141)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp nz,    _034c
	ld hl, (ws+3143)
	ld de,65280
	add hl,de
	ld a,h
	or l
	jp z,    f178_E_ex
_034c:
	ld hl, (ws+3141)
	ld de,65280
	add hl,de
	ld a,h
	or l
	jp nz,    _034b
	ld hl, (ws+3143)
	ld de,65408
	add hl,de
	ld a,h
	or l
	jp z, f178_E_ex
_034b:
	ld hl, (ws+3141)
	ld de,64512
	add hl,de
	ld a,h
	or l
	jp nz,    _0359
	ld hl, (ws+3143)
	ld de,63488
	add hl,de
	ld a,h
	or l
	jp z,    _0357
_0359:
	ld hl, (ws+3141)
	ld de,63488
	add hl,de
	ld a,h
	or l
	jp nz,    _0358
	ld hl, (ws+3143)
	ld de,64512
	add hl,de
	ld a,h
	or l
	jp nz,    _0358
_0357:
	call f178_E_ex
	call f179_E_exx
	call f178_E_ex
	jp f179_E_exx
_0358:
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
	jp z,    _035f
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
	jp f179_E_exx
_035f:
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
	jp z,    _0363
	ld hl, (ws+3141)
	call f180_E_push
	ld hl, (ws+3143)
	jp f181_E_pop
_0363:
	ld hl, (ws+3141)
	ld a,l
	and 128
	ld l,a
	ld a,h
	and 3
	ld h,a
	ld a,h
	or l
	jp z,    _0367
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
	ret
_0367:
	ld hl, (ws+3143)
	push hl
	ld hl, (ws+3141)
	call f177_E_mov
	ret

_c298:
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
	ld (ws+3131), hl
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
	ret nz
	ld hl, (ws+3133)
	ld a,h
	or l
	jp z,    _0370
	ld hl, (ws+3133)
	call f158_FindFirst
	ld (ws+3133), hl
	push hl
	ld hl, (ws+3127)
	call f228_ArchEmitMove
	ret
_0370:
	ld hl, (ws+3127)
	call f164_R_flush
	ld hl,   _c298
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
	ret z
	ld hl, (ws+3127)
	call f172_loreg
	ld (ws+3137), hl
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
	ld (ws+3139), hl
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
	ret

_c299:
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
	ld hl,   _c299
	call f98_E
	ld hl, (ws+3117)
	call f175_E_reg
	call f93_E_comma
	ld hl, (ws+3119)
	push hl
	ld hl, (ws+3121)
	call f162_E_symref
	jp f95_E_nl


	; ArchEndInstruction workspace at ws+3075 length ws+0
f231_ArchEndInstruction:
	ret


	; ArchEndGroup workspace at ws+3073 length ws+0
f232_ArchEndGroup:
	ret


	; Call workspace at ws+3117 length ws+2
f233_Call:
	ld (ws+3117), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp f170_E_call


_c300:
	db 95,106,112,100,101,0


	; CallI workspace at ws+3117 length ws+0
f234_CallI:
	ld hl,   _c300
	jp f224_E_callhelper


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
	jp m,    _037f
	ld hl,127
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m,    _037f
	ld hl, (ws+3142)
	exx
	ld hl, (ws+3144)
	exx
	ld de,65532
	exx
	ld de,65535
	exx
	call f499__cmps4
	jp m,    _0380
	ld hl,4
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m,    _0380
_037f:
	xor a
	ld (ws+3146), a
_0380:
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
	jp m,    _038d
	ld hl,126
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m,    _038d
	ld hl, (ws+3142)
	exx
	ld hl, (ws+3144)
	exx
	ld de,65533
	exx
	ld de,65535
	exx
	call f499__cmps4
	jp m,    _038e
	ld hl,3
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m,    _038e
_038d:
	xor a
	ld (ws+3146), a
_038e:
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
	jp m,    _039b
	ld hl,124
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m,    _039b
	ld hl, (ws+3142)
	exx
	ld hl, (ws+3144)
	exx
	ld de,65533
	exx
	ld de,65535
	exx
	call f499__cmps4
	jp m,    _039c
	ld hl,3
	exx
	ld hl,0
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp m,    _039c
_039b:
	xor a
	ld (ws+3146), a
_039c:
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
	jp p,    _03a6
	ld hl, (ws+3142)
	exx
	ld hl, (ws+3144)
	exx
	ld de,5
	exx
	ld de,0
	exx
	call f499__cmps4
	jp p,    _03a6
	ld a,1
	ld (ws+3146), a
	jp    _03a0
_03a6:
	xor a
	ld (ws+3146), a
_03a0:
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
	jp z,    _03ae
	ld hl,65531
	exx
	ld hl,65535
	exx
	ld de, (ws+3142)
	exx
	ld de, (ws+3144)
	exx
	call f499__cmps4
	jp p,    _03ae
	ld a,1
	ld (ws+3146), a
	jp    _03a8
_03ae:
	xor a
	ld (ws+3146), a
_03a8:
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
	ld (ws+3135), hl
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
	ld (ws+3139), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3125)
	call f173_hireg
	ld (ws+3141), hl
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
	ld (ws+3145), hl
	push hl
	ld hl,1
	call f177_E_mov
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
	ld (ws+3135), hl
	ld de,1
	push de
	call f177_E_mov
	ld hl, (ws+3131)
	push hl
	ld a, (ws+3127)
	call f204_E_alui
	ld hl, (ws+3129)
	call f172_loreg
	ld (ws+3137), hl
	push hl
	ld hl,1
	call f177_E_mov
	ld hl, (ws+3125)
	call f173_hireg
	ld (ws+3139), hl
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
	ld (ws+3141), hl
	push hl
	ld hl,1
	call f177_E_mov
	ret

_c301:
	db 95,100,118,114,109,117,50,0


	; E_dvrmu2 workspace at ws+3117 length ws+0
f243_E_dvrmu2:
	ld hl,   _c301
	jp f224_E_callhelper


_c302:
	db 95,100,118,114,109,115,50,0


	; E_dvrms2 workspace at ws+3117 length ws+0
f244_E_dvrms2:
	ld hl,   _c302
	jp f224_E_callhelper


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
	jp z,    _03b4
	ld hl, (ws+3125)
	push hl
	ld hl, (ws+3129)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f166_E_jump
_03b4:
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
	ret z
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
	ret

_c303:
	db 106,114,32,122,44,0
_c304:
	db 106,114,32,110,122,44,0


	; E_jumps_jz_jnz workspace at ws+3123 length ws+2
f248_E_jumps_jz_jnz:
	ld (ws+3123), hl
	ld hl,   _c303
	push hl
	ld hl,   _c304
	push hl
	ld hl, (ws+3123)
	call f247_E_jumps_with_fallthrough
	ret

_c305:
	db 106,114,32,110,122,44,0
_c306:
	db 106,114,32,122,44,0


	; E_jumps_jnz_jz workspace at ws+3119 length ws+2
f249_E_jumps_jnz_jz:
	ld (ws+3119), hl
	ld hl,   _c305
	push hl
	ld hl,   _c306
	push hl
	ld hl, (ws+3119)
	call f247_E_jumps_with_fallthrough
	ret

_c307:
	db 106,114,32,99,44,0
_c308:
	db 106,114,32,110,99,44,0


	; E_jumps_jc_jnc workspace at ws+3118 length ws+2
f250_E_jumps_jc_jnc:
	ld (ws+3118), hl
	ld hl,   _c307
	push hl
	ld hl,   _c308
	push hl
	ld hl, (ws+3118)
	call f247_E_jumps_with_fallthrough
	ret

_c309:
	db 106,112,32,109,44,0
_c310:
	db 106,112,32,112,44,0


	; E_jumps_jm_jp workspace at ws+3117 length ws+;
f251_E_jumps_jm_jp:
	ld (ws+3117), hl
	ld hl,   _c309
	push hl
	ld hl,   _c310
	push hl
	ld hl, (ws+3117)
	call f247_E_jumps_with_fallthrough
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
	ret


	; bequ1c workspace at ws+3117 length ws+3
f253_bequ1c:
	ld (ws+3119), a
	pop bc
	pop hl
	ld (ws+3117), hl
	push bc
	or a
	jp nz,    _03be
	ld hl,1
	call f202_E_or
	jp    _03ba
_03be:
	ld a, (ws+3119)
	call f212_E_cpi
_03ba:
	ld hl, (ws+3117)
	call f248_E_jumps_jz_jnz
	ret


	; cmpeq2 workspace at ws+3123 length ws+2
f254_cmpeq2:
	ld (ws+3123), hl
	ld a,h
	or l
	jp z,    _03c3
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
_03c3:
	ld bc,1
	push bc
	ld hl,32
	call f177_E_mov
	ld hl,64
	jp f202_E_or


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
	jp f248_E_jumps_jz_jnz


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
	jp f248_E_jumps_jz_jnz


_c311:
	db 95,99,109,112,117,52,0


	; bequ4 workspace at ws+3117 length ws+2
f257_bequ4:
	ld (ws+3117), hl
	ld hl,   _c311
	call f224_E_callhelper
	ld hl, (ws+3117)
	jp f248_E_jumps_jz_jnz


_c312:
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
	jp nz,    _03c8
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
	jp    _03c4
_03c8:
	call f199_E_rcf
	ld hl, (ws+3119)
	exx
	ld hl, (ws+3121)
	exx
	call f254_cmpeq2
	ld hl,   _c312
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
_03c4:
	call f179_E_exx
	ld hl, (ws+3117)
	jp f248_E_jumps_jz_jnz


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
	jp nz,    _03cd
	ld hl, (ws+3117)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+3127), hl
_03cd:
	ld de, (ws+3127)
	ld ix, (ws+3117)
	ld l, (ix+4)
	ld h, (ix+5)
	and a
	sbc hl,de
	ret z
	ld hl, (ws+3127)
	jp f167_E_jp


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
	jp nc,    _03d7
	ld hl, (ws+3119)
	call f172_loreg
	ld (ws+3123), hl
	ld bc,1
	push bc
	call f177_E_mov
	ld hl, (ws+3117)
	ld a,h
	or l
	jp z,    _03dc
	ld a, (ws+3117)
	call f207_E_subi
_03dc:
	ld hl, (ws+3119)
	call f173_hireg
	ld (ws+3125), hl
	call f202_E_or
	jp    _03d3
_03d7:
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
_03d3:
	ld hl, (ws+3121)
	jp f168_E_jnz


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
	jp nz,    _03de
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
	ld (ws+3132), a
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_03de:
	cp 1
	jp nz,    _03e4
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
	ld (ws+3133), a
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_03e4:
	cp 2
	jp nz,    _03ea
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
	ld (ws+3134), a
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_03ea:
	cp 3
	jp nz,    _03f0
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
	ld (ws+3135), a
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_03f0:
	cp 4
	jp nz,    _03f6
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
	ld (ws+3136), a
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_03f6:
	cp 6
	jp nz,    _03fc
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
	ld (ws+3137), a
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_03fc:
	cp 7
	jp nz,    _0402
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
	ld (ws+3138), a
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0402:
	cp 8
	jp nz,    _0408
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
	ld (ws+3139), a
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0408:
	cp 9
	jp nz,    _040e
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
	jp nz,    _03dd
	exx
	ld a,h
	or l
	exx
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_040e:
	cp 10
	jp nz,    _0414
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
	jp nz,    _03dd
	exx
	ld a,h
	or l
	exx
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0414:
	cp 15
	jp nz,    _041a
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
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_041a:
	cp 17
	jp nz,    _0420
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
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0420:
	cp 18
	jp nz,    _0426
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
	jp m,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0426:
	cp 19
	jp nz,    _042c
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
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_042c:
	cp 20
	jp nz,    _0432
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
	jp m,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0432:
	cp 21
	jp nz,    _0438
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
	jp m,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0438:
	cp 22
	jp nz,    _043e
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
	ld (ws+3140), a
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_043e:
	cp 23
	jp nz,    _0444
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
	ld (ws+3141), a
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0444:
	cp 28
	jp nz,    _044a
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
	jp m,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_044a:
	cp 29
	jp nz,    _0450
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
	jp nz,    _03dd
	exx
	ld a,h
	or l
	exx
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0450:
	cp 30
	jp nz,    _0456
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
	jp nz,    _03dd
	exx
	ld a,h
	or l
	exx
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0456:
	cp 31
	jp nz,    _045c
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
	jp nz,    _03dd
	exx
	ld de,1
	add hl,de
	ld a,h
	or l
	exx
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_045c:
	cp 37
	jp nz,    _0462
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0462:
	cp 39
	jp nz,    _0468
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0468:
	cp 40
	jp nz,    _046e
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_046e:
	cp 41
	jp nz,    _0474
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0474:
	cp 42
	jp nz,    _047a
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_047a:
	cp 43
	jp nz,    _0480
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0480:
	cp 44
	jp nz,    _0486
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0486:
	cp 45
	jp nz,    _048c
	ld hl, (ws+3116)
	ld a,(hl)
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_048c:
	cp 47
	jp nz,    _0492
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0492:
	cp 57
	jp nz,    _0498
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp z,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_0498:
	cp 61
	jp nz,    _049e
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp nz,    _03dd
	ld a,1
	ld (ws+3115), a
	jp    _03dd
_049e:
	cp 62
	jp nz,    _04a4
	ld ix, (ws+3116)
	ld a, (ix+10)
	or a
	jp nz,    _04a9
	ld a,1
	ld (ws+3115), a
_04a9:
_04a4:
_03dd:
	ld a, (ws+3115)
	ret
