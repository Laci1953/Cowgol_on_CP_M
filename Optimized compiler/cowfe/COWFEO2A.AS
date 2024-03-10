 global f2___main_s0641
 global f2___main_s0640
 global f2___main_s0642
 global f2___main_s065a
 global f2___main_s063d
 global f2___main_s063e
 global f2___main_s063f
 global f297_BeginNormalLoop
 global f298_TerminateNormalLoop
 global f299_Negate
 global f300_ConditionalEq
 global f301_ConditionalLt
 global f302_parser_i_bad_next_prev
 global f303_parser_i_constant_error
 global f304_i_check_sub_call_args
 global f305_i_end_call
 global f306_SymbolRedeclarationError
 global f308_CheckEndOfInitialiser
 global f311_AlignTo
 global f313_GetInitedMemberChecked
 global f314_yy_destructor
 global f316_yy_pop_parser_stack
 global f317_yy_pop_all_parser_stack
 global f318_yy_stack_overflow
 global f320_CopyMinor
 global f2___main_s0659



	; BeginNormalLoop workspace at ws+1357 length ws+8
f297_BeginNormalLoop:
	ld hl,8
	call f75_InternalAlloc
;	ld (ws+1359), hl
	ld (ws+1357), hl
	call f247_AllocLabel
	ld (ws+1361), hl
	ld d,h
	ld e,l
	ld hl, (ws+1357)
	ld (hl),e
	inc hl
	ld (hl),d
	call f247_AllocLabel
;	ld (ws+1363), hl
	ld d,h
	ld e,l
	ld hl, (ws+1357)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+18)
	ld ix, (ws+1357)
	ld (ix+4), l
	ld (ix+5), h
	ld hl, (ws+20)
	ld (ix+6), l
	ld (ix+7), h
	push ix
	pop hl
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+18), hl
	push ix
	pop hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+20), hl
;end_f297_BeginNormalLoop:
	ld hl, (ws+1357)
	ret


	; TerminateNormalLoop workspace at ws+1353 length ws+6
f298_TerminateNormalLoop:
	ld (ws+1353), hl
	ld hl, (ws+20)
	call f127_MidJump
	ld (ws+1355), hl
	call f269_Generate
	ld hl, (ws+18)
	call f159_MidLabel
	ld (ws+1357), hl
	call f269_Generate
	ld ix, (ws+1353)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+18), hl
	ld l, (ix+6)
	ld h, (ix+7)
	ld (ws+20), hl
	push ix
	pop hl
	jp   f40_Free ;	call f40_Free
;end_f298_TerminateNormalLoop:
;	ret


	; Negate workspace at ws+1353 length ws+2
f299_Negate:
	ld (ws+1353), hl
	push hl
	pop ix
	ld a, (ix+6)
	xor 1
	push hl
	pop ix
	ld (ix+6), a
;end_f299_Negate:
	ret


	; ConditionalEq workspace at ws+1355 length ws+19
f300_ConditionalEq:
	ld (ws+1359), a
	pop bc
	pop hl
	ld (ws+1357), hl
	pop hl
	ld (ws+1355), hl
	push bc
	push hl
	ld hl, (ws+1357)
	call f287_CondSimple
	call f247_AllocLabel
;	ld (ws+1362), hl
	ld (ws+1364), hl
	call f247_AllocLabel
;	ld (ws+1366), hl
	ld (ws+1368), hl
	ld hl, (ws+1355)
	call f172_NodeWidth
;	ld (ws+1370), a
	ld (ws+1371), a
	push af
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	push hl
	ld hl, (ws+1364)
	push hl
	ld hl, (ws+1368)
	push hl
	ld bc,0
	push bc
	ld a, (ws+1359)
	call f164_MidBeq
;	ld (ws+1372), hl
;	ld (ws+1360), hl
;end_f300_ConditionalEq:
;	ld hl, (ws+1360)
	ret


	; ConditionalLt workspace at ws+1355 length ws+22
f301_ConditionalLt:
	ld (ws+1359), a
	pop bc
	pop hl
	ld (ws+1357), hl
	pop hl
	ld (ws+1355), hl
	push bc
	push hl
	ld hl, (ws+1357)
	call f287_CondSimple
	call f247_AllocLabel
;	ld (ws+1362), hl
	ld (ws+1364), hl
	call f247_AllocLabel
;	ld (ws+1366), hl
	ld (ws+1368), hl
	ld hl, (ws+1355)
	call f172_NodeWidth
	ld (ws+1370), a
	ld (ws+1371), a
	ld ix, (ws+1355)
	ld l, (ix+7)
	ld h, (ix+8)
	call f240_IsSNum
;	ld (ws+1372), a
	or a
	jp z, c01_0604
	ld a, (ws+1371)
	push af
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	push hl
	ld hl, (ws+1364)
	push hl
	ld hl, (ws+1368)
	push hl
	ld bc,0
	push bc
	ld a, (ws+1359)
	call f111_MidBlts
	ld (ws+1373), hl
	ld (ws+1360), hl
	jp c01_0600
c01_0604:
	ld a, (ws+1371)
	push af
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	push hl
	ld hl, (ws+1364)
	push hl
	ld hl, (ws+1368)
	push hl
	ld bc,0
	push bc
	ld a, (ws+1359)
	call f150_MidBltu
	ld (ws+1375), hl
	ld (ws+1360), hl
c01_0600:
;end_f301_ConditionalLt:
	ld hl, (ws+1360)
	ret
c01_c282:
	db 64,110,101,120,116,32,97,110,100,32,64,112,114,101,118,32,111,110,108,121,32,119,111,114,107,32,111,110,32,112,111,105,110
db 116,101,114,115,0


	; parser_i_bad_next_prev workspace at ws+1358 length ws+0
f302_parser_i_bad_next_prev:
	ld hl,c01_c282
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f302_parser_i_bad_next_prev:
;	ret
c01_c283:
	db 111,110,108,121,32,99,111,110,115,116,97,110,116,32,118,97,108,117,101,115,32,97,114,101,32,97,108,108,111,119,101,100,32
db 104,101,114,101,0


	; parser_i_constant_error workspace at ws+1369 length ws+0
f303_parser_i_constant_error:
	ld hl,c01_c283
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f303_parser_i_constant_erro: 
;	ret
c01_c284:
	db 115,117,98,114,111,117,116,105,110,101,32,0
c01_c285:
	db 32,116,97,107,101,115,32,0
c01_c286:
	db 32,98,117,116,32,119,97,115,32,103,105,118,101,110,32,0


	; i_check_sub_call_args workspace at ws+1378 length ws+2
f304_i_check_sub_call_args:
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1378), hl
	ld ix, (ws+28)
	ld b, (ix+10)
	push hl
	pop ix
	ld a, (ix+26)
	cp b
	jp z, c01_0609
	call f80_StartError
	ld hl,c01_c284
	call f9_print
	ld hl, (ws+1378)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c285
	call f9_print
	ld ix, (ws+1378)
	ld a, (ix+26)
	call f17_print_i8
	ld hl,c01_c286
	call f9_print
	ld ix, (ws+28)
	ld a, (ix+10)
	call f17_print_i8
	call f81_EndError
c01_0609:
;c01_0605:
;end_f304_i_check_sub_call_args:
	ret


	; i_end_call workspace at ws+1378 length ws+;
f305_i_end_call:
	ld hl, (ws+12)
	push hl
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f212_EmitterReferenceSubroutine
	ld hl, (ws+28)
	ld (ws+1378), hl
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+28), hl
	ld hl, (ws+1378)
	call f40_Free
;end_f305_i_end_call:
	ret
