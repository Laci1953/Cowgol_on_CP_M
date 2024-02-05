	psect text

 global f74_IsPtr
 global f183_MidC2Op
 global f184_MidCCast
 global f207_EmitterOpenfile
 global f208_EmitterClosefile
 global f209_EmitterDeclareSubroutine
 global f210_EmitterDeclareExternalSubr
 global f212_EmitterReferenceSubroutine
 global f215_EmitterEmitInputParameters
 global f216_EmitterEmitOutputParameter
 global f217_EmitterEmitSubroutineFlags
 global f228_LookupSymbol
 global f230_AddSymbol
 global f231_AddAlias
 global f233_CheckNotPartialType
 global f237_IsArray
 global f238_IsSubroutine
 global f239_IsNum
 global f240_IsSNum
 global f241_IsScalar
 global f242_IsRecord
 global f243_MakeLValue
 global f244_UndoLValue
 global f245_IsLValue
 global f246_MaybeUndoLValue
 global f247_AllocLabel
 global f248_AllocSubrId
 global f250_ArchAlignUp
 global f251_ArchInitTypes
 global f252_ArchGuessIntType
 global f254_ArchInitMember
 global f269_Generate
 global f270_GenerateConditional
 global f272_InitVariable
 global f273_MakePointerType
 global f274_MakeArrayType
 global f276_DestructSubroutineContents
 global f278_CopyParameterList
 global f279_CreateMainSubroutine
 global f280_ReportWorkspaces
 global f282_CheckExpressionType
 global f287_CondSimple
 global f288_Expr1Simple
 global f289_ExprAdd
 global f291_ExprSub
 global f293_Expr2Simple
 global f296_ExprShift
 global f66_PushNode
 global f67_PopNode
 global f68_NextNode
 global f69_Discard
 global f459_PrintFreeMemory
 global f460_SyntaxError
 global f461_ParseArguments

_c250:
	db 98,97,100,32,102,111,108,100,0

	; midcodec_i_bad_fold workspace at ws+1430 length ws+0
f173_midcodec_i_bad_fold:
	ld hl,   _c250
	jp f82_SimpleError


	; FoldConstant1 workspace at ws+1376 length ws+11
f174_FoldConstant1:
	ld (ws+1377), hl
	pop bc
	pop af
	ld (ws+1376), a
	push bc
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
	ld (ws+1383), de
	exx
	ld (ws+1385), de
	exx
	cp 106
	jp nz,    _02c7
	ld hl, (ws+1383)
	exx
	ld hl, (ws+1385)
	exx
	call f484__not4
	ld (ws+1379), hl
	exx
	ld (ws+1381), hl
	exx
	jp    _02c6
_02c7:
	cp 111
	jp nz,    _02c8
	ld de, (ws+1383)
	exx
	ld de, (ws+1385)
	exx
	xor a
	ld h,a
	ld l,a
	sbc hl,de
	exx
	ld h,a
	ld l,a
	sbc hl,de
	exx
	ld (ws+1379), hl
	exx
	ld (ws+1381), hl
	exx
	jp    _02c6
_02c8:
	call f173_midcodec_i_bad_fold
_02c6:
	ld hl, (ws+1379)
	exx
	ld hl, (ws+1381)
	exx
	ret


	; FoldConstant2 workspace at ws+1413 length ws+17
f176_FoldConstant2:
	ld (ws+1416), hl
	pop bc
	pop hl
	ld (ws+1414), hl
	pop af
	ld (ws+1413), a
	push bc
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
	ld (ws+1422), de
	exx
	ld (ws+1424), de
	exx
	ld hl, (ws+1416)
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
	ld (ws+1426), de
	exx
	ld (ws+1428), de
	exx
	cp 156
	jp nz,    _02ca
	ld de, (ws+1422)
	exx
	ld de, (ws+1424)
	exx
	ld hl, (ws+1426)
	exx
	ld hl, (ws+1428)
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+1418), hl
	exx
	ld (ws+1420), hl
	exx
	jp    _02c9
_02ca:
	cp 131
	jp nz,    _02cb
	ld hl, (ws+1422)
	exx
	ld hl, (ws+1424)
	exx
	ld de, (ws+1426)
	exx
	ld de, (ws+1428)
	exx
	and a
	sbc hl,de
	exx
	sbc hl,de
	exx
	ld (ws+1418), hl
	exx
	ld (ws+1420), hl
	exx
	jp    _02c9
_02cb:
	cp 161
	jp nz,    _02cc
	ld bc, (ws+1422)
	exx
	ld bc, (ws+1424)
	exx
	ld de, (ws+1426)
	exx
	ld de, (ws+1428)
	exx
	call f474__mul4
	ld (ws+1418), hl
	exx
	ld (ws+1420), hl
	exx
	jp    _02c9
_02cc:
	cp 136
	jp nz,    _02cd
	ld bc, (ws+1422)
	exx
	ld bc, (ws+1424)
	exx
	ld de, (ws+1426)
	exx
	ld de, (ws+1428)
	exx
	call f479__dvrmu4
	ld (ws+1418), bc
	exx
	ld (ws+1420), bc
	exx
	jp    _02c9
_02cd:
	cp 141
	jp nz,    _02ce
	ld bc, (ws+1422)
	exx
	ld bc, (ws+1424)
	exx
	ld de, (ws+1426)
	exx
	ld de, (ws+1428)
	exx
	call f480__dvrms4
	ld (ws+1418), bc
	exx
	ld (ws+1420), bc
	exx
	jp    _02c9
_02ce:
	cp 146
	jp nz,    _02cf
	ld bc, (ws+1422)
	exx
	ld bc, (ws+1424)
	exx
	ld de, (ws+1426)
	exx
	ld de, (ws+1428)
	exx
	call f479__dvrmu4
	ld (ws+1418), hl
	exx
	ld (ws+1420), hl
	exx
	jp    _02c9
_02cf:
	cp 151
	jp nz,    _02d0
	ld bc, (ws+1422)
	exx
	ld bc, (ws+1424)
	exx
	ld de, (ws+1426)
	exx
	ld de, (ws+1428)
	exx
	call f480__dvrms4
	ld (ws+1418), de
	exx
	ld (ws+1420), de
	exx
	jp    _02c9
_02d0:
	cp 166
	jp nz,    _02d1
	ld de, (ws+1422)
	exx
	ld de, (ws+1424)
	exx
	ld hl, (ws+1426)
	exx
	ld hl, (ws+1428)
	exx
	call f481__and4
	ld (ws+1418), hl
	exx
	ld (ws+1420), hl
	exx
	jp    _02c9
_02d1:
	cp 171
	jp nz,    _02d2
	ld de, (ws+1422)
	exx
	ld de, (ws+1424)
	exx
	ld hl, (ws+1426)
	exx
	ld hl, (ws+1428)
	exx
	call f482__or4
	ld (ws+1418), hl
	exx
	ld (ws+1420), hl
	exx
	jp    _02c9
_02d2:
	cp 176
	jp nz,    _02d3
	ld de, (ws+1422)
	exx
	ld de, (ws+1424)
	exx
	ld hl, (ws+1426)
	exx
	ld hl, (ws+1428)
	exx
	call f483__eor4
	ld (ws+1418), hl
	exx
	ld (ws+1420), hl
	exx
	jp    _02c9
_02d3:
	cp 116
	jp nz,    _02d4
	ld hl, (ws+1422)
	exx
	ld hl, (ws+1424)
	exx
	ld a, (ws+1426)
	call f470__asl4
	ld (ws+1418), hl
	exx
	ld (ws+1420), hl
	exx
	jp    _02c9
_02d4:
	cp 121
	jp nz,    _02d5
	ld hl, (ws+1422)
	exx
	ld hl, (ws+1424)
	exx
	ld a, (ws+1426)
	call f469__lsr4
	ld (ws+1418), hl
	exx
	ld (ws+1420), hl
	exx
	jp    _02c9
_02d5:
	cp 126
	jp nz,    _02d6
	ld hl, (ws+1422)
	exx
	ld hl, (ws+1424)
	exx
	ld a, (ws+1426)
	call f471__asr4
	ld (ws+1418), hl
	exx
	ld (ws+1420), hl
	exx
	jp    _02c9
_02d6:
	call f173_midcodec_i_bad_fold
_02c9:
	ld hl, (ws+1418)
	exx
	ld hl, (ws+1420)
	exx
	ret


	; MidC1Op workspace at ws+1363 length ws+13
f180_MidC1Op:
	ld (ws+1365), hl
	pop bc
	pop af
	ld (ws+1364), a
	pop af
	ld (ws+1363), a
	push bc
	push hl
	pop ix
	ld a, (ix+13)
	cp 40
	jp nz,    _02db
	ld a, (ws+1363)
	push af
	ld hl, (ws+1365)
	call f174_FoldConstant1
	ld (ws+1369), hl
	exx
	ld (ws+1371), hl
	exx
	ld de, (ws+1369)
	exx
	ld de, (ws+1371)
	exx
	ld hl, (ws+1365)
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
	ld hl, (ws+1365)
	ld (ws+1367), hl
	jp    _02d7
_02db:
	ld a, (ws+1364)
	call f108_WidthToIndex
	ld (ws+1373), a
	ld a, (ws+1363)
	ld b,a
	ld a, (ws+1373)
	add a,b
	call f109_AllocateNewNode
	ld (ws+1367), hl
	ld hl, (ws+1365)
	ld ix, (ws+1367)
	ld (ix+9), l
	ld (ix+10), h
_02d7:
	ld hl, (ws+1367)
	ret


	; GetPowerOfTwo workspace at ws+1413 length ws+5
f181_GetPowerOfTwo:
	ld (ws+1413), hl
	exx
	ld (ws+1415), hl
	exx
	xor a
	ld (ws+1417), a
	and a
	sbc hl,hl
	exx
	sbc hl,hl
	exx
	ld de, (ws+1413)
	exx
	ld de, (ws+1415)
	exx
	call f487__cmps4
	jp p,    _02e2
	ld bc, (ws+1413)
	exx
	ld bc, (ws+1415)
	exx
	ld d,b
	ld e,c
	exx
	ld de, (ws+1415)
	exx
	ld hl,65535
	exx
	ld hl,65535
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld e,c
	ld d,b
	exx
	ld e,c
	ld d,b
	exx
	call f481__and4
	ld a,h
	or l
	exx
	or h
	or l
	exx
	jp nz,    _02e2
