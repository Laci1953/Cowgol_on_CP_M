	; NodeWidth workspace at ws+1377 length ws+3
f172_NodeWidth::
	ld (ws+1377), hl
	xor a
	ld (ws+1379), a
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp z, c01_02c5
;c01_02c4:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld de,11
	add hl,de
	ld a,(hl)
	ld (ws+1379), a
c01_02c5:
;c01_02c1:
;end_f172_NodeWidth:
	ld a, (ws+1379)
	ret


c01_c251:
	db 98,97,100,32,102,111,108,100,0

	; midcodec_i_bad_fold workspace at ws+1433 length ws+0
f173_midcodec_i_bad_fold::
	ld hl,c01_c251
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f173_midcodec_i_bad_fold:
;	ret


	; FoldConstant1 workspace at ws+1376 length ws+11
f174_FoldConstant1::
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
	jp nz, c01_02c7
	ld hl, (ws+1383)
	exx
	ld hl, (ws+1385)
	exx
	call f487__not4
	ld (ws+1379), hl
	exx
	ld (ws+1381), hl
	exx
	jp c01_02c6
c01_02c7:
	cp 111
	jp nz, c01_02c8
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
	jp c01_02c6
c01_02c8:
	call f173_midcodec_i_bad_fold
c01_02c6:
;end_f174_FoldConstant1:
	ld hl, (ws+1379)
	exx
	ld hl, (ws+1381)
	exx
	ret


	; FoldConstant2 workspace at ws+1416 length ws+17
f176_FoldConstant2::
	ld (ws+1419), hl
	pop bc
	pop hl
	ld (ws+1417), hl
	pop af
	ld (ws+1416), a
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
	ld (ws+1425), de
	exx
	ld (ws+1427), de
	exx
	ld hl, (ws+1419)
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
	ld (ws+1429), de
	exx
	ld (ws+1431), de
	exx
	cp 156
	jp nz, c01_02ca
	ld de, (ws+1425)
	exx
	ld de, (ws+1427)
	exx
	ld hl, (ws+1429)
	exx
	ld hl, (ws+1431)
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+1421), hl
	exx
	ld (ws+1423), hl
	exx
	jp c01_02c9
c01_02ca:
	cp 131
	jp nz, c01_02cb
	ld hl, (ws+1425)
	exx
	ld hl, (ws+1427)
	exx
	ld de, (ws+1429)
	exx
	ld de, (ws+1431)
	exx
	and a
	sbc hl,de
	exx
	sbc hl,de
	exx
	ld (ws+1421), hl
	exx
	ld (ws+1423), hl
	exx
	jp c01_02c9
c01_02cb:
	cp 161
	jp nz, c01_02cc
	ld bc, (ws+1425)
	exx
	ld bc, (ws+1427)
	exx
	ld de, (ws+1429)
	exx
	ld de, (ws+1431)
	exx
	call f477__mul4
	ld (ws+1421), hl
	exx
	ld (ws+1423), hl
	exx
	jp c01_02c9
c01_02cc:
	cp 136
	jp nz, c01_02cd
	ld bc, (ws+1425)
	exx
	ld bc, (ws+1427)
	exx
	ld de, (ws+1429)
	exx
	ld de, (ws+1431)
	exx
	call f482__dvrmu4
	ld (ws+1421), bc
	exx
	ld (ws+1423), bc
	exx
	jp c01_02c9
c01_02cd:
	cp 141
	jp nz, c01_02ce
	ld bc, (ws+1425)
	exx
	ld bc, (ws+1427)
	exx
	ld de, (ws+1429)
	exx
	ld de, (ws+1431)
	exx
	call f483__dvrms4
	ld (ws+1421), bc
	exx
	ld (ws+1423), bc
	exx
	jp c01_02c9
c01_02ce:
	cp 146
	jp nz, c01_02cf
	ld bc, (ws+1425)
	exx
	ld bc, (ws+1427)
	exx
	ld de, (ws+1429)
	exx
	ld de, (ws+1431)
	exx
	call f482__dvrmu4
	ld (ws+1421), hl
	exx
	ld (ws+1423), hl
	exx
	jp c01_02c9
c01_02cf:
	cp 151
	jp nz, c01_02d0
	ld bc, (ws+1425)
	exx
	ld bc, (ws+1427)
	exx
	ld de, (ws+1429)
	exx
	ld de, (ws+1431)
	exx
	call f483__dvrms4
	ld (ws+1421), de
	exx
	ld (ws+1423), de
	exx
	jp c01_02c9
c01_02d0:
	cp 166
	jp nz, c01_02d1
	ld de, (ws+1425)
	exx
	ld de, (ws+1427)
	exx
	ld hl, (ws+1429)
	exx
	ld hl, (ws+1431)
	exx
	call f484__and4
	ld (ws+1421), hl
	exx
	ld (ws+1423), hl
	exx
	jp c01_02c9
c01_02d1:
	cp 171
	jp nz, c01_02d2
	ld de, (ws+1425)
	exx
	ld de, (ws+1427)
	exx
	ld hl, (ws+1429)
	exx
	ld hl, (ws+1431)
	exx
	call f485__or4
	ld (ws+1421), hl
	exx
	ld (ws+1423), hl
	exx
	jp c01_02c9
c01_02d2:
	cp 176
	jp nz, c01_02d3
	ld de, (ws+1425)
	exx
	ld de, (ws+1427)
	exx
	ld hl, (ws+1429)
	exx
	ld hl, (ws+1431)
	exx
	call f486__eor4
	ld (ws+1421), hl
	exx
	ld (ws+1423), hl
	exx
	jp c01_02c9
c01_02d3:
	cp 116
	jp nz, c01_02d4
	ld hl, (ws+1425)
	exx
	ld hl, (ws+1427)
	exx
	ld a, (ws+1429)
	call f473__asl4
	ld (ws+1421), hl
	exx
	ld (ws+1423), hl
	exx
	jp c01_02c9
c01_02d4:
	cp 121
	jp nz, c01_02d5
	ld hl, (ws+1425)
	exx
	ld hl, (ws+1427)
	exx
	ld a, (ws+1429)
	call f472__lsr4
	ld (ws+1421), hl
	exx
	ld (ws+1423), hl
	exx
	jp c01_02c9
c01_02d5:
	cp 126
	jp nz, c01_02d6
	ld hl, (ws+1425)
	exx
	ld hl, (ws+1427)
	exx
	ld a, (ws+1429)
	call f474__asr4
	ld (ws+1421), hl
	exx
	ld (ws+1423), hl
	exx
	jp c01_02c9
c01_02d6:
	call f173_midcodec_i_bad_fold
c01_02c9:
;end_f176_FoldConstant2:
	ld hl, (ws+1421)
	exx
	ld hl, (ws+1423)
	exx
	ret


	; MidC1Op workspace at ws+1363 length ws+13
f180_MidC1Op::
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
	jp nz, c01_02db
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
	jp c01_02d7
c01_02db:
	ld a, (ws+1364)
	call f108_WidthToIndex
	ld (ws+1373), a
	ld a, (ws+1363)
	ld b,a
	ld a, (ws+1373)
	add a,b
	call f109_AllocateNewNode
;	ld (ws+1374), hl
	ld (ws+1367), hl
	ld hl, (ws+1365)
	ld ix, (ws+1367)
	ld (ix+9), l
	ld (ix+10), h
c01_02d7:
;end_f180_MidC1Op:
	ld hl, (ws+1367)
	ret


	; GetPowerOfTwo workspace at ws+1416 length ws+5
f181_GetPowerOfTwo::
	ld (ws+1416), hl
	exx
	ld (ws+1418), hl
	exx
	xor a
	ld (ws+1420), a
	and a
	sbc hl,hl
	exx
	sbc hl,hl
	exx
	ld de, (ws+1416)
	exx
	ld de, (ws+1418)
	exx
	call f490__cmps4
	jp p, c01_02e2
;c01_02e3:
	ld bc, (ws+1416)
	exx
	ld bc, (ws+1418)
	exx
	ld d,b
	ld e,c
	exx
	ld de, (ws+1418)
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
	call f484__and4
	ld a,h
	or l
	exx
	or h
	or l
	exx
	jp nz, c01_02e2
;c01_02e1:
c01_02e4:
	ld hl, (ws+1416)
	exx
	ld hl, (ws+1418)
	exx
	ld a,h
	or l
	exx
	or h
	or l
	exx
	jp z, c01_02e9
;c01_02e8:
	ld a, (ws+1420)
	inc a
	ld (ws+1420), a
	ld hl, (ws+1416)
	exx
	ld hl, (ws+1418)
	exx
	ld a,1
	call f474__asr4
	ld (ws+1416), hl
	exx
	ld (ws+1418), hl
	exx
	jp c01_02e4
c01_02e9:
c01_02e2:
;c01_02dc:
;end_f181_GetPowerOfTwo:
	ld a, (ws+1420)
	ret


	; MidC2Op workspace at ws+1380 length ws+36
f183_MidC2Op::
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
	jp nz, c01_02f0
;c01_02f1:
	ld ix, (ws+1384)
	ld a, (ix+13)
	cp 40
	jp nz, c01_02f0