c01_c287:
	db 97,116,116,101,109,112,116,32,116,111,32,114,101,100,101,102,105,110,101,32,0


	; SymbolRedeclarationError workspace at ws+1355 length ws+0
f306_SymbolRedeclarationError:
	call f80_StartError
	ld hl,c01_c287
	call f9_print
	ld ix, (ws+26)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f306_SymbolRedeclarationErr:  
;	ret
c01_c288:
	db 119,114,111,110,103,32,110,117,109,98,101,114,32,111,102,32,101,108,101,109,101,110,116,115,32,105,110,32,105,110,105,116
db 105,97,108,105,115,101,114,32,102,111,114,32,0


	; WrongNumberOfElementsError workspace at ws+1373 length ws+0
f307_WrongNumberOfElementsError:
	call f80_StartError
	ld hl,c01_c288
	call f9_print
	ld ix, (ws+26)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f307_WrongNumberOfElementsE:    
;	ret


	; CheckEndOfInitialiser workspace at ws+1355 length ws+9
f308_CheckEndOfInitialiser:
	ld hl, (ws+26)
	call f237_IsArray
	ld (ws+1355), a
	or a
	jp z, c01_060e
	ld hl, (ws+26)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+13)
	ld h, (ix+14)
	ld (ws+1356), hl
	ld hl, (ws+562)
	push hl
	ld hl, (ws+26)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld a, (ix+16)
	call f250_ArchAlignUp
;	ld (ws+1358), hl
	ld (ws+562), hl
	ld ix, (ws+26)
	ld l, (ix+11)
	ld h, (ix+12)
	ld a,h
	or l
	jp nz, c01_0613
	ld hl, (ws+562)
	ld ix, (ws+26)
	ld (ix+11), l
	ld (ix+12), h
	ld b,h
	ld c,l
	ld de, (ws+1356)
	call f477__dvrmu2
	ld (ws+1360), bc
	ld d,b
	ld e,c
	ld hl, (ws+26)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld bc,0
	exx
	ld bc,0
	exx
	exx
	push bc
	exx
	push bc
	ld hl, (ws+1360)
	dec hl
	exx
	ld hl,0
	exx
	call f252_ArchGuessIntType
;	ld (ws+1362), hl
	ld ix, (ws+26)
	ld (ix+4), l
	ld (ix+5), h
c01_0613:
;c01_060f:
	ld de, (ws+562)
	ld ix, (ws+26)
	ld l, (ix+11)
	ld h, (ix+12)
	and a
	sbc hl,de
	jp z, c01_060a ; c01_0618
;c01_0617:
	call f307_WrongNumberOfElementsError
c01_0618:
;c01_0614:
	jp c01_060a
c01_060e:
	ld hl, (ws+560)
	ld a,h
	or l
;	jp z, c01_061d
;	call f307_WrongNumberOfElementsError
;c01_061d:
	call nz,f307_WrongNumberOfElementsError
;c01_0619:
c01_060a:
;end_f308_CheckEndOfInitialiser:
	ret


	; GetInitedMember workspace at ws+1373 length ws+5
f310_GetInitedMember:
	ld ix,0
	ld (ws+1373), ix
	ld hl, (ws+26)
	call f237_IsArray
	ld (ws+1377), a
	or a
	jp z, c01_0622
	ld hl, (ws+26)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1375), hl
	jp c01_061e
c01_0622:
	ld hl, (ws+560)
	ld a,h
	or l
	jp nz, c01_0627
	ld ix,0
	ld (ws+1375), ix
	jp end_f310_GetInitedMember
c01_0627:
;c01_0623:
	ld hl, (ws+560)
	ld (ws+1373), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1375), hl
	ld ix, (ws+560)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+560), hl
c01_061e:
end_f310_GetInitedMember:
	ld hl, (ws+1373)
	pop bc
	push hl
	ld hl, (ws+1375)
	push bc
	ret


	; AlignTo workspace at ws+1373 length ws+7
f311_AlignTo:
	ld (ws+1373), a
	ld hl, (ws+564)
	push hl
	call f250_ArchAlignUp
;	ld (ws+1374), hl
	ld (ws+1376), hl
c01_0628:
	ld de, (ws+564)
	ld hl, (ws+1376)
	and a
	sbc hl,de
	jp z, c01_062d
	ld d,1
	push de
	and a
	sbc hl,hl
	exx
	sbc hl,hl
	exx
	call f110_MidInit
;	ld (ws+1378), hl
	call f269_Generate
	ld hl, (ws+562)
	inc hl
	ld (ws+562), hl
	ld hl, (ws+564)
	inc hl
	ld (ws+564), hl
	jp c01_0628
c01_062d:
;end_f311_AlignTo:
	ret
c01_c289:
	db 111,117,116,32,111,102,32,111,114,100,101,114,32,115,116,97,116,105,99,32,105,110,105,116,105,97,108,105,115,97,116,105,111
db 110,0


	; CheckForOverlaps workspace at ws+1373 length ws+2
f312_CheckForOverlaps:
	ld (ws+1373), hl
	ld a,h
	or l
;	jp nz, c01_0632
;	ret
;c01_0632:
	ret z
;c01_062e:
	ld hl, (ws+1373)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+6)
	ld h, (ix+7)
	ld de, (ws+562)
	and a
	sbc hl,de
	jp nc, c01_0637
;c01_0636:
	ld hl,c01_c289
	call f82_SimpleError
c01_0637:
;c01_0633:
;end_f312_CheckForOverlaps:
	ret


	; GetInitedMemberChecked workspace at ws+1369 length ws+4
f313_GetInitedMemberChecked:
	call f310_GetInitedMember
	ld (ws+1371), hl
	pop hl
	ld (ws+1369), hl
	ld hl, (ws+1371)
	ld a,h
	or l
;	jp nz, c01_063c
;	call f307_WrongNumberOfElementsError
;c01_063c:
	call z,f307_WrongNumberOfElementsError
;c01_0638:
	ld ix, (ws+1371)
	ld a, (ix+16)
	call f311_AlignTo
	ld hl, (ws+1369)
	call f312_CheckForOverlaps
;end_f313_GetInitedMemberChecked:
	ld hl, (ws+1369)
	pop bc
	push hl
	ld hl, (ws+1371)
	push bc
	ret
