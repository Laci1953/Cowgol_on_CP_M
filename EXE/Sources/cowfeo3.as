	; BeginNormalLoop workspace at ws+1357 length ws+8
f299_BeginNormalLoop::
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
;end_f299_BeginNormalLoop:
	ld hl, (ws+1357)
	ret


	; TerminateNormalLoop workspace at ws+1353 length ws+6
f300_TerminateNormalLoop::
	ld (ws+1353), hl
	ld hl, (ws+20)
	call f130_MidJump
	ld (ws+1355), hl
	call f269_Generate
	ld hl, (ws+18)
	call f135_MidLabel
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
;end_f300_TerminateNormalLoop:
;	ret


	; Negate workspace at ws+1353 length ws+2
f301_Negate::
	ld (ws+1353), hl
	push hl
	pop ix
	ld a, (ix+6)
	xor 1
	push hl
	pop ix
	ld (ix+6), a
;end_f301_Negate:
	ret


	; ConditionalEq workspace at ws+1355 length ws+19
f302_ConditionalEq::
	ld (ws+1359), a
	pop bc
	pop hl
	ld (ws+1357), hl
	pop hl
	ld (ws+1355), hl
	push bc
	push hl
	ld hl, (ws+1357)
	call f289_CondSimple
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
	call f129_MidBeq
;	ld (ws+1372), hl
;	ld (ws+1360), hl
;end_f302_ConditionalEq:
;	ld hl, (ws+1360)
	ret


	; ConditionalLt workspace at ws+1355 length ws+22
f303_ConditionalLt::
	ld (ws+1359), a
	pop bc
	pop hl
	ld (ws+1357), hl
	pop hl
	ld (ws+1355), hl
	push bc
	push hl
	ld hl, (ws+1357)
	call f289_CondSimple
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
	jp z, c01_061b
;c01_061a:
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
	call f151_MidBlts
	ld (ws+1373), hl
	ld (ws+1360), hl
	jp c01_0617
c01_061b:
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
	call f110_MidBltu
	ld (ws+1375), hl
	ld (ws+1360), hl
c01_0617:
;end_f303_ConditionalLt:
	ld hl, (ws+1360)
	ret


c01_c282:
	db 64,110,101,120,116,32,97,110,100,32,64,112,114,101,118,32,111,110,108,121,32,119,111,114,107,32,111,110,32,112,111,105,110
	db 116,101,114,115,0

	; parser_i_bad_next_prev workspace at ws+1358 length ws+0
f304_parser_i_bad_next_prev::
	ld hl,c01_c282
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f304_parser_i_bad_next_prev:
;	ret


c01_c283:
	db 111,110,108,121,32,99,111,110,115,116,97,110,116,32,118,97,108,117,101,115,32,97,114,101,32,97,108,108,111,119,101,100,32
	db 104,101,114,101,0

	; parser_i_constant_error workspace at ws+1369 length ws+0
f305_parser_i_constant_error::
	ld hl,c01_c283
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f305_parser_i_constant_erro: 
;	ret


c01_c284:
	db 115,117,98,114,111,117,116,105,110,101,32,0
c01_c285:
	db 32,116,97,107,101,115,32,0
c01_c286:
	db 32,98,117,116,32,119,97,115,32,103,105,118,101,110,32,0

	; i_check_sub_call_args workspace at ws+1378 length ws+2
f306_i_check_sub_call_args::
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
	jp z, c01_0620
;c01_061f:
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
c01_0620:
;c01_061c:
;end_f306_i_check_sub_call_args:
	ret


	; i_end_call workspace at ws+1378 length ws+2
f307_i_end_call::
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
;end_f307_i_end_call:
	ret


c01_c287:
	db 97,116,116,101,109,112,116,32,116,111,32,114,101,100,101,102,105,110,101,32,0

	; SymbolRedeclarationError workspace at ws+1355 length ws+0
f308_SymbolRedeclarationError::
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
;end_f308_SymbolRedeclarationErr:  
;	ret


c01_c288:
	db 119,114,111,110,103,32,110,117,109,98,101,114,32,111,102,32,101,108,101,109,101,110,116,115,32,105,110,32,105,110,105,116
	db 105,97,108,105,115,101,114,32,102,111,114,32,0

	; WrongNumberOfElementsError workspace at ws+1373 length ws+0
f309_WrongNumberOfElementsError::
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
;end_f309_WrongNumberOfElementsE:    
;	ret


	; CheckEndOfInitialiser workspace at ws+1355 length ws+9
f310_CheckEndOfInitialiser::
	ld hl, (ws+26)
	call f237_IsArray
	ld (ws+1355), a
	or a
	jp z, c01_0625
;c01_0624:
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
	jp nz, c01_062a
	ld hl, (ws+562)
	ld ix, (ws+26)
	ld (ix+11), l
	ld (ix+12), h
	ld b,h
	ld c,l
	ld de, (ws+1356)
	call f480__dvrmu2
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
c01_062a:
;c01_0626:
	ld de, (ws+562)
	ld ix, (ws+26)
	ld l, (ix+11)
	ld h, (ix+12)
	and a
	sbc hl,de
	jp z, c01_0621 ; c01_062f
;c01_062e:
	call f309_WrongNumberOfElementsError
c01_062f:
;c01_062b:
	jp c01_0621
c01_0625:
	ld hl, (ws+560)
	ld a,h
	or l
	jp z, c01_0634
;c01_0633:
	call f309_WrongNumberOfElementsError
c01_0634:
;c01_0630:
c01_0621:
;end_f310_CheckEndOfInitialiser:
	ret


	; GetInitedMember workspace at ws+1373 length ws+5
f312_GetInitedMember::
	ld ix,0
	ld (ws+1373), ix
	ld hl, (ws+26)
	call f237_IsArray
	ld (ws+1377), a
	or a
	jp z, c01_0639
;c01_0638:
	ld hl, (ws+26)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1375), hl
	jp c01_0635
c01_0639:
	ld hl, (ws+560)
	ld a,h
	or l
	jp nz, c01_063e
	ld ix,0
	ld (ws+1375), ix
	jp end_f312_GetInitedMember
c01_063e:
;c01_063a:
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
c01_0635:
end_f312_GetInitedMember:
	ld hl, (ws+1373)
	pop bc
	push hl
	ld hl, (ws+1375)
	push bc
	ret


	; AlignTo workspace at ws+1373 length ws+7