;c01_02ef:
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
c01_02f0:
;c01_02ea:
	ld a, (ws+1380)
	cp 156
	jp c, c01_02f6
;c01_02f5:
	ld ix, (ws+1382)
	ld a, (ix+13)
	cp 40
	jp nz, c01_02fb
	ld hl, (ws+1382)
	ld (ws+1388), hl
	ld hl, (ws+1384)
	ld (ws+1382), hl
	ld hl, (ws+1388)
	ld (ws+1384), hl
c01_02fb:
;c01_02f7:
	ld ix, (ws+1384)
	ld a, (ix+13)
	cp 40
	jp nz, c01_0306
;c01_0309:
	ld ix, (ws+1382)
	ld b, (ix+13)
	ld a, (ws+1380)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_0306
;c01_0308:
	ld a, (ws+1380)
	add 4
	ld ix, (ws+1382)
	ld b, (ix+13)
	cp b
	jp c, c01_0306
;c01_0307:
	ld ix, (ws+1382)
	ld l, (ix+11)
	ld h, (ix+12)
	push hl
	pop ix
	ld a, (ix+13)
	cp 40
	jp nz, c01_0306
;c01_0305:
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
	call f166_MidConstant
;	ld (ws+1394), hl
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
c01_0306:
;c01_02fc:
c01_02f6:
;c01_02f2:
	ld ix, (ws+1382)
	ld a, (ix+13)
	cp 40
	jp z, c01_0310
;c01_0311:
	ld ix, (ws+1384)
	ld a, (ix+13)
	cp 40
	jp nz, c01_0310
;c01_030f:
	ld a, (ws+1380)
	cp 161
	jp z, c01_0319
;c01_031c:
	ld a, (ws+1380)
	cp 141
	jp z, c01_0319
;c01_031b:
	ld a, (ws+1380)
	cp 136
	jp nz, c01_031a
c01_0319:
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
	ld (ws+1400), a
	ld (ws+1401), a
	or a
	jp z, c01_0321
;c01_0320:
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
	call f166_MidConstant
;	ld (ws+1402), hl
	ld (ws+1384), hl
	ld a, (ws+1380)
	cp 161
	jp nz, c01_0323
	ld a,116
	ld (ws+1380), a
	jp c01_0322
c01_0323:
	cp 141
	jp nz, c01_0324
	ld a,126
	ld (ws+1380), a
	jp c01_0322
c01_0324:
	cp 136
	jp nz, c01_0325
	ld a,121
	ld (ws+1380), a
c01_0325:
c01_0322:
c01_0321:
;c01_031d:
c01_031a:
;c01_0312:
	ld a, (ws+1380)
	cp 146
	jp nz, c01_032a
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
;	ld (ws+1404), a
	ld (ws+1401), a
	or a
	jp z, c01_032f
;c01_032e:
	ld hl, (ws+1384)
	call f69_Discard
	ld de, (ws+1396)
	exx
	ld de, (ws+1398)
	exx
	ld hl,65535
	exx
	ld hl,65535
	exx
	add hl,de
	exx
	adc hl,de
	exx
	call f166_MidConstant
;	ld (ws+1405), hl
	ld (ws+1384), hl
	ld a,166
	ld (ws+1380), a
c01_032f:
;c01_032b:
c01_032a:
;c01_0326:
	ld a, (ws+1380)
	cp 116
	jp z, c01_0337
;c01_033a:
	ld a, (ws+1380)
	cp 121
	jp z, c01_0337
;c01_0339:
	ld a, (ws+1380)
	cp 126
	jp nz, c01_0338
c01_0337:
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
	jp nz, c01_033f
	ld hl, (ws+1384)
	call f69_Discard
	ld hl, (ws+1382)
	ld (ws+1386), hl
	jp end_f183_MidC2Op
c01_033f:
;c01_033b:
c01_0338:
;c01_0330:
	ld a, (ws+1380)
	cp 156
	jp z, c01_0345
;c01_0347:
	ld a, (ws+1380)
	cp 131
	jp nz, c01_0346
c01_0345:
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
	jp nz, c01_034c
	ld hl, (ws+1384)
	call f69_Discard
	ld hl, (ws+1382)
	ld (ws+1386), hl
	jp end_f183_MidC2Op
c01_034c:
;c01_0348:
	ld ix, (ws+1382)
	ld a, (ix+13)
	cp 42
	jp nz, c01_0351
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
	ld (ws+1407), hl
	ld a, (ws+1380)
	cp 156
	jp nz, c01_0353
	ld hl, (ws+1382)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1407)
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
c01_0353:
	cp 131
	jp nz, c01_0354
	ld hl, (ws+1382)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld de, (ws+1407)
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
c01_0354:
;c01_0352:
c01_0351:
;c01_034d:
c01_0346:
;c01_0340:
c01_0310:
;c01_030a:
	ld ix, (ws+1382)
	ld a, (ix+13)
	cp 40
	jp nz, c01_035b
;c01_035c:
	ld ix, (ws+1384)
	ld a, (ix+13)
	cp 40
	jp nz, c01_035b
;c01_035a:
	ld a, (ws+1380)
	push af
	ld hl, (ws+1382)
	push hl
	ld hl, (ws+1384)
	call f176_FoldConstant2
	ld (ws+1409), hl
	exx
	ld (ws+1411), hl
	exx
	ld de, (ws+1409)
	exx
	ld de, (ws+1411)
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
c01_035b:
;c01_0355:
	ld a, (ws+1381)
	call f108_WidthToIndex
	ld (ws+1413), a
	ld a, (ws+1380)
	ld b,a
	ld a, (ws+1413)
	add a,b
	call f109_AllocateNewNode
;	ld (ws+1414), hl
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
f184_MidCCast::
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
	jp nz, c01_0361
	ld hl, (ws+1381)
	ld (ws+1384), hl
	jp end_f184_MidCCast
c01_0361:
;c01_035d:
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
	jp nz, c01_0366
	ld hl, (ws+1381)
	ld (ws+1384), hl
	jp c01_0362
c01_0366:
	ld a, (ws+1386)
	cp 1
	jp nz, c01_0368
	ld a,86
	ld (ws+1387), a
	jp c01_0367
c01_0368:
	cp 2
	jp nz, c01_0369
	ld a,91
	ld (ws+1387), a
	jp c01_0367
c01_0369:
	cp 4
	jp nz, c01_036a
	ld a,96
	ld (ws+1387), a
	jp c01_0367
c01_036a:
	cp 8
	jp nz, c01_036b
	ld a,101
	ld (ws+1387), a
c01_036b:
c01_0367:
	ld a, (ws+1380)
	call f108_WidthToIndex
	ld (ws+1388), a
	ld a, (ws+1387)
	ld b,a
	ld a, (ws+1388)
	add a,b
	call f109_AllocateNewNode
;	ld (ws+1389), hl
	ld (ws+1384), hl
	ld hl, (ws+1381)
	ld ix, (ws+1384)
	ld (ix+9), l
	ld (ix+10), h
	ld a, (ws+1383)
	push ix
	pop hl
	ld (hl),a
c01_0362:
end_f184_MidCCast:
	ld hl, (ws+1384)
	ret


	; E_b8 workspace at ws+1415 length ws+1
f185_E_b8::
	ld (ws+1415), a
	ld bc,ws+377
	push bc
	call f62_FCBPutChar
;end_f185_E_b8:
	ret


	; E_b16 workspace at ws+1412 length ws+2
f186_E_b16::
	ld (ws+1412), hl
	ld a, (ws+1412)
	call f185_E_b8
	ld hl, (ws+1412)
	ld a,8
	call f469__lsr2
	ld a,l
	jp   f185_E_b8 ;	call f185_E_b8
;end_f186_E_b16:
;	ret


	; E_b32 workspace at ws+1408 length ws+4
f187_E_b32::
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
	call f472__lsr4
	jp   f186_E_b16 ;	call f186_E_b16
;end_f187_E_b32:
;	ret


	; E_bsize workspace at ws+1408 length ws+2
f188_E_bsize::
	ld (ws+1408), hl
	jp   f186_E_b16 ;	call f186_E_b16
;end_f188_E_bsize:
;	ret


	; E workspace at ws+1412 length ws+3
f195_E::
	ld (ws+1412), hl
c01_036c:
	ld hl, (ws+1412)
	ld a,(hl)
	ld (ws+1414), a
	inc hl
	ld (ws+1412), hl
	or a
;	jp nz, c01_0372
;	jp c01_036d
;c01_0372:
	jp z,c01_036d
;c01_036e:
	ld a, (ws+1414)
	call f185_E_b8
	jp c01_036c
c01_036d:
;end_f195_E:
	ret


	; E_countedstring workspace at ws+1408 length ws+4
f196_E_countedstring::
	ld (ws+1408), hl
	call f32_StrLen
	ld (ws+1410), hl
	ld a, (ws+1410)
	call f185_E_b8
	ld hl, (ws+1408)
	jp   f195_E ;	call f195_E