f2___main_s063d:
	dw 530
	dw 425
	dw 508
	dw 208
	dw 94
	dw 452
	dw 8
	dw 96
	dw 104
	dw 327
	dw 186
	dw 185
	dw 110
	dw 317
	dw 55
	dw 39
	dw 17
	dw 40
	dw 571
	dw 76
	dw 82
	dw 220
	dw 432
	dw 217
	dw 105
	dw 86
	dw 167
	dw 53
	dw 98
	dw 319
	dw 187
	dw 549
	dw 45
	dw 380
	dw 343
	dw 73
	dw 81
	dw 328
	dw 217
	dw 197
	dw 80
	dw 369
	dw 180
	dw 191
	dw 83
	dw 516
	dw 217
	dw 45
	dw 51
	dw 593
	dw 168
	dw 381
	dw 571
	dw 52
	dw 54
	dw 45
	dw 215
	dw 380
	dw 427
	dw 44
	dw 42
	dw 41
	dw 407
	dw 207
	dw 31
	dw 426
	dw 425
	dw 216
	dw 208
	dw 588
	dw 64
	dw 88
	dw 96
	dw 75
	dw 49
	dw 179
	dw 418
	dw 110
	dw 317
	dw 55
	dw 79
	dw 17
	dw 40
	dw 169
	dw 168
	dw 82
	dw 220
	dw 432
	dw 75
	dw 49
	dw 86
	dw 184
	dw 53
	dw 98
	dw 319
	dw 116
	dw 114
	dw 77
	dw 380
	dw 343
	dw 147
	dw 81
	dw 164
	dw 124
	dw 197
	dw 80
	dw 369
	dw 180
	dw 191
	dw 83
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 97
	dw 77
	dw 422
	dw 219
	dw 114
	dw 508
	dw 381
	dw 97
	dw 477
	dw 44
	dw 42
	dw 41
	dw 379
	dw 207
	dw 31
	dw 14
	dw 425
	dw 216
	dw 208
	dw 219
	dw 172
	dw 508
	dw 96
	dw 97
	dw 203
	dw 210
	dw 374
	dw 110
	dw 317
	dw 55
	dw 190
	dw 17
	dw 40
	dw 590
	dw 11
	dw 82
	dw 220
	dw 432
	dw 24
	dw 516
	dw 86
	dw 397
	dw 53
	dw 98
	dw 319
	dw 132
	dw 114
	dw 150
	dw 380
	dw 343
	dw 147
	dw 81
	dw 206
	dw 68
	dw 197
	dw 80
	dw 369
	dw 180
	dw 191
	dw 83
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 97
	dw 516
	dw 156
	dw 533
	dw 114
	dw 177
	dw 64
	dw 88
	dw 479
	dw 44
	dw 42
	dw 41
	dw 184
	dw 207
	dw 31
	dw 18
	dw 425
	dw 216
	dw 208
	dw 219
	dw 183
	dw 508
	dw 96
	dw 97
	dw 333
	dw 211
	dw 174
	dw 110
	dw 317
	dw 55
	dw 74
	dw 17
	dw 40
	dw 556
	dw 153
	dw 82
	dw 220
	dw 432
	dw 175
	dw 516
	dw 86
	dw 190
	dw 53
	dw 98
	dw 319
	dw 124
	dw 115
	dw 380
	dw 380
	dw 343
	dw 178
	dw 81
	dw 89
	dw 516
	dw 197
	dw 80
	dw 369
	dw 180
	dw 191
	dw 83
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 97
	dw 22
	dw 20
	dw 69
	dw 113
	dw 201
	dw 537
	dw 24
	dw 144
	dw 44
	dw 42
	dw 41
	dw 415
	dw 207
	dw 31
	dw 572
	dw 425
	dw 216
	dw 208
	dw 219
	dw 155
	dw 508
	dw 96
	dw 97
	dw 148
	dw 148
	dw 11
	dw 110
	dw 317
	dw 55
	dw 402
	dw 17
	dw 40
	dw 520
	dw 525
	dw 82
	dw 220
	dw 432
	dw 380
	dw 516
	dw 86
	dw 402
	dw 53
	dw 98
	dw 319
	dw 124
	dw 114
	dw 544
	dw 380
	dw 343
	dw 209
	dw 81
	dw 133
	dw 126
	dw 197
	dw 80
	dw 369
	dw 180
	dw 191
	dw 83
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 97
	dw 166
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 97
	dw 100
	dw 44
	dw 42
	dw 41
	dw 190
	dw 207
	dw 31
	dw 102
	dw 425
	dw 216
	dw 208
	dw 59
	dw 579
	dw 106
	dw 96
	dw 439
	dw 149
	dw 149
	dw 11
	dw 110
	dw 317
	dw 55
	dw 548
	dw 17
	dw 40
	dw 193
	dw 24
	dw 82
	dw 220
	dw 432
	dw 16
	dw 312
	dw 86
	dw 195
	dw 53
	dw 98
	dw 319
	dw 125
	dw 114
	dw 199
	dw 380
	dw 343
	dw 145
	dw 81
	dw 133
	dw 543
	dw 197
	dw 80
	dw 369
	dw 180
	dw 191
	dw 83
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 97
	dw 212
	dw 219
	dw 527
	dw 508
	dw 200
	dw 97
	dw 133
	dw 154
	dw 44
	dw 42
	dw 41
	dw 218
	dw 207
	dw 31
	dw 344
	dw 66
	dw 216
	dw 163
	dw 217
	dw 151
	dw 173
	dw 219
	dw 127
	dw 508
	dw 56
	dw 97
	dw 516
	dw 45
	dw 51
	dw 58
	dw 516
	dw 57
	dw 40
	dw 52
	dw 54
	dw 146
	dw 217
	dw 219
	dw 128
	dw 508
	dw 1
	dw 97
	dw 56
	dw 507
	dw 525
	dw 45
	dw 51
	dw 58
	dw 380
	dw 343
	dw 3
	dw 52
	dw 54
	dw 219
	dw 516
	dw 508
	dw 369
	dw 97
	dw 48
	dw 50
	dw 35
	dw 32
	dw 33
	dw 34
	dw 37
	dw 36
	dw 47
	dw 46
	dw 75
	dw 49
	dw 320
	dw 506
	dw 525
	dw 4
	dw 543
	dw 152
	dw 48
	dw 50
	dw 35
	dw 32
	dw 33
	dw 34
	dw 37
	dw 36
	dw 47
	dw 46
	dw 75
	dw 49
	dw 574
	dw 5
	dw 101
	dw 118
	dw 112
	dw 111
	dw 23
	dw 87
	dw 187
	dw 549
	dw 577
	dw 108
	dw 13
	dw 107
	dw 67
	dw 22
	dw 20
	dw 78
	dw 219
	dw 543
	dw 508
	dw 9
	dw 95
	dw 133
	dw 194
	dw 15
	dw 129
	dw 553
	dw 185
	dw 22
	dw 20
	dw 383
	dw 10
	dw 2
	dw 92
	dw 91
	dw 170
	dw 198
	dw 219
	dw 388
	dw 508
	dw 219
	dw 97
	dw 508
	dw 24
	dw 97
	dw 171
	dw 63
	dw 574
	dw 14
	dw 62
	dw 118
	dw 112
	dw 111
	dw 23
	dw 6
	dw 103
	dw 7
	dw 205
	dw 108
	dw 13
	dw 107
	dw 187
	dw 549
	dw 24
	dw 99
	dw 219
	dw 24
	dw 508
	dw 378
	dw 95
	dw 574
	dw 194
	dw 133
	dw 118
	dw 112
	dw 111
	dw 23
	dw 332
	dw 331
	dw 29
	dw 61
	dw 92
	dw 91
	dw 107
	dw 424
	dw 419
	dw 213
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 95
	dw 171
	dw 194
	dw 574
	dw 12
	dw 62
	dw 118
	dw 112
	dw 111
	dw 23
	dw 417
	dw 181
	dw 92
	dw 91
	dw 25
	dw 70
	dw 107
	dw 412
	dw 176
	dw 403
	dw 65
	dw 219
	dw 441
	dw 508
	dw 171
	dw 95
	dw 90
	dw 194
	dw 62
	dw 440
	dw 71
	dw 84
	dw 408
	dw 93
	dw 399
	dw 189
	dw 182
	dw 92
	dw 91
	dw 574
	dw 188
	dw 132
	dw 118
	dw 112
	dw 111
	dw 23
	dw 85
	dw 60
	dw 438
	dw 171
	dw 72
	dw 386
	dw 107
	dw 62
	dw 385
	dw 196
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 95
	dw 574
	dw 194
	dw 534
	dw 118
	dw 112
	dw 111
	dw 23
	dw 371
	dw 26
	dw 393
	dw 192
	dw 92
	dw 91
	dw 107
	dw 133
	dw 329
	dw 27
	dw 202
	dw 219
	dw 323
	dw 508
	dw 204
	dw 95
	dw 171
	dw 194
	dw 109
	dw 322
	dw 62
	dw 214
	dw 219
	dw 321
	dw 508
	dw 318
	dw 97
	dw 92
	dw 91
	dw 20
	dw 130
	dw 55
	dw 316
	dw 57
	dw 40
	dw 375
	dw 372
	dw 30
	dw 28
	dw 171
	dw 530
	dw 368
	dw 43
	dw 62
	dw 53
	dw 219
	dw 453
	dw 508
	dw 423
	dw 97
	dw 380
	dw 343
	dw 453
	dw 81
	dw 453
	dw 131
	dw 311
	dw 80
	dw 369
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 55
	dw 19
	dw 21
	dw 40
	dw 219
	dw 453
	dw 508
	dw 453
	dw 97
	dw 453
	dw 44
	dw 42
	dw 41
	dw 53
	dw 117
	dw 119
	dw 453
	dw 453
	dw 216
	dw 380
	dw 343
	dw 453
	dw 81
	dw 453
	dw 120
	dw 389
	dw 80
	dw 369
	dw 453
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 97
	dw 55
	dw 453
	dw 57
	dw 40
	dw 219
	dw 453
	dw 508
	dw 453
	dw 97
	dw 453
	dw 44
	dw 42
	dw 41
	dw 53
	dw 453
	dw 453
	dw 453
	dw 157
	dw 216
	dw 380
	dw 343
	dw 453
	dw 81
	dw 453
	dw 158
	dw 453
	dw 80
	dw 369
	dw 453
	dw 453
	dw 165
	dw 453
	dw 219
	dw 453
	dw 508
	dw 55
	dw 97
	dw 57
	dw 40
	dw 219
	dw 453
	dw 508
	dw 453
	dw 97
	dw 453
	dw 44
	dw 42
	dw 41
	dw 53
	dw 453
	dw 159
	dw 160
	dw 453
	dw 216
	dw 380
	dw 343
	dw 453
	dw 81
	dw 453
	dw 453
	dw 453
	dw 80
	dw 369
	dw 376
	dw 453
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 97
	dw 453
	dw 55
	dw 453
	dw 57
	dw 40
	dw 453
	dw 453
	dw 453
	dw 453
	dw 44
	dw 42
	dw 41
	dw 453
	dw 453
	dw 53
	dw 453
	dw 453
	dw 216
	dw 453
	dw 453
	dw 380
	dw 343
	dw 344
	dw 81
	dw 453
	dw 453
	dw 217
	dw 80
	dw 369
	dw 453
	dw 453
	dw 453
	dw 56
	dw 453
	dw 121
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 136
	dw 52
	dw 54
	dw 137
	dw 453
	dw 453
	dw 44
	dw 42
	dw 41
	dw 219
	dw 453
	dw 508
	dw 453
	dw 97
	dw 216
	dw 219
	dw 453
	dw 508
	dw 219
	dw 97
	dw 508
	dw 453
	dw 97
	dw 453
	dw 453
	dw 134
	dw 48
	dw 50
	dw 453
	dw 453
	dw 453
	dw 161
	dw 453
	dw 453
	dw 47
	dw 46
	dw 75
	dw 49
	dw 453
	dw 453
	dw 219
	dw 453
	dw 508
	dw 217
	dw 97
	dw 135
	dw 219
	dw 453
	dw 508
	dw 56
	dw 97
	dw 453
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 453
	dw 52
	dw 54
	dw 219
	dw 217
	dw 508
	dw 142
	dw 97
	dw 453
	dw 453
	dw 56
	dw 453
	dw 453
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 315
	dw 52
	dw 54
	dw 219
	dw 453
	dw 508
	dw 453
	dw 97
	dw 48
	dw 50
	dw 453
	dw 453
	dw 453
	dw 143
	dw 162
	dw 453
	dw 47
	dw 46
	dw 75
	dw 49
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 330
	dw 48
	dw 50
	dw 219
	dw 219
	dw 508
	dw 508
	dw 97
	dw 97
	dw 47
	dw 46
	dw 75
	dw 49
	dw 38
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 217
	dw 453
	dw 141
	dw 453
	dw 453
	dw 453
	dw 56
	dw 453
	dw 453
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 453
	dw 52
	dw 54
	dw 219
	dw 217
	dw 508
	dw 140
	dw 97
	dw 453
	dw 453
	dw 56
	dw 453
	dw 453
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 314
	dw 52
	dw 54
	dw 219
	dw 453
	dw 508
	dw 139
	dw 97
	dw 48
	dw 50
	dw 453
	dw 453
	dw 453
	dw 122
	dw 453
	dw 453
	dw 47
	dw 46
	dw 75
	dw 49
	dw 453
	dw 219
	dw 453
	dw 508
	dw 453
	dw 97
	dw 48
	dw 50
	dw 219
	dw 138
	dw 508
	dw 453
	dw 97
	dw 453
	dw 47
	dw 46
	dw 75
	dw 49
	dw 453
	dw 453
	dw 366
	dw 453
	dw 453
	dw 217
	dw 219
	dw 453
	dw 508
	dw 453
	dw 97
	dw 56
	dw 453
	dw 453
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 453
	dw 52
	dw 54
	dw 367
	dw 453
	dw 453
	dw 217
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 56
	dw 123
	dw 453
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 453
	dw 52
	dw 54
	dw 453
	dw 453
	dw 453
	dw 48
	dw 50
	dw 219
	dw 453
	dw 508
	dw 453
	dw 97
	dw 453
	dw 47
	dw 46
	dw 75
	dw 49
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 48
	dw 50
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 47
	dw 46
	dw 75
	dw 49
	dw 453
	dw 453
	dw 453
	dw 453
	dw 55
	dw 217
	dw 57
	dw 40
	dw 453
	dw 453
	dw 453
	dw 56
	dw 453
	dw 453
	dw 45
	dw 51
	dw 58
	dw 53
	dw 453
	dw 313
	dw 52
	dw 54
	dw 453
	dw 380
	dw 343
	dw 453
	dw 81
	dw 453
	dw 217
	dw 453
	dw 80
	dw 369
	dw 453
	dw 453
	dw 56
	dw 453
	dw 453
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 453
	dw 52
	dw 54
	dw 48
	dw 50
	dw 453
	dw 453
	dw 44
	dw 42
	dw 41
	dw 453
	dw 47
	dw 46
	dw 75
	dw 49
	dw 216
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 48
	dw 50
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 47
	dw 46
	dw 75
	dw 49
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 217
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 56
	dw 453
	dw 453
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 453
	dw 52
	dw 54
	dw 453
	dw 217
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 56
	dw 453
	dw 453
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 453
	dw 52
	dw 54
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 50
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 47
	dw 46
	dw 75
	dw 49
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 47
	dw 46
	dw 75
	dw 49
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 217
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 56
	dw 453
	dw 453
	dw 45
	dw 51
	dw 58
	dw 453
	dw 453
	dw 453
	dw 52
	dw 54
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 75
	dw 49