f313_AlignTo::
	ld (ws+1373), a
	ld hl, (ws+564)
	push hl
	call f250_ArchAlignUp
;	ld (ws+1374), hl
	ld (ws+1376), hl
c01_063f:
	ld de, (ws+564)
	ld hl, (ws+1376)
	and a
	sbc hl,de
	jp z, c01_0644
;c01_0643:
	ld d,1
	push de
	and a
	sbc hl,hl
	exx
	sbc hl,hl
	exx
	call f116_MidInit
;	ld (ws+1378), hl
	call f269_Generate
	ld hl, (ws+562)
	inc hl
	ld (ws+562), hl
	ld hl, (ws+564)
	inc hl
	ld (ws+564), hl
	jp c01_063f
c01_0644:
;end_f313_AlignTo:
	ret


c01_c289:
	db 111,117,116,32,111,102,32,111,114,100,101,114,32,115,116,97,116,105,99,32,105,110,105,116,105,97,108,105,115,97,116,105,111
	db 110,0

	; CheckForOverlaps workspace at ws+1373 length ws+2
f314_CheckForOverlaps::
	ld (ws+1373), hl
	ld a,h
	or l
;	jp nz, c01_0649
;	ret
;c01_0649:
	ret z
;c01_0645:
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
	jp nc, c01_064e
;c01_064d:
	ld hl,c01_c289
	call f82_SimpleError
c01_064e:
;c01_064a:
;end_f314_CheckForOverlaps:
	ret


	; GetInitedMemberChecked workspace at ws+1369 length ws+4
f315_GetInitedMemberChecked::
	call f312_GetInitedMember
	ld (ws+1371), hl
	pop hl
	ld (ws+1369), hl
	ld hl, (ws+1371)
	ld a,h
	or l
;	jp nz, c01_0653
;	call f309_WrongNumberOfElementsError
;c01_0653:
	call z,f309_WrongNumberOfElementsError
;c01_064f:
	ld ix, (ws+1371)
	ld a, (ix+16)
	call f313_AlignTo
	ld hl, (ws+1369)
	call f314_CheckForOverlaps
;end_f315_GetInitedMemberChecked:
	ld hl, (ws+1369)
	pop bc
	push hl
	ld hl, (ws+1371)
	push bc
	ret