;end_f196_E_countedstring:
;	ret
c01_c252:
	db 99,97,110,110,111,116,32,111,112,101,110,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterOpenfile workspace at ws+1294 length ws+3
f207_EmitterOpenfile::
	ld (ws+1294), hl
	ld bc,ws+377
	push bc
	call f52_FCBOpenOut
;	ld (ws+1296), a
	or a
	jp nz, c01_0392
				;check "-S"
	ld	a,(symbols)
	or	a
	ret	z
				;open "$SUBSYMS.$$$"
	ld	hl,FCBsubsyms
	push	hl
	ld	hl,subsyms_name
	call 	f_FCBOpenForAppend
	or	a
	ret 	z

c01_0392:
	ld hl,c01_c252
	call f82_SimpleError
;c01_0393:
;c01_038f:
;end_f207_EmitterOpenfile:
;	ret


c01_c253:
	db 99,97,110,110,111,116,32,99,108,111,115,101,32,111,117,116,112,117,116,32,102,105,108,101,0

	; EmitterClosefile workspace at ws+1294 length ws+1
f208_EmitterClosefile::
	ld a,69
	call f185_E_b8
	ld hl,ws+377
	call f53_FCBClose
;	ld (ws+1294), a
	or a
	jp z, c01_0398
;c01_0397:
	ld hl,c01_c253
	call f82_SimpleError
c01_0398:
;c01_0394:
;end_f208_EmitterClosefile:
	ret


	; EmitterDeclareSubroutine workspace at ws+1361 length ws+2
f209_EmitterDeclareSubroutine::
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
	jp   f196_E_countedstring ;	call f196_E_countedstring
;end_f209_EmitterDeclareSubrouti:  
;	ret


	; EmitterDeclareExternalSubroutine workspace at ws+1353 length ws+4
f210_EmitterDeclareExternalSubr::      
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
	call f196_E_countedstring
;end_f210_EmitterDeclareExternal:          
	ret


	; EmitterReferenceSubroutineById workspace at ws+1384 length ws+4
f211_EmitterReferenceSubroutine::    
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
	call f186_E_b16
;end_f211_EmitterReferenceSubrou:        
	ret


	; EmitterReferenceSubroutine workspace at ws+1380 length ws+4
f212_EmitterReferenceSubroutine::
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
;end_f212_EmitterReferenceSubrou:    
	ret


	; EmitterDeclareWorkspace workspace at ws+1364 length ws+5
f213_EmitterDeclareWorkspace::
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
	call f188_E_bsize
;end_f213_EmitterDeclareWorkspac: 
	ret


	; EmitParameterList workspace at ws+1362 length ws+2
f214_EmitParameterList::
	ld (ws+1362), hl
c01_0399:
	ld hl, (ws+1362)
	ld a,h
	or l
	jp z, c01_039e
;c01_039d:
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
	jp c01_0399
c01_039e:
;end_f214_EmitParameterList:
	ret


	; EmitterEmitInputParameters workspace at ws+1358 length ws+4
f215_EmitterEmitInputParameters::
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
;	ld (ws+1360), hl
	call f214_EmitParameterList
;end_f215_EmitterEmitInputParame:    
	ret


	; EmitterEmitOutputParameters workspace at ws+1358 length ws+4
f216_EmitterEmitOutputParameter:: 
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
;	ld (ws+1360), hl
	call f214_EmitParameterList
;end_f216_EmitterEmitOutputParam:     
	ret


	; EmitterEmitSubroutineFlags workspace at ws+1358 length ws+2
f217_EmitterEmitSubroutineFlags::
	ld (ws+1358), hl
	ld a,70
	call f185_E_b8
	ld ix, (ws+1358)
	ld l, (ix+14)
	ld h, (ix+15)
	call f186_E_b16
	ld ix, (ws+1358)
	ld a, (ix+28)
	jp   f185_E_b8 ;	call f185_E_b8
;end_f217_EmitterEmitSubroutineF:    
;	ret


	; LookupSymbolInNamespace workspace at ws+1388 length ws+7
f227_LookupSymbolInNamespace::
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
c01_0427:
	ld hl, (ws+1392)
	ld a,h
	or l
	jp z, c01_042c
;c01_042b:
	ld ix, (ws+1392)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+1390)
	call f29_StrCmp
;	ld (ws+1394), a
	or a
	jp nz, c01_0431
c01_0432:
	ld ix, (ws+1392)
	ld a, (ix+10)
	cp 39
	jp nz, c01_0437
	ld hl, (ws+1392)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1392), hl
	jp c01_0432
c01_0437:
	jp end_f227_LookupSymbolInNamespac;
c01_0431:
;c01_042d:
	ld ix, (ws+1392)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1392), hl
	jp c01_0427
c01_042c:
	ld ix,0
	ld (ws+1392), ix
end_f227_LookupSymbolInNamespac: 
	ld hl, (ws+1392)
	ret


	; LookupSymbol workspace at ws+1377 length ws+8
f228_LookupSymbol::
	ld (ws+1379), hl
	pop bc
	pop hl
	ld (ws+1377), hl
	push bc
	ld a,h
	or l
	jp nz, c01_043c
	ld hl, (ws+12)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+1377), hl
c01_043c:
;c01_0438:
c01_043d:
	ld hl, (ws+1377)
	ld a,h
	or l
	jp z, c01_0442
;c01_0441:
	ld hl, (ws+1377)
	push hl
	ld hl, (ws+1379)
	call f227_LookupSymbolInNamespace
;	ld (ws+1383), hl
	ld (ws+1381), hl
	ld a,h
	or l
	jp z, c01_0447
;c01_0446:
	jp end_f228_LookupSymbol
c01_0447:
;c01_0443:
	ld ix, (ws+1377)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1377), hl
	jp c01_043d
c01_0442:
	ld ix,0
	ld (ws+1381), ix
end_f228_LookupSymbol:
	ld hl, (ws+1381)
	ret


	; AddToNamespace workspace at ws+1398 length ws+4
f229_AddToNamespace::
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
	jp nz, c01_044c
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
	jp c01_0448
c01_044c:
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
c01_0448:
	ld hl, (ws+1398)
	ld ix, (ws+1400)
	ld (ix+6), l
	ld (ix+7), h
;end_f229_AddToNamespace:
	ret


c01_c254:
	db 115,121,109,98,111,108,32,39,0
c01_c255:
	db 39,32,105,115,32,97,108,114,101,97,100,121,32,100,101,102,105,110,101,100,0

	; AddSymbol workspace at ws+1378 length ws+10
f230_AddSymbol::
	ld (ws+1380), hl
	pop bc
	pop hl
	ld (ws+1378), hl
	push bc
	ld a,h
	or l
	jp nz, c01_0451
	ld hl, (ws+12)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+1378), hl
c01_0451:
;c01_044d:
	call f70_AllocNewSymbol
;	ld (ws+1384), hl
	ld (ws+1382), hl
	ld hl, (ws+1380)
	ld a,h
	or l
	jp z, c01_0456
;c01_0455:
	ld hl, (ws+1378)
	push hl
	ld hl, (ws+1380)
	call f227_LookupSymbolInNamespace
;	ld (ws+1386), hl
	ld a,h
	or l
	jp z, c01_045b
;c01_045a:
	call f80_StartError
	ld hl,c01_c254
	call f9_print
	ld hl, (ws+1380)
	call f9_print
	ld hl,c01_c255
	call f9_print
	call f81_EndError
c01_045b:
;c01_0457:
	ld hl, (ws+1380)
	ld ix, (ws+1382)
	ld (ix+4), l
	ld (ix+5), h
	ld hl, (ws+1378)
	push hl
	push ix
	pop hl
	call f229_AddToNamespace
c01_0456:
;c01_0452:
;end_f230_AddSymbol:
	ld hl, (ws+1382)
	ret


	; AddAlias workspace at ws+1357 length ws+10
f231_AddAlias::
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
;	ld (ws+1365), hl
	ld (ws+1363), hl
	push hl
	pop ix
	ld (ix+10), 39
	ld de, (ws+1361)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f231_AddAlias:
	ld hl, (ws+1363)
	ret


	; AddAliasString workspace at ws+1308 length ws+8
f232_AddAliasString::
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
;	ld (ws+1312), hl
;	ld (ws+1314), hl
;end_f232_AddAliasString:
	ret


c01_c256:
	db 39,0
c01_c257:
	db 39,32,105,115,32,97,32,112,97,114,116,105,97,108,32,116,121,112,101,0

	; CheckNotPartialType workspace at ws+1386 length ws+2
f233_CheckNotPartialType::
	ld (ws+1386), hl
	push hl
	pop ix
	ld a, (ix+15)
	cp 1
	jp nz, c01_0460
	call f80_StartError
	ld hl,c01_c256
	call f9_print
	ld ix, (ws+1386)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c257
	call f9_print
	call f81_EndError
c01_0460:
;c01_045c:
;end_f233_CheckNotPartialType:
	ret


	; AddTypeToNamespace workspace at ws+1388 length ws+10
f234_AddTypeToNamespace::
	ld (ws+1392), hl
	pop bc
	pop hl
	ld (ws+1390), hl
	pop hl
	ld (ws+1388), hl
	push bc
	call f70_AllocNewSymbol