f2___main_s063e:
	db 89
	db 1
	db 91
	db 3
	db 93
	db 69
	db 70
	db 7
	db 103
	db 9
	db 109
	db 110
	db 12
	db 13
	db 14
	db 2
	db 16
	db 17
	db 91
	db 6
	db 20
	db 21
	db 22
	db 8
	db 101
	db 25
	db 73
	db 27
	db 28
	db 29
	db 107
	db 108
	db 17
	db 33
	db 34
	db 17
	db 36
	db 37
	db 8
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 92
	db 8
	db 17
	db 18
	db 122
	db 123
	db 33
	db 91
	db 23
	db 24
	db 17
	db 38
	db 33
	db 34
	db 59
	db 60
	db 61
	db 4
	db 63
	db 64
	db 41
	db 1
	db 67
	db 3
	db 113
	db 114
	db 115
	db 7
	db 58
	db 59
	db 10
	db 33
	db 12
	db 13
	db 14
	db 62
	db 16
	db 17
	db 122
	db 123
	db 20
	db 21
	db 22
	db 58
	db 59
	db 25
	db 33
	db 27
	db 28
	db 29
	db 74
	db 74
	db 16
	db 33
	db 34
	db 78
	db 36
	db 80
	db 74
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 16
	db 32
	db 89
	db 74
	db 91
	db 33
	db 93
	db 78
	db 59
	db 60
	db 61
	db 33
	db 63
	db 64
	db 45
	db 1
	db 67
	db 3
	db 89
	db 73
	db 91
	db 7
	db 93
	db 10
	db 10
	db 5
	db 12
	db 13
	db 14
	db 11
	db 16
	db 17
	db 119
	db 120
	db 20
	db 21
	db 22
	db 17
	db 92
	db 25
	db 22
	db 27
	db 28
	db 29
	db 74
	db 74
	db 73
	db 33
	db 34
	db 78
	db 36
	db 80
	db 68
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 92
	db 96
	db 97
	db 74
	db 113
	db 114
	db 115
	db 78
	db 59
	db 60
	db 61
	db 33
	db 63
	db 64
	db 66
	db 1
	db 67
	db 3
	db 89
	db 73
	db 91
	db 7
	db 93
	db 4
	db 10
	db 35
	db 12
	db 13
	db 14
	db 16
	db 16
	db 17
	db 92
	db 73
	db 20
	db 21
	db 22
	db 116
	db 92
	db 25
	db 11
	db 27
	db 28
	db 29
	db 74
	db 74
	db 33
	db 33
	db 34
	db 112
	db 36
	db 111
	db 92
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 46
	db 47
	db 6
	db 74
	db 98
	db 99
	db 17
	db 78
	db 59
	db 60
	db 61
	db 22
	db 63
	db 64
	db 0
	db 1
	db 67
	db 3
	db 89
	db 73
	db 91
	db 7
	db 93
	db 118
	db 119
	db 120
	db 12
	db 13
	db 14
	db 65
	db 16
	db 17
	db 90
	db 91
	db 20
	db 21
	db 22
	db 33
	db 92
	db 25
	db 65
	db 27
	db 28
	db 29
	db 74
	db 74
	db 91
	db 33
	db 34
	db 78
	db 36
	db 74
	db 74
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 88
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 103
	db 59
	db 60
	db 61
	db 11
	db 63
	db 64
	db 103
	db 1
	db 67
	db 3
	db 2
	db 86
	db 87
	db 7
	db 22
	db 118
	db 119
	db 120
	db 12
	db 13
	db 14
	db 108
	db 16
	db 17
	db 94
	db 17
	db 20
	db 21
	db 22
	db 16
	db 22
	db 25
	db 94
	db 27
	db 28
	db 29
	db 74
	db 74
	db 72
	db 33
	db 34
	db 78
	db 36
	db 74
	db 72
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 88
	db 89
	db 94
	db 91
	db 99
	db 93
	db 74
	db 73
	db 59
	db 60
	db 61
	db 73
	db 63
	db 64
	db 4
	db 100
	db 67
	db 72
	db 8
	db 102
	db 88
	db 89
	db 74
	db 91
	db 14
	db 93
	db 92
	db 17
	db 18
	db 19
	db 92
	db 16
	db 17
	db 23
	db 24
	db 73
	db 8
	db 89
	db 74
	db 91
	db 70
	db 93
	db 14
	db 90
	db 91
	db 17
	db 18
	db 19
	db 33
	db 34
	db 70
	db 23
	db 24
	db 89
	db 92
	db 91
	db 41
	db 93
	db 48
	db 49
	db 50
	db 51
	db 52
	db 53
	db 54
	db 55
	db 56
	db 57
	db 58
	db 59
	db 13
	db 90
	db 91
	db 70
	db 72
	db 102
	db 48
	db 49
	db 50
	db 51
	db 52
	db 53
	db 54
	db 55
	db 56
	db 57
	db 58
	db 59
	db 71
	db 70
	db 101
	db 74
	db 75
	db 76
	db 77
	db 102
	db 107
	db 108
	db 81
	db 82
	db 83
	db 84
	db 100
	db 46
	db 47
	db 85
	db 89
	db 72
	db 91
	db 70
	db 93
	db 74
	db 95
	db 79
	db 74
	db 109
	db 110
	db 46
	db 47
	db 4
	db 70
	db 70
	db 105
	db 106
	db 32
	db 88
	db 89
	db 4
	db 91
	db 89
	db 93
	db 91
	db 17
	db 93
	db 117
	db 100
	db 71
	db 45
	db 121
	db 74
	db 75
	db 76
	db 77
	db 70
	db 101
	db 70
	db 81
	db 82
	db 83
	db 84
	db 107
	db 108
	db 17
	db 26
	db 89
	db 17
	db 91
	db 22
	db 93
	db 71
	db 95
	db 74
	db 74
	db 75
	db 76
	db 77
	db 6
	db 6
	db 45
	db 45
	db 105
	db 106
	db 84
	db 22
	db 22
	db 88
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 117
	db 95
	db 71
	db 31
	db 121
	db 74
	db 75
	db 76
	db 77
	db 4
	db 104
	db 105
	db 106
	db 16
	db 6
	db 84
	db 20
	db 10
	db 25
	db 65
	db 89
	db 22
	db 91
	db 117
	db 93
	db 25
	db 95
	db 121
	db 22
	db 6
	db 45
	db 4
	db 6
	db 4
	db 16
	db 104
	db 105
	db 106
	db 71
	db 41
	db 74
	db 74
	db 75
	db 76
	db 77
	db 25
	db 2
	db 22
	db 117
	db 65
	db 22
	db 84
	db 121
	db 22
	db 33
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 71
	db 95
	db 97
	db 74
	db 75
	db 76
	db 77
	db 22
	db 2
	db 4
	db 104
	db 105
	db 106
	db 84
	db 74
	db 22
	db 45
	db 64
	db 89
	db 12
	db 91
	db 10
	db 93
	db 117
	db 95
	db 26
	db 22
	db 121
	db 88
	db 89
	db 22
	db 91
	db 13
	db 93
	db 105
	db 106
	db 47
	db 74
	db 14
	db 13
	db 16
	db 17
	db 5
	db 4
	db 16
	db 45
	db 117
	db 16
	db 33
	db 59
	db 121
	db 27
	db 89
	db 124
	db 91
	db 31
	db 93
	db 33
	db 34
	db 124
	db 36
	db 124
	db 74
	db 22
	db 40
	db 41
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 14
	db 15
	db 16
	db 17
	db 89
	db 124
	db 91
	db 124
	db 93
	db 124
	db 59
	db 60
	db 61
	db 27
	db 74
	db 74
	db 124
	db 124
	db 67
	db 33
	db 34
	db 124
	db 36
	db 124
	db 74
	db 4
	db 40
	db 41
	db 124
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 14
	db 124
	db 16
	db 17
	db 89
	db 124
	db 91
	db 124
	db 93
	db 124
	db 59
	db 60
	db 61
	db 27
	db 124
	db 124
	db 124
	db 74
	db 67
	db 33
	db 34
	db 124
	db 36
	db 124
	db 74
	db 124
	db 40
	db 41
	db 124
	db 124
	db 9
	db 124
	db 89
	db 124
	db 91
	db 14
	db 93
	db 16
	db 17
	db 89
	db 124
	db 91
	db 124
	db 93
	db 124
	db 59
	db 60
	db 61
	db 27
	db 124
	db 74
	db 74
	db 124
	db 67
	db 33
	db 34
	db 124
	db 36
	db 124
	db 124
	db 124
	db 40
	db 41
	db 5
	db 124
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 124
	db 14
	db 124
	db 16
	db 17
	db 124
	db 124
	db 124
	db 124
	db 59
	db 60
	db 61
	db 124
	db 124
	db 27
	db 124
	db 124
	db 67
	db 124
	db 124
	db 33
	db 34
	db 4
	db 36
	db 124
	db 124
	db 8
	db 40
	db 41
	db 124
	db 124
	db 124
	db 14
	db 124
	db 74
	db 17
	db 18
	db 19
	db 124
	db 124
	db 74
	db 23
	db 24
	db 74
	db 124
	db 124
	db 59
	db 60
	db 61
	db 89
	db 124
	db 91
	db 124
	db 93
	db 67
	db 89
	db 124
	db 91
	db 89
	db 93
	db 91
	db 124
	db 93
	db 124
	db 124
	db 74
	db 48
	db 49
	db 124
	db 124
	db 124
	db 74
	db 124
	db 124
	db 56
	db 57
	db 58
	db 59
	db 124
	db 124
	db 89
	db 124
	db 91
	db 8
	db 93
	db 74
	db 89
	db 124
	db 91
	db 14
	db 93
	db 124
	db 17
	db 18
	db 19
	db 124
	db 124
	db 124
	db 23
	db 24
	db 89
	db 8
	db 91
	db 74
	db 93
	db 124
	db 124
	db 14
	db 124
	db 124
	db 17
	db 18
	db 19
	db 124
	db 124
	db 22
	db 23
	db 24
	db 89
	db 124
	db 91
	db 124
	db 93
	db 48
	db 49
	db 124
	db 124
	db 124
	db 74
	db 74
	db 124
	db 56
	db 57
	db 58
	db 59
	db 124
	db 124
	db 124
	db 124
	db 124
	db 65
	db 48
	db 49
	db 89
	db 89
	db 91
	db 91
	db 93
	db 93
	db 56
	db 57
	db 58
	db 59
	db 2
	db 124
	db 124
	db 124
	db 124
	db 124
	db 8
	db 124
	db 74
	db 124
	db 124
	db 124
	db 14
	db 124
	db 124
	db 17
	db 18
	db 19
	db 124
	db 124
	db 124
	db 23
	db 24
	db 89
	db 8
	db 91
	db 74
	db 93
	db 124
	db 124
	db 14
	db 124
	db 124
	db 17
	db 18
	db 19
	db 124
	db 124
	db 22
	db 23
	db 24
	db 89
	db 124
	db 91
	db 74
	db 93
	db 48
	db 49
	db 124
	db 124
	db 124
	db 74
	db 124
	db 124
	db 56
	db 57
	db 58
	db 59
	db 124
	db 89
	db 124
	db 91
	db 124
	db 93
	db 48
	db 49
	db 89
	db 74
	db 91
	db 124
	db 93
	db 124
	db 56
	db 57
	db 58
	db 59
	db 124
	db 124
	db 5
	db 124
	db 124
	db 8
	db 89
	db 124
	db 91
	db 124
	db 93
	db 14
	db 124
	db 124
	db 17
	db 18
	db 19
	db 124
	db 124
	db 124
	db 23
	db 24
	db 5
	db 124
	db 124
	db 8
	db 124
	db 124
	db 124
	db 124
	db 124
	db 14
	db 74
	db 124
	db 17
	db 18
	db 19
	db 124
	db 124
	db 124
	db 23
	db 24
	db 124
	db 124
	db 124
	db 48
	db 49
	db 89
	db 124
	db 91
	db 124
	db 93
	db 124
	db 56
	db 57
	db 58
	db 59
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 48
	db 49
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 56
	db 57
	db 58
	db 59
	db 124
	db 124
	db 124
	db 124
	db 14
	db 8
	db 16
	db 17
	db 124
	db 124
	db 124
	db 14
	db 124
	db 124
	db 17
	db 18
	db 19
	db 27
	db 124
	db 22
	db 23
	db 24
	db 124
	db 33
	db 34
	db 124
	db 36
	db 124
	db 8
	db 124
	db 40
	db 41
	db 124
	db 124
	db 14
	db 124
	db 124
	db 17
	db 18
	db 19
	db 124
	db 124
	db 124
	db 23
	db 24
	db 48
	db 49
	db 124
	db 124
	db 59
	db 60
	db 61
	db 124
	db 56
	db 57
	db 58
	db 59
	db 67
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 48
	db 49
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 56
	db 57
	db 58
	db 59
	db 124
	db 124
	db 124
	db 124
	db 124
	db 8
	db 124
	db 124
	db 124
	db 124
	db 124
	db 14
	db 124
	db 124
	db 17
	db 18
	db 19
	db 124
	db 124
	db 124
	db 23
	db 24
	db 124
	db 8
	db 124
	db 124
	db 124
	db 124
	db 124
	db 14
	db 124
	db 124
	db 17
	db 18
	db 19
	db 124
	db 124
	db 124
	db 23
	db 24
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 49
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 56
	db 57
	db 58
	db 59
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 56
	db 57
	db 58
	db 59
	db 124
	db 124
	db 124
	db 124
	db 124
	db 8
	db 124
	db 124
	db 124
	db 124
	db 124
	db 14
	db 124
	db 124
	db 17
	db 18
	db 19
	db 124
	db 124
	db 124
	db 23
	db 24
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 58
	db 59
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 124
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
	db 69