_02e4:
	ld hl, (ws+1413)
	exx
	ld hl, (ws+1415)
	exx
	ld a,h
	or l
	exx
	or h
	or l
	exx
	jp z,    _02e9
	ld a, (ws+1417)
	inc a
	ld (ws+1417), a
	ld hl, (ws+1413)
	exx
	ld hl, (ws+1415)
	exx
	ld a,1
	call f471__asr4
	ld (ws+1413), hl
	exx
	ld (ws+1415), hl
	exx
	jp    _02e4
_02e9:
_02e2:
	ld a, (ws+1417)
	ret


	; MidC2Op workspace at ws+1380 length ws+33
f183_MidC2Op:
	ld (ws+1384), hl
	pop bc
	pop hl
	ld (ws+1382), hl
	pop af
	ld (ws+1381), a
	pop af
	ld (ws+1380), a
	push bc
	cp 131
	jp nz,    _02f0
	ld ix, (ws+1384)
	ld a, (ix+13)
	cp 40
	jp nz,    _02f0
	ld hl, (ws+1384)
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
	xor a
	ld h,a
	ld l,a
	sbc hl,de
	exx
	ld h,a
	ld l,a
	sbc hl,de
	exx
	ex de,hl
	exx
	ex de,hl
	exx
	ld hl, (ws+1384)
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
	ld a,156
	ld (ws+1380), a
_02f0:
	ld a, (ws+1380)
	cp 156
	jp c,    _02f6
	ld ix, (ws+1382)
	ld a, (ix+13)
	cp 40
	jp nz,    _02fb
	ld hl, (ws+1382)
	ld (ws+1388), hl
	ld hl, (ws+1384)
	ld (ws+1382), hl
	ld hl, (ws+1388)
	ld (ws+1384), hl
_02fb:
	ld ix, (ws+1384)
	ld a, (ix+13)
	cp 40
	jp nz,    _0306
	ld ix, (ws+1382)
	ld b, (ix+13)
	ld a, (ws+1380)
	push af
	ld a,b
	pop bc
	cp b
	jp c,    _0306
	ld a, (ws+1380)
	add 4
	ld ix, (ws+1382)
	ld b, (ix+13)
	cp b
	jp c,    _0306
	ld ix, (ws+1382)
	ld l, (ix+11)
	ld h, (ix+12)
	push hl
	pop ix
	ld a, (ix+13)
	cp 40
	jp nz,    _0306
	ld a, (ws+1380)
	push af
	ld ix, (ws+1382)
	ld l, (ix+11)
	ld h, (ix+12)
	push hl
	ld hl, (ws+1384)
	call f176_FoldConstant2
	ld (ws+1390), hl
	exx
	ld (ws+1392), hl
	exx
	ld hl, (ws+1390)
	exx
	ld hl, (ws+1392)
	exx
	call f161_MidConstant
	ld (ws+1388), hl
	ld hl, (ws+1384)
	call f69_Discard
	ld hl, (ws+1388)
	ld (ws+1384), hl
	ld ix, (ws+1382)
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+1388), hl
	ld (ix+9), 0
	ld (ix+10), 0
	push ix
	pop hl
	call f69_Discard
	ld hl, (ws+1388)
	ld (ws+1382), hl
_0306:
_02f6:
	ld ix, (ws+1382)
	ld a, (ix+13)
	cp 40
	jp z,    _0310
	ld ix, (ws+1384)
	ld a, (ix+13)
	cp 40
	jp nz,    _0310
	ld a, (ws+1380)
	cp 161
	jp z,    _0319
	ld a, (ws+1380)
	cp 141
	jp z,    _0319
	ld a, (ws+1380)
	cp 136
	jp nz,    _031a
_0319:
	ld hl, (ws+1384)
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
	ld (ws+1396), de
	exx
	ld (ws+1398), de
	exx
	ld hl, (ws+1396)
	exx
	ld hl, (ws+1398)
	exx
	call f181_GetPowerOfTwo
	ld (ws+1401), a
	or a
	jp z,    _0321
	ld hl, (ws+1384)
	call f69_Discard
	ld a, (ws+1401)
	dec a
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	call f161_MidConstant
	ld (ws+1384), hl
	ld a, (ws+1380)
	cp 161
	jp nz,    _0323
	ld a,116
	ld (ws+1380), a
	jp    _0322
_0323:
	cp 141
	jp nz,    _0324
	ld a,126
	ld (ws+1380), a
	jp    _0322
_0324:
	cp 136
	jp nz,    _0325
	ld a,121
	ld (ws+1380), a
_0325:
_0322:
_0321:
_031a:
	ld a, (ws+1380)
	cp 116
	jp z,    _032d
	ld a, (ws+1380)
	cp 121
	jp z,    _032d
	ld a, (ws+1380)
	cp 126
	jp nz,    _032e
_032d:
	ld hl, (ws+1384)
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
	jp nz,    _0335
	ld hl, (ws+1384)
	call f69_Discard
	ld hl, (ws+1382)
	ld (ws+1386), hl
	jp end_f183_MidC2Op
_0335:
_032e:
	ld a, (ws+1380)
	cp 156
	jp z,    _033b
	ld a, (ws+1380)
	cp 131
	jp nz,    _033c
_033b:
	ld hl, (ws+1384)
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
	jp nz,    _0342
	ld hl, (ws+1384)
	call f69_Discard
	ld hl, (ws+1382)
	ld (ws+1386), hl
	jp end_f183_MidC2Op
_0342:
	ld ix, (ws+1382)
	ld a, (ix+13)
	cp 42
	jp nz,    _0347
	ld hl, (ws+1384)
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
	ld (ws+1404), hl
	ld a, (ws+1380)
	cp 156
	jp nz,    _0349
	ld hl, (ws+1382)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1404)
	add hl,de
	ex de,hl
	ld hl, (ws+1382)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1384)
	call f69_Discard
	ld hl, (ws+1382)
	ld (ws+1386), hl
	jp end_f183_MidC2Op
_0349:
	cp 131
	jp nz,    _034a
	ld hl, (ws+1382)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld de, (ws+1404)
	and a
	sbc hl,de
	ex de,hl
	ld hl, (ws+1382)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1384)
	call f69_Discard
	ld hl, (ws+1382)
	ld (ws+1386), hl
	jp end_f183_MidC2Op
_034a:
_0347:
_033c:
_0310:
	ld ix, (ws+1382)
	ld a, (ix+13)
	cp 40
	jp nz,    _0351
	ld ix, (ws+1384)
	ld a, (ix+13)
	cp 40
	jp nz,    _0351
	ld a, (ws+1380)
	push af
	ld hl, (ws+1382)
	push hl
	ld hl, (ws+1384)
	call f176_FoldConstant2
	ld (ws+1406), hl
	exx
	ld (ws+1408), hl
	exx
	ld de, (ws+1406)
	exx
	ld de, (ws+1408)
	exx
	ld hl, (ws+1382)
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
	ld hl, (ws+1384)
	call f69_Discard
	ld hl, (ws+1382)
	ld (ws+1386), hl
	jp end_f183_MidC2Op
_0351:
	ld a, (ws+1381)
	call f108_WidthToIndex
	ld (ws+1410), a
	ld a, (ws+1380)
	ld b,a
	ld a, (ws+1410)
	add a,b
	call f109_AllocateNewNode
	ld (ws+1386), hl
	ld hl, (ws+1382)
	ld ix, (ws+1386)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1384)
	ld (ix+11), l
	ld (ix+12), h
end_f183_MidC2Op:
	ld hl, (ws+1386)
	ret


	; MidCCast workspace at ws+1380 length ws+11
f184_MidCCast:
	ld (ws+1383), a
	pop bc
	pop hl
	ld (ws+1381), hl
	pop af
	ld (ws+1380), a
	push bc
	push hl
	pop ix
	ld a, (ix+13)
	cp 40
	jp nz,    _0357
	ld hl, (ws+1381)
	ld (ws+1384), hl
	jp end_f184_MidCCast
_0357:
	ld ix, (ws+1381)
	ld l, (ix+7)
	ld h, (ix+8)
	ld de,11
	add hl,de
	ld a,(hl)
	ld (ws+1386), a
	ld b,a
	ld a, (ws+1380)
	cp b
	jp nz,    _035c
	ld hl, (ws+1381)
	ld (ws+1384), hl
	jp    _0358
_035c:
	ld a, (ws+1386)
	cp 1
	jp nz,    _035e
	ld a,86
	ld (ws+1387), a
	jp    _035d
_035e:
	cp 2
	jp nz,    _035f
	ld a,91
	ld (ws+1387), a
	jp    _035d
_035f:
	cp 4
	jp nz,    _0360
	ld a,96
	ld (ws+1387), a
	jp    _035d
_0360:
	cp 8
	jp nz,    _0361
	ld a,101
	ld (ws+1387), a
_0361:
_035d:
	ld a, (ws+1380)
	call f108_WidthToIndex
	ld (ws+1388), a
	ld a, (ws+1387)
	ld b,a
	ld a, (ws+1388)
	add a,b
	call f109_AllocateNewNode
	ld (ws+1384), hl
	ld hl, (ws+1381)
	ld ix, (ws+1384)
	ld (ix+9), l
	ld (ix+10), h
	ld a, (ws+1383)
	push ix
	pop hl
	ld (hl),a
_0358:
end_f184_MidCCast:
	ld hl, (ws+1384)
	ret


	; E_b8 workspace at ws+1415 length ws+1
f185_E_b8:
	ld (ws+1415), a
	ld bc,ws+377
	push bc
	call f62_FCBPutChar
	ret


	; E_b16 workspace at ws+1412 length ws+2
f186_E_b16:
	ld (ws+1412), hl
	ld a, (ws+1412)
	call f185_E_b8
	ld hl, (ws+1412)
	ld a,8
	call f466__lsr2
	ld a,l
	jp f185_E_b8


	; E_b32 workspace at ws+1408 length ws+4
f187_E_b32:
	ld (ws+1408), hl
	exx
	ld (ws+1410), hl
	exx
	call f186_E_b16
	ld hl, (ws+1408)
	exx
	ld hl, (ws+1410)
	exx
	ld a,16
	call f469__lsr4
	jp f186_E_b16


	; E_bsize workspace at ws+1408 length ws+2