f2___main_s0654::
	dw 533
	dw 427
	dw 511
	dw 208
	dw 94
	dw 454
	dw 8
	dw 96
	dw 104
	dw 328
	dw 186
	dw 185
	dw 110
	dw 318
	dw 55
	dw 175
	dw 17
	dw 40
	dw 574
	dw 385
	dw 82
	dw 220
	dw 434
	dw 77
	dw 105
	dw 86
	dw 574
	dw 53
	dw 98
	dw 320
	dw 187
	dw 552
	dw 24
	dw 382
	dw 344
	dw 73
	dw 81
	dw 329
	dw 217
	dw 197
	dw 80
	dw 371
	dw 180
	dw 191
	dw 83
	dw 346
	dw 420
	dw 45
	dw 51
	dw 596
	dw 168
	dw 383
	dw 167
	dw 52
	dw 54
	dw 114
	dw 215
	dw 169
	dw 168
	dw 479
	dw 44
	dw 42
	dw 41
	dw 409
	dw 207
	dw 31
	dw 172
	dw 427
	dw 216
	dw 208
	dw 219
	dw 519
	dw 511
	dw 96
	dw 97
	dw 334
	dw 179
	dw 150
	dw 110
	dw 318
	dw 55
	dw 79
	dw 17
	dw 40
	dw 77
	dw 519
	dw 82
	dw 220
	dw 434
	dw 75
	dw 49
	dw 86
	dw 184
	dw 53
	dw 98
	dw 320
	dw 519
	dw 114
	dw 132
	dw 382
	dw 344
	dw 147
	dw 81
	dw 164
	dw 174
	dw 197
	dw 80
	dw 371
	dw 180
	dw 191
	dw 83
	dw 346
	dw 219
	dw 219
	dw 511
	dw 511
	dw 97
	dw 97
	dw 22
	dw 20
	dw 156
	dw 536
	dw 183
	dw 59
	dw 382
	dw 429
	dw 44
	dw 42
	dw 41
	dw 190
	dw 207
	dw 31
	dw 428
	dw 427
	dw 216
	dw 208
	dw 153
	dw 68
	dw 24
	dw 96
	dw 399
	dw 519
	dw 210
	dw 313
	dw 110
	dw 318
	dw 55
	dw 190
	dw 17
	dw 40
	dw 203
	dw 155
	dw 82
	dw 220
	dw 434
	dw 519
	dw 383
	dw 86
	dw 441
	dw 53
	dw 98
	dw 320
	dw 69
	dw 114
	dw 115
	dw 382
	dw 344
	dw 147
	dw 81
	dw 206
	dw 519
	dw 197
	dw 80
	dw 371
	dw 180
	dw 191
	dw 83
	dw 346
	dw 219
	dw 219
	dw 511
	dw 511
	dw 97
	dw 97
	dw 591
	dw 64
	dw 88
	dw 114
	dw 201
	dw 540
	dw 154
	dw 481
	dw 44
	dw 42
	dw 41
	dw 381
	dw 207
	dw 31
	dw 218
	dw 427
	dw 216
	dw 208
	dw 219
	dw 146
	dw 511
	dw 96
	dw 97
	dw 18
	dw 211
	dw 519
	dw 110
	dw 318
	dw 55
	dw 74
	dw 17
	dw 40
	dw 24
	dw 519
	dw 82
	dw 220
	dw 434
	dw 417
	dw 519
	dw 86
	dw 190
	dw 53
	dw 98
	dw 320
	dw 559
	dw 124
	dw 382
	dw 382
	dw 344
	dw 184
	dw 81
	dw 133
	dw 217
	dw 197
	dw 80
	dw 371
	dw 180
	dw 191
	dw 83
	dw 346
	dw 219
	dw 45
	dw 511
	dw 89
	dw 97
	dw 166
	dw 219
	dw 178
	dw 511
	dw 113
	dw 97
	dw 582
	dw 106
	dw 144
	dw 44
	dw 42
	dw 41
	dw 547
	dw 207
	dw 31
	dw 575
	dw 427
	dw 216
	dw 208
	dw 219
	dw 390
	dw 511
	dw 96
	dw 97
	dw 148
	dw 148
	dw 11
	dw 110
	dw 318
	dw 55
	dw 404
	dw 17
	dw 40
	dw 523
	dw 528
	dw 82
	dw 220
	dw 434
	dw 75
	dw 49
	dw 86
	dw 39
	dw 53
	dw 98
	dw 320
	dw 76
	dw 124
	dw 382
	dw 382
	dw 344
	dw 424
	dw 81
	dw 133
	dw 546
	dw 197
	dw 80
	dw 371
	dw 180
	dw 191
	dw 83
	dw 346
	dw 219
	dw 29
	dw 511
	dw 14
	dw 97
	dw 212
	dw 219
	dw 404
	dw 511
	dw 114
	dw 97
	dw 510
	dw 528
	dw 209
	dw 44
	dw 42
	dw 41
	dw 100
	dw 207
	dw 31
	dw 66
	dw 427
	dw 216
	dw 208
	dw 219
	dw 102
	dw 511
	dw 96
	dw 97
	dw 149
	dw 149
	dw 11
	dw 110
	dw 318
	dw 55
	dw 551
	dw 17
	dw 40
	dw 509
	dw 528
	dw 82
	dw 220
	dw 434
	dw 170
	dw 321
	dw 86
	dw 16
	dw 53
	dw 98
	dw 320
	dw 1
	dw 114
	dw 124
	dw 382
	dw 344
	dw 145
	dw 81
	dw 14
	dw 133
	dw 197
	dw 80
	dw 371
	dw 180
	dw 191
	dw 83
	dw 346
	dw 219
	dw 219
	dw 511
	dw 511
	dw 97
	dw 97
	dw 173
	dw 219
	dw 116
	dw 511
	dw 193
	dw 97
	dw 22
	dw 20
	dw 44
	dw 42
	dw 41
	dw 199
	dw 207
	dw 31
	dw 345
	dw 195
	dw 216
	dw 219
	dw 217
	dw 511
	dw 132
	dw 97
	dw 556
	dw 185
	dw 56
	dw 593
	dw 11
	dw 45
	dw 51
	dw 58
	dw 177
	dw 64
	dw 88
	dw 52
	dw 54
	dw 219
	dw 217
	dw 511
	dw 376
	dw 97
	dw 22
	dw 20
	dw 56
	dw 537
	dw 530
	dw 45
	dw 51
	dw 58
	dw 24
	dw 101
	dw 24
	dw 52
	dw 54
	dw 380
	dw 163
	dw 187
	dw 552
	dw 133
	dw 3
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
	dw 198
	dw 219
	dw 151
	dw 511
	dw 546
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
	dw 577
	dw 103
	dw 4
	dw 118
	dw 112
	dw 111
	dw 23
	dw 187
	dw 552
	dw 152
	dw 580
	dw 108
	dw 13
	dw 107
	dw 67
	dw 87
	dw 217
	dw 5
	dw 219
	dw 9
	dw 511
	dw 78
	dw 95
	dw 10
	dw 194
	dw 45
	dw 99
	dw 217
	dw 2
	dw 15
	dw 133
	dw 6
	dw 7
	dw 56
	dw 92
	dw 91
	dw 45
	dw 51
	dw 58
	dw 333
	dw 24
	dw 546
	dw 52
	dw 54
	dw 214
	dw 219
	dw 171
	dw 511
	dw 577
	dw 97
	dw 62
	dw 118
	dw 112
	dw 111
	dw 23
	dw 332
	dw 61
	dw 12
	dw 205
	dw 108
	dw 13
	dw 107
	dw 426
	dw 57
	dw 40
	dw 421
	dw 219
	dw 419
	dw 511
	dw 63
	dw 95
	dw 577
	dw 194
	dw 25
	dw 118
	dw 112
	dw 111
	dw 23
	dw 75
	dw 49
	dw 382
	dw 344
	dw 92
	dw 91
	dw 107
	dw 70
	dw 414
	dw 176
	dw 371
	dw 219
	dw 65
	dw 511
	dw 346
	dw 95
	dw 171
	dw 194
	dw 405
	dw 90
	dw 62
	dw 71
	dw 443
	dw 84
	dw 442
	dw 93
	dw 181
	dw 92
	dw 91
	dw 577
	dw 401
	dw 125
	dw 118
	dw 112
	dw 111
	dw 23
	dw 410
	dw 188
	dw 189
	dw 171
	dw 440
	dw 85
	dw 107
	dw 62
	dw 60
	dw 388
	dw 219
	dw 219
	dw 511
	dw 511
	dw 97
	dw 95
	dw 72
	dw 194
	dw 577
	dw 387
	dw 200
	dw 118
	dw 112
	dw 111
	dw 23
	dw 196
	dw 182
	dw 92
	dw 91
	dw 373
	dw 133
	dw 107
	dw 26
	dw 395
	dw 27
	dw 330
	dw 219
	dw 202
	dw 511
	dw 171
	dw 95
	dw 204
	dw 194
	dw 62
	dw 213
	dw 219
	dw 126
	dw 511
	dw 324
	dw 97
	dw 109
	dw 192
	dw 92
	dw 91
	dw 55
	dw 323
	dw 57
	dw 40
	dw 20
	dw 322
	dw 127
	dw 219
	dw 319
	dw 511
	dw 171
	dw 97
	dw 317
	dw 53
	dw 62
	dw 128
	dw 377
	dw 425
	dw 374
	dw 382
	dw 344
	dw 219
	dw 81
	dw 511
	dw 28
	dw 97
	dw 80
	dw 371
	dw 30
	dw 43
	dw 219
	dw 346
	dw 511
	dw 370
	dw 97
	dw 533
	dw 129
	dw 55
	dw 19
	dw 21
	dw 40
	dw 455
	dw 312
	dw 130
	dw 455
	dw 455
	dw 44
	dw 42
	dw 41
	dw 455
	dw 53
	dw 219
	dw 455
	dw 511
	dw 216
	dw 97
	dw 382
	dw 344
	dw 219
	dw 81
	dw 511
	dw 455
	dw 97
	dw 80
	dw 371
	dw 455
	dw 455
	dw 455
	dw 346
	dw 391
	dw 455
	dw 131
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 117
	dw 55
	dw 455
	dw 57
	dw 40
	dw 44
	dw 42
	dw 41
	dw 219
	dw 455
	dw 511
	dw 455
	dw 97
	dw 216
	dw 53
	dw 219
	dw 455
	dw 511
	dw 455
	dw 97
	dw 382
	dw 344
	dw 455
	dw 81
	dw 455
	dw 455
	dw 455
	dw 80
	dw 371
	dw 455
	dw 455
	dw 455
	dw 346
	dw 165
	dw 455
	dw 119
	dw 455
	dw 455
	dw 55
	dw 455
	dw 57
	dw 40
	dw 455
	dw 455
	dw 120
	dw 455
	dw 455
	dw 44
	dw 42
	dw 41
	dw 219
	dw 53
	dw 511
	dw 157
	dw 97
	dw 216
	dw 455
	dw 382
	dw 344
	dw 219
	dw 81
	dw 511
	dw 455
	dw 97
	dw 80
	dw 371
	dw 378
	dw 455
	dw 219
	dw 346
	dw 511
	dw 455
	dw 97
	dw 455
	dw 455
	dw 55
	dw 455
	dw 57
	dw 40
	dw 455
	dw 455
	dw 158
	dw 455
	dw 455
	dw 44
	dw 42
	dw 41
	dw 455
	dw 53
	dw 455
	dw 159
	dw 455
	dw 216
	dw 160
	dw 382
	dw 344
	dw 219
	dw 81
	dw 511
	dw 455
	dw 97
	dw 80
	dw 371
	dw 455
	dw 455
	dw 219
	dw 346
	dw 511
	dw 219
	dw 97
	dw 511
	dw 455
	dw 97
	dw 577
	dw 455
	dw 455
	dw 118
	dw 112
	dw 111
	dw 23
	dw 455
	dw 44
	dw 42
	dw 41
	dw 455
	dw 455
	dw 107
	dw 121
	dw 455
	dw 216
	dw 455
	dw 219
	dw 455
	dw 511
	dw 455
	dw 95
	dw 455
	dw 194
	dw 55
	dw 455
	dw 57
	dw 40
	dw 219
	dw 455
	dw 511
	dw 455
	dw 97
	dw 92
	dw 91
	dw 455
	dw 455
	dw 53
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 382
	dw 344
	dw 171
	dw 81
	dw 455
	dw 345
	dw 62
	dw 80
	dw 371
	dw 217
	dw 455
	dw 455
	dw 346
	dw 455
	dw 455
	dw 56
	dw 455
	dw 136
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 455
	dw 52
	dw 54
	dw 455
	dw 44
	dw 42
	dw 41
	dw 455
	dw 455
	dw 219
	dw 217
	dw 511
	dw 216
	dw 97
	dw 137
	dw 455
	dw 56
	dw 455
	dw 455
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 455
	dw 52
	dw 54
	dw 48
	dw 50
	dw 219
	dw 455
	dw 511
	dw 455
	dw 97
	dw 217
	dw 47
	dw 46
	dw 75
	dw 49
	dw 455
	dw 56
	dw 455
	dw 455
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 316
	dw 52
	dw 54
	dw 48
	dw 50
	dw 455
	dw 134
	dw 161
	dw 455
	dw 455
	dw 455
	dw 47
	dw 46
	dw 75
	dw 49
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 331
	dw 219
	dw 219
	dw 511
	dw 511
	dw 97
	dw 97
	dw 48
	dw 50
	dw 455
	dw 455
	dw 455
	dw 455
	dw 135
	dw 455
	dw 47
	dw 46
	dw 75
	dw 49
	dw 38
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 217
	dw 455
	dw 142
	dw 219
	dw 455
	dw 511
	dw 56
	dw 97
	dw 455
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 455
	dw 52
	dw 54
	dw 219
	dw 217
	dw 511
	dw 143
	dw 97
	dw 455
	dw 455
	dw 56
	dw 455
	dw 455
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 315
	dw 52
	dw 54
	dw 219
	dw 455
	dw 511
	dw 162
	dw 97
	dw 455
	dw 48
	dw 50
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 47
	dw 46
	dw 75
	dw 49
	dw 219
	dw 455
	dw 511
	dw 455
	dw 97
	dw 455
	dw 48
	dw 50
	dw 455
	dw 455
	dw 455
	dw 141
	dw 455
	dw 455
	dw 47
	dw 46
	dw 75
	dw 49
	dw 455
	dw 455
	dw 368
	dw 455
	dw 455
	dw 217
	dw 455
	dw 455
	dw 219
	dw 455
	dw 511
	dw 56
	dw 97
	dw 455
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 455
	dw 52
	dw 54
	dw 369
	dw 455
	dw 455
	dw 217
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 56
	dw 455
	dw 140
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 455
	dw 52
	dw 54
	dw 455
	dw 139
	dw 122
	dw 455
	dw 48
	dw 50
	dw 219
	dw 455
	dw 511
	dw 455
	dw 97
	dw 455
	dw 47
	dw 46
	dw 75
	dw 49
	dw 219
	dw 219
	dw 511
	dw 511
	dw 97
	dw 97
	dw 455
	dw 138
	dw 48
	dw 50
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 47
	dw 46
	dw 75
	dw 49
	dw 455
	dw 455
	dw 219
	dw 455
	dw 511
	dw 217
	dw 97
	dw 455
	dw 455
	dw 123
	dw 455
	dw 56
	dw 455
	dw 455
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 314
	dw 52
	dw 54
	dw 455
	dw 217
	dw 219
	dw 455
	dw 511
	dw 455
	dw 97
	dw 56
	dw 455
	dw 455
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 455
	dw 52
	dw 54
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 48
	dw 50
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 47
	dw 46
	dw 75
	dw 49
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 48
	dw 50
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 47
	dw 46
	dw 75
	dw 49
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 217
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 56
	dw 455
	dw 455
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 455
	dw 52
	dw 54
	dw 455
	dw 217
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 56
	dw 455
	dw 455
	dw 45
	dw 51
	dw 58
	dw 455
	dw 455
	dw 455
	dw 52
	dw 54
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 50
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 47
	dw 46
	dw 75
	dw 49
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 455
	dw 47
	dw 46
	dw 75
	dw 49