f2___main_s063f:
	dw 1316
	dw 0
	dw 0
	dw 65
	dw 65
	dw 65
	dw 130
	dw 195
	dw 260
	dw 325
	dw 325
	dw 643
	dw 643
	dw 678
	dw 643
	dw 678
	dw 713
	dw 1094
	dw 748
	dw 678
	dw 678
	dw 678
	dw 678
	dw 678
	dw 785
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 1094
	dw 391
	dw 24
	dw 24
	dw 100
	dw 43
	dw 43
	dw 81
	dw 81
	dw 18
	dw 18
	dw 18
	dw 18
	dw 18
	dw 18
	dw 18
	dw 18
	dw 18
	dw 58
	dw 129
	dw 194
	dw 194
	dw 194
	dw 88
	dw 94
	dw 159
	dw 94
	dw 94
	dw 210
	dw 171
	dw 242
	dw 250
	dw 221
	dw 221
	dw 81
	dw 332
	dw 332
	dw 94
	dw 332
	dw 94
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 1316
	dw 386
	dw 404
	dw 816
	dw 873
	dw 891
	dw 949
	dw 967
	dw 1024
	dw 1044
	dw 816
	dw 1101
	dw 1124
	dw 1124
	dw 1124
	dw 1124
	dw 1124
	dw 1124
	dw 1124
	dw 1124
	dw 1124
	dw 1124
	dw 1181
	dw 1199
	dw 1256
	dw 1256
	dw 30
	dw 30
	dw 30
	dw 15
	dw 15
	dw 15
	dw 200
	dw 433
	dw 327
	dw 447
	dw 85
	dw 468
	dw 235
	dw 134
	dw 311
	dw 511
	dw 491
	dw 136
	dw 499
	dw 38
	dw 38
	dw 38
	dw 38
	dw 38
	dw 38
	dw 13
	dw 503
	dw 536
	dw 537
	dw 514
	dw 500
	dw 527
	dw 528
	dw 530
	dw 514
	dw 563
	dw 555
	dw 566
	dw 554
	dw 565
	dw 512
	dw 551
	dw 558
	dw 557
	dw 564
	dw 514
	dw 581
	dw 543
	dw 585
	dw 584
	dw 587
	dw 556
	dw 576
	dw 578
	dw 583
	dw 586
	dw 602
	dw 589
	dw 542
	dw 579
	dw 604
	dw 625
	dw 624
	dw 590
	dw 612
	dw 572
	dw 626
	dw 630
	dw 618
	dw 623
	dw 627
	dw 608
	dw 638
	dw 645
	dw 656
	dw 658
	dw 619
	dw 647
	dw 609
	dw 634
	dw 514
	dw 650
	dw 660