f188_E_bsize:
	ld (ws+1408), hl
	jp f186_E_b16


	; E workspace at ws+1412 length ws+3
f195_E:
	ld (ws+1412), hl
_0362:
	ld hl, (ws+1412)
	ld a,(hl)
	ld (ws+1414), a
	inc hl
	ld (ws+1412), hl
	or a
	ret z
	ld a, (ws+1414)
	call f185_E_b8
	jp    _0362


	; E_countedstring workspace at ws+1408 length ws+4
f196_E_countedstring:
	ld (ws+1408), hl
	call f32_StrLen
	ld a,l
	call f185_E_b8
	ld hl, (ws+1408)
	jp f195_E


_c251:
	db 99,97,110,110,111,116,32,111,112,101,110,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterOpenfile workspace at ws+1294 length ws+3
f207_EmitterOpenfile:
	ld (ws+1294), hl
	ld bc,ws+377
	push bc
	call f52_FCBOpenOut
	ld (ws+1296), a
	or a
	ret z
	ld hl,   _c251
	jp f82_SimpleError


_c252:
	db 99,97,110,110,111,116,32,99,108,111,115,101,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterClosefile workspace at ws+1294 length ws+1
f208_EmitterClosefile:
	ld a,69
	call f185_E_b8
	ld hl,ws+377
	call f53_FCBClose
	ld (ws+1294), a
	or a
	ret z
	ld hl,   _c252
	jp f82_SimpleError


	; EmitterDeclareSubroutine workspace at ws+1361 length ws+2
f209_EmitterDeclareSubroutine:
	ld (ws+1361), hl
	ld a,78
	call f185_E_b8
	ld ix, (ws+1361)
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld hl, (ws+1361)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	jp f196_E_countedstring


	; EmitterDeclareExternalSubroutine workspace at ws+1353 length ws+4
f210_EmitterDeclareExternalSubr:      
	ld (ws+1355), hl
	pop bc
	pop hl
	ld (ws+1353), hl
	push bc
	ld a,88
	call f185_E_b8
	ld hl, (ws+1353)
	call f186_E_b16
	ld hl, (ws+1355)
	jp f196_E_countedstring


	; EmitterReferenceSubroutineById workspace at ws+1384 length ws+4
f211_EmitterReferenceSubroutine:    
	ld (ws+1386), hl
	pop bc
	pop hl
	ld (ws+1384), hl
	push bc
	ld a,82
	call f185_E_b8
	ld hl, (ws+1384)
	call f186_E_b16
	ld hl, (ws+1386)
	jp f186_E_b16


	; EmitterReferenceSubroutine workspace at ws+1380 length ws+4
f212_EmitterReferenceSubroutine:
	ld (ws+1382), hl
	pop bc
	pop hl
	ld (ws+1380), hl
	push bc
	push hl
	pop ix
	ld l, (ix+14)
	ld h, (ix+15)
	push hl
	ld ix, (ws+1382)
	ld l, (ix+14)
	ld h, (ix+15)
	call f211_EmitterReferenceSubroutine;yId
	ret


	; EmitterDeclareWorkspace workspace at ws+1364 length ws+5
f213_EmitterDeclareWorkspace:
	ld (ws+1367), hl
	pop bc
	pop af
	ld (ws+1366), a
	pop hl
	ld (ws+1364), hl
	push bc
	ld a,87
	call f185_E_b8
	ld ix, (ws+1364)
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld a, (ws+1366)
	call f185_E_b8
	ld hl, (ws+1367)
	jp f188_E_bsize


	; EmitParameterList workspace at ws+1362 length ws+2
f214_EmitParameterList:
	ld (ws+1362), hl
_038f:
	ld hl, (ws+1362)
	ld a,h
	or l
	ret z
	ld hl, (ws+1362)
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
	pop ix
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld hl, (ws+1362)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld a, (ix+8)
	call f185_E_b8
	ld hl, (ws+1362)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+6)
	ld h, (ix+7)
	call f188_E_bsize
	ld ix, (ws+1362)
	ld l, (ix+4)
	ld h, (ix+5)
	call f196_E_countedstring
	ld hl, (ws+1362)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld de,11
	add hl,de
	ld a,(hl)
	call f185_E_b8
	ld hl, (ws+1362)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1362), hl
	jp    _038f


	; EmitterEmitInputParameters workspace at ws+1358 length ws+4
f215_EmitterEmitInputParameters:
	ld (ws+1358), hl
	ld a,73
	call f185_E_b8
	ld ix, (ws+1358)
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld ix, (ws+1358)
	ld a, (ix+26)
	call f185_E_b8
	ld hl, (ws+1358)
	push hl
	xor a
	call f105_GetInputParameter
	ld (ws+1360), hl
	jp f214_EmitParameterList


	; EmitterEmitOutputParameters workspace at ws+1358 length ws+4
f216_EmitterEmitOutputParameter: 
	ld (ws+1358), hl
	ld a,79
	call f185_E_b8
	ld ix, (ws+1358)
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld ix, (ws+1358)
	ld a, (ix+27)
	call f185_E_b8
	ld hl, (ws+1358)
	push hl
	xor a
	call f106_GetOutputParameter
	jp f214_EmitParameterList


	; EmitterEmitSubroutineFlags workspace at ws+1358 length ws+2
f217_EmitterEmitSubroutineFlags:
	ld (ws+1358), hl
	ld a,70
	call f185_E_b8
	ld ix, (ws+1358)
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld ix, (ws+1358)
	ld a, (ix+28)
	jp f185_E_b8


	; LookupSymbolInNamespace workspace at ws+1388 length ws+7
f227_LookupSymbolInNamespace:
	ld (ws+1390), hl
	pop bc
	pop hl
	ld (ws+1388), hl
	push bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1392), hl
_041d:
	ld hl, (ws+1392)
	ld a,h
	or l
	jp z,    _0422
	ld ix, (ws+1392)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+1390)
	call f29_StrCmp
	ld (ws+1394), a
	or a
	jp nz,    _0427
_0428:
	ld ix, (ws+1392)
	ld a, (ix+10)
	cp 39
	jp nz,    end_f227_LookupSymbolInNamespac
	ld hl, (ws+1392)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1392), hl
	jp    _0428
_0427:
	ld ix, (ws+1392)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1392), hl
	jp    _041d
_0422:
	ld bc,0
	ld (ws+1392), bc
end_f227_LookupSymbolInNamespac: 
	ld hl, (ws+1392)
	ret


	; LookupSymbol workspace at ws+1377 length ws+8
f228_LookupSymbol:
	ld (ws+1379), hl
	pop bc
	pop hl
	ld (ws+1377), hl
	push bc
	ld a,h
	or l
	jp nz,    _0432
	ld hl, (ws+12)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+1377), hl
_0432:
_0433:
	ld hl, (ws+1377)
	ld a,h
	or l
	jp z,    _0438
	ld hl, (ws+1377)
	push hl
	ld hl, (ws+1379)
	call f227_LookupSymbolInNamespace
	ld (ws+1381), hl
	ld a,h
	or l
	jp z,    _043d
	jp end_f228_LookupSymbol
_043d:
	ld ix, (ws+1377)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1377), hl
	jp    _0433
_0438:
	ld bc,0
	ld (ws+1381), bc
end_f228_LookupSymbol:
	ld hl, (ws+1381)
	ret


	; AddToNamespace workspace at ws+1398 length ws+4
f229_AddToNamespace:
	ld (ws+1400), hl
	pop bc
	pop hl
	ld (ws+1398), hl
	push bc
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz,    _0442
	ld de, (ws+1400)
	ld hl, (ws+1398)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1398)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	jp    _043e
_0442:
	ld de, (ws+1400)
	ld hl, (ws+1398)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld (ix+8), e
	ld (ix+9), d
	ld hl, (ws+1398)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
_043e:
	ld hl, (ws+1398)
	ld ix, (ws+1400)
	ld (ix+6), l
	ld (ix+7), h
	ret

_c253:
	db 115,121,109,98,111,108,32,39,0
_c254:
	db 39,32,105,115,32,97,108,114,101,97,100,121,32,100,101,102,105,110,101,100,0


	; AddSymbol workspace at ws+1378 length ws+10
f230_AddSymbol:
	ld (ws+1380), hl
	pop bc
	pop hl
	ld (ws+1378), hl
	push bc
	ld a,h
	or l
	jp nz,    _0447
	ld hl, (ws+12)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+1378), hl
_0447:
	call f70_AllocNewSymbol
	ld (ws+1382), hl
	ld hl, (ws+1380)
	ld a,h
	or l
	jp z,    _044c
	ld hl, (ws+1378)
	push hl
	ld hl, (ws+1380)
	call f227_LookupSymbolInNamespace
	ld a,h
	or l
	jp z,    _0451
	call f80_StartError
	ld hl,   _c253
	call f9_print
	ld hl, (ws+1380)
	call f9_print
	ld hl,   _c254
	call f9_print
	call f81_EndError
_0451:
	ld hl, (ws+1380)
	ld ix, (ws+1382)
	ld (ix+4), l
	ld (ix+5), h
	ld hl, (ws+1378)
	push hl
	push ix
	pop hl
	call f229_AddToNamespace
_044c:
	ld hl, (ws+1382)
	ret


	; AddAlias workspace at ws+1357 length ws+10
f231_AddAlias:
	ld (ws+1361), hl
	pop bc
	pop hl
	ld (ws+1359), hl
	pop hl
	ld (ws+1357), hl
	push bc
	push hl
	ld hl, (ws+1359)
	call f230_AddSymbol
	ld (ws+1363), hl
	push hl
	pop ix
	ld (ix+10), 39
	ld de, (ws+1361)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1363)
	ret


	; AddAliasString workspace at ws+1308 length ws+8
f232_AddAliasString:
	ld (ws+1310), hl
	pop bc
	pop hl
	ld (ws+1308), hl
	push bc
	ld bc,0
	push bc
	push hl
	ld hl, (ws+1310)
	call f231_AddAlias
	ret

_c255:
	db 39,0
_c256:
	db 39,32,105,115,32,97,32,112,97,114,116,105,97,108,32,116,121,112,101,0


	; CheckNotPartialType workspace at ws+1386 length ws+2