f2___main_s0655::
	db 90
	db 1
	db 92
	db 3
	db 94
	db 70
	db 71
	db 7
	db 104
	db 9
	db 110
	db 111
	db 12
	db 13
	db 14
	db 117
	db 16
	db 17
	db 92
	db 4
	db 20
	db 21
	db 22
	db 16
	db 102
	db 25
	db 92
	db 27
	db 28
	db 29
	db 108
	db 109
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
	db 45
	db 33
	db 17
	db 18
	db 123
	db 124
	db 33
	db 74
	db 23
	db 24
	db 75
	db 38
	db 123
	db 124
	db 79
	db 60
	db 61
	db 62
	db 4
	db 64
	db 65
	db 74
	db 1
	db 68
	db 3
	db 90
	db 93
	db 92
	db 7
	db 94
	db 4
	db 10
	db 74
	db 12
	db 13
	db 14
	db 63
	db 16
	db 17
	db 16
	db 93
	db 20
	db 21
	db 22
	db 59
	db 60
	db 25
	db 33
	db 27
	db 28
	db 29
	db 93
	db 75
	db 75
	db 33
	db 34
	db 79
	db 36
	db 81
	db 35
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 45
	db 90
	db 90
	db 92
	db 92
	db 94
	db 94
	db 47
	db 48
	db 97
	db 98
	db 74
	db 2
	db 33
	db 34
	db 60
	db 61
	db 62
	db 11
	db 64
	db 65
	db 41
	db 1
	db 68
	db 3
	db 74
	db 69
	db 17
	db 7
	db 22
	db 93
	db 10
	db 22
	db 12
	db 13
	db 14
	db 11
	db 16
	db 17
	db 10
	db 74
	db 20
	db 21
	db 22
	db 93
	db 33
	db 25
	db 22
	db 27
	db 28
	db 29
	db 6
	db 75
	db 75
	db 33
	db 34
	db 79
	db 36
	db 81
	db 93
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 45
	db 90
	db 90
	db 92
	db 92
	db 94
	db 94
	db 114
	db 115
	db 116
	db 75
	db 99
	db 100
	db 74
	db 79
	db 60
	db 61
	db 62
	db 33
	db 64
	db 65
	db 74
	db 1
	db 68
	db 3
	db 90
	db 74
	db 92
	db 7
	db 94
	db 67
	db 10
	db 93
	db 12
	db 13
	db 14
	db 16
	db 16
	db 17
	db 17
	db 93
	db 20
	db 21
	db 22
	db 22
	db 93
	db 25
	db 11
	db 27
	db 28
	db 29
	db 93
	db 75
	db 33
	db 33
	db 34
	db 33
	db 36
	db 75
	db 8
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 45
	db 90
	db 17
	db 92
	db 112
	db 94
	db 89
	db 90
	db 113
	db 92
	db 75
	db 94
	db 87
	db 88
	db 79
	db 60
	db 61
	db 62
	db 92
	db 64
	db 65
	db 0
	db 1
	db 68
	db 3
	db 90
	db 4
	db 92
	db 7
	db 94
	db 119
	db 120
	db 121
	db 12
	db 13
	db 14
	db 66
	db 16
	db 17
	db 91
	db 92
	db 20
	db 21
	db 22
	db 59
	db 60
	db 25
	db 2
	db 27
	db 28
	db 29
	db 6
	db 75
	db 33
	db 33
	db 34
	db 32
	db 36
	db 75
	db 73
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 45
	db 90
	db 46
	db 92
	db 46
	db 94
	db 89
	db 90
	db 66
	db 92
	db 75
	db 94
	db 91
	db 92
	db 79
	db 60
	db 61
	db 62
	db 104
	db 64
	db 65
	db 101
	db 1
	db 68
	db 3
	db 90
	db 104
	db 92
	db 7
	db 94
	db 119
	db 120
	db 121
	db 12
	db 13
	db 14
	db 109
	db 16
	db 17
	db 91
	db 92
	db 20
	db 21
	db 22
	db 32
	db 13
	db 25
	db 16
	db 27
	db 28
	db 29
	db 71
	db 75
	db 75
	db 33
	db 34
	db 79
	db 36
	db 46
	db 75
	db 39
	db 40
	db 41
	db 42
	db 43
	db 44
	db 45
	db 90
	db 90
	db 92
	db 92
	db 94
	db 94
	db 89
	db 90
	db 75
	db 92
	db 95
	db 94
	db 47
	db 48
	db 60
	db 61
	db 62
	db 73
	db 64
	db 65
	db 4
	db 95
	db 68
	db 90
	db 8
	db 92
	db 75
	db 94
	db 110
	db 111
	db 14
	db 120
	db 121
	db 17
	db 18
	db 19
	db 114
	db 115
	db 116
	db 23
	db 24
	db 90
	db 8
	db 92
	db 5
	db 94
	db 47
	db 48
	db 14
	db 98
	db 95
	db 17
	db 18
	db 19
	db 17
	db 102
	db 17
	db 23
	db 24
	db 22
	db 73
	db 108
	db 109
	db 75
	db 71
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
	db 60
	db 89
	db 90
	db 103
	db 92
	db 73
	db 94
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
	db 60
	db 72
	db 102
	db 71
	db 75
	db 76
	db 77
	db 78
	db 108
	db 109
	db 103
	db 82
	db 83
	db 84
	db 85
	db 101
	db 103
	db 8
	db 71
	db 90
	db 71
	db 92
	db 86
	db 94
	db 71
	db 96
	db 17
	db 26
	db 8
	db 71
	db 80
	db 75
	db 71
	db 71
	db 14
	db 106
	db 107
	db 17
	db 18
	db 19
	db 6
	db 17
	db 73
	db 23
	db 24
	db 89
	db 90
	db 118
	db 92
	db 72
	db 94
	db 122
	db 75
	db 76
	db 77
	db 78
	db 6
	db 46
	db 31
	db 82
	db 83
	db 84
	db 85
	db 22
	db 16
	db 17
	db 22
	db 90
	db 4
	db 92
	db 101
	db 94
	db 72
	db 96
	db 16
	db 75
	db 76
	db 77
	db 78
	db 59
	db 60
	db 33
	db 34
	db 106
	db 107
	db 85
	db 6
	db 20
	db 10
	db 41
	db 90
	db 66
	db 92
	db 45
	db 94
	db 118
	db 96
	db 25
	db 25
	db 122
	db 6
	db 22
	db 46
	db 22
	db 6
	db 105
	db 106
	db 107
	db 72
	db 4
	db 75
	db 75
	db 76
	db 77
	db 78
	db 4
	db 41
	db 16
	db 118
	db 22
	db 25
	db 85
	db 122
	db 2
	db 22
	db 90
	db 90
	db 92
	db 92
	db 94
	db 94
	db 66
	db 96
	db 72
	db 22
	db 100
	db 75
	db 76
	db 77
	db 78
	db 33
	db 105
	db 106
	db 107
	db 22
	db 75
	db 85
	db 2
	db 4
	db 46
	db 22
	db 90
	db 65
	db 92
	db 118
	db 94
	db 10
	db 96
	db 122
	db 89
	db 90
	db 75
	db 92
	db 12
	db 94
	db 26
	db 105
	db 106
	db 107
	db 14
	db 22
	db 16
	db 17
	db 48
	db 22
	db 75
	db 90
	db 13
	db 92
	db 118
	db 94
	db 13
	db 27
	db 122
	db 75
	db 5
	db 31
	db 4
	db 33
	db 34
	db 90
	db 36
	db 92
	db 46
	db 94
	db 40
	db 41
	db 16
	db 60
	db 90
	db 45
	db 92
	db 33
	db 94
	db 16
	db 75
	db 14
	db 15
	db 16
	db 17
	db 125
	db 22
	db 75
	db 125
	db 125
	db 60
	db 61
	db 62
	db 125
	db 27
	db 90
	db 125
	db 92
	db 68
	db 94
	db 33
	db 34
	db 90
	db 36
	db 92
	db 125
	db 94
	db 40
	db 41
	db 125
	db 125
	db 125
	db 45
	db 4
	db 125
	db 75
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 75
	db 14
	db 125
	db 16
	db 17
	db 60
	db 61
	db 62
	db 90
	db 125
	db 92
	db 125
	db 94
	db 68
	db 27
	db 90
	db 125
	db 92
	db 125
	db 94
	db 33
	db 34
	db 125
	db 36
	db 125
	db 125
	db 125
	db 40
	db 41
	db 125
	db 125
	db 125
	db 45
	db 9
	db 125
	db 75
	db 125
	db 125
	db 14
	db 125
	db 16
	db 17
	db 125
	db 125
	db 75
	db 125
	db 125
	db 60
	db 61
	db 62
	db 90
	db 27
	db 92
	db 75
	db 94
	db 68
	db 125
	db 33
	db 34
	db 90
	db 36
	db 92
	db 125
	db 94
	db 40
	db 41
	db 5
	db 125
	db 90
	db 45
	db 92
	db 125
	db 94
	db 125
	db 125
	db 14
	db 125
	db 16
	db 17
	db 125
	db 125
	db 75
	db 125
	db 125
	db 60
	db 61
	db 62
	db 125
	db 27
	db 125
	db 75
	db 125
	db 68
	db 75
	db 33
	db 34
	db 90
	db 36
	db 92
	db 125
	db 94
	db 40
	db 41
	db 125
	db 125
	db 90
	db 45
	db 92
	db 90
	db 94
	db 92
	db 125
	db 94
	db 72
	db 125
	db 125
	db 75
	db 76
	db 77
	db 78
	db 125
	db 60
	db 61
	db 62
	db 125
	db 125
	db 85
	db 75
	db 125
	db 68
	db 125
	db 90
	db 125
	db 92
	db 125
	db 94
	db 125
	db 96
	db 14
	db 125
	db 16
	db 17
	db 90
	db 125
	db 92
	db 125
	db 94
	db 106
	db 107
	db 125
	db 125
	db 27
	db 125
	db 125
	db 125
	db 125
	db 125
	db 33
	db 34
	db 118
	db 36
	db 125
	db 4
	db 122
	db 40
	db 41
	db 8
	db 125
	db 125
	db 45
	db 125
	db 125
	db 14
	db 125
	db 75
	db 17
	db 18
	db 19
	db 125
	db 125
	db 125
	db 23
	db 24
	db 125
	db 60
	db 61
	db 62
	db 125
	db 125
	db 90
	db 8
	db 92
	db 68
	db 94
	db 75
	db 125
	db 14
	db 125
	db 125
	db 17
	db 18
	db 19
	db 125
	db 125
	db 125
	db 23
	db 24
	db 49
	db 50
	db 90
	db 125
	db 92
	db 125
	db 94
	db 8
	db 57
	db 58
	db 59
	db 60
	db 125
	db 14
	db 125
	db 125
	db 17
	db 18
	db 19
	db 125
	db 125
	db 22
	db 23
	db 24
	db 49
	db 50
	db 125
	db 75
	db 75
	db 125
	db 125
	db 125
	db 57
	db 58
	db 59
	db 60
	db 125
	db 125
	db 125
	db 125
	db 125
	db 66
	db 90
	db 90
	db 92
	db 92
	db 94
	db 94
	db 49
	db 50
	db 125
	db 125
	db 125
	db 125
	db 75
	db 125
	db 57
	db 58
	db 59
	db 60
	db 2
	db 125
	db 125
	db 125
	db 125
	db 125
	db 8
	db 125
	db 75
	db 90
	db 125
	db 92
	db 14
	db 94
	db 125
	db 17
	db 18
	db 19
	db 125
	db 125
	db 125
	db 23
	db 24
	db 90
	db 8
	db 92
	db 75
	db 94
	db 125
	db 125
	db 14
	db 125
	db 125
	db 17
	db 18
	db 19
	db 125
	db 125
	db 22
	db 23
	db 24
	db 90
	db 125
	db 92
	db 75
	db 94
	db 125
	db 49
	db 50
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 57
	db 58
	db 59
	db 60
	db 90
	db 125
	db 92
	db 125
	db 94
	db 125
	db 49
	db 50
	db 125
	db 125
	db 125
	db 75
	db 125
	db 125
	db 57
	db 58
	db 59
	db 60
	db 125
	db 125
	db 5
	db 125
	db 125
	db 8
	db 125
	db 125
	db 90
	db 125
	db 92
	db 14
	db 94
	db 125
	db 17
	db 18
	db 19
	db 125
	db 125
	db 125
	db 23
	db 24
	db 5
	db 125
	db 125
	db 8
	db 125
	db 125
	db 125
	db 125
	db 125
	db 14
	db 125
	db 75
	db 17
	db 18
	db 19
	db 125
	db 125
	db 125
	db 23
	db 24
	db 125
	db 75
	db 75
	db 125
	db 49
	db 50
	db 90
	db 125
	db 92
	db 125
	db 94
	db 125
	db 57
	db 58
	db 59
	db 60
	db 90
	db 90
	db 92
	db 92
	db 94
	db 94
	db 125
	db 75
	db 49
	db 50
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 57
	db 58
	db 59
	db 60
	db 125
	db 125
	db 90
	db 125
	db 92
	db 8
	db 94
	db 125
	db 125
	db 75
	db 125
	db 14
	db 125
	db 125
	db 17
	db 18
	db 19
	db 125
	db 125
	db 22
	db 23
	db 24
	db 125
	db 8
	db 90
	db 125
	db 92
	db 125
	db 94
	db 14
	db 125
	db 125
	db 17
	db 18
	db 19
	db 125
	db 125
	db 125
	db 23
	db 24
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 49
	db 50
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 57
	db 58
	db 59
	db 60
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 49
	db 50
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 57
	db 58
	db 59
	db 60
	db 125
	db 125
	db 125
	db 125
	db 125
	db 8
	db 125
	db 125
	db 125
	db 125
	db 125
	db 14
	db 125
	db 125
	db 17
	db 18
	db 19
	db 125
	db 125
	db 125
	db 23
	db 24
	db 125
	db 8
	db 125
	db 125
	db 125
	db 125
	db 125
	db 14
	db 125
	db 125
	db 17
	db 18
	db 19
	db 125
	db 125
	db 125
	db 23
	db 24
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 50
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 57
	db 58
	db 59
	db 60
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 57
	db 58
	db 59
	db 60
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 125
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70
	db 70