f2___main_s0640:
	dw 65472
	dw 393
	dw 441
	dw 464
	dw 489
	dw 525
	dw 548
	dw 548
	dw 548
	dw 548
	dw 548
	dw 151
	dw 216
	dw 22
	dw 29
	dw 87
	dw 86
	dw 152
	dw 223
	dw 45
	dw 110
	dw 175
	dw 217
	dw 282
	dw 288
	dw 308
	dw 413
	dw 281
	dw 463
	dw 524
	dw 559
	dw 21
	dw 224
	dw 324
	dw 340
	dw 416
	dw 582
	dw 607
	dw 632
	dw 633
	dw 642
	dw 670
	dw 677
	dw 703
	dw 704
	dw 758
	dw 764
	dw 767
	dw 789
	dw 795
	dw 809
	dw 827
	dw 852
	dw 853
	dw 885
	dw 903
	dw 921
	dw 928
	dw 944
	dw 985
	dw 65447
	dw 65463
	dw 65497
	dw 65459
	dw 65492
	dw 72
	dw 365
	dw 419
	dw 65489
	dw 62
	dw 89
	dw 127
	dw 141
	dw 192
	dw 310
	dw 314
	dw 338
	dw 65437
	dw 244
	dw 188
	dw 329
	dw 357
	dw 121
	dw 291
	dw 382
	dw 378
	dw 411
	dw 65441
	dw 102
	dw 118
	dw 201
	dw 215
	dw 222
	dw 232
	dw 249
	dw 257
	dw 285
	dw 284
	dw 321
	dw 346
	dw 356
	dw 293
	dw 379
	dw 349
	dw 395
	dw 369
	dw 415
	dw 396
	dw 426
	dw 427
	dw 410
	dw 449
	dw 451