f233_CheckNotPartialType:
	ld (ws+1386), hl
	push hl
	pop ix
	ld a, (ix+15)
	cp 1
	ret nz
	call f80_StartError
	ld hl,   _c255
	call f9_print
	ld ix, (ws+1386)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,   _c256
	call f9_print
	jp f81_EndError



	; AddTypeToNamespace workspace at ws+1388 length ws+10
f234_AddTypeToNamespace:
	ld (ws+1392), hl
	pop bc
	pop hl
	ld (ws+1390), hl
	pop hl
	ld (ws+1388), hl
	push bc
	call f70_AllocNewSymbol
	ld (ws+1396), hl
	push hl
	pop ix
	ld (ix+10), 30
	ld de, (ws+1390)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1392)
	ld ix, (ws+1396)
	ld (ix+4), l
	ld (ix+5), h
	push ix
	pop hl
	push de
	pop ix
	ld (ix+7), l
	ld (ix+8), h
	ld hl, (ws+1388)
	push hl
	ld hl, (ws+1396)
	call f229_AddToNamespace
	ret


	; MakeNumberType workspace at ws+1308 length ws+9
f235_MakeNumberType:
	ld (ws+1311), hl
	pop bc
	pop af
	ld (ws+1310), a
	pop af
	ld (ws+1309), a
	pop af
	ld (ws+1308), a
	push bc
	call f72_AllocNewType
	ld (ws+1313), hl
	push hl
	pop ix
	ld (ix+15), 2
	ld a, (ws+1308)
	ld l,a
	ld h,0
	ld ix, (ws+1313)
	ld (ix+11), l
	ld (ix+12), h
	ld l,a
	ld (ix+13), l
	ld (ix+14), h
	ld a, (ws+1309)
	ld (ix+16), a
	ld a, (ws+1310)
	push ix
	pop hl
	ld (hl),a
	ld hl, (ws+12)
	inc hl
	inc hl
	inc hl
	inc hl
	push hl
	push ix
	pop hl
	push hl
	ld hl, (ws+1311)
	call f234_AddTypeToNamespace
	ld hl, (ws+1313)
	ret


	; IsTypeOfKind workspace at ws+1400 length ws+4
f236_IsTypeOfKind:
	ld (ws+1402), a
	pop bc
	pop hl
	ld (ws+1400), hl
	push bc
	xor a
	ld (ws+1403), a
	ld a,h
	or l
	jp z,    _045d
	ld ix, (ws+1400)
	ld b, (ix+15)
	ld a, (ws+1402)
	cp b
	jp nz,    _045d
	ld a,1
	ld (ws+1403), a
_045d:
	ld a, (ws+1403)
	ret


	; IsArray workspace at ws+1380 length ws+4
f237_IsArray:
	ld (ws+1380), hl
	push hl
	ld a,4
	call f236_IsTypeOfKind
	ret


	; IsPtr workspace at ws+1396 length ws+4
f74_IsPtr:
	ld (ws+1396), hl
	push hl
	ld a,3
	call f236_IsTypeOfKind
	ret


	; IsSubroutine workspace at ws+1396 length ws+4
f238_IsSubroutine:
	ld (ws+1396), hl
	push hl
	ld a,6
	call f236_IsTypeOfKind
	ret


	; IsNum workspace at ws+1396 length ws+4
f239_IsNum:
	ld (ws+1396), hl
	ld a,h
	or l
	jp nz,    _0463
	ld a,1
	ret
_0463:
	push hl
	ld a,2
	call f236_IsTypeOfKind
	ret


	; IsSNum workspace at ws+1377 length ws+4
f240_IsSNum:
	ld (ws+1377), hl
	ld a,h
	or l
	jp nz,    _0468
	ld a,1
	ret
_0468:
	ld hl, (ws+1377)
	push hl
	ld a,2
	call f236_IsTypeOfKind
	or a
	ret z
	ld hl, (ws+1377)
	ld a,(hl)
	or a
	ret z
	ld a,1
	ret


	; IsScalar workspace at ws+1390 length ws+6
f241_IsScalar:
	ld (ws+1390), hl
	call f74_IsPtr
	ld (ws+1393), a
	ld hl, (ws+1390)
	call f239_IsNum
	ld (ws+1394), a
	ld hl, (ws+1390)
	call f238_IsSubroutine
	ld (ws+1395), a
	ld a, (ws+1393)
	or a
	jp nz,    _0477
	ld a, (ws+1394)
	or a
	jp nz,    _0477
	ld a, (ws+1395)
	or a
	ret z
_0477:
	ld a,1
	ret


	; IsRecord workspace at ws+1377 length ws+4
f242_IsRecord:
	ld (ws+1377), hl
	push hl
	ld a,5
	call f236_IsTypeOfKind
	ret


	; MakeLValue workspace at ws+1380 length ws+10
f243_MakeLValue:
	ld (ws+1380), hl
	xor a
	ld (ws+1384), a
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1385), hl
	call f241_IsScalar
	or a
	jp z,    _047f
	ld de, (ws+1385)
	ld hl,11
	add hl,de
	ld a,(hl)
	ld (ws+1384), a
_047f:
	ld a, (ws+1384)
	push af
	ld hl, (ws+1380)
	call f111_MidDeref
	ld (ws+1382), hl
	ld hl, (ws+1385)
	ld ix, (ws+1382)
	ld (ix+7), l
	ld (ix+8), h
	ld hl, (ws+1382)
	ret

_c257:
	db 108,118,97,108,117,101,32,114,101,113,117,105,114,101,100,0


	; UndoLValue workspace at ws+1364 length ws+5
f244_UndoLValue:
	ld (ws+1364), hl
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1368), a
	cp 44
	jp c,    _0485
	ld b,48
	ld a, (ws+1368)
	push af
	ld a,b
	pop bc
	cp b
	jp nc,    _0486
_0485:
	ld hl,   _c257
	call f82_SimpleError
_0486:
	ld ix, (ws+1364)
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+1366), hl
	ld (ix+9), 0
	ld (ix+10), 0
	push ix
	pop hl
	call f69_Discard
	ld hl, (ws+1366)
	ret


	; IsLValue workspace at ws+1377 length ws+4
f245_IsLValue:
	ld (ws+1377), hl
	xor a
	ld (ws+1379), a
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1380), a
	cp 44
	jp c,    _048e
	ld b,48
	ld a, (ws+1380)
	push af
	ld a,b
	pop bc
	cp b
	jp c,    _048e
	ld a,1
	ld (ws+1379), a
_048e:
	ld a, (ws+1379)
	ret

_c258:
	db 112,111,105,110,116,101,114,32,111,114,32,108,118,97,108,117,101,32,114,101,113,117,105,114,101,100,0


	; MaybeUndoLValue workspace at ws+1380 length ws+6
f246_MaybeUndoLValue:
	ld (ws+1380), hl
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1384), a
	cp 44
	jp c,    _0496
	ld b,48
	ld a, (ws+1384)
	push af
	ld a,b
	pop bc
	cp b
	jp c,    _0496
	ld ix, (ws+1380)
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+1382), hl
	ld (ix+9), 0
	ld (ix+10), 0
	jp    _0490
_0496:
	ld ix, (ws+1380)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	or a
	jp z,    _049b
	ld hl, (ws+1380)
	ld (ws+1382), hl
	jp    _0490
_049b:
	ld hl,   _c258
	call f82_SimpleError
_0490:
	ld hl, (ws+1382)
	ret


	; AllocLabel workspace at ws+1390 length ws+2
f247_AllocLabel:
	ld hl, (ws+14)
	ld (ws+1390), hl
	inc hl
	ld (ws+14), hl
	ld hl, (ws+1390)
	ret


	; AllocSubrId workspace at ws+1361 length ws+2
f248_AllocSubrId:
	ld hl, (ws+16)
	ld (ws+1361), hl
	inc hl
	ld (ws+16), hl
	ld hl, (ws+1361)
	ret


	; MidWriter workspace at ws+1406 length ws+2
f249_MidWriter:
	ret


	; ArchAlignUp workspace at ws+1380 length ws+5
f250_ArchAlignUp:
	pop bc
	pop hl
	push bc
	ret

_c259:
	db 117,105,110,116,51,50,0
_c260:
	db 105,110,116,51,50,0
_c261:
	db 117,105,110,116,49,54,0
_c262:
	db 105,110,116,49,54,0
_c263:
	db 117,105,110,116,56,0
_c264:
	db 105,110,116,56,0
_c265:
	db 117,105,110,116,49,54,0
_c266:
	db 105,110,116,112,116,114,0


	; ArchInitTypes workspace at ws+1294 length ws+14
f251_ArchInitTypes:
	ld h,4
	push hl
	ld a,1
	push af
	ld d,0
	push de
	ld hl,   _c259
	call f235_MakeNumberType
	ld (ws+543), hl
	ld h,4
	push hl
	ld a,1
	push af
	push af
	ld hl,   _c260
	call f235_MakeNumberType
	ld (ws+545), hl
	ld b,2
	push bc
	ld a,1
	push af
	ld d,0
	push de
	ld hl,   _c261
	call f235_MakeNumberType
	ld (ws+547), hl
	ld b,2
	push bc
	ld a,1
	push af
	push af
	ld hl,   _c262
	call f235_MakeNumberType
	ld (ws+549), hl
	ld a,1
	push af
	push af
	ld d,0
	push de
	ld hl,   _c263
	call f235_MakeNumberType
	ld (ws+551), hl
	ld a,1
	push af
	push af
	push af
	ld hl,   _c264
	call f235_MakeNumberType
	ld (ws+553), hl
	ld hl, (ws+547)
	ld (ws+555), hl
	ld bc,0
	push bc
	ld hl,   _c265
	call f228_LookupSymbol
	ld (ws+1306), hl
	ld hl,   _c266
	push hl
	ld hl, (ws+1306)
	call f232_AddAliasString
	ret


	; ArchGuessIntType workspace at ws+1369 length ws+10
f252_ArchGuessIntType:
	ld (ws+1373), hl
	exx
	ld (ws+1375), hl
	exx
	pop bc
	pop hl
	ld (ws+1369), hl
	pop hl
	ld (ws+1371), hl
	push bc
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	exx
	bit 7,h
	exx
	jp nz,    _04a2
	ld hl,255
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f487__cmps4
	jp m,    _04a2
	ld hl, (ws+551)
	ld (ws+1377), hl
	jp    _049c