;	ld (ws+1394), hl
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
;end_f234_AddTypeToNamespace:
	ret


	; MakeNumberType workspace at ws+1308 length ws+9
f235_MakeNumberType::
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
;	ld (ws+1315), hl
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
;end_f235_MakeNumberType:
	ld hl, (ws+1313)
	ret


	; IsTypeOfKind workspace at ws+1401 length ws+4
f236_IsTypeOfKind::
	ld (ws+1403), a
	pop bc
	pop hl
	ld (ws+1401), hl
	push bc
	xor a
	ld (ws+1404), a
	ld a,h
	or l
	jp z, c01_0467
;c01_0468:
	ld ix, (ws+1401)
	ld b, (ix+15)
	ld a, (ws+1403)
	cp b
	jp nz, c01_0467
;c01_0466:
	ld a,1
	ld (ws+1404), a
c01_0467:
;c01_0461:
;end_f236_IsTypeOfKind:
	ld a, (ws+1404)
	ret


	; IsArray workspace at ws+1380 length ws+4
f237_IsArray::
	ld (ws+1380), hl
	push hl
	ld a,4
	call f236_IsTypeOfKind
;	ld (ws+1383), a
;	ld (ws+1382), a
;end_f237_IsArray:
;	ld a, (ws+1382)
	ret


	; IsPtr workspace at ws+1397 length ws+4
f74_IsPtr::
	ld (ws+1397), hl
	push hl
	ld a,3
	call f236_IsTypeOfKind
;	ld (ws+1400), a
;	ld (ws+1399), a
;end_f74_IsPtr:
;	ld a, (ws+1399)
	ret


	; IsSubroutine workspace at ws+1396 length ws+4
f238_IsSubroutine::
	ld (ws+1396), hl
	push hl
	ld a,6
	call f236_IsTypeOfKind
;	ld (ws+1399), a
;	ld (ws+1398), a
;end_f238_IsSubroutine:
;	ld a, (ws+1398)
	ret


	; IsNum workspace at ws+1397 length ws+4
f239_IsNum::
	ld (ws+1397), hl
	ld a,h
	or l
	jp nz, c01_046d
	ld a,1
	ld (ws+1399), a
	jp c01_0469
c01_046d:
	ld hl, (ws+1397)
	push hl
	ld a,2
	call f236_IsTypeOfKind
;	ld (ws+1400), a
	ld (ws+1399), a
c01_0469:
;end_f239_IsNum:
	ld a, (ws+1399)
	ret


	; IsSNum workspace at ws+1377 length ws+4
f240_IsSNum::
	ld (ws+1377), hl
	ld a,h
	or l
	jp nz, c01_0472
	ld a,1
	ld (ws+1379), a
	jp c01_046e
c01_0472:
	ld hl, (ws+1377)
	push hl
	ld a,2
	call f236_IsTypeOfKind
;	ld (ws+1380), a
	or a
	jp z, c01_0478
;c01_0479:
	ld hl, (ws+1377)
	ld a,(hl)
	or a
	jp z, c01_0478
;c01_0477:
	ld a,1
	ld (ws+1379), a
	jp c01_046e
c01_0478:
	xor a
	ld (ws+1379), a
c01_046e:
;end_f240_IsSNum:
	ld a, (ws+1379)
	ret


	; IsScalar workspace at ws+1390 length ws+6
f241_IsScalar::
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
	jp nz, c01_0481
;c01_0484:
	ld a, (ws+1394)
	or a
	jp nz, c01_0481
;c01_0483:
	ld a, (ws+1395)
	or a
	jp z, c01_0482
c01_0481:
	ld a,1
	ld (ws+1392), a
	jp c01_047a
c01_0482:
	xor a
	ld (ws+1392), a
c01_047a:
;end_f241_IsScalar:
	ld a, (ws+1392)
	ret


	; IsRecord workspace at ws+1377 length ws+4
f242_IsRecord::
	ld (ws+1377), hl
	push hl
	ld a,5
	call f236_IsTypeOfKind
;	ld (ws+1380), a
;	ld (ws+1379), a
;end_f242_IsRecord:
;	ld a, (ws+1379)
	ret


	; MakeLValue workspace at ws+1380 length ws+10
f243_MakeLValue::
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
;	ld (ws+1387), a
	or a
	jp z, c01_0489
;c01_0488:
	ld de, (ws+1385)
	ld hl,11
	add hl,de
	ld a,(hl)
	ld (ws+1384), a
c01_0489:
;c01_0485:
	ld a, (ws+1384)
	push af
	ld hl, (ws+1380)
	call f156_MidDeref
;	ld (ws+1388), hl
	ld (ws+1382), hl
	ld hl, (ws+1385)
	ld ix, (ws+1382)
	ld (ix+7), l
	ld (ix+8), h
;end_f243_MakeLValue:
	ld hl, (ws+1382)
	ret


c01_c258:
	db 108,118,97,108,117,101,32,114,101,113,117,105,114,101,100,0

	; UndoLValue workspace at ws+1364 length ws+5
f244_UndoLValue::
	ld (ws+1364), hl
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1368), a
	cp 44
	jp c, c01_048f
;c01_0491:
	ld b,48
	ld a, (ws+1368)
	push af
	ld a,b
	pop bc
	cp b
	jp nc, c01_0490
c01_048f:
	ld hl,c01_c258
	call f82_SimpleError
c01_0490:
;c01_048a:
	ld ix, (ws+1364)
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+1366), hl
	ld (ix+9), 0
	ld (ix+10), 0
	push ix
	pop hl
	call f69_Discard
;end_f244_UndoLValue:
	ld hl, (ws+1366)
	ret


	; IsLValue workspace at ws+1377 length ws+4
f245_IsLValue::
	ld (ws+1377), hl
	xor a
	ld (ws+1379), a
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1380), a
	cp 44
	jp c, c01_0498
;c01_0499:
	ld b,48
	ld a, (ws+1380)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_0498
;c01_0497:
	ld a,1
	ld (ws+1379), a
c01_0498:
;c01_0492:
;end_f245_IsLValue:
	ld a, (ws+1379)
	ret


c01_c259:
	db 112,111,105,110,116,101,114,32,111,114,32,108,118,97,108,117,101,32,114,101,113,117,105,114,101,100,0

	; MaybeUndoLValue workspace at ws+1380 length ws+6
f246_MaybeUndoLValue::
	ld (ws+1380), hl
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1384), a
	cp 44
	jp c, c01_04a0
;c01_04a1:
	ld b,48
	ld a, (ws+1384)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_04a0
;c01_049f:
	ld ix, (ws+1380)
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+1382), hl
	ld (ix+9), 0
	ld (ix+10), 0
	jp c01_049a
c01_04a0:
	ld ix, (ws+1380)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
;	ld (ws+1385), a
	or a
	jp z, c01_04a5
;c01_04a4:
	ld hl, (ws+1380)
	ld (ws+1382), hl
	jp c01_049a
c01_04a5:
	ld hl,c01_c259
	call f82_SimpleError
c01_049a:
;end_f246_MaybeUndoLValue:
	ld hl, (ws+1382)
	ret


	; AllocLabel workspace at ws+1390 length ws+2
f247_AllocLabel::
	ld hl, (ws+14)
	ld (ws+1390), hl
	inc hl
	ld (ws+14), hl
;end_f247_AllocLabel:
	ld hl, (ws+1390)
	ret


	; AllocSubrId workspace at ws+1361 length ws+2
f248_AllocSubrId::
	ld hl, (ws+16)
	ld (ws+1361), hl
	inc hl
	ld (ws+16), hl
;end_f248_AllocSubrId:
	ld hl, (ws+1361)
	ret


	; MidWriter workspace at ws+1406 length ws+2
f249_MidWriter::
	ld (ws+1406), hl
;end_f249_MidWriter:
	ret


	; ArchAlignUp workspace at ws+1380 length ws+5
f250_ArchAlignUp::
	ld (ws+1382), a
	pop bc
	pop hl
	ld (ws+1380), hl
	push bc
;	ld (ws+1383), hl
;end_f250_ArchAlignUp:
;	ld hl, (ws+1383)
	ret


c01_c260:
	db 117,105,110,116,51,50,0
c01_c261:
	db 105,110,116,51,50,0
c01_c262:
	db 117,105,110,116,49,54,0
c01_c263:
	db 105,110,116,49,54,0
c01_c264:
	db 117,105,110,116,56,0
c01_c265:
	db 105,110,116,56,0
c01_c266:
	db 117,105,110,116,49,54,0
c01_c267:
	db 105,110,116,112,116,114,0

	; ArchInitTypes workspace at ws+1294 length ws+14
f251_ArchInitTypes::
	ld h,4
	push hl
	ld a,1
	push af
	ld d,0
	push de
	ld hl,c01_c260
	call f235_MakeNumberType
;	ld (ws+1294), hl
	ld (ws+543), hl
	ld h,4
	push hl
	ld a,1
	push af
	push af
	ld hl,c01_c261
	call f235_MakeNumberType