f2___main_s0656::
	dw 1291
	dw 0
	dw 0
	dw 66
	dw 66
	dw 66
	dw 132
	dw 198
	dw 264
	dw 330
	dw 330
	dw 625
	dw 625
	dw 662
	dw 625
	dw 662
	dw 704
	dw 841
	dw 741
	dw 662
	dw 662
	dw 662
	dw 662
	dw 662
	dw 778
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 841
	dw 518
	dw 91
	dw 91
	dw 68
	dw 13
	dw 13
	dw 7
	dw 7
	dw 18
	dw 18
	dw 18
	dw 18
	dw 18
	dw 18
	dw 18
	dw 18
	dw 18
	dw 59
	dw 140
	dw 197
	dw 197
	dw 197
	dw 123
	dw 162
	dw 200
	dw 162
	dw 162
	dw 213
	dw 69
	dw 156
	dw 263
	dw 251
	dw 251
	dw 7
	dw 340
	dw 340
	dw 162
	dw 340
	dw 162
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 1291
	dw 392
	dw 410
	dw 875
	dw 899
	dw 923
	dw 982
	dw 1000
	dw 1058
	dw 1078
	dw 875
	dw 1136
	dw 1154
	dw 1154
	dw 1154
	dw 1154
	dw 1154
	dw 1154
	dw 1154
	dw 1154
	dw 1154
	dw 1154
	dw 1212
	dw 1230
	dw 490
	dw 490
	dw 30
	dw 30
	dw 30
	dw 228
	dw 228
	dw 228
	dw 71
	dw 341
	dw 121
	dw 375
	dw 267
	dw 321
	dw 199
	dw 118
	dw 136
	dw 413
	dw 15
	dw 415
	dw 265
	dw 479
	dw 479
	dw 479
	dw 479
	dw 479
	dw 479
	dw 288
	dw 471
	dw 504
	dw 520
	dw 494
	dw 481
	dw 511
	dw 514
	dw 497
	dw 494
	dw 534
	dw 528
	dw 550
	dw 537
	dw 548
	dw 495
	dw 542
	dw 543
	dw 549
	dw 551
	dw 494
	dw 564
	dw 526
	dw 581
	dw 568
	dw 575
	dw 545
	dw 571
	dw 565
	dw 567
	dw 572
	dw 591
	dw 582
	dw 535
	dw 577
	dw 592
	dw 615
	dw 614
	dw 573
	dw 598
	dw 557
	dw 621
	dw 616
	dw 609
	dw 618
	dw 622
	dw 595
	dw 634
	dw 638
	dw 650
	dw 653
	dw 617
	dw 651
	dw 608
	dw 639
	dw 494
	dw 658
	dw 659