_04a2:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	ld de,65408
	exx
	ld de,65535
	exx
	call f487__cmps4
	jp m,    _04a9
	ld hl,127
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f487__cmps4
	jp m,    _04a9
	ld hl, (ws+553)
	ld (ws+1377), hl
	jp    _049c
_04a9:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	exx
	bit 7,h
	exx
	jp nz,    _04b0
	ld hl,65535
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f487__cmps4
	jp m,    _04b0
	ld hl, (ws+547)
	ld (ws+1377), hl
	jp    _049c
_04b0:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	ld de,32768
	exx
	ld de,65535
	exx
	call f487__cmps4
	jp m,    _04b7
	ld hl,32767
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f487__cmps4
	jp m,    _04b7
	ld hl, (ws+549)
	ld (ws+1377), hl
	jp    _049c
_04b7:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	exx
	bit 7,h
	exx
	jp nz,    _04bc
	ld hl, (ws+543)
	ld (ws+1377), hl
	jp    _049c
_04bc:
	ld hl, (ws+545)
	ld (ws+1377), hl
_049c:
	ld hl, (ws+1377)
	ret


	; ArchInitVariable workspace at ws+1386 length ws+6
f253_ArchInitVariable:
	ld (ws+1386), hl
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
	ld (ws+1388), hl
	push hl
	pop ix
	ld l, (ix+16)
	ld h, (ix+17)
	ld (ws+1390), hl
	ld d,h
	ld e,l
	ld hl, (ws+1386)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld (ix+6), e
	ld (ix+7), d
	ld de, (ws+1390)
	ld hl, (ws+1386)
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
	ld l, (ix+11)
	ld h, (ix+12)
	add hl,de
	ld ix, (ws+1388)
	ld (ix+16), l
	ld (ix+17), h
	ret


	; ArchInitMember workspace at ws+1355 length ws+6
f254_ArchInitMember:
	ld (ws+1359), hl
	pop bc
	pop hl
	ld (ws+1357), hl
	pop hl
	ld (ws+1355), hl
	push bc
	ld de, (ws+1359)
	ld hl, (ws+1357)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld (ix+6), e
	ld (ix+7), d
	ld hl, (ws+1357)
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
	ld l, (ix+11)
	ld h, (ix+12)
	add hl,de
	ld (ws+1359), hl
	ld ix, (ws+1355)
	ld l, (ix+11)
	ld h, (ix+12)
	ld de, (ws+1359)
	and a
	sbc hl,de
	ret nc
   	ld hl, (ws+1359)
	ld ix, (ws+1355)
	ld (ix+11), l
	ld (ix+12), h
	ret


	; WriteMid1 workspace at ws+1408 length ws+0
f255_WriteMid1:
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
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
	pop ix
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld hl, (ws+1406)
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
	ld a, (ix+8)
	call f185_E_b8
	ld hl, (ws+1406)
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
	ld l, (ix+6)
	ld h, (ix+7)
	call f188_E_bsize
	ld hl, (ws+1406)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl,11
	add hl,de
	ld a,(hl)
	jp f185_E_b8



	; WriteMid2 workspace at ws+1408 length ws+0
f256_WriteMid2:
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp f196_E_countedstring



	; WriteMid3 workspace at ws+1408 length ws+0
f257_WriteMid3:
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+14)
	ld h, (ix+15)
	jp f186_E_b16


	; WriteMid4 workspace at ws+1408 length ws+0
f258_WriteMid4:
	ld (ws+1406), hl
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
	call f187_E_b32
	ld ix, (ws+1406)
	ld l, (ix+4)
	ld h, (ix+5)
	jp f186_E_b16


	; WriteMid5 workspace at ws+1408 length ws+0
f259_WriteMid5:
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld hl, (ws+1406)
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
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld hl, (ws+1406)
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
	ld a, (ix+8)
	call f185_E_b8
	ld hl, (ws+1406)
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
	ld l, (ix+6)
	ld h, (ix+7)
	call f188_E_bsize
	ld hl, (ws+1406)
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
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl,11
	add hl,de
	ld a,(hl)
	call f185_E_b8
	ld hl, (ws+1406)
	inc hl
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	jp f185_E_b8


	; WriteMid6 workspace at ws+1408 length ws+0
f260_WriteMid6:
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp f186_E_b16


	; WriteMid7 workspace at ws+1408 length ws+0
f261_WriteMid7:
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
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
	pop ix
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld hl, (ws+1406)
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
	ld a, (ix+8)
	call f185_E_b8
	ld hl, (ws+1406)
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
	ld l, (ix+6)
	ld h, (ix+7)
	call f188_E_bsize
	ld hl, (ws+1406)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl,11
	add hl,de
	ld a,(hl)
	call f185_E_b8
	ld hl, (ws+1406)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp f188_E_bsize


	; WriteMid8 workspace at ws+1408 length ws+0
f262_WriteMid8:
	ld (ws+1406), hl
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
	jp f187_E_b32


	; WriteMid9 workspace at ws+1408 length ws+0
f263_WriteMid9:
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f186_E_b16
	ld hl, (ws+1406)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f186_E_b16
	ld ix, (ws+1406)
	ld l, (ix+4)
	ld h, (ix+5)
	call f186_E_b16
	ld ix, (ws+1406)
	ld a, (ix+6)
	jp f185_E_b8


	; WriteMid10 workspace at ws+1408 length ws+0
f264_WriteMid10:
	ld a,(hl)
	jp f185_E_b8


	; WriteMid11 workspace at ws+1408 length ws+0
f265_WriteMid11:
	ret

f2___main_s04c2:
	dw f255_WriteMid1
	dw f256_WriteMid2
	dw f257_WriteMid3
	dw f258_WriteMid4
	dw f259_WriteMid5
	dw f260_WriteMid6
	dw f261_WriteMid7
	dw f262_WriteMid8
	dw f263_WriteMid9
	dw f264_WriteMid10
	dw f265_WriteMid11

f2___main_s04c3:
	db 10
	db 10
	db 10
	db 2
	db 2
	db 0
	db 7
	db 7
	db 7
	db 7
	db 7
	db 1
	db 6
	db 2
	db 10
	db 10
	db 10
	db 10
	db 1
	db 0
	db 2
	db 7
	db 10
	db 10
	db 10
	db 5
	db 5
	db 10
	db 2
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
	db 1
	db 6
	db 2
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 10
	db 10
	db 10
	db 10
	db 10
	db 3
	db 3
	db 3
	db 3
	db 3
	db 10
	db 10
	db 10
	db 10
	db 10
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
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10
	db 10


	; ReallyGenerate workspace at ws+1397 length ws+9
f267_ReallyGenerate:
	ld (ws+1397), hl
	ld a,77
	call f185_E_b8
	ld hl, (ws+64)
	ld (ws+1399), hl
	ld hl, (ws+1397)
	call f66_PushNode
_04cf:
	ld de, (ws+64)
	ld hl, (ws+1399)
	and a
	sbc hl,de
	jp z,    _04d4
	call f68_NextNode
	ld (ws+1403), hl
	push hl
	pop ix
	ld a, (ix+13)
	call f185_E_b8
	ld de,f2___main_s04c3
	ld ix, (ws+1403)
	ld a, (ix+13)
	dec a
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
	ld (ws+1405), a
	ld bc,f2___main_s04c2
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld e,(hl)
	inc hl
	ld d,(hl)
	push ix
	pop hl
	call f488__jpde
	jp    _04cf
_04d4:
	ld hl, (ws+1397)
	jp f69_Discard


	; Generate workspace at ws+1390 length ws+7
f269_Generate:
	ld (ws+1390), hl
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1392), a
	ld a, (ws+557)
	cp 27
	jp z,    _04da
	ld a, (ws+557)
	cp 28
	jp nz,    _04db
_04da:
	ld a, (ws+1392)
	cp 26
	jp z,    _04e3
	ld a, (ws+1392)
	cp 5
	jp z,    _04e3
	ld hl, (ws+1390)
	jp f69_Discard
_04e3:
_04db:
	ld a, (ws+1392)
	cp 18
	jp nz,    _04eb
	ld a, (ws+557)
	cp 23
	jp z,    _04eb
	call f160_MidAsmgroupstart
	call f267_ReallyGenerate
_04eb:
	ld a, (ws+557)
	cp 23
	jp nz,    _04f3
	ld a, (ws+1392)
	cp 18
	jp z,    _04f3
	call f125_MidAsmgroupend
	call f267_ReallyGenerate
_04f3:
	ld a, (ws+1392)
	ld (ws+557), a
	ld hl, (ws+1390)
	jp f267_ReallyGenerate


	; push_and_free workspace at ws+1390 length ws+0
f271_push_and_free:
	ld de, (ws+1369)
	ld hl, (ws+1377)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1371)
	ld hl, (ws+1377)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1373)
	ld ix, (ws+1377)
	ld (ix+4), l
	ld (ix+5), h
	ld ix, (ws+1367)
	ld (ix+9), 0
	ld (ix+10), 0
	ld (ix+11), 0
	ld (ix+12), 0
	ld hl, (ws+1377)
	call f66_PushNode
	ld hl, (ws+1375)
	call f66_PushNode
	ld hl, (ws+1367)
	jp f69_Discard


	; GenerateConditional workspace at ws+1361 length ws+29
f270_GenerateConditional:
	ld (ws+1361), hl
	ld hl, (ws+64)
	ld (ws+1363), hl
	ld hl, (ws+1361)
	call f66_PushNode
_04f5:
	ld de, (ws+64)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	ret z
	call f67_PopNode
	ld (ws+1367), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1369), hl
	ld hl, (ws+1367)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1371), hl
	ld ix, (ws+1367)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1373), hl
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+1375), hl
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+1377), hl
	ld a, (ix+13)
	ld (ws+1379), a
	ld a, (ix+6)
	or a
	jp z,    _04ff
	ld hl, (ws+1369)
	ld (ws+1380), hl
	ld hl, (ws+1371)
	ld (ws+1369), hl
	ld hl, (ws+1380)
	ld (ws+1371), hl