;	ld (ws+1296), hl
	ld (ws+545), hl
	ld b,2
	push bc
	ld a,1
	push af
	ld d,0
	push de
	ld hl,c01_c262
	call f235_MakeNumberType
;	ld (ws+1298), hl
	ld (ws+547), hl
	ld b,2
	push bc
	ld a,1
	push af
	push af
	ld hl,c01_c263
	call f235_MakeNumberType
;	ld (ws+1300), hl
	ld (ws+549), hl
	ld a,1
	push af
	push af
	ld d,0
	push de
	ld hl,c01_c264
	call f235_MakeNumberType
;	ld (ws+1302), hl
	ld (ws+551), hl
	ld a,1
	push af
	push af
	push af
	ld hl,c01_c265
	call f235_MakeNumberType
;	ld (ws+1304), hl
	ld (ws+553), hl
	ld hl, (ws+547)
	ld (ws+555), hl
	ld bc,0
	push bc
	ld hl,c01_c266
	call f228_LookupSymbol
	ld (ws+1306), hl
	ld hl,c01_c267
	push hl
	ld hl, (ws+1306)
	call f232_AddAliasString
;end_f251_ArchInitTypes:
	ret


	; ArchGuessIntType workspace at ws+1369 length ws+10
f252_ArchGuessIntType::
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
	jp nz, c01_04ac
;c01_04ad:
	ld hl,255
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f490__cmps4
	jp m, c01_04ac
;c01_04ab:
	ld hl, (ws+551)
	ld (ws+1377), hl
	jp c01_04a6
c01_04ac:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	ld de,65408
	exx
	ld de,65535
	exx
	call f490__cmps4
	jp m, c01_04b3
;c01_04b4:
	ld hl,127
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f490__cmps4
	jp m, c01_04b3
;c01_04b2:
	ld hl, (ws+553)
	ld (ws+1377), hl
	jp c01_04a6
c01_04b3:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	exx
	bit 7,h
	exx
	jp nz, c01_04ba
;c01_04bb:
	ld hl,65535
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f490__cmps4
	jp m, c01_04ba
;c01_04b9:
	ld hl, (ws+547)
	ld (ws+1377), hl
	jp c01_04a6
c01_04ba:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	ld de,32768
	exx
	ld de,65535
	exx
	call f490__cmps4
	jp m, c01_04c1
;c01_04c2:
	ld hl,32767
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f490__cmps4
	jp m, c01_04c1
;c01_04c0:
	ld hl, (ws+549)
	ld (ws+1377), hl
	jp c01_04a6
c01_04c1:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	exx
	bit 7,h
	exx
	jp nz, c01_04c6
	ld hl, (ws+543)
	ld (ws+1377), hl
	jp c01_04a6
c01_04c6:
	ld hl, (ws+545)
	ld (ws+1377), hl
c01_04a6:
;end_f252_ArchGuessIntType:
	ld hl, (ws+1377)
	ret


	; ArchInitVariable workspace at ws+1386 length ws+6
f253_ArchInitVariable::
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
;end_f253_ArchInitVariable:
	ret


	; ArchInitMember workspace at ws+1355 length ws+6
f254_ArchInitMember::
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
	jp nc, c01_04cb
;c01_04ca:
	ld hl, (ws+1359)
	ld ix, (ws+1355)
	ld (ix+11), l
	ld (ix+12), h
c01_04cb:
;c01_04c7:
;end_f254_ArchInitMember:
	ret


	; WriteMid1 workspace at ws+1408 length ws+0
f255_WriteMid1::
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
	jp   f185_E_b8 ;	call f185_E_b8
;end_f255_WriteMid1:
;	ret


	; WriteMid2 workspace at ws+1408 length ws+0
f256_WriteMid2::
	ld (ws+1406), hl
	ld a,(hl)
	jp   f185_E_b8 ;	call f185_E_b8
;end_f256_WriteMid2:
;	ret


	; WriteMid3 workspace at ws+1408 length ws+0
f257_WriteMid3::
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
	jp   f185_E_b8 ;	call f185_E_b8
;end_f257_WriteMid3:
;	ret


	; WriteMid4 workspace at ws+1408 length ws+0
f258_WriteMid4::
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
	jp   f185_E_b8 ;	call f185_E_b8
;end_f258_WriteMid4:
;	ret


	; WriteMid5 workspace at ws+1408 length ws+0
f259_WriteMid5::
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp   f186_E_b16 ;	call f186_E_b16
;end_f259_WriteMid5:
;	ret


	; WriteMid6 workspace at ws+1408 length ws+0
f260_WriteMid6::
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
	jp   f188_E_bsize ;	call f188_E_bsize
;end_f260_WriteMid6:
;	ret


	; WriteMid7 workspace at ws+1408 length ws+0
f261_WriteMid7::
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
	jp   f186_E_b16 ;	call f186_E_b16
;end_f261_WriteMid7:
;	ret


	; WriteMid8 workspace at ws+1408 length ws+0
f262_WriteMid8::
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp   f196_E_countedstring ;	call f196_E_countedstring
;end_f262_WriteMid8:
;	ret


	; WriteMid9 workspace at ws+1408 length ws+0
f263_WriteMid9::
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
	jp   f187_E_b32 ;	call f187_E_b32
;end_f263_WriteMid9:
;	ret


	; WriteMid10 workspace at ws+1408 length ws+0
f264_WriteMid10::
	ld (ws+1406), hl
;end_f264_WriteMid10:
	ret


	; WriteMid11 workspace at ws+1408 length ws+0
f265_WriteMid11::
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+14)
	ld h, (ix+15)
	jp   f186_E_b16 ;	call f186_E_b16
;end_f265_WriteMid11:
;	ret

f2___main_s04cc::
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

f2___main_s04cd::
	db 9
	db 9
	db 9
	db 10
	db 10
	db 3
	db 8
	db 8
	db 8
	db 8
	db 8
	db 7
	db 5
	db 10
	db 9
	db 9
	db 9
	db 9
	db 7
	db 3
	db 10
	db 8
	db 9
	db 9
	db 9
	db 4
	db 4
	db 9
	db 10
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
	db 8
	db 7
	db 5
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
	db 9
	db 9
	db 9
	db 9
	db 9
	db 6
	db 6
	db 6
	db 6
	db 6
	db 9
	db 9
	db 9
	db 9
	db 9
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


	; ReallyGenerate workspace at ws+1397 length ws+9
f267_ReallyGenerate::
	ld (ws+1397), hl
	ld a,77
	call f185_E_b8
	ld hl, (ws+64)
	ld (ws+1399), hl
	ld hl, (ws+1397)
	call f66_PushNode
c01_04d9:
	ld de, (ws+64)
	ld hl, (ws+1399)
	and a
	sbc hl,de
	jp z, c01_04de
;c01_04dd:
	call f68_NextNode
;	ld (ws+1401), hl
	ld (ws+1403), hl
	push hl
	pop ix
	ld a, (ix+13)
	call f185_E_b8
	ld de,f2___main_s04cd
	ld ix, (ws+1403)
	ld a, (ix+13)
	dec a
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
	ld (ws+1405), a
	ld bc,f2___main_s04cc
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld e,(hl)
	inc hl
	ld d,(hl)
	push ix
	pop hl
	call f491__jpde
	jp c01_04d9
c01_04de:
	ld hl, (ws+1397)
	jp   f69_Discard ;	call f69_Discard
;end_f267_ReallyGenerate:
;	ret


	; Generate workspace at ws+1390 length ws+7
f269_Generate::
	ld (ws+1390), hl
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1392), a
	ld a, (ws+557)
	cp 27
	jp z, c01_04e4
;c01_04e6:
	ld a, (ws+557)
	cp 28
	jp nz, c01_04e5
c01_04e4:
	ld a, (ws+1392)
	cp 26
	jp z, c01_04ed
;c01_04ee:
	ld a, (ws+1392)
	cp 5
	jp z, c01_04ed
;c01_04ec:
	ld hl, (ws+1390)
	call f69_Discard
	ret
c01_04ed:
;c01_04e7:
c01_04e5:
;c01_04df:
	ld a, (ws+1392)
	cp 18
	jp nz, c01_04f5
;c01_04f6:
	ld a, (ws+557)
	cp 23
	jp z, c01_04f5
;c01_04f4:
	call f137_MidAsmgroupstart
;	ld (ws+1393), hl
	call f267_ReallyGenerate
c01_04f5:
;c01_04ef:
	ld a, (ws+557)
	cp 23
	jp nz, c01_04fd
;c01_04fe:
	ld a, (ws+1392)
	cp 18
	jp z, c01_04fd
;c01_04fc:
	call f132_MidAsmgroupend
;	ld (ws+1395), hl
	call f267_ReallyGenerate
c01_04fd:
;c01_04f7:
	ld a, (ws+1392)
	ld (ws+557), a
	ld hl, (ws+1390)
	jp   f267_ReallyGenerate ;	call f267_ReallyGenerate
;end_f269_Generate:
;	ret


	; push_and_free workspace at ws+1390 length ws+0
f271_push_and_free::
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
	jp   f69_Discard ;	call f69_Discard