f2___main_s0641:
	dw 573
	dw 469
	dw 469
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 580
	dw 576
	dw 591
	dw 591
	dw 451
	dw 591
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 563
	dw 451
	dw 451
	dw 451
	dw 451
	dw 587
	dw 587
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 559
	dw 586
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 573
	dw 573
	dw 585
	dw 573
	dw 585
	dw 573
	dw 585
	dw 573
	dw 578
	dw 573
	dw 573
	dw 467
	dw 573
	dw 573
	dw 451
	dw 451
	dw 539
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 564
	dw 539
	dw 485
	dw 484
	dw 483
	dw 482
	dw 481
	dw 480
	dw 535
	dw 513
	dw 498
	dw 496
	dw 500
	dw 499
	dw 491
	dw 492
	dw 489
	dw 493
	dw 495
	dw 494
	dw 451
	dw 451
	dw 451
	dw 468
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 505
	dw 504
	dw 503
	dw 502
	dw 497
	dw 490
	dw 451
	dw 451
	dw 451
	dw 451
	dw 541
	dw 592
	dw 451
	dw 451
	dw 451
	dw 557
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 554
	dw 451
	dw 552
	dw 451
	dw 547
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 527
	dw 451
	dw 451
	dw 451
	dw 451
	dw 538
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 478
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 451
	dw 501
	dw 488
	dw 451
c01_c290:
	db 36,0
c01_c291:
	db 65,83,77,0
c01_c292:
	db 65,83,83,73,71,78,0
c01_c293:
	db 66,82,69,65,75,0
c01_c294:
	db 67,76,79,83,69,80,65,82,69,78,0
c01_c295:
	db 67,76,79,83,69,83,81,0
c01_c296:
	db 67,79,76,79,78,0
c01_c297:
	db 67,79,78,83,84,0
c01_c298:
	db 68,79,84,0
c01_c299:
	db 69,76,83,69,0
c01_c300:
	db 69,78,68,0
c01_c301:
	db 69,88,84,69,82,78,0
c01_c302:
	db 73,70,0
c01_c303:
	db 76,79,79,80,0
c01_c304:
	db 77,73,78,85,83,0
c01_c305:
	db 78,79,84,0
c01_c306:
	db 79,80,69,78,80,65,82,69,78,0
c01_c307:
	db 79,80,69,78,83,81,0
c01_c308:
	db 80,69,82,67,69,78,84,0
c01_c309:
	db 80,76,85,83,0
c01_c310:
	db 82,69,67,79,82,68,0
c01_c311:
	db 82,69,84,85,82,78,0
c01_c312:
	db 83,69,77,73,67,79,76,79,78,0
c01_c313:
	db 83,76,65,83,72,0
c01_c314:
	db 83,84,65,82,0
c01_c315:
	db 83,85,66,0
c01_c316:
	db 84,72,69,78,0
c01_c317:
	db 84,73,76,68,69,0
c01_c318:
	db 86,65,82,0
c01_c319:
	db 87,72,73,76,69,0
c01_c320:
	db 84,89,80,69,0
c01_c321:
	db 79,80,69,78,66,82,0
c01_c322:
	db 67,76,79,83,69,66,82,0
c01_c323:
	db 73,68,0
c01_c324:
	db 78,85,77,66,69,82,0
c01_c325:
	db 65,84,0
c01_c326:
	db 66,89,84,69,83,79,70,0
c01_c327:
	db 69,76,83,69,73,70,0
c01_c328:
	db 73,78,84,0
c01_c329:
	db 84,89,80,69,68,69,70,0
c01_c330:
	db 83,73,90,69,79,70,0
c01_c331:
	db 83,84,82,73,78,71,0
c01_c332:
	db 73,77,80,76,0
c01_c333:
	db 68,69,67,76,0
c01_c334:
	db 73,78,84,69,82,70,65,67,69,0
c01_c335:
	db 67,79,77,77,65,0
c01_c336:
	db 65,78,68,0
c01_c337:
	db 79,82,0
c01_c338:
	db 80,73,80,69,0
c01_c339:
	db 67,65,82,69,84,0
c01_c340:
	db 76,84,79,80,0
c01_c341:
	db 76,69,79,80,0
c01_c342:
	db 71,84,79,80,0
c01_c343:
	db 71,69,79,80,0
c01_c344:
	db 69,81,79,80,0
c01_c345:
	db 78,69,79,80,0
c01_c346:
	db 76,83,72,73,70,84,0
c01_c347:
	db 82,83,72,73,70,84,0
c01_c348:
	db 65,83,0
c01_c349:
	db 65,77,80,69,82,83,65,78,68,0
c01_c350:
	db 78,69,88,84,0
c01_c351:
	db 80,82,69,86,0
c01_c352:
	db 73,78,68,69,88,79,70,0
c01_c353:
	db 67,79,78,84,73,78,85,69,0
c01_c354:
	db 67,65,83,69,0
c01_c355:
	db 73,83,0
c01_c356:
	db 87,72,69,78,0