_04ff:
	ld a, (ws+1379)
	cp 55
	jp nz,    _0501
	call f247_AllocLabel
	ld (ws+1382), hl
	ld de, (ws+1369)
	ld hl, (ws+1375)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1382)
	ld hl, (ws+1375)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld h,d
	ld l,e
	ld ix, (ws+1375)
	ld (ix+4), l
	ld (ix+5), h
	call f271_push_and_free
	jp    _04f5
_0501:
	cp 54
	jp nz,    _0502
	call f247_AllocLabel
	ld (ws+1382), hl
	ld d,h
	ld e,l
	ld hl, (ws+1375)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1371)
	ld hl, (ws+1375)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1382)
	ld ix, (ws+1375)
	ld (ix+4), l
	ld (ix+5), h
	call f271_push_and_free
	jp    _04f5
_0502:
	ld de, (ws+1369)
	ld hl, (ws+1367)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1371)
	ld hl, (ws+1367)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1367)
	call f269_Generate
	ld hl, (ws+1373)
	call f131_MidLabel
	call f269_Generate
	jp    _04f5


	; InitVariable workspace at ws+1378 length ws+8
f272_InitVariable:
	ld (ws+1382), hl
	pop bc
	pop hl
	ld (ws+1380), hl
	pop hl
	ld (ws+1378), hl
	push bc
	ld hl, (ws+1382)
	call f233_CheckNotPartialType
	ld ix, (ws+1380)
	ld (ix+10), 28
	ld hl,9
	call f75_InternalAlloc
	ld d,h
	ld e,l
	ld hl, (ws+1380)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1382)
	ld hl, (ws+1380)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1378)
	ld hl, (ws+1380)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1380)
	jp f253_ArchInitVariable


	; MakePointerType workspace at ws+1380 length ws+8
f273_MakePointerType:
	ld (ws+1380), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+1382), hl
	ld a,h
	or l
	jp nz,    _0507
	call f72_AllocNewType
	ld (ws+1382), hl
	push hl
	pop ix
	ld (ix+15), 3
	ld ix, (ws+555)
	ld l, (ix+11)
	ld h, (ix+12)
	ld ix, (ws+1382)
	ld (ix+11), l
	ld (ix+12), h
	ld ix, (ws+555)
	ld a, (ix+16)
	ld ix, (ws+1382)
	ld (ix+16), a
	ld ix, (ws+555)
	ld l, (ix+13)
	ld h, (ix+14)
	ld ix, (ws+1382)
	ld (ix+13), l
	ld (ix+14), h
	ld de, (ws+1380)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	push ix
	pop hl
	push de
	pop ix
	ld (ix+9), l
	ld (ix+10), h
	push de
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f76_StrDupBraced
	ld (ws+1386), hl
	ld ix, (ws+1380)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+6)
	ld h, (ix+7)
	push hl
	ld hl, (ws+1382)
	push hl
	ld hl, (ws+1386)
	call f234_AddTypeToNamespace
_0507:
	ld hl, (ws+1382)
	ret


	; MakeArrayType workspace at ws+1355 length ws+14
f274_MakeArrayType:
	ld (ws+1357), hl
	pop bc
	pop hl
	ld (ws+1355), hl
	push bc
	call f233_CheckNotPartialType
	call f72_AllocNewType
	ld (ws+1359), hl
	push hl
	pop ix
	ld (ix+15), 4
	ld ix,0
	ld (ws+1363), ix
	push ix
	pop hl
	ld de, (ws+1357)
	and a
	sbc hl,de
	jp nc,    _050c
	ld ix, (ws+1355)
	ld e, (ix+13)
	ld d, (ix+14)
	ld bc, (ws+1357)
	dec bc
	call f473__mul2
	ex de,hl
	ld ix, (ws+1355)
	ld l, (ix+11)
	ld h, (ix+12)
	add hl,de
	ld (ws+1363), hl
_050c:
	ld hl, (ws+1363)
	ld ix, (ws+1359)
	ld (ix+11), l
	ld (ix+12), h
	ld ix, (ws+1355)
	ld a, (ix+16)
	ld ix, (ws+1359)
	ld (ix+16), a
	ld ix, (ws+1355)
	ld e, (ix+13)
	ld d, (ix+14)
	ld bc, (ws+1357)
	call f473__mul2
	ld ix, (ws+1359)
	ld (ix+13), l
	ld (ix+14), h
	ld de, (ws+1355)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1357)
	push ix
	pop hl
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
	ld hl, (ws+1357)
	dec hl
	exx
	ld hl,0
	exx
	call f252_ArchGuessIntType
	ld (ws+1365), hl
	ld ix, (ws+1359)
	ld (ix+4), l
	ld (ix+5), h
	ld ix, (ws+1355)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+1357)
	call f77_StrDupArrayed
	ld (ws+1367), hl
	ld ix, (ws+1355)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+6)
	ld h, (ix+7)
	push hl
	ld hl, (ws+1359)
	push hl
	ld hl, (ws+1367)
	call f234_AddTypeToNamespace
	ld hl, (ws+1359)
	ret


	; QueueNamespace workspace at ws+1373 length ws+4
f277_QueueNamespace:
	ld (ws+1373), hl
_050d:
	ld hl, (ws+1373)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	ret z
	ld hl, (ws+1373)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1375), hl
	push hl
	pop ix
	ld e, (ix+8)
	ld d, (ix+9)
	ld hl, (ws+1373)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1361)
	ld ix, (ws+1375)
	ld (ix+8), l
	ld (ix+9), h
	push ix
	pop hl
	ld (ws+1361), hl
	jp    _050d


	; DestructSubroutineContents workspace at ws+1359 length ws+14
f276_DestructSubroutineContents:
	ld (ws+1359), hl
	ld ix,0
	ld (ws+1361), ix
	ld ix, (ws+1359)
	ld a, (ix+27)
	or a
	jp z,    _0517
	ld hl, (ws+1359)
	push hl
	push hl
	pop ix
	ld a, (ix+27)
	dec a
	call f106_GetOutputParameter
	ld (ws+1363), hl
	jp    _0513
_0517:
	ld ix, (ws+1359)
	ld a, (ix+26)
	or a
	jp z,    _051b
	ld hl, (ws+1359)
	push hl
	push hl
	pop ix
	ld a, (ix+26)
	dec a
	call f105_GetInputParameter
	ld (ws+1363), hl
	jp    _0513
_051b:
	ld bc,0
	ld (ws+1363), bc
_0513:
	ld ix, (ws+1359)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1361), hl
	ld hl, (ws+1363)
	ld a,h
	or l
	jp z,    _0520
	ld ix, (ws+1363)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1361), hl
_0520:
_0521:
	ld hl, (ws+1361)
	ld a,h
	or l
	jp z,    _0526
	ld hl, (ws+1361)
	ld (ws+1369), hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1361), hl
	ld ix, (ws+1369)
	ld a, (ix+10)
	cp 30
	jp nz,    _0528
	ld hl, (ws+1369)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1371), hl
	push hl
	pop ix
	ld a, (ix+15)
	cp 5
	jp nz,    _052a
	ld hl, (ws+1371)
	call f277_QueueNamespace
	jp    _0529
_052a:
	cp 6
	jp nz,    _052b
	ld hl, (ws+1371)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	inc hl
	inc hl
	inc hl
	inc hl
	call f277_QueueNamespace
	ld hl, (ws+1371)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
_052b:
_0529:
	ld hl, (ws+1371)
	call f73_FreeType
	jp    _0527
_0528:
	cp 28
	jp nz,    _052c
	ld hl, (ws+1369)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
_052c:
_0527:
	ld ix, (ws+1369)
	ld l, (ix+4)
	ld h, (ix+5)
	call f40_Free
	ld hl, (ws+1369)
	call f71_FreeSymbol
	jp    _0521
_0526:
	ld hl, (ws+1363)
	ld a,h
	or l
	jp z,    _0531
	ld ix, (ws+1363)
	ld (ix+8), 0
	ld (ix+9), 0
	jp    _052d
_0531:
	ld ix, (ws+1359)
	ld (ix+4), 0
	ld (ix+5), 0
_052d:
	ld hl, (ws+1363)
	ld ix, (ws+1359)
	ld (ix+6), l
	ld (ix+7), h
	ret


	; CopyParameterList workspace at ws+1358 length ws+14
f278_CopyParameterList:
	ld (ws+1360), hl
	pop bc
	pop hl
	ld (ws+1358), hl
	push bc
	ld ix,0
	ld (ws+1362), ix
_0532:
	ld hl, (ws+1358)
	ld a,h
	or l
	ret z
	ld ix, (ws+1358)
	ld l, (ix+4)
	ld h, (ix+5)
	call f78_InternalStrDup
	ld (ws+1364), hl
	ld hl, (ws+1360)
	inc hl
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, (ws+1364)
	call f230_AddSymbol
	ld (ws+1368), hl
	push hl
	pop ix
	ld (ix+10), 28
	ld hl,9
	call f75_InternalAlloc
	ld d,h
	ld e,l
	ld hl, (ws+1368)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1358)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1368)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1358)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1368)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1358)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld b, (ix+8)
	ld hl, (ws+1368)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld (ix+8), b
	ld hl, (ws+1358)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld e, (ix+6)
	ld d, (ix+7)
	ld hl, (ws+1368)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld (ix+6), e
	ld (ix+7), d
	ld hl, (ws+1362)
	ld a,h
	or l
	jp z,    _053c
	ld de, (ws+1368)
	ld hl, (ws+1362)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld (ix+4), e
	ld (ix+5), d
_053c:
	ld hl, (ws+1368)
	ld (ws+1362), hl
	ld hl, (ws+1358)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1358), hl
	jp    _0532

_c267:
	db 95,95,109,97,105,110,0


	; CreateMainSubroutine workspace at ws+1294 length ws+10
f279_CreateMainSubroutine:
	call f72_AllocNewType
	ld (ws+1296), hl
	push hl
	pop ix
	ld (ix+15), 6
	call f70_AllocNewSymbol
	ld (ws+1300), hl
	push hl
	pop ix
	ld (ix+10), 30
	ld hl,   _c267
	ld ix, (ws+1300)
	ld (ix+4), l
	ld (ix+5), h
	ld de, (ws+1296)
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
	ld hl,29
	call f75_InternalAlloc
	ld (ws+12), hl
	ld de, (ws+1300)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1296)
	ld ix, (ws+12)
	ld (ix+10), l
	ld (ix+11), h
	push ix
	pop hl
	ld (ix+12), l
	ld (ix+13), h
	push ix
	pop de
	ld hl, (ws+1296)
	ld (hl),e
	inc hl
	ld (hl),d
	push ix
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, (ws+1300)
	call f229_AddToNamespace
	ret


	; ReportWorkspaces workspace at ws+1359 length ws+5