;end_f271_push_and_free:
;	ret


	; GenerateConditional workspace at ws+1361 length ws+29
f270_GenerateConditional::
	ld (ws+1361), hl
	ld hl, (ws+64)
	ld (ws+1363), hl
	ld hl, (ws+1361)
	call f66_PushNode
c01_04ff:
	ld de, (ws+64)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	jp z, c01_0504
;c01_0503:
	call f67_PopNode
;	ld (ws+1365), hl
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
	jp z, c01_0509
;c01_0508:
	ld hl, (ws+1369)
	ld (ws+1380), hl
	ld hl, (ws+1371)
	ld (ws+1369), hl
	ld hl, (ws+1380)
	ld (ws+1371), hl
c01_0509:
;c01_0505:
	ld a, (ws+1379)
	cp 55
	jp nz, c01_050b
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
	jp c01_04ff ; c01_050a
c01_050b:
	cp 54
	jp nz, c01_050c
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
	jp c01_04ff ; c01_050a
c01_050c:
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
	call f135_MidLabel
;	ld (ws+1388), hl
	call f269_Generate
c01_050a:
	jp c01_04ff
c01_0504:
;end_f270_GenerateConditional:
	ret


	; InitVariable workspace at ws+1378 length ws+8
f272_InitVariable::
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
;	ld (ws+1384), hl
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
				;if '-S'
	ld	a,(symbols)
	or	a
	jr	z,nosubsyms
				;write subr.symbol.name
	ld	hl, (ws+1378)	;subr
	ld	e,(hl)
	inc	hl
	ld	d,(hl)		;DE=subr.symbol
	ex	de,hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)		;DE=subr.symbol.name
	push	de		;subr name on stack
				;get symbol.name
	ld	ix,(ws+1380)	;symbol
	ld	l,(ix+4)
	ld	h,(ix+5)	;HL=symbol name pointer
	pop	bc		;BC=subr name pointer
	ld	a,h
	or	l		;symbol name pointer NULL?
	jr	z,nosubsyms
				;not NULL
	push	hl		;symbol name pointer on stack
	call	E_Sstr		;write subr name
	pop	bc		;BC=symbol name pointer
	call	E_Sstr		;write symbol name
				;write symbol.vardata.offset = subr.workspace[0]
	ld	ix,(ws+1378)	;subr
	ld	c,(ix+16)
	ld	b,(ix+17)	;BC=offset
	call	E_Sb16
nosubsyms:
        ld hl, (ws+1380)
        jp f253_ArchInitVariable

	;write byte to subsyms
E_Sb8:			;A=char
	ld	hl,FCBsubsyms
	push	hl
	call	f_FCBPutChar
	ret
	
	;write word to subsyms
E_Sb16:			;BC=v
	push	bc
	ld	a,c
	call	E_Sb8
	pop	bc
	ld	a,b
	jr	E_Sb8

	;write string to subsyms
E_Sstr:			;BC=string
	ld	a,(bc)
	push	bc
	call	E_Sb8
	pop	bc
	ld	a,(bc)
	or	a
	ret	z
	inc	bc
	jr	E_Sstr


	; MakePointerType workspace at ws+1380 length ws+8
f273_MakePointerType::
	ld (ws+1380), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+1382), hl
	ld a,h
	or l
	jp nz, c01_0511
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
c01_0511:
;c01_050d:
;end_f273_MakePointerType:
	ld hl, (ws+1382)
	ret


	; MakeArrayType workspace at ws+1355 length ws+14
f274_MakeArrayType::
	ld (ws+1357), hl
	pop bc
	pop hl
	ld (ws+1355), hl
	push bc
	call f233_CheckNotPartialType
	call f72_AllocNewType
;	ld (ws+1361), hl
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
	jp nc, c01_0516
;c01_0515:
	ld ix, (ws+1355)
	ld e, (ix+13)
	ld d, (ix+14)
	ld bc, (ws+1357)
	dec bc
	call f476__mul2
	ex de,hl
	ld ix, (ws+1355)
	ld l, (ix+11)
	ld h, (ix+12)
	add hl,de
	ld (ws+1363), hl
c01_0516:
;c01_0512:
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
	call f476__mul2
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
;	ld (ws+1365), hl
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
;end_f274_MakeArrayType:
	ld hl, (ws+1359)
	ret


	; QueueNamespace workspace at ws+1373 length ws+4
f277_QueueNamespace::
	ld (ws+1373), hl
c01_0517:
	ld hl, (ws+1373)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_051c
;c01_051b:
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
	jp c01_0517
c01_051c:
;end_f277_QueueNamespace:
	ret


	; DestructSubroutineContents workspace at ws+1359 length ws+14
f276_DestructSubroutineContents::
	ld (ws+1359), hl
	ld ix,0
	ld (ws+1361), ix
	ld ix, (ws+1359)
	ld a, (ix+27)
	or a
	jp z, c01_0521
;c01_0520:
	ld hl, (ws+1359)
	push hl
	push hl
	pop ix
	ld a, (ix+27)
	dec a
	call f106_GetOutputParameter
;	ld (ws+1365), hl
	ld (ws+1363), hl
	jp c01_051d
c01_0521:
	ld ix, (ws+1359)
	ld a, (ix+26)
	or a
	jp z, c01_0525
;c01_0524:
	ld hl, (ws+1359)
	push hl
	push hl
	pop ix
	ld a, (ix+26)
	dec a
	call f105_GetInputParameter
	ld (ws+1367), hl
	ld (ws+1363), hl
	jp c01_051d
c01_0525:
	ld ix,0
	ld (ws+1363), ix
c01_051d:
	ld ix, (ws+1359)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1361), hl
	ld hl, (ws+1363)
	ld a,h
	or l
	jp z, c01_052a
;c01_0529:
	ld ix, (ws+1363)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1361), hl
c01_052a:
;c01_0526:
c01_052b:
	ld hl, (ws+1361)
	ld a,h
	or l
	jp z, c01_0530
;c01_052f:
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
	jp nz, c01_0532
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
	jp nz, c01_0534
	ld hl, (ws+1371)
	call f277_QueueNamespace
	jp c01_0533
c01_0534:
	cp 6
	jp nz, c01_0535
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
c01_0535:
c01_0533:
	ld hl, (ws+1371)
	call f73_FreeType
	jp c01_0531
c01_0532:
	cp 28
	jp nz, c01_0536
	ld hl, (ws+1369)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
c01_0536:
c01_0531:
	ld ix, (ws+1369)
	ld l, (ix+4)
	ld h, (ix+5)
	call f40_Free
	ld hl, (ws+1369)
	call f71_FreeSymbol
	jp c01_052b
c01_0530:
	ld hl, (ws+1363)
	ld a,h
	or l
	jp z, c01_053b
;c01_053a:
	ld ix, (ws+1363)
	ld (ix+8), 0
	ld (ix+9), 0
	jp c01_0537
c01_053b:
	ld ix, (ws+1359)
	ld (ix+4), 0
	ld (ix+5), 0
c01_0537:
	ld hl, (ws+1363)
	ld ix, (ws+1359)
	ld (ix+6), l
	ld (ix+7), h
;end_f276_DestructSubroutineCont:    
	ret


	; CopyParameterList workspace at ws+1358 length ws+14
f278_CopyParameterList::
	ld (ws+1360), hl
	pop bc
	pop hl
	ld (ws+1358), hl
	push bc
	ld ix,0
	ld (ws+1362), ix
c01_053c:
	ld hl, (ws+1358)
	ld a,h
	or l
	jp z, c01_0541
;c01_0540:
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
;	ld (ws+1366), hl
	ld (ws+1368), hl
	push hl
	pop ix
	ld (ix+10), 28
	ld hl,9
	call f75_InternalAlloc
;	ld (ws+1370), hl
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
	jp z, c01_0546
;c01_0545:
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
c01_0546:
;c01_0542:
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
	jp c01_053c
c01_0541:
;end_f278_CopyParameterList:
	ret


c01_c268:
	db 95,95,109,97,105,110,0

	; CreateMainSubroutine workspace at ws+1294 length ws+10
f279_CreateMainSubroutine::
	call f72_AllocNewType
;	ld (ws+1294), hl
	ld (ws+1296), hl
	push hl
	pop ix
	ld (ix+15), 6
	call f70_AllocNewSymbol
;	ld (ws+1298), hl
	ld (ws+1300), hl
	push hl
	pop ix
	ld (ix+10), 30
	ld hl,c01_c268
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
;	ld (ws+1302), hl
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
;end_f279_CreateMainSubroutine:
	ret


	; ReportWorkspaces workspace at ws+1359 length ws+5
f280_ReportWorkspaces::
	ld (ws+1359), hl
	xor a
	ld (ws+1361), a
c01_0547:
	ld a, (ws+1361)
	cp 4
	jp z, c01_054c
;c01_054b:
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
	jp z, c01_0551
;c01_0550:
	ld hl, (ws+1359)
	push hl
	ld a, (ws+1361)
	push af
	ld hl, (ws+1362)
	call f213_EmitterDeclareWorkspace
c01_0551:
;c01_054d:
	ld a, (ws+1361)
	inc a
	ld (ws+1361), a
	jp c01_0547