c01_c357:
	db 65,76,73,65,83,0
c01_c358:
	db 73,77,80,76,69,77,69,78,84,83,0
f2___main_s0642:
	dw c01_c290
	dw c01_c291
	dw c01_c292
	dw c01_c293
	dw c01_c294
	dw c01_c295
	dw c01_c296
	dw c01_c297
	dw c01_c298
	dw c01_c299
	dw c01_c300
	dw c01_c301
	dw c01_c302
	dw c01_c303
	dw c01_c304
	dw c01_c305
	dw c01_c306
	dw c01_c307
	dw c01_c308
	dw c01_c309
	dw c01_c310
	dw c01_c311
	dw c01_c312
	dw c01_c313
	dw c01_c314
	dw c01_c315
	dw c01_c316
	dw c01_c317
	dw c01_c318
	dw c01_c319
	dw c01_c320
	dw c01_c321
	dw c01_c322
	dw c01_c323
	dw c01_c324
	dw c01_c325
	dw c01_c326
	dw c01_c327
	dw c01_c328
	dw c01_c329
	dw c01_c330
	dw c01_c331
	dw c01_c332
	dw c01_c333
	dw c01_c334
	dw c01_c335
	dw c01_c336
	dw c01_c337
	dw c01_c338
	dw c01_c339
	dw c01_c340
	dw c01_c341
	dw c01_c342
	dw c01_c343
	dw c01_c344
	dw c01_c345
	dw c01_c346
	dw c01_c347
	dw c01_c348
	dw c01_c349
	dw c01_c350
	dw c01_c351
	dw c01_c352
	dw c01_c353
	dw c01_c354
	dw c01_c355
	dw c01_c356
	dw c01_c357
	dw c01_c358
c01_c359:
	db 102,114,101,101,32,117,110,117,115,101,100,32,115,116,114,105,110,103,10,0


	; token_destructor workspace at ws+1383 length ws+0
f315_token_destructor:
	ld a, (ws+1380)
	cp 41
	jp z, c01_0648
	ld a, (ws+1380)
	cp 33
	jp nz, c01_0649
c01_0648:
	ld hl,c01_c359
	call f9_print
	ld hl, (ws+1381)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
c01_0649:
;c01_0643:
;end_f315_token_destructor:
	ret


	; yy_destructor workspace at ws+1380 length ws+3
f314_yy_destructor:
	ld (ws+1381), hl
	pop bc
	pop af
	ld (ws+1380), a
	push bc
	ld a, (ws+1380)
	or a
	jp z, c01_0651
;c01_0652:
	ld a, (ws+1380)
	cp 69
	jp nc, c01_0651
;c01_0650:
	call f315_token_destructor
c01_0651:
;c01_064b:
;end_f314_yy_destructor:
	ret


	; yy_pop_parser_stack workspace at ws+1353 length ws+0
f316_yy_pop_parser_stack:
	ld hl, (ws+566)
	ld de,65529
	add hl,de
	ld (ws+566), hl
	inc hl
	inc hl
	ld a,(hl)
	push af
	ld hl, (ws+566)
	inc hl
	inc hl
	inc hl
	call f314_yy_destructor
;end_f316_yy_pop_parser_stack:
	ret


	; yy_pop_all_parser_stack workspace at ws+1353 length ws+0
f317_yy_pop_all_parser_stack:
c01_0653:
	ld de, (ws+566)
	ld hl,ws+568
	and a
	sbc hl,de
	jp z, c01_0658
	call f316_yy_pop_parser_stack
	jp c01_0653
c01_0658:
;end_f317_yy_pop_all_parser_stac: 
	ret
c01_c360:
	db 112,97,114,115,101,114,32,115,116,97,99,107,32,111,118,101,114,102,108,111,119,0


	; yy_stack_overflow workspace at ws+1353 length ws+0
f318_yy_stack_overflow:
	call f317_yy_pop_all_parser_stack
	call f80_StartError
	ld hl,c01_c360
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f318_yy_stack_overflow:
;	ret
f2___main_s0659:
	db 71
	db 71
	db 71
	db 71
	db 71
	db 71
	db 75
	db 71
	db 77
	db 76
	db 71
	db 71
	db 71
	db 79
	db 80
	db 81
	db 82
	db 83
	db 71
	db 84
	db 87
	db 87
	db 78
	db 78
	db 78
	db 78
	db 78
	db 78
	db 78
	db 78
	db 78
	db 78
	db 89
	db 89
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 89
	db 89
	db 74
	db 74
	db 89
	db 88
	db 71
	db 73
	db 73
	db 73
	db 73
	db 73
	db 73
	db 71
	db 72
	db 91
	db 92
	db 90
	db 90
	db 74
	db 71
	db 71
	db 93
	db 94
	db 94
	db 96
	db 96
	db 97
	db 95
	db 98
	db 98
	db 99
	db 71
	db 106
	db 102
	db 100
	db 105
	db 103
	db 104
	db 101
	db 101
	db 107
	db 108
	db 108
	db 109
	db 109
	db 110
	db 71
	db 111
	db 112
	db 114
	db 116
	db 116
	db 115
	db 71
	db 117
	db 119
	db 119
	db 120
	db 71
	db 121
	db 123
	db 123
	db 123
	db 69
	db 70
	db 70
	db 71
	db 81
	db 81
	db 85
	db 85
	db 86
	db 71
	db 71
	db 71
	db 71
	db 102
	db 112
	db 113
	db 113
	db 118
	db 118
	db 119
	db 122
	db 122
f2___main_s065a:
	db 2
	db 5
	db 7
	db 5
	db 4
	db 4
	db 1
	db 4
	db 1
	db 3
	db 2
	db 2
	db 8
	db 0
	db 1
	db 0
	db 1
	db 1
	db 5
	db 3
	db 3
	db 3
	db 3
	db 2
	db 3
	db 3
	db 3
	db 3
	db 3
	db 3
	db 3
	db 3
	db 1
	db 3
	db 1
	db 2
	db 2
	db 3
	db 3
	db 3
	db 3
	db 3
	db 3
	db 3
	db 3
	db 3
	db 3
	db 3
	db 2
	db 3
	db 2
	db 2
	db 2
	db 2
	db 1
	db 3
	db 4
	db 3
	db 1
	db 1
	db 5
	db 6
	db 1
	db 3
	db 4
	db 3
	db 2
	db 5
	db 1
	db 1
	db 1
	db 1
	db 3
	db 2
	db 3
	db 5
	db 1
	db 3
	db 2
	db 1
	db 3
	db 1
	db 5
	db 1
	db 3
	db 1
	db 5
	db 4
	db 5
	db 1
	db 3
	db 1
	db 2
	db 1
	db 3
	db 1
	db 2
	db 3
	db 1
	db 3
	db 3
	db 7
	db 1
	db 2
	db 5
	db 0
	db 4
	db 1
	db 5
	db 5
	db 1
	db 3
	db 1
	db 3
	db 1
	db 1
	db 1
	db 1
	db 1
	db 0
	db 2
	db 1
	db 2
	db 5
	db 0
	db 2
	db 2
	db 8
	db 6
	db 5
	db 5
	db 0
	db 0
	db 0
	db 2
	db 1
	db 3
	db 0
	db 1
	db 3


	; CopyMinor workspace at ws+1353 length ws+4
f320_CopyMinor:
	ld (ws+1355), hl
	pop bc
	pop hl
	ld (ws+1353), hl
	push bc
	push hl
	ld de,4
	push de
	ld hl, (ws+1355)
	call f34_MemCopy
;end_f320_CopyMinor:
	ret