f280_ReportWorkspaces:
	ld (ws+1359), hl
	xor a
	ld (ws+1361), a
_053d:
	ld a, (ws+1361)
	cp 4
	ret z
	ld hl, (ws+1359)
	ld de,16
	add hl,de
	ex de,hl
	ld a, (ws+1361)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1362), hl
	ld a,h
	or l
	jp z,    _0547
	ld hl, (ws+1359)
	push hl
	ld a, (ws+1361)
	push af
	ld hl, (ws+1362)
	call f213_EmitterDeclareWorkspace
_0547:
	ld a, (ws+1361)
	inc a
	ld (ws+1361), a
	jp    _053d

_c268:
	db 32,97,110,100,32,0
_c269:
	db 32,97,114,101,32,110,111,116,32,99,111,109,112,97,116,105,98,108,101,32,105,110,32,116,104,105,115,32,99,111,110,116
db 101,120,116,0


	; expr_i_cant_do_that workspace at ws+1389 length ws+4
f281_expr_i_cant_do_that:
	ld (ws+1391), hl
	pop bc
	pop hl
	ld (ws+1389), hl
	push bc
	call f80_StartError
	ld ix, (ws+1389)
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
	ld hl,   _c268
	call f9_print
	ld ix, (ws+1391)
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
	ld hl,   _c269
	call f9_print
	jp f81_EndError


_c270:
	db 116,121,112,101,32,109,105,115,109,97,116,99,104,58,32,101,120,112,114,101,115,115,105,111,110,32,119,97,115,32,97
db 32,0
_c271:
	db 44,32,117,115,101,100,32,119,104,101,110,32,97,32,0
_c272:
	db 32,119,97,115,32,101,120,112,101,99,116,101,100,0
_c273:
	db 32,99,97,110,110,111,116,32,98,101,32,117,115,101,100,32,104,101,114,101,0


	; CheckExpressionType workspace at ws+1380 length ws+5
f282_CheckExpressionType:
	ld (ws+1382), hl
	pop bc
	pop hl
	ld (ws+1380), hl
	push bc
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp nz,    _054c
	ld hl, (ws+1382)
	ld ix, (ws+1380)
	ld (ix+7), l
	ld (ix+8), h
_054c:
	ld ix, (ws+1380)
	ld e, (ix+7)
	ld d, (ix+8)
	ld hl, (ws+1382)
	and a
	sbc hl,de
	jp z,    _0551
	call f80_StartError
	ld hl,   _c270
	call f9_print
	ld ix, (ws+1380)
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
	ld hl,   _c271
	call f9_print
	ld ix, (ws+1382)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,   _c272
	call f9_print
	call f81_EndError
_0551:
	ld hl, (ws+1382)
	call f241_IsScalar
	or a
	ret nz
	call f80_StartError
	ld ix, (ws+1382)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,   _c273
	call f9_print
	jp f81_EndError


_c274:
	db 108,104,115,46,116,121,112,101,61,0
_c275:
	db 114,104,115,46,116,121,112,101,61,0
_c276:
	db 99,97,110,110,111,116,32,117,115,101,32,97,110,32,117,110,116,121,112,101,100,32,99,111,110,115,116,97,110,116,32
db 105,110,32,116,104,105,115,32,99,111,110,116,101,120,116,0
_c277:
	db 112,111,105,110,116,101,114,115,32,109,97,121,32,111,110,108,121,32,97,112,112,101,97,114,32,111,110,32,116,104,101
db 32,76,72,83,32,111,102,32,97,110,32,97,100,100,105,116,105,111,110,32,111,114,32,115,117,98,116,114,97,99,116,105,111,110,0


	; ResolveUntypedConstantsForAddOrSub workspace at ws+1375 length ws+8
f283_ResolveUntypedConstantsFor:        
	ld (ws+1377), hl
	pop bc
	pop hl
	ld (ws+1375), hl
	push bc
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp z,    _055d
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp nz,    _055d
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
	or a
	jp z,    _0563
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1377)
	ld (ix+7), l
	ld (ix+8), h
	jp    _055f
_0563:
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	or a
	jp z,    _0567
	ld hl, (ws+555)
	ld ix, (ws+1377)
	ld (ix+7), l
	ld (ix+8), h
	jp    _055f
_0567:
	ld hl,   _c274
	call f9_print
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	call fxx_print_hex_i16
	call f10_print_nl
	ld hl,   _c275
	call f9_print
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	call fxx_print_hex_i16
	call f10_print_nl
	ld hl,   _c276
	call f82_SimpleError
_055f:
_055d:
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	ret nz
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	ret z
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
	or a
	jp z,    _0574
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1375)
	ld (ix+7), l
	ld (ix+8), h
	ret
_0574:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	or a
	ret z
	ld hl,   _c277
	jp f82_SimpleError



	; ResolveUntypedConstantsSimply workspace at ws+1381 length ws+8
f284_ResolveUntypedConstantsSim:   
	ld (ws+1383), hl
	pop bc
	pop hl
	ld (ws+1381), hl
	push bc
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1385), hl
	ld ix, (ws+1383)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1387), hl
	ld hl, (ws+1385)
	ld a,h
	or l
	jp z,    _057f
	ld hl, (ws+1387)
	ld a,h
	or l
	jp nz,    _057f
	ld hl, (ws+1385)
	ld ix, (ws+1383)
	ld (ix+7), l
	ld (ix+8), h
	ret
_057f:
	ld hl, (ws+1385)
	ld a,h
	or l
	jp nz,    _0586
	ld hl, (ws+1387)
	ld a,h
	or l
	jp z,    _0586
	ld hl, (ws+1387)
	ld ix, (ws+1381)
	ld (ix+7), l
	ld (ix+8), h
	ret
_0586:
	ld de, (ws+1385)
	ld hl, (ws+1387)
	and a
	sbc hl,de
	ret z
	ld hl, (ws+1381)
	push hl
	ld hl, (ws+1383)
	call f281_expr_i_cant_do_that
	ret

_c278:
	db 110,117,109,98,101,114,32,114,101,113,117,105,114,101,100,0


	; CheckNumber workspace at ws+1374 length ws+3
f285_CheckNumber:
	ld (ws+1374), hl
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
	or a
	ret nz
	ld hl,   _c278
	jp f82_SimpleError


	; ResolveUntypedConstantsNeedingNumbers workspace at ws+1370 length ws+4
f286_ResolveUntypedConstantsNee:           
	ld (ws+1372), hl
	pop bc
	pop hl
	ld (ws+1370), hl
	push bc
	push hl
	ld hl, (ws+1372)
	call f284_ResolveUntypedConstantsSim;ly
	ld hl, (ws+1370)
	call f285_CheckNumber
	ld hl, (ws+1372)
	jp f285_CheckNumber


	; CondSimple workspace at ws+1377 length ws+4
f287_CondSimple:
	ld (ws+1379), hl
	pop bc
	pop hl
	ld (ws+1377), hl
	push bc
	push hl
	ld hl, (ws+1379)
	call f284_ResolveUntypedConstantsSim;ly
	ld ix, (ws+1377)
	ld e, (ix+7)
	ld d, (ix+8)
	ld ix, (ws+1379)
	ld l, (ix+7)
	ld h, (ix+8)
	and a
	sbc hl,de
	ret z
	ld hl, (ws+1377)
	push hl
	ld hl, (ws+1379)
	call f281_expr_i_cant_do_that
	ret


	; Expr1Simple workspace at ws+1355 length ws+8
f288_Expr1Simple:
	ld (ws+1356), hl
	pop bc
	pop af
	ld (ws+1355), a
	push bc
	call f172_NodeWidth
	ld (ws+1360), a
	ld a, (ws+1355)
	push af
	ld a, (ws+1360)
	push af
	ld hl, (ws+1356)
	call f180_MidC1Op
	ld (ws+1358), hl
	ld ix, (ws+1356)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1358)
	ld (ix+7), l
	ld (ix+8), h
	ld hl, (ws+1358)
	ret


	; cant_add_that workspace at ws+1372 length ws+0
f290_cant_add_that:
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	call f281_expr_i_cant_do_that
	ret


	; ExprAdd workspace at ws+1355 length ws+17
f289_ExprAdd:
	ld (ws+1357), hl
	pop bc
	pop hl
	ld (ws+1355), hl
	push bc
	push hl
	ld hl, (ws+1357)
	call f283_ResolveUntypedConstantsFor;ddOrSub
	ld ix, (ws+1355)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1361), hl
	ld ix, (ws+1357)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1363), hl
	ld hl, (ws+1361)
	call f74_IsPtr
	or a
	jp z,    _059a
	ld hl, (ws+1363)
	call f74_IsPtr
	or a
	jp nz,    _05a0
	ld de, (ws+1363)
	ld hl, (ws+555)
	and a
	sbc hl,de
_05a0:
	call nz, f290_cant_add_that
	jp    _0596
_059a:
	ld hl, (ws+1363)
	call f74_IsPtr
	or a
	jp z,    _05a6
	call f290_cant_add_that
	jp    _0596
_05a6:
	ld hl, (ws+1361)
	call f74_IsPtr
	or a
	jp nz,    _05ac
	ld de, (ws+1361)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	call nz, f290_cant_add_that
_05ac:
_0596:
	ld hl, (ws+1355)
	call f172_NodeWidth
	ld h,156
	push hl
	push af
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	call f183_MidC2Op
	ld (ws+1359), hl
	ld hl, (ws+1361)
	ld ix, (ws+1359)
	ld (ix+7), l
	ld (ix+8), h
	ld hl, (ws+1359)
	ret


	; cant_sub_that workspace at ws+1375 length ws+0
f292_cant_sub_that:
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	call f281_expr_i_cant_do_that
	ret


	; ExprSub workspace at ws+1355 length ws+20