f2___main_s0657::
	dw 65471
	dw 399
	dw 447
	dw 470
	dw 506
	dw 531
	dw 758
	dw 758
	dw 758
	dw 758
	dw 758
	dw 154
	dw 220
	dw 22
	dw 287
	dw 88
	dw 23
	dw 89
	dw 160
	dw 65516
	dw 112
	dw 178
	dw 244
	dw 286
	dw 226
	dw 293
	dw 364
	dw 505
	dw 540
	dw 327
	dw 426
	dw 309
	dw 556
	dw 570
	dw 579
	dw 600
	dw 607
	dw 635
	dw 642
	dw 677
	dw 686
	dw 695
	dw 723
	dw 732
	dw 735
	dw 769
	dw 816
	dw 836
	dw 876
	dw 877
	dw 903
	dw 917
	dw 935
	dw 953
	dw 979
	dw 1019
	dw 1029
	dw 1030
	dw 1051
	dw 1073
	dw 65446
	dw 65462
	dw 65470
	dw 65458
	dw 70
	dw 298
	dw 329
	dw 370
	dw 65514
	dw 65528
	dw 3
	dw 48
	dw 62
	dw 77
	dw 116
	dw 124
	dw 129
	dw 65436
	dw 168
	dw 191
	dw 230
	dw 257
	dw 135
	dw 229
	dw 294
	dw 384
	dw 439
	dw 65440
	dw 65434
	dw 138
	dw 169
	dw 223
	dw 231
	dw 236
	dw 291
	dw 302
	dw 320
	dw 331
	dw 363
	dw 289
	dw 369
	dw 352
	dw 402
	dw 377
	dw 417
	dw 383
	dw 419
	dw 406
	dw 423
	dw 428
	dw 420
	dw 431
	dw 432