c01_054c:
;end_f280_ReportWorkspaces:
	ret


c01_c269:
	db 32,97,110,100,32,0
c01_c270:
	db 32,97,114,101,32,110,111,116,32,99,111,109,112,97,116,105,98,108,101,32,105,110,32,116,104,105,115,32,99,111,110,116,101,120
	db 116,0

	; expr_i_cant_do_that workspace at ws+1389 length ws+4
f281_expr_i_cant_do_that::
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
	ld hl,c01_c269
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
	ld hl,c01_c270
	call f9_print
	call f81_EndError
;end_f281_expr_i_cant_do_that:
	ret


c01_c271:
	db 116,121,112,101,32,109,105,115,109,97,116,99,104,58,32,101,120,112,114,101,115,115,105,111,110,32,119,97,115,32,97,32,0
c01_c272:
	db 44,32,117,115,101,100,32,119,104,101,110,32,97,32,0
c01_c273:
	db 32,119,97,115,32,101,120,112,101,99,116,101,100,0
c01_c274:
	db 32,99,97,110,110,111,116,32,98,101,32,117,115,101,100,32,104,101,114,101,0

	; CheckExpressionType workspace at ws+1380 length ws+5
f282_CheckExpressionType::
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
	jp nz, c01_0556
	ld hl, (ws+1382)
	ld ix, (ws+1380)
	ld (ix+7), l
	ld (ix+8), h
c01_0556:
;c01_0552:
	ld ix, (ws+1380)
	ld e, (ix+7)
	ld d, (ix+8)
	ld hl, (ws+1382)
	and a
	sbc hl,de
	jp z, c01_055b
;c01_055a:
	call f80_StartError
	ld hl,c01_c271
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
	ld hl,c01_c272
	call f9_print
	ld ix, (ws+1382)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c273
	call f9_print
	call f81_EndError
c01_055b:
;c01_0557:
	ld hl, (ws+1382)
	call f241_IsScalar
;	ld (ws+1384), a
	or a
	jp nz, c01_0560
	call f80_StartError
	ld ix, (ws+1382)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c274
	call f9_print
	call f81_EndError
c01_0560:
;c01_055c:
;end_f282_CheckExpressionType:
	ret


c01_c275:
	db 99,97,110,110,111,116,32,117,115,101,32,97,110,32,117,110,116,121,112,101,100,32,99,111,110,115,116,97,110,116,32,105,110,32
	db 116,104,105,115,32,99,111,110,116,101,120,116,0
c01_c276:
	db 112,111,105,110,116,101,114,115,32,109,97,121,32,111,110,108,121,32,97,112,112,101,97,114,32,111,110,32,116,104,101,32,76,72
	db 83,32,111,102,32,97,110,32,97,100,100,105,116,105,111,110,32,111,114,32,115,117,98,116,114,97,99,116,105,111,110,0

	; ResolveUntypedConstantsForAddOrSub workspace at ws+1375 length ws+8
f283_ResolveUntypedConstantsFor::        
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
	jp z, c01_0567
;c01_0568:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp nz, c01_0567
;c01_0566:
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
;	ld (ws+1379), a
	or a
	jp z, c01_056d
;c01_056c:
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1377)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_0569
c01_056d:
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
;	ld (ws+1380), a
	or a
	jp z, c01_0571
;c01_0570:
	ld hl, (ws+555)
	ld ix, (ws+1377)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_0569
c01_0571:
	ld hl,c01_c275
	call f82_SimpleError
c01_0569:
c01_0567:
;c01_0561:
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp nz, c01_0578
;c01_0579:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp z, c01_0578
;c01_0577:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
;	ld (ws+1381), a
	or a
	jp z, c01_057e
;c01_057d:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1375)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_057a
c01_057e:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
;	ld (ws+1382), a
	or a
	jp z, c01_0582
;c01_0581:
	ld hl,c01_c276
	call f82_SimpleError
c01_0582:
c01_057a:
c01_0578:
;c01_0572:
;end_f283_ResolveUntypedConstant:            
	ret


c01_c277:
	db 110,117,109,98,101,114,32,114,101,113,117,105,114,101,100,0

	; CheckNumber workspace at ws+1393 length ws+3
f284_CheckNumber::
	ld (ws+1393), hl
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
;	ld (ws+1395), a
	or a
	jp nz, c01_0587
	ld hl,c01_c277
	call f82_SimpleError
c01_0587:
;c01_0583:
;end_f284_CheckNumber:
	ret


c01_c278:
	db 110,117,109,98,101,114,32,111,114,32,112,111,105,110,116,101,114,32,114,101,113,117,105,114,101,100,0

	; CheckNumberOrPointer workspace at ws+1393 length ws+4
f285_CheckNumberOrPointer::
	ld (ws+1393), hl
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
	ld (ws+1395), a
	ld ix, (ws+1393)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	ld (ws+1396), a
	ld a, (ws+1395)
	or a
	jp nz, c01_058e
;c01_058f:
	ld a, (ws+1396)
	or a
	jp nz, c01_058e
;c01_058d:
	ld hl,c01_c278
	call f82_SimpleError
c01_058e:
;c01_0588:
;end_f285_CheckNumberOrPointer:
	ret


	; CheckNilCompatible workspace at ws+1389 length ws+4
f286_CheckNilCompatible::
	ld (ws+1391), hl
	pop bc
	pop hl
	ld (ws+1389), hl
	push bc
	ld hl, (ws+1391)
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
	jp nz, c01_0594
	ld hl, (ws+1389)
	call f285_CheckNumberOrPointer
	jp c01_0590
c01_0594:
	ld hl, (ws+1389)
	call f284_CheckNumber
c01_0590:
;end_f286_CheckNilCompatible:
	ret


	; ResolveUntypedConstantsSimply workspace at ws+1381 length ws+8
f287_ResolveUntypedConstantsSim::   
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
	jp z, c01_059b
;c01_059c:
	ld hl, (ws+1387)
	ld a,h
	or l
	jp nz, c01_059b
;c01_059a:
	ld hl, (ws+1381)
	push hl
	ld hl, (ws+1383)
	call f286_CheckNilCompatible
	ld hl, (ws+1385)
	ld ix, (ws+1383)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_0595
c01_059b:
	ld hl, (ws+1385)
	ld a,h
	or l
	jp nz, c01_05a2
;c01_05a3:
	ld hl, (ws+1387)
	ld a,h
	or l
	jp z, c01_05a2
;c01_05a1:
	ld hl, (ws+1383)
	push hl
	ld hl, (ws+1381)
	call f286_CheckNilCompatible
	ld hl, (ws+1387)
	ld ix, (ws+1381)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_0595
c01_05a2:
	ld de, (ws+1385)
	ld hl, (ws+1387)
	and a
	sbc hl,de
	jp z, c01_05a7
;c01_05a6:
	ld hl, (ws+1381)
	push hl
	ld hl, (ws+1383)
	call f281_expr_i_cant_do_that
c01_05a7:
c01_0595:
;end_f287_ResolveUntypedConstant:       
	ret


	; ResolveUntypedConstantsNeedingNumbers workspace at ws+1370 length ws+4
f288_ResolveUntypedConstantsNee::           
	ld (ws+1372), hl
	pop bc
	pop hl
	ld (ws+1370), hl
	push bc
	push hl
	ld hl, (ws+1372)
	call f287_ResolveUntypedConstantsSim;ly
	ld hl, (ws+1370)
	call f284_CheckNumber
	ld hl, (ws+1372)
	call f284_CheckNumber
;end_f288_ResolveUntypedConstant:               
	ret


	; CondSimple workspace at ws+1377 length ws+4
f289_CondSimple::
	ld (ws+1379), hl
	pop bc
	pop hl
	ld (ws+1377), hl
	push bc
	push hl
	ld hl, (ws+1379)
	call f287_ResolveUntypedConstantsSim;ly
	ld ix, (ws+1377)
	ld e, (ix+7)
	ld d, (ix+8)
	ld ix, (ws+1379)
	ld l, (ix+7)
	ld h, (ix+8)
	and a
	sbc hl,de
	jp z, c01_05ac
;c01_05ab:
	ld hl, (ws+1377)
	push hl
	ld hl, (ws+1379)
	call f281_expr_i_cant_do_that
c01_05ac:
;c01_05a8:
;end_f289_CondSimple:
	ret


	; Expr1Simple workspace at ws+1355 length ws+8
f290_Expr1Simple::
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
	ld (ws+1361), hl
	ld (ws+1358), hl
	ld ix, (ws+1356)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1358)
	ld (ix+7), l
	ld (ix+8), h
;end_f290_Expr1Simple:
	ld hl, (ws+1358)
	ret


	; cant_add_that workspace at ws+1372 length ws+0
f292_cant_add_that::
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	call f281_expr_i_cant_do_that
;end_f292_cant_add_that:
	ret


	; ExprAdd workspace at ws+1355 length ws+17
f291_ExprAdd::
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
;	ld (ws+1365), a
	or a
	jp z, c01_05b1
;c01_05b0:
	ld hl, (ws+1363)
	call f74_IsPtr