f291_ExprSub:
	ld (ws+1357), hl
	pop bc
	pop hl
	ld (ws+1355), hl
	push bc
	push hl
	ld hl, (ws+1357)
	call f283_ResolveUntypedConstantsFor;ddOrSub
	ld ix, (ws+1355)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1361), hl
	ld ix, (ws+1357)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1363), hl
	ld hl, (ws+1361)
	call f74_IsPtr
	ld (ws+1365), a
	ld hl, (ws+1363)
	call f74_IsPtr
	ld (ws+1366), a
	ld a, (ws+1365)
	or a
	jp z,    _05b6
	ld a, (ws+1366)
	or a
	jp nz,    _05b6
	ld de, (ws+1363)
	ld hl, (ws+555)
	and a
	sbc hl,de
	jp z,    _05b6
	call f292_cant_sub_that
	jp    _05ae
_05b6:
	ld hl, (ws+1361)
	call f239_IsNum
	ld (ws+1367), a
	ld hl, (ws+1363)
	call f74_IsPtr
	ld (ws+1368), a
	ld a, (ws+1367)
	or a
	jp z,    _05be
	ld a, (ws+1368)
	or a
	jp z,    _05be
	call f292_cant_sub_that
	jp    _05ae
_05be:
	ld hl, (ws+1361)
	call f239_IsNum
	ld (ws+1369), a
	ld hl, (ws+1363)
	call f239_IsNum
	ld (ws+1370), a
	ld a, (ws+1369)
	or a
	jp z,    _05c7
	ld a, (ws+1370)
	or a
	jp z,    _05c7
	ld de, (ws+1361)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	call nz, f292_cant_sub_that
_05c7:
_05ae:
	ld hl, (ws+1355)
	call f172_NodeWidth
	ld b,131
	push bc
	push af
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	call f183_MidC2Op
	ld (ws+1359), hl
	ld hl, (ws+1361)
	call f74_IsPtr
	or a
	jp z,    _05d0
	ld de, (ws+1361)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	jp nz,    _05d0
	ld hl, (ws+555)
	ld ix, (ws+1359)
	ld (ix+7), l
	ld (ix+8), h
	jp    _05ca
_05d0:
	ld hl, (ws+1361)
	ld ix, (ws+1359)
	ld (ix+7), l
	ld (ix+8), h
_05ca:
	ld hl, (ws+1359)
	ret


	; Expr2Simple workspace at ws+1355 length ws+15
f293_Expr2Simple:
	ld (ws+1359), hl
	pop bc
	pop hl
	ld (ws+1357), hl
	pop af
	ld (ws+1356), a
	pop af
	ld (ws+1355), a
	push bc
	push hl
	ld hl, (ws+1359)
	call f286_ResolveUntypedConstantsNee;ingNumbers
	ld a, (ws+1356)
	ld (ws+1363), a
	ld ix, (ws+1357)
	ld l, (ix+7)
	ld h, (ix+8)
	call f240_IsSNum
	or a
	jp z,    _05d6
	ld a, (ws+1355)
	ld (ws+1363), a
_05d6:
	ld ix, (ws+1357)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1365), hl
	push ix
	pop hl
	call f172_NodeWidth
	ld (ws+1367), a
	ld a, (ws+1363)
	push af
	ld a, (ws+1367)
	push af
	ld hl, (ws+1357)
	push hl
	ld hl, (ws+1359)
	call f183_MidC2Op
	ld (ws+1361), hl
	ld hl, (ws+1365)
	ld ix, (ws+1361)
	ld (ix+7), l
	ld (ix+8), h
	ld hl, (ws+1361)
	ret

_c279:
	db 76,72,83,32,111,102,32,115,104,105,102,116,32,99,97,110,32,111,110,108,121,32,98,101,32,99,111,110,115,116,97,110
db 116,32,105,102,32,116,104,101,32,82,72,83,32,105,115,32,97,108,115,111,32,99,111,110,115,116,97,110,116,0


	; expr_i_checkrhsconst workspace at ws+1374 length ws+2
f294_expr_i_checkrhsconst:
	ld (ws+1374), hl
	push hl
	pop ix
	ld a, (ix+13)
	cp 40
	ret z
	ld hl,   _c279
	jp f82_SimpleError


_c280:
	db 110,117,109,98,101,114,32,114,101,113,117,105,114,101,100,32,111,110,32,76,72,83,32,111,102,32,115,104,105,102,116
db 0


	; expr_i_checkshift workspace at ws+1374 length ws+5
f295_expr_i_checkshift:
	ld (ws+1376), hl
	pop bc
	pop hl
	ld (ws+1374), hl
	push bc
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
	or a
	jp nz,    _05e0
	ld hl,   _c280
	call f82_SimpleError
_05e0:
	ld hl, (ws+1376)
	push hl
	ld hl, (ws+551)
	call f282_CheckExpressionType
	ret


	; ExprShift workspace at ws+1355 length ws+19
f296_ExprShift:
	ld (ws+1359), hl
	pop bc
	pop hl
	ld (ws+1357), hl
	pop af
	ld (ws+1356), a
	pop af
	ld (ws+1355), a
	push bc
	ld a, (ws+1356)
	ld (ws+1363), a
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	call f240_IsSNum
	or a
	jp z,    _05e5
	ld a, (ws+1355)
	ld (ws+1363), a
_05e5:
	ld ix, (ws+1357)
	ld a, (ix+13)
	cp 40
	jp nz,    _05ea
	ld hl, (ws+1359)
	call f294_expr_i_checkrhsconst
	ld a, (ws+1363)
	push af
	ld hl, (ws+1357)
	push hl
	ld hl, (ws+1359)
	call f176_FoldConstant2
	ld (ws+1365), hl
	exx
	ld (ws+1367), hl
	exx
	ld de, (ws+1365)
	exx
	ld de, (ws+1367)
	exx
	ld hl, (ws+1357)
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
	ld hl, (ws+1357)
	ld (ws+1361), hl
	ld hl, (ws+1359)
	call f69_Discard
	jp end_f296_ExprShift
_05ea:
	ld hl, (ws+1357)
	push hl
	ld hl, (ws+1359)
	call f295_expr_i_checkshift
	ld ix, (ws+1357)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1369), hl
	push ix
	pop hl
	call f172_NodeWidth
	ld (ws+1371), a
	ld a, (ws+1363)
	push af
	ld a, (ws+1371)
	push af
	ld hl, (ws+1357)
	push hl
	ld hl, (ws+1359)
	call f183_MidC2Op
	ld (ws+1361), hl
	ld hl, (ws+1369)
	ld ix, (ws+1361)
	ld (ix+7), l
	ld (ix+8), h
end_f296_ExprShift:
	ld hl, (ws+1361)
	ret

_c281:
	db 110,111,100,101,32,115,116,97,99,107,32,111,118,101,114,102,108,111,119,0


	; PushNode workspace at ws+1425 length ws+2
f66_PushNode:
	ld (ws+1425), hl
	ld a,h
	or l
	ret z
	ld de, (ws+64)
	ld hl,ws+64
	and a
	sbc hl,de
	jp nz,    _05f4
	ld hl,   _c281
	call f82_SimpleError
_05f4:
	ld de, (ws+1425)
	ld hl, (ws+64)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+64)
	inc hl
	inc hl
	ld (ws+64), hl
	ret


	; PopNode workspace at ws+1425 length ws+2
f67_PopNode:
	ld hl, (ws+64)
	dec hl
	dec hl
	ld (ws+64), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ret


	; NextNode workspace at ws+1421 length ws+4
f68_NextNode:
	call f67_PopNode
	ld (ws+1421), hl
	ld a,h
	or l
	jp z,    _05f9
	ld ix, (ws+1421)
	ld l, (ix+9)
	ld h, (ix+10)
	call f66_PushNode
	ld ix, (ws+1421)
	ld l, (ix+11)
	ld h, (ix+12)
	call f66_PushNode
_05f9:
	ld hl, (ws+1421)
	ret


	; Discard workspace at ws+1413 length ws+8
f69_Discard:
	ld (ws+1413), hl
	ld hl, (ws+64)
	ld (ws+1415), hl
	ld hl, (ws+1413)
	call f66_PushNode
_05fa:
	ld de, (ws+64)
	ld hl, (ws+1415)
	and a
	sbc hl,de
	ret z
	call f68_NextNode
	call f171_FreeNode
	jp    _05fa

_c409:
	db 107,66,32,102,114,101,101,10,0

	; PrintFreeMemory workspace at ws+1294 length ws+2
f459_PrintFreeMemory:
	call f41_GetFreeMemory
	ld (ws+1294), hl
	ld a,10
	call f466__lsr2
	call f16_print_i16
	ld hl,   _c409
	jp f9_print


_c410:
	db 115,121,110,116,97,120,32,101,114,114,111,114,58,32,99,111,119,102,101,32,91,45,73,112,97,116,104,93,32,60,105,110
db 102,105,108,101,62,32,60,111,117,116,102,105,108,101,62,10,0


	; SyntaxError workspace at ws+1298 length ws+0
f460_SyntaxError:
	ld hl,   _c410
	call f9_print
	jp f4_ExitWithError


	; ParseArguments workspace at ws+1294 length ws+4
f461_ParseArguments:
	call f27_ArgvInit
_080d:
	call f28_ArgvNext
	ld (ws+1296), hl
	ld a,h
	or l
	jp nz,    _0813
	jp    _080e
_0813:
	ld hl, (ws+1296)
	ld a,(hl)
	cp 45
	jp nz,    _0818
	ld hl, (ws+1296)
	inc hl
	ld (ws+1296), hl
	ld a,(hl)
	cp 73
	jp nz,    _081d
	ld hl, (ws+1296)
	inc hl
	ld (ws+1296), hl
	call f83_LexerAddIncludePath
	jp    _080d
_081d:
	call f460_SyntaxError
	jp    _080d
_0818:
	ld hl, (ws+8)
	ld a,h
	or l
	jp nz,    _0822
	ld hl, (ws+1296)
	ld (ws+8), hl
	jp    _080d
_0822:
	ld hl, (ws+10)
	ld a,h
	or l
	jp nz,    _0826
	ld hl, (ws+1296)
	ld (ws+10), hl
	jp    _080d
_0826:
	call f460_SyntaxError
	jp    _080d
_080e:
	ld hl, (ws+8)
	ld a,h
	or l
	jp z,    f460_SyntaxError
	ld hl, (ws+10)
	ld a,h
	or l
	ret nz
	jp f460_SyntaxError