f2___main_s0658::
	dw 576
	dw 471
	dw 471
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 583
	dw 579
	dw 594
	dw 594
	dw 453
	dw 594
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
	dw 566
	dw 453
	dw 453
	dw 453
	dw 453
	dw 590
	dw 590
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
	dw 562
	dw 589
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 576
	dw 576
	dw 588
	dw 576
	dw 588
	dw 576
	dw 588
	dw 576
	dw 581
	dw 576
	dw 576
	dw 469
	dw 576
	dw 576
	dw 453
	dw 453
	dw 542
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 567
	dw 542
	dw 487
	dw 486
	dw 485
	dw 484
	dw 483
	dw 482
	dw 538
	dw 516
	dw 501
	dw 499
	dw 503
	dw 502
	dw 494
	dw 495
	dw 492
	dw 496
	dw 498
	dw 497
	dw 453
	dw 453
	dw 453
	dw 470
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 508
	dw 507
	dw 506
	dw 505
	dw 500
	dw 493
	dw 453
	dw 453
	dw 453
	dw 453
	dw 544
	dw 595
	dw 453
	dw 453
	dw 453
	dw 560
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
	dw 557
	dw 453
	dw 555
	dw 453
	dw 550
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 530
	dw 453
	dw 453
	dw 453
	dw 453
	dw 541
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 480
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 453
	dw 504
	dw 491
	dw 453

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
	db 78,73,76,0