;	ld (ws+1366), a
	or a
	jp nz, c01_05b7
	ld de, (ws+1363)
	ld hl, (ws+555)
	and a
	sbc hl,de
	jp z, c01_05ad ; c01_05b8
c01_05b7:
	call f292_cant_add_that
c01_05b8:
;c01_05b2:
	jp c01_05ad
c01_05b1:
	ld hl, (ws+1363)
	call f74_IsPtr
	ld (ws+1367), a
	or a
	jp z, c01_05bd
;c01_05bc:
	call f292_cant_add_that
	jp c01_05ad
c01_05bd:
	ld hl, (ws+1361)
	call f74_IsPtr
;	ld (ws+1368), a
	or a
	jp nz, c01_05c3
;c01_05c4:
	ld de, (ws+1361)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	jp z, c01_05c3
;c01_05c2:
	call f292_cant_add_that
c01_05c3:
c01_05ad:
	ld hl, (ws+1355)
	call f172_NodeWidth
	ld (ws+1369), a
	ld h,156
	push hl
	push af
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	call f183_MidC2Op
;	ld (ws+1370), hl
	ld (ws+1359), hl
	ld hl, (ws+1361)
	ld ix, (ws+1359)
	ld (ix+7), l
	ld (ix+8), h
;end_f291_ExprAdd:
	ld hl, (ws+1359)
	ret


	; cant_sub_that workspace at ws+1375 length ws+0
f294_cant_sub_that::
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	call f281_expr_i_cant_do_that
;end_f294_cant_sub_that:
	ret


	; ExprSub workspace at ws+1355 length ws+20
f293_ExprSub::
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
	jp z, c01_05cd
;c01_05cf:
	ld a, (ws+1366)
	or a
	jp nz, c01_05cd
;c01_05ce:
	ld de, (ws+1363)
	ld hl, (ws+555)
	and a
	sbc hl,de
	jp z, c01_05cd
;c01_05cc:
	call f294_cant_sub_that
	jp c01_05c5
c01_05cd:
	ld hl, (ws+1361)
	call f239_IsNum
	ld (ws+1367), a
	ld hl, (ws+1363)
	call f74_IsPtr
	ld (ws+1368), a
	ld a, (ws+1367)
	or a
	jp z, c01_05d5
;c01_05d6:
	ld a, (ws+1368)
	or a
	jp z, c01_05d5
;c01_05d4:
	call f294_cant_sub_that
	jp c01_05c5
c01_05d5:
	ld hl, (ws+1361)
	call f239_IsNum
	ld (ws+1369), a
	ld hl, (ws+1363)
	call f239_IsNum
	ld (ws+1370), a
	ld a, (ws+1369)
	or a
	jp z, c01_05de
;c01_05e0:
	ld a, (ws+1370)
	or a
	jp z, c01_05de
;c01_05df:
	ld de, (ws+1361)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	jp z, c01_05de
;c01_05dd:
	call f294_cant_sub_that
c01_05de:
c01_05c5:
	ld hl, (ws+1355)
	call f172_NodeWidth
	ld (ws+1371), a
	ld b,131
	push bc
	push af
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	call f183_MidC2Op
;	ld (ws+1372), hl
	ld (ws+1359), hl
	ld hl, (ws+1361)
	call f74_IsPtr
;	ld (ws+1374), a
	or a
	jp z, c01_05e7
;c01_05e8:
	ld de, (ws+1361)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	jp nz, c01_05e7
;c01_05e6:
	ld hl, (ws+555)
	ld ix, (ws+1359)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_05e1
c01_05e7:
	ld hl, (ws+1361)
	ld ix, (ws+1359)
	ld (ix+7), l
	ld (ix+8), h
c01_05e1:
;end_f293_ExprSub:
	ld hl, (ws+1359)
	ret


	; Expr2Simple workspace at ws+1355 length ws+15
f295_Expr2Simple::
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
	call f288_ResolveUntypedConstantsNee;ingNumbers
	ld a, (ws+1356)
	ld (ws+1363), a
	ld ix, (ws+1357)
	ld l, (ix+7)
	ld h, (ix+8)
	call f240_IsSNum
	ld (ws+1364), a
	or a
	jp z, c01_05ed
;c01_05ec:
	ld a, (ws+1355)
	ld (ws+1363), a
c01_05ed:
;c01_05e9:
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
;	ld (ws+1368), hl
	ld (ws+1361), hl
	ld hl, (ws+1365)
	ld ix, (ws+1361)
	ld (ix+7), l
	ld (ix+8), h
;end_f295_Expr2Simple:
	ld hl, (ws+1361)
	ret


c01_c279:
	db 76,72,83,32,111,102,32,115,104,105,102,116,32,99,97,110,32,111,110,108,121,32,98,101,32,99,111,110,115,116,97,110,116,32,105
	db 102,32,116,104,101,32,82,72,83,32,105,115,32,97,108,115,111,32,99,111,110,115,116,97,110,116,0

	; expr_i_checkrhsconst workspace at ws+1374 length ws+2
f296_expr_i_checkrhsconst::
	ld (ws+1374), hl
	push hl
	pop ix
	ld a, (ix+13)
	cp 40
	jp z, c01_05f2
;c01_05f1:
	ld hl,c01_c279
	call f82_SimpleError
c01_05f2:
;c01_05ee:
;end_f296_expr_i_checkrhsconst:
	ret


c01_c280:
	db 110,117,109,98,101,114,32,114,101,113,117,105,114,101,100,32,111,110,32,76,72,83,32,111,102,32,115,104,105,102,116,0

	; expr_i_checkshift workspace at ws+1374 length ws+5
f297_expr_i_checkshift::
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
;	ld (ws+1378), a
	or a
	jp nz, c01_05f7
	ld hl,c01_c280
	call f82_SimpleError
c01_05f7:
;c01_05f3:
	ld hl, (ws+1376)
	push hl
	ld hl, (ws+551)
	call f282_CheckExpressionType
;end_f297_expr_i_checkshift:
	ret


	; ExprShift workspace at ws+1355 length ws+19
f298_ExprShift::
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
	ld (ws+1364), a
	or a
	jp z, c01_05fc
;c01_05fb:
	ld a, (ws+1355)
	ld (ws+1363), a
c01_05fc:
;c01_05f8:
	ld ix, (ws+1357)
	ld a, (ix+13)
	cp 40
	jp nz, c01_0601
	ld hl, (ws+1359)
	call f296_expr_i_checkrhsconst
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
	jp end_f298_ExprShift
c01_0601:
;c01_05fd:
	ld hl, (ws+1357)
	push hl
	ld hl, (ws+1359)
	call f297_expr_i_checkshift
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
;	ld (ws+1372), hl
	ld (ws+1361), hl
	ld hl, (ws+1369)
	ld ix, (ws+1361)
	ld (ix+7), l
	ld (ix+8), h
end_f298_ExprShift:
	ld hl, (ws+1361)
	ret


c01_c281:
	db 110,111,100,101,32,115,116,97,99,107,32,111,118,101,114,102,108,111,119,0

	; PushNode workspace at ws+1428 length ws+2
f66_PushNode::
	ld (ws+1428), hl
	ld a,h
	or l
	jp z, c01_0606
;c01_0605:
	ld de, (ws+64)
	ld hl,ws+64
	and a
	sbc hl,de
	jp nz, c01_060b
	ld hl,c01_c281
	call f82_SimpleError
c01_060b:
;c01_0607:
	ld de, (ws+1428)
	ld hl, (ws+64)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+64)
	inc hl
	inc hl
	ld (ws+64), hl
c01_0606:
;c01_0602:
;end_f66_PushNode:
	ret


	; PopNode workspace at ws+1428 length ws+2
f67_PopNode::
	ld hl, (ws+64)
	dec hl
	dec hl
	ld (ws+64), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
;	ld (ws+1428), hl
;end_f67_PopNode:
;	ld hl, (ws+1428)
	ret


	; NextNode workspace at ws+1424 length ws+4
f68_NextNode::
	call f67_PopNode
;	ld (ws+1426), hl
	ld (ws+1424), hl
	ld a,h
	or l
	jp z, c01_0610
;c01_060f:
	ld ix, (ws+1424)
	ld l, (ix+9)
	ld h, (ix+10)
	call f66_PushNode
	ld ix, (ws+1424)
	ld l, (ix+11)
	ld h, (ix+12)
	call f66_PushNode
c01_0610:
;c01_060c:
;end_f68_NextNode:
	ld hl, (ws+1424)
	ret


	; Discard workspace at ws+1416 length ws+8
f69_Discard::
	ld (ws+1416), hl
	ld hl, (ws+64)
	ld (ws+1418), hl
	ld hl, (ws+1416)
	call f66_PushNode
c01_0611:
	ld de, (ws+64)
	ld hl, (ws+1418)
	and a
	sbc hl,de
	jp z, c01_0616
;c01_0615:
	call f68_NextNode
;	ld (ws+1420), hl
;	ld (ws+1422), hl
	call f171_FreeNode
	jp c01_0611
c01_0616:
;end_f69_Discard:
	ret