c01_c336:
	db 67,79,77,77,65,0
c01_c337:
	db 65,78,68,0
c01_c338:
	db 79,82,0
c01_c339:
	db 80,73,80,69,0
c01_c340:
	db 67,65,82,69,84,0
c01_c341:
	db 76,84,79,80,0
c01_c342:
	db 76,69,79,80,0
c01_c343:
	db 71,84,79,80,0
c01_c344:
	db 71,69,79,80,0
c01_c345:
	db 69,81,79,80,0
c01_c346:
	db 78,69,79,80,0
c01_c347:
	db 76,83,72,73,70,84,0
c01_c348:
	db 82,83,72,73,70,84,0
c01_c349:
	db 65,83,0
c01_c350:
	db 65,77,80,69,82,83,65,78,68,0
c01_c351:
	db 78,69,88,84,0
c01_c352:
	db 80,82,69,86,0
c01_c353:
	db 73,78,68,69,88,79,70,0
c01_c354:
	db 67,79,78,84,73,78,85,69,0
c01_c355:
	db 67,65,83,69,0
c01_c356:
	db 73,83,0
c01_c357:
	db 87,72,69,78,0
c01_c358:
	db 65,76,73,65,83,0
c01_c359:
	db 73,77,80,76,69,77,69,78,84,83,0

f2___main_s0659::
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
	dw c01_c359


c01_c360:
	db 102,114,101,101,32,117,110,117,115,101,100,32,115,116,114,105,110,103,10,0

	; token_destructor workspace at ws+1383 length ws+0
f317_token_destructor::
	ld a, (ws+1380)
	cp 41
	jp z, c01_065f
;c01_0661:
	ld a, (ws+1380)
	cp 33
	jp nz, c01_0660
c01_065f:
	ld hl,c01_c360
	call f9_print
	ld hl, (ws+1381)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
c01_0660:
;c01_065a:
;end_f317_token_destructor:
	ret


	; yy_destructor workspace at ws+1380 length ws+3
f316_yy_destructor::
	ld (ws+1381), hl
	pop bc
	pop af
	ld (ws+1380), a
	push bc
	ld a, (ws+1380)
	or a
	jp z, c01_0668
;c01_0669:
	ld a, (ws+1380)
	cp 70
	jp nc, c01_0668
;c01_0667:
	call f317_token_destructor
c01_0668:
;c01_0662:
;end_f316_yy_destructor:
	ret


	; yy_pop_parser_stack workspace at ws+1353 length ws+0
f318_yy_pop_parser_stack::
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
	call f316_yy_destructor
;end_f318_yy_pop_parser_stack:
	ret


	; yy_pop_all_parser_stack workspace at ws+1353 length ws+0
f319_yy_pop_all_parser_stack::
c01_066a:
	ld de, (ws+566)
	ld hl,ws+568
	and a
	sbc hl,de
	jp z, c01_066f
;c01_066e:
	call f318_yy_pop_parser_stack
	jp c01_066a
c01_066f:
;end_f319_yy_pop_all_parser_stac: 
	ret


c01_c361:
	db 112,97,114,115,101,114,32,115,116,97,99,107,32,111,118,101,114,102,108,111,119,0

	; yy_stack_overflow workspace at ws+1353 length ws+0
f320_yy_stack_overflow::
	call f319_yy_pop_all_parser_stack
	call f80_StartError
	ld hl,c01_c361
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f320_yy_stack_overflow:
;	ret


f2___main_s0670::
	db 72
	db 72
	db 72
	db 72
	db 72
	db 72
	db 76
	db 72
	db 78
	db 77
	db 72
	db 72
	db 72
	db 80
	db 81
	db 82
	db 83
	db 84
	db 72
	db 85
	db 88
	db 88
	db 79
	db 79
	db 79
	db 79
	db 79
	db 79
	db 79
	db 79
	db 79
	db 79
	db 90
	db 90
	db 90
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 75
	db 90
	db 90
	db 75
	db 75
	db 90
	db 89
	db 72
	db 74
	db 74
	db 74
	db 74
	db 74
	db 74
	db 72
	db 73
	db 92
	db 93
	db 91
	db 91
	db 75
	db 72
	db 72
	db 94
	db 95
	db 95
	db 97
	db 97
	db 98
	db 96
	db 99
	db 99
	db 100
	db 72
	db 107
	db 103
	db 101
	db 106
	db 104
	db 105
	db 102
	db 102
	db 108
	db 109
	db 109
	db 110
	db 110
	db 111
	db 72
	db 112
	db 113
	db 115
	db 117
	db 117
	db 116
	db 72
	db 118
	db 120
	db 120
	db 121
	db 72
	db 122
	db 124
	db 124
	db 124
	db 70
	db 71
	db 71
	db 72
	db 82
	db 82
	db 86
	db 86
	db 87
	db 72
	db 72
	db 72
	db 72
	db 103
	db 113
	db 114
	db 114
	db 119
	db 119
	db 120
	db 123
	db 123

f2___main_s0671::
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
f322_CopyMinor::
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
;end_f322_CopyMinor:
	ret

