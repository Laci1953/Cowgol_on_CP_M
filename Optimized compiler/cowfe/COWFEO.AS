psect text
ld sp,TOPSTACK
	call f2___main
	rst 0


	; ExitWithError workspace at ws+1434 length ws+0
f4_ExitWithError:
	rst 0 
;end_f4_ExitWithError:
	ret


	; AlignUp workspace at ws+1458 length ws+4
f5_AlignUp:
	ld (ws+1458), hl
;	ld (ws+1460), hl
;end_f5_AlignUp:
;	ld hl, (ws+1460)
	ret


	; print_char workspace at ws+1457 length ws+1
f7_print_char:
	ld (ws+1457), a
	cp 10
	jp nz, c01_0005
	ld e, 13 
	ld c, 2 
	call 5 
c01_0005:
;c01_0001:
	ld a, ( ws+1457 ) 
	ld e, a 
	ld c, 2 
	jp   5  ;	call 5 
;end_f7_print_char:
;	ret


	; MemSet workspace at ws+1458 length ws+7
f8_MemSet:
	ld (ws+1461), hl
	pop bc
	pop af
	ld (ws+1460), a
	pop hl
	ld (ws+1458), hl
	push bc
	ld d,h
	ld e,l
	ld hl, (ws+1461)
	add hl,de
	ld (ws+1463), hl
c01_0006:
	ld de, (ws+1458)
	ld hl, (ws+1463)
	and a
	sbc hl,de
;	jp nz, c01_000c
;	ret
;c01_000c:
	ret z
;c01_0008:
	ld a, (ws+1460)
	ld hl, (ws+1458)
	ld (hl),a
	inc hl
	ld (ws+1458), hl
	jp c01_0006
;c01_0007:
;end_f8_MemSet:
	ret


	; print workspace at ws+1454 length ws+3
f9_print:
	ld (ws+1454), hl
c01_000d:
	ld hl, (ws+1454)
	ld a,(hl)
	ld (ws+1456), a
	or a
;	jp nz, c01_0013
;	ret
;c01_0013:
	ret z
;c01_000f:
	ld a, (ws+1456)
	call f7_print_char
	ld hl, (ws+1454)
	inc hl
	ld (ws+1454), hl
	jp c01_000d
;c01_000e:
;end_f9_print:
	ret


	; print_nl workspace at ws+1432 length ws+0
f10_print_nl:
	ld a,10
	jp   f7_print_char ;	call f7_print_char
;end_f10_print_nl:
;	ret


	; UIToA workspace at ws+1454 length ws+18
f11_UIToA:
	ld (ws+1459), hl
	pop bc
	pop af
	ld (ws+1458), a
	pop hl
	ld (ws+1454), hl
	pop hl
	ld (ws+1456), hl
	push bc
	ld hl, (ws+1459)
	ld (ws+1461), hl
c01_0014:
	ld bc, (ws+1454)
	exx
	ld bc, (ws+1456)
	exx
	ld a, (ws+1458)
	ld e,a
	xor a
	ld d,a
	exx
	ld e,a
	ld d,a
	exx
	call f479__dvrmu4
	ld (ws+1463), hl
	exx
	ld (ws+1465), hl
	exx
	ld bc, (ws+1454)
	exx
	ld bc, (ws+1456)
	exx
	ld a, (ws+1458)
	ld e,a
	xor a
	ld d,a
	exx
	ld e,a
	ld d,a
	exx
	call f479__dvrmu4
	ld (ws+1454), bc
	exx
	ld (ws+1456), bc
	exx
	ld hl, (ws+1463)
	exx
	ld hl, (ws+1465)
	exx
	ld de,10
	exx
	ld de,0
	exx
	call f486__cmpu4
	jp nc, c01_001a
;c01_0019:
	ld de, (ws+1463)
	exx
	ld de, (ws+1465)
	exx
	ld hl,48
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+1463), hl
	exx
	ld (ws+1465), hl
	exx
	jp c01_0016
c01_001a:
	ld de, (ws+1463)
	exx
	ld de, (ws+1465)
	exx
	ld hl,87
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+1463), hl
	exx
	ld (ws+1465), hl
	exx
c01_0016:
	ld a, (ws+1463)
	ld hl, (ws+1461)
	ld (hl),a
	inc hl
	ld (ws+1461), hl
	ld hl, (ws+1454)
	exx
	ld hl, (ws+1456)
	exx
	ld a,h
	or l
	exx
	or h
	or l
	exx
	jp nz, c01_0014 ; c01_001f
;c01_001e:
	jp c01_0015
c01_001f:
;c01_001b:
	jp c01_0014
c01_0015:
	ld hl, (ws+1459)
	ld (ws+1467), hl
	ld hl, (ws+1461)
	dec hl
	ld (ws+1469), hl
c01_0020:
	ld hl, (ws+1467)
	ld de, (ws+1469)
	and a
	sbc hl,de
	jp nc, c01_0025
;c01_0024:
	ld hl, (ws+1467)
	ld a,(hl)
	ld (ws+1471), a
	ld hl, (ws+1469)
	ld a,(hl)
	ld hl, (ws+1467)
	ld (hl),a
	ld a, (ws+1471)
	ld hl, (ws+1469)
	ld (hl),a
	ld hl, (ws+1467)
	inc hl
	ld (ws+1467), hl
	ld hl, (ws+1469)
	dec hl
	ld (ws+1469), hl
	jp c01_0020
c01_0025:
	xor a
	ld hl, (ws+1461)
	ld (hl),a
;end_f11_UIToA:
	ld hl, (ws+1461)
	ret


	; print_i32 workspace at ws+1434 length ws+20
f15_print_i32:
	ld (ws+1434), hl
	exx
	ld (ws+1436), hl
	exx
	exx
	push hl
	exx
	push hl
	ld h,10
	push hl
	ld hl,ws+1438
	call f11_UIToA
;	ld (ws+1450), hl
;	ld (ws+1452), hl
	ld hl,ws+1438
	call f9_print
;end_f15_print_i32:
	ret


	; print_i16 workspace at ws+1432 length ws+2
f16_print_i16:
	ld (ws+1432), hl
	exx
	ld hl,0
	exx
	jp   f15_print_i32 ;	call f15_print_i32
;end_f16_print_i16:
;	ret


	; print_i8 workspace at ws+1380 length ws+1
f17_print_i8:
	ld (ws+1380), a
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	jp   f15_print_i32 ;	call f15_print_i32
;end_f17_print_i8:
;	ret


	; print_hex_i8 workspace at ws+1387 length ws+3
f18_print_hex_i8:
	ld (ws+1387), a
	ld a,2
	ld (ws+1388), a
c01_002b:
	ld a, (ws+1387)
	ld b,4
	call f463__lsr1
	ld (ws+1389), a
	cp 10
	jp nc, c01_0031
;c01_0030:
	ld a, (ws+1389)
	add 48
	ld (ws+1389), a
	jp c01_002d
c01_0031:
	ld a, (ws+1389)
	add 87
	ld (ws+1389), a
c01_002d:
	ld a, (ws+1389)
	call f7_print_char
	ld a, (ws+1387)
	add a,a
	add a,a
	add a,a
	add a,a
	ld (ws+1387), a
	ld a, (ws+1388)
	dec a
	ld (ws+1388), a
	or a
	jp nz, c01_002b ; c01_0036
;c01_0035:
	jp c01_002c
c01_0036:
;c01_0032:
	jp c01_002b
c01_002c:
;end_f18_print_hex_i8:
	ret


	; print_hex_i32 workspace at ws+1383 length ws+4
f22_print_hex_i32:
	ld (ws+1383), hl
	exx
	ld (ws+1385), hl
	exx
	ld a,24
	call f469__lsr4
	ld a,l
	call f18_print_hex_i8
	ld hl, (ws+1383)
	exx
	ld hl, (ws+1385)
	exx
	ld a,16
	call f469__lsr4
	ld a,l
	call f18_print_hex_i8
	ld hl, (ws+1383)
	exx
	ld hl, (ws+1385)
	exx
	ld a,8
	call f469__lsr4
	ld a,l
	call f18_print_hex_i8
	ld a, (ws+1383)
	jp   f18_print_hex_i8 ;	call f18_print_hex_i8
;end_f22_print_hex_i32:
;	ret


	; ArgvInit workspace at ws+1298 length ws+0
f27_ArgvInit:
	ld iy,129
	ld (ws+4), iy
	ld b,0
	push iy
	pop de
	ld ix,128
	ld a, (ix+0)
	ld l,a
	ld h,b
	add hl,de
	ld a,b
	ld (hl),a
;end_f27_ArgvInit:
	ret


	; ArgvNext workspace at ws+1298 length ws+3
f28_ArgvNext:
	ld hl, (ws+4)
	ld a,h
	or l
	jp nz, c01_005f
	ld hl, (ws+4)
	ld (ws+1298), hl
	jp end_f28_ArgvNext
c01_005f:
;c01_005b:
c01_0060:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+1300), a
	cp 32
;	jp z, c01_0066
;	jp c01_0061
;c01_0066:
	jp nz,c01_0061
;c01_0062:
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp c01_0060
c01_0061:
	ld hl, (ws+4)
	ld (ws+1298), hl
c01_0067:
	ld hl, (ws+4)
	ld a,(hl)
	ld (ws+1300), a
	cp 32
	jp z, c01_0068 ; c01_0070
;c01_0073:
	ld a, (ws+1300)
	cp 10
	jp z, c01_0068 ; c01_0070
;c01_0072:
	ld a, (ws+1300)
	or a
	jp nz, c01_0071
c01_0070:
	jp c01_0068
c01_0071:
;c01_0069:
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp c01_0067
c01_0068:
	xor a
	ld hl, (ws+4)
	ld (hl),a
	ld a, (ws+1300)
	cp 32
	jp nz, c01_0078
	ld hl, (ws+4)
	inc hl
	ld (ws+4), hl
	jp c01_0074
c01_0078:
	ld bc,0
	ld (ws+4), bc
c01_0074:
end_f28_ArgvNext:
	ld hl, (ws+1298)
	ret


	; StrCmp workspace at ws+1395 length ws+5
f29_StrCmp:
	ld (ws+1397), hl
	pop bc
	pop hl
	ld (ws+1395), hl
	push bc
c01_0079:
	ld hl, (ws+1395)
	ld a,(hl)
	push af
	ld hl, (ws+1397)
	ld a,(hl)
	ld b,a
	pop af
	sub b
	ld (ws+1399), a
	or a
	jp nz, c01_007a ; c01_0080
;c01_0082:
	ld hl, (ws+1395)
	ld a,(hl)
	or a
	jp nz, c01_0081
c01_0080:
	jp c01_007a
c01_0081:
;c01_007b:
	ld hl, (ws+1395)
	inc hl
	ld (ws+1395), hl
	ld hl, (ws+1397)
	inc hl
	ld (ws+1397), hl
	jp c01_0079
c01_007a:
;end_f29_StrCmp:
	ld a, (ws+1399)
	ret


	; ToLower workspace at ws+1321 length ws+2
f30_ToLower:
	ld (ws+1321), a
	cp 65
	jp c, c01_0089
;c01_008a:
	ld b,90
	ld a, (ws+1321)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_0089
;c01_0088:
	ld a, (ws+1321)
	or 32
	ld (ws+1322), a
	jp c01_0083
c01_0089:
	ld a, (ws+1321)
	ld (ws+1322), a
c01_0083:
;end_f30_ToLower:
	ld a, (ws+1322)
	ret


	; StrLen workspace at ws+1412 length ws+7
f32_StrLen:
	ld (ws+1412), hl
	ld (ws+1416), hl
c01_0095:
	ld hl, (ws+1416)
	ld a,(hl)
	ld (ws+1418), a
	or a
;	jp nz, c01_009b
;	jp c01_0096
;c01_009b:
	jp z,c01_0096
;c01_0097:
	ld hl, (ws+1416)
	inc hl
	ld (ws+1416), hl
	jp c01_0095
c01_0096:
	ld hl, (ws+1416)
	ld de, (ws+1412)
	and a
	sbc hl,de
;	ld (ws+1414), hl
;end_f32_StrLen:
;	ld hl, (ws+1414)
	ret


	; MemCopy workspace at ws+1400 length ws+6
f34_MemCopy:
	ld (ws+1404), hl
	pop bc
	pop hl
	ld (ws+1402), hl
	pop hl
	ld (ws+1400), hl
	push bc
c01_00a3:
	ld hl, (ws+1402)
	ld a,h
	or l
	jp z, c01_00a8
	ld hl, (ws+1400)
	ld a,(hl)
	ld hl, (ws+1404)
	ld (hl),a
	inc hl
	ld (ws+1404), hl
	ld hl, (ws+1400)
	inc hl
	ld (ws+1400), hl
	ld hl, (ws+1402)
	dec hl
	ld (ws+1402), hl
	jp c01_00a3
c01_00a8:
;end_f34_MemCopy:
	ret


	; RawAlloc workspace at ws+1434 length ws+24
f37_RawAlloc:
	ld (ws+1434), hl
	inc hl
	inc hl
	call f5_AlignUp
;	ld (ws+1438), hl
	ld (ws+1440), hl
	ld de,4
	and a
	sbc hl,de
	jp nc, c01_00c3
;c01_00c2:
	ld de,4
	ld (ws+1440), de
c01_00c3:
;c01_00bf:
	ld de, (ws+1440)
	ld hl,7
	add hl,de
	ld a,l
	and 248
	ld l,a
	ld a,h
	and 255
	ld h,a
	ld (ws+1440), hl
	ld hl, (ws+6)
	ld (ws+1442), hl
	ld bc,0
	ld (ws+1444), bc
	ld (ws+1446), bc
	ld (ws+1448), bc
	ld iy,65535
	ld (ws+1450), iy
c01_00c4:
	ld hl, (ws+1442)
	ld a,h
	or l
	jp z, c01_00c9
;c01_00c8:
	ld hl, (ws+1442)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1452), hl
	ld de, (ws+1440)
	and a
	sbc hl,de
	jp c, c01_00d0
;c01_00d1:
	ld hl, (ws+1452)
	ld de, (ws+1450)
	and a
	sbc hl,de
	jp nc, c01_00d0
;c01_00cf:
	ld hl, (ws+1442)
	ld (ws+1446), hl
	ld hl, (ws+1452)
	ld (ws+1450), hl
	ld hl, (ws+1444)
	ld (ws+1448), hl
	ld de, (ws+1450)
	ld hl, (ws+1440)
	and a
	sbc hl,de
;	jp nz, c01_00d6
;	jp c01_00c9
;c01_00d6:
	jp z,c01_00c9
;c01_00d2:
c01_00d0:
;c01_00ca:
	ld hl, (ws+1442)
	ld (ws+1444), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1442), hl
	jp c01_00c4
c01_00c9:
	ld hl, (ws+1446)
	ld a,h
	or l
	jp nz, c01_00db
	ld bc,0
	ld (ws+1436), bc
	jp end_f37_RawAlloc
c01_00db:
;c01_00d7:
	ld hl, (ws+1450)
	ld de, (ws+1440)
	and a
	sbc hl,de
	ld (ws+1454), hl
	ld de,4
	and a
	sbc hl,de
	jp nc, c01_00e0
;c01_00df:
	ld hl, (ws+1448)
	ld a,h
	or l
	jp z, c01_00e5
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1448)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00e1
c01_00e5:
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+6), hl
c01_00e1:
	ld hl, (ws+1450)
	ld (ws+1440), hl
	jp c01_00dc
c01_00e0:
	ld de, (ws+1454)
	ld hl, (ws+1446)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1446)
	ld h,d
	ld l,e
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ld (ws+1446), hl
c01_00dc:
	ld hl, (ws+1446)
	ld (ws+1456), hl
	ld de, (ws+1440)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1456)
	inc hl
	inc hl
	ld (ws+1436), hl
	push hl
	ld d,0
	push de
	ld hl, (ws+1440)
	dec hl
	dec hl
	call f8_MemSet
end_f37_RawAlloc:
	ld hl, (ws+1436)
	ret


	; AddFreeBlock workspace at ws+1440 length ws+8
f39_AddFreeBlock:
	ld (ws+1442), hl
	pop bc
	pop hl
	ld (ws+1440), hl
	push bc
	push hl
	ld h,170
	push hl
	ld hl, (ws+1442)
	call f8_MemSet
	ld hl, (ws+1440)
	ld (ws+1444), hl
	ld de, (ws+1442)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+6)
	ld (ws+1446), hl
	ld hl, (ws+1444)
	ld de, (ws+1446)
	and a
	sbc hl,de
	jp nc, c01_00ef
;c01_00ee:
	ld de, (ws+1444)
	ld h,d
	ld l,e
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1446)
	and a
	sbc hl,de
	jp nz, c01_00f4
	ld de, (ws+1442)
	ld hl, (ws+1446)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1444)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1444)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00f0
c01_00f4:
	ld de, (ws+1446)
	ld hl, (ws+1444)
	ld (hl),e
	inc hl
	ld (hl),d
c01_00f0:
	ld hl, (ws+1444)
	ld (ws+6), hl
	jp c01_00eb
c01_00ef:
c01_00f5:
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp nz, c01_00fb
	ld de, (ws+1444)
	ld hl, (ws+1446)
	ld (hl),e
	inc hl
	ld (hl),d
	ld bc,0
	ld h,d
	ld l,e
	ld (hl),c
	inc hl
	ld (hl),b
	jp c01_00f6
c01_00fb:
;c01_00f7:
	ld bc, (ws+1444)
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld h,b
	ld l,c
	and a
	sbc hl,de
	jp nc, c01_0100
;c01_00ff:
	ld de, (ws+1444)
	ld hl, (ws+1442)
	add hl,de
	ex de,hl
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	and a
	sbc hl,de
	jp nz, c01_0105
	ld de, (ws+1442)
	ld hl, (ws+1446)
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
	add hl,de
	ex de,hl
	ld hl, (ws+1444)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1444)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_0101
c01_0105:
	ld hl, (ws+1446)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1444)
	ld (hl),e
	inc hl
	ld (hl),d
c01_0101:
	ld de, (ws+1444)
	ld hl, (ws+1446)
	ld (hl),e
	inc hl
	ld (hl),d
	jp c01_00f6
c01_0100:
;c01_00fc:
	ld hl, (ws+1446)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1446), hl
	jp c01_00f5
c01_00f6:
	ld de, (ws+1446)
	ld h,d
	ld l,e
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1444)
	and a
	sbc hl,de
	jp nz, c01_010a
	ld hl, (ws+1446)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1444)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ex de,hl
	ld hl, (ws+1446)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1444)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1446)
	ld (hl),e
	inc hl
	ld (hl),d
c01_010a:
;c01_0106:
c01_00eb:
;end_f39_AddFreeBlock:
	ret


	; Free workspace at ws+1436 length ws+4
f40_Free:
	ld (ws+1436), hl
	ld a,h
	or l
	jp z, c01_010f
	ld hl, (ws+1436)
	dec hl
	dec hl
	ld (ws+1438), hl
	push hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f39_AddFreeBlock
c01_010f:
;c01_010b:
;end_f40_Free:
	ret


	; GetFreeMemory workspace at ws+1296 length ws+4
f41_GetFreeMemory:
	ld bc,0
	ld (ws+1296), bc
	ld hl, (ws+6)
	ld (ws+1298), hl
c01_0110:
	ld hl, (ws+1298)
	ld a,h
	or l
	jp z, c01_0115
	ld de, (ws+1296)
	ld hl, (ws+1298)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ld (ws+1296), hl
	ld hl, (ws+1298)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1298), hl
	jp c01_0110
c01_0115:
;end_f41_GetFreeMemory:
	ld hl, (ws+1296)
	ret


	; fill workspace at ws+1348 length ws+8
f44_fill:
	ld (ws+1352), a
	pop bc
	pop hl
	ld (ws+1350), hl
	pop hl
	ld (ws+1348), hl
	push bc
c01_0116:
	ld hl, (ws+1350)
	ld a,(hl)
	ld (ws+1355), a
	cp 32
	jp c, c01_011d
;c01_011f:
	ld a, (ws+1355)
	cp 46
	jp nz, c01_011e
c01_011d:
	ld a,32
	ld (ws+1355), a
	jp c01_0118
c01_011e:
	ld a, (ws+1355)
	cp 42
	jp nz, c01_0123
	ld a,63
	ld (ws+1355), a
	jp c01_0118
c01_0123:
	ld hl, (ws+1350)
	inc hl
	ld (ws+1350), hl
c01_0118:
	ld a, (ws+1355)
	cp 97
	jp c, c01_012a
;c01_012b:
	ld b,122
	ld a, (ws+1355)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_012a
;c01_0129:
	ld a, (ws+1355)
	add 224
	ld (ws+1355), a
c01_012a:
;c01_0124:
	ld a, (ws+1355)
	ld hl, (ws+1348)
	ld (hl),a
	inc hl
	ld (ws+1348), hl
	ld a, (ws+1352)
	dec a
	ld (ws+1352), a
	or a
	jp nz, c01_0116 ; c01_0130
;c01_012f:
	jp c01_0117
c01_0130:
;c01_012c:
	jp c01_0116
c01_0117:
	ld hl, (ws+1350)
;	ld (ws+1353), hl
;end_f44_fill:
;	ld hl, (ws+1353)
	ret


	; file_i_init workspace at ws+1339 length ws+9
f43_file_i_init:
	ld (ws+1341), hl
	pop bc
	pop hl
	ld (ws+1339), hl
	push bc
	ld hl, (ws+1339)
	push hl
	ld d,0
	push de
	ld hl,166
	call f8_MemSet
	ld hl, (ws+1339)
	inc hl
	inc hl
	inc hl
	push hl
	ld b,32
	push bc
	ld hl,11
	call f8_MemSet
	ld hl, (ws+1339)
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, (ws+1341)
	push hl
	ld a,8
	call f44_fill
;	ld (ws+1343), hl
	ld (ws+1341), hl
c01_0131:
	ld hl, (ws+1341)
	ld a,(hl)
	ld (ws+1345), a
	cp 32
	jp c, c01_0132 ; c01_0138
;c01_013a:
	ld a, (ws+1345)
	cp 46
	jp nz, c01_0139
c01_0138:
	jp c01_0132
c01_0139:
;c01_0133:
	ld hl, (ws+1341)
	inc hl
	ld (ws+1341), hl
	jp c01_0131
c01_0132:
	ld a, (ws+1345)
	cp 46
	jp nz, c01_013f
	ld de, (ws+1339)
	ld hl,11
	add hl,de
	push hl
	ld hl, (ws+1341)
	inc hl
	push hl
	ld a,3
	call f44_fill
;	ld (ws+1346), hl
	ld (ws+1341), hl
c01_013f:
;c01_013b:
	ld ix, (ws+1339)
	ld (ix+35), 255
	ld (ix+36), 255
	ld a,127
	push ix
	pop hl
	ld (hl),a
;end_f43_file_i_init:
	ret


	; fcb_i_gbpb workspace at ws+1427 length ws+7
f45_fcb_i_gbpb:
	ld (ws+1429), a
	pop bc
	pop hl
	ld (ws+1427), hl
	push bc
	inc hl
	inc hl
	ld (ws+1430), hl
	ld hl, (ws+1427)
	ld de,38
	add hl,de
	ld (ws+1432), hl
	ld c, 26 
	ld de, ( ws+1432 ) 
	call 5 
	ld a, ( ws+1429 ) 
	ld c, a 
	ld de, ( ws+1430 ) 
	call 5 
;end_f45_fcb_i_gbpb:
	ret


	; fcb_i_blockin workspace at ws+1425 length ws+2
f46_fcb_i_blockin:
	ld (ws+1425), hl
	ld de,38
	add hl,de
	push hl
	ld d,0
	push de
	ld hl,128
	call f8_MemSet
	ld hl, (ws+1425)
	push hl
	ld a,33
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+1425)
	inc hl
	ld (hl),a
;end_f46_fcb_i_blockin:
	ret


	; fcb_i_blockout workspace at ws+1425 length ws+2
f47_fcb_i_blockout:
	ld (ws+1425), hl
	inc hl
	ld a,(hl)
	or a
	jp z, c01_0144
	ld hl, (ws+1425)
	push hl
	ld a,34
	call f45_fcb_i_gbpb
	xor a
	ld hl, (ws+1425)
	inc hl
	ld (hl),a
c01_0144:
;c01_0140:
;end_f47_fcb_i_blockout:
	ret


	; fcb_i_changeblock workspace at ws+1421 length ws+4
f48_fcb_i_changeblock:
	ld (ws+1423), hl
	pop bc
	pop hl
	ld (ws+1421), hl
	push bc
	ld de, (ws+1423)
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	and a
	sbc hl,de
	jp z, c01_0149
	ld hl, (ws+1421)
	call f47_fcb_i_blockout
	ld hl, (ws+1423)
	ld ix, (ws+1421)
	ld (ix+35), l
	ld (ix+36), h
	push ix
	pop hl
	call f46_fcb_i_blockin
c01_0149:
;c01_0145:
;end_f48_fcb_i_changeblock:
	ret


	; fcb_i_convert_a_to_error workspace at ws+1341 length ws+0
f49_fcb_i_convert_a_to_error:
	cp 0ffh 
	ld a, 0 
	ret nz 
	inc a 
;end_f49_fcb_i_convert_a_to_erro: 
	ret


	; FCBOpenIn workspace at ws+1332 length ws+7
f50_FCBOpenIn:
	ld (ws+1334), hl
	pop bc
	pop hl
	ld (ws+1332), hl
	push bc
	push hl
	ld hl, (ws+1334)
	call f43_file_i_init
	ld hl, (ws+1332)
	inc hl
	inc hl
	ld (ws+1337), hl
	ld c, 15 
	ld de, ( ws+1337 ) 
	call 5 
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+1336 ), a 
;end_f50_FCBOpenIn:
;	ld a, (ws+1336)
	ret


	; FCBOpenOut workspace at ws+1297 length ws+7
f52_FCBOpenOut:
	ld (ws+1299), hl
	pop bc
	pop hl
	ld (ws+1297), hl
	push bc
	push hl
	ld hl, (ws+1299)
	call f43_file_i_init
	ld hl, (ws+1297)
	inc hl
	inc hl
	ld (ws+1302), hl
	ld c, 19 
	ld de, ( ws+1302 ) 
	call 5 
	ld c, 22 
	ld de, ( ws+1302 ) 
	call 5 
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+1301 ), a 
;end_f52_FCBOpenOut:
;	ld a, (ws+1301)
	ret


	; FCBClose workspace at ws+1336 length ws+5
f53_FCBClose:
	ld (ws+1336), hl
	call f47_fcb_i_blockout
	ld hl, (ws+1336)
	inc hl
	inc hl
	ld (ws+1339), hl
	ld c, 16 
	ld de, ( ws+1339 ) 
	call 5 
	call f49_fcb_i_convert_a_to_error 
;	ld ( ws+1338 ), a 
;end_f53_FCBClose:
;	ld a, (ws+1338)
	ret


	; FCBSeek workspace at ws+1332 length ws+9
f54_FCBSeek:
	ld (ws+1334), hl
	exx
	ld (ws+1336), hl
	exx
	pop bc
	pop hl
	ld (ws+1332), hl
	push bc
	ld de, (ws+1334)
	exx
	ld de, (ws+1336)
	exx
	ld hl,65535
	exx
	ld hl,65535
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+1334), hl
	exx
	ld (ws+1336), hl
	exx
	ld hl, (ws+1334)
	exx
	ld hl, (ws+1336)
	exx
	ld a,7
	call f469__lsr4
	ld (ws+1338), hl
	ld a, (ws+1334)
	and 127
	ld (ws+1340), a
	ld hl, (ws+1332)
	push hl
	ld hl, (ws+1338)
	call f48_fcb_i_changeblock
	ld a, (ws+1340)
	ld hl, (ws+1332)
	ld (hl),a
;end_f54_FCBSeek:
	ret


	; FCBPos workspace at ws+1336 length ws+6
f55_FCBPos:
	ld (ws+1336), hl
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	exx
	ld hl,0
	exx
	ld a,7
	call f470__asl4
	ex de,hl
	exx
	ex de,hl
	exx
	ld hl, (ws+1336)
	ld a,(hl)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	call f482__or4
	ex de,hl
	exx
	ex de,hl
	exx
	ld hl,1
	exx
	ld hl,0
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+1338), hl
	exx
	ld (ws+1340), hl
	exx
;end_f55_FCBPos:
	ld hl, (ws+1338)
	exx
	ld hl, (ws+1340)
	exx
	ret


	; fcb_i_nextchar workspace at ws+1419 length ws+2
f60_fcb_i_nextchar:
	ld (ws+1419), hl
	ld a,(hl)
	inc a
	ld (hl),a
	ld a,(hl)
	cp 128
	jp nz, c01_014e
	ld hl, (ws+1419)
	push hl
	push hl
	pop ix
	ld l, (ix+35)
	ld h, (ix+36)
	inc hl
	call f48_fcb_i_changeblock
	xor a
	ld hl, (ws+1419)
	ld (hl),a
c01_014e:
;c01_014a:
;end_f60_fcb_i_nextchar:
	ret


	; FCBGetChar workspace at ws+1326 length ws+3
f61_FCBGetChar:
	ld (ws+1326), hl
	call f60_fcb_i_nextchar
	ld hl, (ws+1326)
	ld de,38
	add hl,de
	ex de,hl
	ld hl, (ws+1326)
	ld a,(hl)
	ld l,a
	ld h,0
	add hl,de
	ld a,(hl)
;	ld (ws+1328), a
;end_f61_FCBGetChar:
;	ld a, (ws+1328)
	ret


	; FCBPutChar workspace at ws+1416 length ws+3
f62_FCBPutChar:
	ld (ws+1418), a
	pop bc
	pop hl
	ld (ws+1416), hl
	push bc
	call f60_fcb_i_nextchar
	ld a, (ws+1418)
	push af
	ld hl, (ws+1416)
	ld de,38
	add hl,de
	ex de,hl
	ld hl, (ws+1416)
	ld a,(hl)
	ld l,a
	ld h,0
	add hl,de
	pop af
	ld (hl),a
	ld a,1
	ld hl, (ws+1416)
	inc hl
	ld (hl),a
;end_f62_FCBPutChar:
	ret


	; StrDupBraced workspace at ws+1388 length ws+12
f76_StrDupBraced:
	ld (ws+1388), hl
	call f32_StrLen
;	ld (ws+1392), hl
	ld (ws+1394), hl
	inc hl
	inc hl
	inc hl
	call f75_InternalAlloc
;	ld (ws+1396), hl
	ld (ws+1390), hl
	ld (ws+1398), hl
	ld a,91
	ld (hl),a
	inc hl
	ld (ws+1398), hl
	ld hl, (ws+1388)
	push hl
	ld hl, (ws+1394)
	push hl
	ld hl, (ws+1398)
	call f34_MemCopy
	ld de, (ws+1398)
	ld hl, (ws+1394)
	add hl,de
	ld (ws+1398), hl
	ld a,93
	ld (hl),a
	inc hl
	ld (ws+1398), hl
	xor a
	ld (hl),a
;end_f76_StrDupBraced:
	ld hl, (ws+1390)
	ret


	; StrDupArrayed workspace at ws+1369 length ws+14
f77_StrDupArrayed:
	ld (ws+1371), hl
	pop bc
	pop hl
	ld (ws+1369), hl
	push bc
	call f32_StrLen
;	ld (ws+1375), hl
	ld (ws+1377), hl
	inc hl
	inc hl
	inc hl
	call f75_InternalAlloc
;	ld (ws+1379), hl
	ld (ws+1373), hl
	ld (ws+1381), hl
	ld hl, (ws+1369)
	push hl
	ld hl, (ws+1377)
	push hl
	ld hl, (ws+1381)
	call f34_MemCopy
	ld de, (ws+1381)
	ld hl, (ws+1377)
	add hl,de
	ld (ws+1381), hl
	ld a,91
	ld (hl),a
	inc hl
	ld (ws+1381), hl
	ld a,93
	ld (hl),a
	inc hl
	ld (ws+1381), hl
	xor a
	ld (hl),a
;end_f77_StrDupArrayed:
	ld hl, (ws+1373)
	ret


	; InternalStrDup workspace at ws+1372 length ws+10
f78_InternalStrDup:
	ld (ws+1372), hl
	call f32_StrLen
;	ld (ws+1376), hl
	inc hl
	ld (ws+1378), hl
	call f75_InternalAlloc
;	ld (ws+1380), hl
	ld (ws+1374), hl
	ld hl, (ws+1372)
	push hl
	ld hl, (ws+1378)
	push hl
	ld hl, (ws+1374)
	call f34_MemCopy
;end_f78_InternalStrDup:
	ld hl, (ws+1374)
	ret


	; AllocNewSymbol workspace at ws+1398 length ws+4
f70_AllocNewSymbol:
	ld hl, (ws+66)
	ld a,h
	or l
	jp z, c01_0166
	ld hl, (ws+66)
	ld (ws+1398), hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+66), hl
	ld hl, (ws+1398)
	push hl
	ld d,0
	push de
	ld hl,11
	call f8_MemSet
	jp c01_0162
c01_0166:
	ld hl,11
	call f75_InternalAlloc
;	ld (ws+1400), hl
	ld (ws+1398), hl
c01_0162:
;end_f70_AllocNewSymbol:
	ld hl, (ws+1398)
	ret


	; FreeSymbol workspace at ws+1373 length ws+2
f71_FreeSymbol:
	ld (ws+1373), hl
	ld hl, (ws+66)
	ld ix, (ws+1373)
	ld (ix+8), l
	ld (ix+9), h
	push ix
	pop hl
	ld (ws+66), hl
;end_f71_FreeSymbol:
	ret


	; AllocNewType workspace at ws+1388 length ws+4
f72_AllocNewType:
	ld hl, (ws+68)
	ld a,h
	or l
	jp z, c01_016b
	ld hl, (ws+68)
	ld (ws+1388), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+68), hl
	ld hl, (ws+1388)
	push hl
	ld d,0
	push de
	ld hl,17
	call f8_MemSet
	jp c01_0167
c01_016b:
	ld hl,17
	call f75_InternalAlloc
;	ld (ws+1390), hl
	ld (ws+1388), hl
c01_0167:
;end_f72_AllocNewType:
	ld hl, (ws+1388)
	ret


	; FreeType workspace at ws+1373 length ws+2
f73_FreeType:
	ld (ws+1373), hl
	ld hl, (ws+68)
	ld ix, (ws+1373)
	ld (ix+9), l
	ld (ix+10), h
	push ix
	pop hl
	ld (ws+68), hl
;end_f73_FreeType:
	ret
c01_c9:
	db 79,117,116,32,111,102,32,109,101,109,111,114,121,10,0


	; InternalAlloc workspace at ws+1426 length ws+8
f75_InternalAlloc:
	ld (ws+1426), hl
	call f37_RawAlloc
;	ld (ws+1430), hl
	ld (ws+1428), hl
	ld a,h
	or l
	jp nz, c01_0170
c01_0171:
	ld hl, (ws+66)
	ld a,h
	or l
	jp z, c01_0176
	ld hl, (ws+66)
	ld (ws+1428), hl
	push hl
	pop ix
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+66), hl
	ld hl, (ws+1428)
	call f40_Free
	jp c01_0171
c01_0176:
c01_0177:
	ld hl, (ws+68)
	ld a,h
	or l
	jp z, c01_017c
	ld hl, (ws+68)
	ld (ws+1428), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+68), hl
	ld hl, (ws+1428)
	call f40_Free
	jp c01_0177
c01_017c:
	call f79_PurgeAllFreeNodes
	ld hl, (ws+1426)
	call f37_RawAlloc
;	ld (ws+1432), hl
	ld (ws+1428), hl
	ld a,h
	or l
	jp nz, c01_0181
	ld hl,c01_c9
	call f9_print
	call f4_ExitWithError
c01_0181:
;c01_017d:
c01_0170:
;c01_016c:
;end_f75_InternalAlloc:
	ld hl, (ws+1428)
	ret
f2___main_s0182:
	db 0
	db 0
	db 0
	db 0
	db 146
	db 187
	db 0
	db 144
	db 132
	db 152
	db 147
	db 173
	db 142
	db 136
	db 151
	db 33
	db 33
	db 33
	db 33
	db 33
	db 33
	db 33
	db 33
	db 33
	db 33
	db 134
	db 150
	db 0
	db 0
	db 0
	db 0
	db 16
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 145
	db 0
	db 133
	db 177
	db 48
	db 0
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 48
	db 159
	db 176
	db 160
	db 155
c01_c10:
	db 64,97,108,105,97,115,0
c01_c11:
	db 64,97,115,109,0
c01_c12:
	db 64,97,116,0
c01_c13:
	db 64,98,121,116,101,115,111,102,0
c01_c14:
	db 64,100,101,99,108,0
c01_c15:
	db 64,101,120,116,101,114,110,0
c01_c16:
	db 64,105,110,100,101,120,111,102,0
c01_c17:
	db 64,105,109,112,108,0
c01_c18:
	db 64,115,105,122,101,111,102,0
c01_c19:
	db 64,110,101,120,116,0
c01_c20:
	db 64,112,114,101,118,0
c01_c21:
	db 97,110,100,0
c01_c22:
	db 97,115,0
c01_c23:
	db 98,114,101,97,107,0
c01_c24:
	db 99,97,115,101,0
c01_c25:
	db 99,111,110,115,116,0
c01_c26:
	db 99,111,110,116,105,110,117,101,0
c01_c27:
	db 101,108,115,101,0
c01_c28:
	db 101,108,115,101,105,102,0
c01_c29:
	db 101,110,100,0
c01_c30:
	db 101,120,116,101,114,110,0
c01_c31:
	db 105,102,0
c01_c32:
	db 105,115,0
c01_c33:
	db 105,110,99,108,117,100,101,0
c01_c34:
	db 105,110,116,0
c01_c35:
	db 105,110,116,101,114,102,97,99,101,0
c01_c36:
	db 105,109,112,108,101,109,101,110,116,115,0
c01_c37:
	db 108,111,111,112,0
c01_c38:
	db 110,111,116,0
c01_c39:
	db 111,114,0
c01_c40:
	db 114,101,99,111,114,100,0
c01_c41:
	db 114,101,116,117,114,110,0
c01_c42:
	db 115,117,98,0
c01_c43:
	db 116,104,101,110,0
c01_c44:
	db 116,121,112,101,100,101,102,0
c01_c45:
	db 118,97,114,0
c01_c46:
	db 119,104,101,110,0
c01_c47:
	db 119,104,105,108,101,0
f2___main_s0183:
	dw c01_c10
	dw c01_c11
	dw c01_c12
	dw c01_c13
	dw c01_c14
	dw c01_c15
	dw c01_c16
	dw c01_c17
	dw c01_c18
	dw c01_c19
	dw c01_c20
	dw c01_c21
	dw c01_c22
	dw c01_c23
	dw c01_c24
	dw c01_c25
	dw c01_c26
	dw c01_c27
	dw c01_c28
	dw c01_c29
	dw c01_c30
	dw c01_c31
	dw c01_c32
	dw c01_c33
	dw c01_c34
	dw c01_c35
	dw c01_c36
	dw c01_c37
	dw c01_c38
	dw c01_c39
	dw c01_c40
	dw c01_c41
	dw c01_c42
	dw c01_c43
	dw c01_c44
	dw c01_c45
	dw c01_c46
	dw c01_c47
f2___main_s0184:
	db 67
	db 1
	db 35
	db 36
	db 43
	db 11
	db 62
	db 42
	db 40
	db 60
	db 61
	db 46
	db 58
	db 3
	db 64
	db 7
	db 63
	db 9
	db 37
	db 10
	db 11
	db 12
	db 65
	db 255
	db 38
	db 44
	db 68
	db 13
	db 15
	db 47
	db 20
	db 21
	db 25
	db 26
	db 39
	db 28
	db 66
	db 29
c01_c48:
	db 101,114,114,111,114,58,32,0
c01_c49:
	db 60,101,111,102,62,0
c01_c50:
	db 58,32,0
c01_c51:
	db 58,32,0


	; StartError workspace at ws+1432 length ws+0
f80_StartError:
	ld hl,c01_c48
	call f9_print
	ld hl, (ws+72)
	ld a,h
	or l
	jp nz, c01_0189
	ld hl,c01_c49
	call f9_print
	jp c01_0185
c01_0189:
	ld hl, (ws+72)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	ld hl,c01_c50
	call f9_print
	ld ix, (ws+72)
	ld l, (ix+4)
	ld h, (ix+5)
	call f16_print_i16
c01_0185:
	ld hl,c01_c51
	jp   f9_print ;	call f9_print
;end_f80_StartError:
;	ret


	; EndError workspace at ws+1432 length ws+0
f81_EndError:
	call f10_print_nl
	jp   f4_ExitWithError ;	call f4_ExitWithError
;end_f81_EndError:
;	ret


	; SimpleError workspace at ws+1430 length ws+2
f82_SimpleError:
	ld (ws+1430), hl
	call f80_StartError
	ld hl, (ws+1430)
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f82_SimpleError:
;	ret


	; LexerAddIncludePath workspace at ws+1298 length ws+6
f83_LexerAddIncludePath:
	ld (ws+1298), hl
	ld hl,4
	call f75_InternalAlloc
;	ld (ws+1300), hl
	ld (ws+1302), hl
	ld de, (ws+70)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1298)
	ld hl, (ws+1302)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1302)
	ld (ws+70), hl
;end_f83_LexerAddIncludePath:
	ret
c01_c52:
	db 32,32,0


	; LexerPrintSpaces workspace at ws+1328 length ws+1
f84_LexerPrintSpaces:
	ld a, (ws+374)
	ld (ws+1328), a
c01_018a:
	ld a, (ws+1328)
	or a
	jp z, c01_018f
	ld hl,c01_c52
	call f9_print
	ld a, (ws+1328)
	dec a
	ld (ws+1328), a
	jp c01_018a
c01_018f:
;end_f84_LexerPrintSpaces:
	ret


	; lexer_i_open workspace at ws+1328 length ws+4
f85_lexer_i_open:
	ld (ws+1328), hl
	ld de,ws+208
	push de
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f50_FCBOpenIn
;	ld (ws+1331), a
	or a
	jp nz, c01_0194
	ld de,ws+208
	push de
	ld ix, (ws+1328)
	ld l, (ix+6)
	ld h, (ix+7)
	exx
	ld l, (ix+8)
	ld h, (ix+9)
	exx
	call f54_FCBSeek
	xor a
	ld (ws+1330), a
	jp c01_0190
c01_0194:
	ld a,1
	ld (ws+1330), a
c01_0190:
;end_f85_lexer_i_open:
	ld a, (ws+1330)
	ret


	; lexer_i_close workspace at ws+1328 length ws+8
f86_lexer_i_close:
	ld (ws+1328), hl
	ld hl,ws+208
	call f55_FCBPos
	ld (ws+1330), hl
	exx
	ld (ws+1332), hl
	exx
	ld hl, (ws+1330)
	exx
	ld hl, (ws+1332)
	exx
	ld ix, (ws+1328)
	ld (ix+6), l
	ld (ix+7), h
	exx
	ld (ix+8), l
	ld (ix+9), h
	exx
	ld hl,ws+208
	call f53_FCBClose
;	ld (ws+1334), a
;	ld (ws+1335), a
;end_f86_lexer_i_close:
	ret
c01_c53:
	db 62,32,0
c01_c54:
	db 99,97,110,110,111,116,32,111,112,101,110,32,39,0
c01_c55:
	db 39,0


	; LexerIncludeFile workspace at ws+1309 length ws+19
f87_LexerIncludeFile:
	ld (ws+1309), hl
	ld hl,10
	call f75_InternalAlloc
;	ld (ws+1311), hl
	ld (ws+1313), hl
	ld de, (ws+72)
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix, (ws+1313)
	ld (ix+4), 1
	ld (ix+5), 0
	ld h,d
	ld l,e
	ld a,h
	or l
	jp z, c01_0199
	ld hl, (ws+72)
	call f86_lexer_i_close
c01_0199:
;c01_0195:
	ld hl, (ws+70)
	ld (ws+1315), hl
	ld hl, (ws+1309)
	call f32_StrLen
;	ld (ws+1317), hl
	ld (ws+1319), hl
c01_019a:
	ld hl, (ws+1315)
	ld a,h
	or l
	jp z, c01_019f
	ld hl, (ws+1315)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f32_StrLen
;	ld (ws+1321), hl
	ld (ws+1323), hl
	ld de, (ws+1319)
	add hl,de
	inc hl
	call f75_InternalAlloc
;	ld (ws+1325), hl
	ld d,h
	ld e,l
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1315)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1323)
	push hl
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f34_MemCopy
	ld hl, (ws+1309)
	push hl
	ld hl, (ws+1319)
	inc hl
	push hl
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+1323)
	add hl,de
	call f34_MemCopy
	ld hl, (ws+1313)
	call f85_lexer_i_open
;	ld (ws+1327), a
	or a
	jp nz, c01_01a4
	ld a, (ws+374)
	inc a
	ld (ws+374), a
	call f84_LexerPrintSpaces
	ld hl,c01_c53
	call f9_print
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	call f10_print_nl
	ld hl, (ws+1313)
	ld (ws+72), hl
	ret
c01_01a4:
;c01_01a0:
	ld hl, (ws+1313)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
	ld hl, (ws+1315)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1315), hl
	jp c01_019a
c01_019f:
	call f80_StartError
	ld hl,c01_c54
	call f9_print
	ld hl, (ws+1309)
	call f9_print
	ld hl,c01_c55
	call f9_print
	call f81_EndError
;end_f87_LexerIncludeFile:
	ret


	; lexer_i_ctype workspace at ws+1321 length ws+3
f89_lexer_i_ctype:
	ld (ws+1321), a
	cp 33
	jp c, c01_01ab
;c01_01ac:
	ld b,127
	ld a, (ws+1321)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_01ab
;c01_01aa:
	ld bc,f2___main_s0182
	ld a, (ws+1321)
	add 223
	ld l,a
	ld h,0
	add hl,bc
	ld a,(hl)
	ld (ws+1322), a
	and 128
	or a
	jp z, c01_01a5 ; c01_01b1
;c01_01b0:
	ld a, (ws+1322)
	and 127
	ld (ws+1323), a
	ld a,128
	ld (ws+1322), a
c01_01b1:
;c01_01ad:
	jp c01_01a5
c01_01ab:
	xor a
	ld (ws+1322), a
	xor a
	ld (ws+1323), a
c01_01a5:
;end_f89_lexer_i_ctype:
	ld a, (ws+1322)
	pop bc
	push af
	ld a, (ws+1323)
	push bc
	ret
c01_c56:
	db 60,32,0
c01_c57:
	db 73,47,79,32,101,114,114,111,114,0


	; lexer_i_getchar workspace at ws+1321 length ws+5
f90_lexer_i_getchar:
	ld a, (ws+74)
	or a
	jp z, c01_01b6
	ld a, (ws+74)
	ld (ws+1321), a
	xor a
	ld (ws+74), a
	jp end_f90_lexer_i_getchar
c01_01b6:
;c01_01b2:
c01_01b7:
	ld hl, (ws+72)
	ld a,h
	or l
	jp nz, c01_01bd
	xor a
	ld (ws+1321), a
	jp c01_01b8
c01_01bd:
;c01_01b9:
	ld hl, (ws+72)
	ld (ws+1322), hl
	ld hl,ws+208
	call f61_FCBGetChar
;	ld (ws+1324), a
	ld (ws+1321), a
	cp 26
	jp nz, c01_01c2
	xor a
	ld (ws+1321), a
c01_01c2:
;c01_01be:
	ld a, (ws+1321)
	or a
;	jp z, c01_01c7
;	jp c01_01b8
;c01_01c7:
	jp nz,c01_01b8
;c01_01c3:
	ld hl, (ws+1322)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+72), hl
	ld hl, (ws+1322)
	call f86_lexer_i_close
	ld hl, (ws+1322)
	call f40_Free
	ld hl, (ws+72)
	ld a,h
	or l
	jp z, c01_01b7 ; c01_01cc
;c01_01cb:
	ld a, (ws+374)
	dec a
	ld (ws+374), a
	call f84_LexerPrintSpaces
	ld hl,c01_c56
	call f9_print
	ld hl, (ws+72)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f9_print
	call f10_print_nl
	ld hl, (ws+72)
	call f85_lexer_i_open
;	ld (ws+1325), a
	or a
	jp z, c01_01b7 ; c01_01d1
;c01_01d0:
	ld hl,c01_c57
	call f82_SimpleError
c01_01d1:
;c01_01cd:
c01_01cc:
;c01_01c8:
	jp c01_01b7
c01_01b8:
end_f90_lexer_i_getchar:
	ld a, (ws+1321)
	ret
c01_c58:
	db 117,110,112,97,114,115,101,97,98,108,101,32,99,104,97,114,97,99,116,101,114,32,48,120,0


	; lexer_i_unparseable workspace at ws+1306 length ws+1
f91_lexer_i_unparseable:
	ld (ws+1306), a
	call f80_StartError
	ld hl,c01_c58
	call f9_print
	ld a, (ws+1306)
	call f18_print_hex_i8
	jp   f81_EndError ;	call f81_EndError
;end_f91_lexer_i_unparseable:
;	ret


	; lexer_i_skipwhitespace workspace at ws+1310 length ws+2
f92_lexer_i_skipwhitespace:
c01_01d2:
	call f90_lexer_i_getchar
	ld (ws+1310), a
	ld (ws+1311), a
	cp 32
;	jp nz, c01_01d5
;	jp c01_01d4
;c01_01d5:
	jp z,c01_01d4
	cp 13
;	jp nz, c01_01d6
;	jp c01_01d4
;c01_01d6:
	jp z,c01_01d4
	cp 10
	jp nz, c01_01d7
	ld ix, (ws+72)
	ld l, (ix+4)
	ld h, (ix+5)
	inc hl
	ld (ix+4), l
	ld (ix+5), h
	jp c01_01d2 ; c01_01d4
c01_01d7:
	cp 9
	jp nz, c01_01d3 ; c01_01d8
	jp c01_01d2 ; c01_01d4
c01_01d8:
	jp c01_01d3
c01_01d4:
	jp c01_01d2
c01_01d3:
	ld a, (ws+1311)
	ld (ws+74), a
;end_f92_lexer_i_skipwhitespace:
	ret
c01_c59:
	db 116,111,107,101,110,32,116,111,111,32,108,111,110,103,0


	; lexer_i_read_identifier workspace at ws+1306 length ws+4
f93_lexer_i_read_identifier:
c01_01d9:
	call f90_lexer_i_getchar
	ld (ws+1306), a
	ld (ws+1307), a
	call f89_lexer_i_ctype
;	ld (ws+1309), a
	pop af
	ld (ws+1308), a
	and 32
	or a
	jp z, c01_01df
	ld a, (ws+1307)
	push af
	ld de,ws+75
	ld a, (ws+203)
	ld l,a
	ld h,0
	add hl,de
	pop af
	ld (hl),a
	ld a, (ws+203)
	inc a
	ld (ws+203), a
	cp 128
	jp nz, c01_01d9 ; c01_01e4
;c01_01e3:
	call f80_StartError
	ld hl,c01_c59
	call f9_print
	call f81_EndError
c01_01e4:
;c01_01e0:
	jp c01_01d9 ; c01_01db
c01_01df:
	ld a, (ws+1307)
	ld (ws+74), a
	jp c01_01da
c01_01db:
	jp c01_01d9
c01_01da:
	ld b,0
	ld de,ws+75
	ld a, (ws+203)
	ld l,a
	ld h,b
	add hl,de
	ld a,b
	ld (hl),a
;end_f93_lexer_i_read_identifier:
	ret


	; lexer_i_match_keyword workspace at ws+1306 length ws+3
f94_lexer_i_match_keyword:
	xor a
	ld (ws+1307), a
c01_01e5:
	ld a, (ws+1307)
	cp 38
	jp z, c01_01ea
	ld de,ws+75
	push de
	ld bc,f2___main_s0183
	ld a, (ws+1307)
	ld l,a
	ld h,0
	add hl,hl
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f29_StrCmp
;	ld (ws+1308), a
	or a
	jp nz, c01_01ef
	ld bc,f2___main_s0184
	ld a, (ws+1307)
	ld l,a
	ld h,0
	add hl,bc
	ld a,(hl)
	ld (ws+1306), a
	jp end_f94_lexer_i_match_keyword
c01_01ef:
;c01_01eb:
	ld a, (ws+1307)
	inc a
	ld (ws+1307), a
	jp c01_01e5
c01_01ea:
	ld a,33
	ld (ws+1306), a
end_f94_lexer_i_match_keyword:
	ld a, (ws+1306)
	ret
c01_c60:
	db 105,110,118,97,108,105,100,32,110,117,109,98,101,114,0


	; lexer_i_read_number workspace at ws+1310 length ws+11
f95_lexer_i_read_number:
	ld hl,0
	ld (ws+204), hl
	ld (ws+206), hl
	ld hl,10
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	call f90_lexer_i_getchar
	ld (ws+1316), a
	ld (ws+1317), a
	cp 48
	jp nz, c01_01f4
	call f90_lexer_i_getchar
	ld (ws+1317), a
	cp 98
	jp nz, c01_01f6
	ld hl,2
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ; c01_01f5
c01_01f6:
	cp 111
	jp nz, c01_01f7
	ld hl,8
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ; c01_01f5
c01_01f7:
	cp 100
	jp nz, c01_01f8
	ld hl,10
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ; c01_01f5
c01_01f8:
	cp 120
	jp nz, c01_01f9
	ld hl,16
	ld (ws+1310), hl
	ld hl,0
	ld (ws+1312), hl
	jp c01_01f0 ; c01_01f5
c01_01f9:
	ld a, (ws+1317)
	ld (ws+74), a
	call f89_lexer_i_ctype
;	ld (ws+1315), a
	pop af
	ld (ws+1314), a
	and 32
	or a
	jp nz, c01_01f0 ; c01_01fe
;c01_01fd:
	ret
c01_01fe:
;c01_01fa:
c01_01f5:
	jp c01_01f0
c01_01f4:
	ld a, (ws+1317)
	ld (ws+74), a
c01_01f0:
c01_01ff:
	call f90_lexer_i_getchar
;	ld (ws+1319), a
	call f30_ToLower
;	ld (ws+1320), a
	ld (ws+1317), a
	cp 95
;	jp nz, c01_0205
;	jp c01_01ff
;c01_0205:
	jp z,c01_01ff
;c01_0201:
	ld a, (ws+1317)
	call f89_lexer_i_ctype
;	ld (ws+1315), a
	pop af
	ld (ws+1314), a
	and 32
	or a
	jp nz, c01_020a
	ld a, (ws+1317)
	ld (ws+74), a
	jp c01_0200
c01_020a:
;c01_0206:
	ld a, (ws+1317)
	cp 97
	jp c, c01_020f
;c01_020e:
	ld a, (ws+1317)
	add 169
	ld (ws+1317), a
	jp c01_020b
c01_020f:
	ld a, (ws+1317)
	add 208
	ld (ws+1317), a
c01_020b:
	ld a, (ws+1317)
	push af
	ld a, (ws+1310)
	ld b,a
	pop af
	cp b
	jp c, c01_0214
;c01_0213:
	call f80_StartError
	ld hl,c01_c60
	call f9_print
	call f81_EndError
c01_0214:
;c01_0210:
	ld bc, (ws+204)
	exx
	ld bc, (ws+206)
	exx
	ld de, (ws+1310)
	exx
	ld de, (ws+1312)
	exx
	call f474__mul4
	ex de,hl
	exx
	ex de,hl
	exx
	ld a, (ws+1317)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	add hl,de
	exx
	adc hl,de
	exx
	ld (ws+204), hl
	exx
	ld (ws+206), hl
	exx
	jp c01_01ff
c01_0200:
;end_f95_lexer_i_read_number:
	ret
c01_c61:
	db 109,97,108,102,111,114,109,101,100,32,0


	; lexer_i_malformed workspace at ws+1315 length ws+2
f96_lexer_i_malformed:
	ld (ws+1315), hl
	call f80_StartError
	ld hl,c01_c61
	call f9_print
	ld hl, (ws+1315)
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f96_lexer_i_malformed:
;	ret
c01_c62:
	db 101,115,99,97,112,101,0


	; lexer_i_get_escaped workspace at ws+1313 length ws+2
f97_lexer_i_get_escaped:
	call f90_lexer_i_getchar
;	ld (ws+1314), a
	ld (ws+1313), a
	cp 110
	jp nz, c01_0216
	ld a,10
	ld (ws+1313), a
	jp c01_0215
c01_0216:
	cp 114
	jp nz, c01_0217
	ld a,13
	ld (ws+1313), a
	jp c01_0215
c01_0217:
	cp 116
	jp nz, c01_0218
	ld a,9
	ld (ws+1313), a
	jp c01_0215
c01_0218:
	cp 92
	jp nz, c01_0219
	ld a,92
	ld (ws+1313), a
	jp c01_0215
c01_0219:
	cp 39
	jp nz, c01_021a
	ld a,39
	ld (ws+1313), a
	jp c01_0215
c01_021a:
	cp 34
	jp nz, c01_021b
	ld a,34
	ld (ws+1313), a
	jp c01_0215
c01_021b:
	cp 48
	jp nz, c01_021c
	xor a
	ld (ws+1313), a
	jp c01_0215
c01_021c:
	ld hl,c01_c62
	call f96_lexer_i_malformed
c01_0215:
;end_f97_lexer_i_get_escaped:
	ld a, (ws+1313)
	ret
c01_c63:
	db 115,116,114,105,110,103,32,99,111,110,115,116,97,110,116,0
c01_c64:
	db 115,116,114,105,110,103,32,99,111,110,115,116,97,110,116,32,116,111,111,32,108,111,110,103,0


	; lexer_i_read_string workspace at ws+1310 length ws+3
f98_lexer_i_read_string:
	xor a
	ld (ws+203), a
c01_021d:
	call f90_lexer_i_getchar
	ld (ws+1310), a
	ld (ws+1311), a
	cp 32
	jp nc, c01_0223
;c01_0222:
	ld hl,c01_c63
	call f96_lexer_i_malformed
c01_0223:
;c01_021f:
	ld a, (ws+1311)
	cp 34
;	jp nz, c01_0225
;	jp c01_021e
;c01_0225:
	jp z,c01_021e
	cp 92
	jp nz, c01_0226
	call f97_lexer_i_get_escaped
	ld (ws+1311), a
c01_0226:
;c01_0224:
	ld a, (ws+1311)
	push af
	ld de,ws+75
	ld a, (ws+203)
	ld l,a
	ld h,0
	add hl,de
	pop af
	ld (hl),a
	ld a, (ws+203)
	inc a
	ld (ws+203), a
	cp 128
	jp nz, c01_021d ; c01_022b
;c01_022a:
	call f80_StartError
	ld hl,c01_c64
	call f9_print
	call f81_EndError
c01_022b:
;c01_0227:
	jp c01_021d
c01_021e:
	ld b,0
	ld de,ws+75
	ld a, (ws+203)
	ld l,a
	ld h,b
	add hl,de
	ld a,b
	ld (hl),a
;end_f98_lexer_i_read_string:
	ret
c01_c65:
	db 99,104,97,114,97,99,116,101,114,32,99,111,110,115,116,97,110,116,0


	; malformed workspace at ws+1310 length ws+0
f100_malformed:
	ld hl,c01_c65
	jp   f96_lexer_i_malformed ;	call f96_lexer_i_malformed
;end_f100_malformed:
;	ret


	; lexer_i_read_char workspace at ws+1306 length ws+4
f99_lexer_i_read_char:
	call f90_lexer_i_getchar
	ld (ws+1306), a
	ld (ws+1307), a
	cp 32
	jp c, c01_0231
;c01_0233:
	ld a, (ws+1307)
	cp 39
	jp nz, c01_0232
c01_0231:
	call f100_malformed
c01_0232:
;c01_022c:
	ld a, (ws+1307)
	cp 92
	jp nz, c01_0238
	call f97_lexer_i_get_escaped
	ld (ws+1307), a
c01_0238:
;c01_0234:
	ld a, (ws+1307)
	ld l,a
	xor a
	ld h,a
	exx
	ld l,a
	ld h,a
	exx
	ld (ws+204), hl
	exx
	ld (ws+206), hl
	exx
	call f90_lexer_i_getchar
;	ld (ws+1309), a
	ld (ws+1307), a
	cp 39
;	jp z, c01_023d
;	call f100_malformed
;c01_023d:
	call nz,f100_malformed
;c01_0239:
;end_f99_lexer_i_read_char:
	ret
c01_c66:
	db 105,110,99,108,117,100,101,32,100,105,114,101,99,116,105,118,101,0


	; malformed_include workspace at ws+1309 length ws+0
f102_malformed_include:
	ld hl,c01_c66
	jp   f96_lexer_i_malformed ;	call f96_lexer_i_malformed
;end_f102_malformed_include:
;	ret


	; lexer_i_include workspace at ws+1306 length ws+3
f101_lexer_i_include:
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
;	ld (ws+1306), a
;	ld (ws+1307), a
	cp 34
;	jp z, c01_0242
;	call f102_malformed_include
;c01_0242:
	call nz,f102_malformed_include
;c01_023e:
	call f98_lexer_i_read_string
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
;	ld (ws+1308), a
;	ld (ws+1307), a
	cp 59
;	jp z, c01_0247
;	call f102_malformed_include
;c01_0247:
	call nz,f102_malformed_include
;c01_0243:
	ld hl,ws+75
	jp   f87_LexerIncludeFile ;	call f87_LexerIncludeFile
;end_f101_lexer_i_include:
;	ret
c01_c67:
	db 35,108,105,110,101,32,100,105,114,101,99,116,105,118,101,0


	; lexer_i_line_directive workspace at ws+1306 length ws+4
f103_lexer_i_line_directive:
	call f92_lexer_i_skipwhitespace
	call f95_lexer_i_read_number
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
;	ld (ws+1306), a
;	ld (ws+1307), a
	cp 34
	jp z, c01_024c
	ld hl,c01_c67
	call f96_lexer_i_malformed
c01_024c:
;c01_0248:
	call f98_lexer_i_read_string
	ld hl, (ws+204)
	exx
	ld hl, (ws+206)
	exx
	ld ix, (ws+72)
	ld (ix+4), l
	ld (ix+5), h
	push ix
	pop hl
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
	ld hl,ws+75
	call f78_InternalStrDup
;	ld (ws+1308), hl
	ld d,h
	ld e,l
	ld hl, (ws+72)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
;end_f103_lexer_i_line_directive:
	ret
c01_c68:
	db 108,105,110,101,0


	; LexerReadToken workspace at ws+1294 length ws+12
f88_LexerReadToken:
c01_024d:
	call f92_lexer_i_skipwhitespace
	call f90_lexer_i_getchar
	ld (ws+1295), a
	ld (ws+1296), a
	cp 35
	jp nz, c01_0253
	xor a
	ld (ws+203), a
	call f93_lexer_i_read_identifier
	ld de,ws+75
	push de
	ld hl,c01_c68
	call f29_StrCmp
;	ld (ws+1297), a
	or a
;	jp nz, c01_0258
;	call f103_lexer_i_line_directive
;c01_0258:
	call z,f103_lexer_i_line_directive
;c01_0254:
c01_0259:
	call f90_lexer_i_getchar
;	ld (ws+1298), a
	ld (ws+1296), a
	cp 10
	jp z, c01_0262
;c01_0265:
	ld a, (ws+1296)
	cp 13
	jp z, c01_0262
;c01_0264:
	ld a, (ws+1296)
	or a
	jp nz, c01_0259 ; c01_0263
c01_0262:
	ld a, (ws+1296)
	ld (ws+74), a
	jp c01_024d ; c01_025a
c01_0263:
;c01_025b:
	jp c01_0259
c01_025a:
	jp c01_024d
c01_0253:
;c01_024f:
	ld a, (ws+1296)
	or a
	jp nz, c01_0267
	xor a
	ld (ws+1294), a
	jp c01_0266
c01_0267:
	cp 58
	jp nz, c01_0268
	call f90_lexer_i_getchar
	ld (ws+1296), a
	cp 61
	jp nz, c01_026d
	ld a,2
	ld (ws+1294), a
	jp c01_0266 ; c01_0269
c01_026d:
	ld a, (ws+1296)
	ld (ws+74), a
	ld a,6
	ld (ws+1294), a
c01_0269:
	jp c01_0266
c01_0268:
	cp 60
	jp nz, c01_026e
	call f90_lexer_i_getchar
	ld (ws+1296), a
	cp 60
	jp nz, c01_0270
	ld a,56
	ld (ws+1294), a
	jp c01_0266 ; c01_026f
c01_0270:
	cp 61
	jp nz, c01_0271
	ld a,51
	ld (ws+1294), a
	jp c01_0266 ; c01_026f
c01_0271:
	ld a, (ws+1296)
	ld (ws+74), a
	ld a,50
	ld (ws+1294), a
c01_026f:
	jp c01_0266
c01_026e:
	cp 61
	jp nz, c01_0272
	call f90_lexer_i_getchar
	ld (ws+1296), a
	cp 61
	jp nz, c01_0277
	ld a,54
	ld (ws+1294), a
	jp c01_0266 ; c01_0273
c01_0277:
	ld a, (ws+1296)
	call f91_lexer_i_unparseable
c01_0273:
	jp c01_0266
c01_0272:
	cp 33
	jp nz, c01_0278
	call f90_lexer_i_getchar
	ld (ws+1296), a
	cp 61
	jp nz, c01_027d
	ld a,55
	ld (ws+1294), a
	jp c01_0266 ; c01_0279
c01_027d:
	ld a, (ws+1296)
	call f91_lexer_i_unparseable
c01_0279:
	jp c01_0266
c01_0278:
	cp 62
	jp nz, c01_027e
	call f90_lexer_i_getchar
	ld (ws+1303), a
	ld (ws+1296), a
	cp 62
	jp nz, c01_0280
	ld a,57
	ld (ws+1294), a
	jp c01_0266 ; c01_027f
c01_0280:
	cp 61
	jp nz, c01_0281
	ld a,53
	ld (ws+1294), a
	jp c01_0266 ; c01_027f
c01_0281:
	ld a, (ws+1296)
	ld (ws+74), a
	ld a,52
	ld (ws+1294), a
c01_027f:
	jp c01_0266
c01_027e:
	cp 34
	jp nz, c01_0282
	call f98_lexer_i_read_string
	ld a,41
	ld (ws+1294), a
	jp c01_0266
c01_0282:
	cp 39
	jp nz, c01_0283
	call f99_lexer_i_read_char
	ld a,34
	ld (ws+1294), a
	jp c01_0266
c01_0283:
	ld a, (ws+1296)
	call f89_lexer_i_ctype
	ld (ws+1294), a
	pop af
	ld (ws+1304), a
	and 128
	or a
;	jp z, c01_0288
;	jp c01_0284
;c01_0288:
	jp nz,c01_0284
	ld a, (ws+1304)
	and 1
	or a
	jp z, c01_028c
	ld a, (ws+1296)
	ld (ws+74), a
	call f95_lexer_i_read_number
	ld a,34
	ld (ws+1294), a
	jp c01_0284
c01_028c:
	ld a, (ws+1304)
	and 16
	or a
	jp z, c01_0290
	ld a,1
	ld (ws+203), a
	ld a, (ws+1296)
	ld (ws+75), a
	call f93_lexer_i_read_identifier
	call f94_lexer_i_match_keyword
;	ld (ws+1305), a
	ld (ws+1294), a
	jp c01_0284
c01_0290:
	ld a, (ws+1296)
	call f91_lexer_i_unparseable
c01_0284:
c01_0266:
	ld a, (ws+1294)
	cp 255
	jp nz, c01_024e ; c01_0295
;c01_0294:
	call f101_lexer_i_include
	jp c01_024d ; c01_0291
c01_0295:
	jp c01_024e
c01_0291:
	jp c01_024d
c01_024e:
;end_f88_LexerReadToken:
	ld a, (ws+1294)
	ret


	; CountParameters workspace at ws+1354 length ws+3
f104_CountParameters:
	ld (ws+1354), hl
	xor a
	ld (ws+1356), a
c01_0296:
	ld hl, (ws+1354)
	ld a,h
	or l
	jp z, c01_029b
	ld a, (ws+1356)
	inc a
	ld (ws+1356), a
	ld hl, (ws+1354)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1354), hl
	jp c01_0296
c01_029b:
;end_f104_CountParameters:
	ld a, (ws+1356)
	ret


	; GetInputParameter workspace at ws+1373 length ws+5
f105_GetInputParameter:
	ld (ws+1375), a
	pop bc
	pop hl
	ld (ws+1373), hl
	push bc
	push hl
	pop ix
	ld a, (ix+26)
	or a
	jp z, c01_02a0
	ld ix, (ws+1373)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1376), hl
c01_02a1:
	ld a, (ws+1375)
	or a
	jp z, c01_029c ; c01_02a6
;c01_02a5:
	ld ix, (ws+1376)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1376), hl
	ld a, (ws+1375)
	dec a
	ld (ws+1375), a
	jp c01_02a1
c01_02a6:
	jp c01_029c
c01_02a0:
	ld ix,0
	ld (ws+1376), ix
c01_029c:
;end_f105_GetInputParameter:
	ld hl, (ws+1376)
	ret


	; GetOutputParameter workspace at ws+1378 length ws+5
f106_GetOutputParameter:
	ld (ws+1380), a
	pop bc
	pop hl
	ld (ws+1378), hl
	push bc
	push hl
	pop ix
	ld a, (ix+27)
	or a
	jp z, c01_02ab
	ld a, (ws+1380)
	ld b,a
	ld ix, (ws+1378)
	ld a, (ix+26)
	add a,b
	ld (ws+1380), a
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1381), hl
c01_02ac:
	ld a, (ws+1380)
	or a
	jp z, c01_02a7 ; c01_02b1
;c01_02b0:
	ld ix, (ws+1381)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1381), hl
	ld a, (ws+1380)
	dec a
	ld (ws+1380), a
	jp c01_02ac
c01_02b1:
	jp c01_02a7
c01_02ab:
	ld ix,0
	ld (ws+1381), ix
c01_02a7:
;end_f106_GetOutputParameter:
	ld hl, (ws+1381)
	ret


	; WidthToIndex workspace at ws+1413 length ws+2
f108_WidthToIndex:
	ld (ws+1413), a
	cp 4
	jp nz, c01_02b3
	ld a,3
	ld (ws+1414), a
	jp c01_02b2
c01_02b3:
	cp 8
	jp nz, c01_02b4
	ld a,4
	ld (ws+1414), a
	jp c01_02b2
c01_02b4:
	ld a, (ws+1413)
	ld (ws+1414), a
c01_02b2:
;end_f108_WidthToIndex:
	ld a, (ws+1414)
	ret


	; MidInit workspace at ws+1380 length ws+10
f110_MidInit:
	ld (ws+1381), hl
	exx
	ld (ws+1383), hl
	exx
	pop bc
	pop af
	ld (ws+1380), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1387), a
	add 7
	call f109_AllocateNewNode
;	ld (ws+1388), hl
	ld (ws+1385), hl
	ld de, (ws+1381)
	exx
	ld de, (ws+1383)
	exx
	ld hl, (ws+1385)
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
;end_f110_MidInit:
	ld hl, (ws+1385)
	ret


	; MidBlts workspace at ws+1377 length ws+17
f111_MidBlts:
	ld (ws+1388), a
	pop bc
	pop hl
	ld (ws+1386), hl
	pop hl
	ld (ws+1384), hl
	pop hl
	ld (ws+1382), hl
	pop hl
	ld (ws+1380), hl
	pop hl
	ld (ws+1378), hl
	pop af
	ld (ws+1377), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1391), a
	add 61
	call f109_AllocateNewNode
;	ld (ws+1392), hl
	ld (ws+1389), hl
	ld hl, (ws+1378)
	ld ix, (ws+1389)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1380)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1382)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1384)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1386)
	ld (ix+4), l
	ld (ix+5), h
	ld a, (ws+1388)
	ld (ix+6), a
;end_f111_MidBlts:
	ld hl, (ws+1389)
	ret


	; MidStartinit workspace at ws+1363 length ws+6
f113_MidStartinit:
	ld (ws+1363), hl
	ld a,6
	call f109_AllocateNewNode
;	ld (ws+1367), hl
	ld (ws+1365), hl
	ld de, (ws+1363)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f113_MidStartinit:
	ld hl, (ws+1365)
	ret


	; MidAsmsubref workspace at ws+1360 length ws+6
f114_MidAsmsubref:
	ld (ws+1360), hl
	ld a,21
	call f109_AllocateNewNode
;	ld (ws+1364), hl
	ld (ws+1362), hl
	ld de, (ws+1360)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f114_MidAsmsubref:
	ld hl, (ws+1362)
	ret


	; MidConstant workspace at ws+1413 length ws+8
f116_MidConstant:
	ld (ws+1413), hl
	exx
	ld (ws+1415), hl
	exx
	ld a,40
	call f109_AllocateNewNode
;	ld (ws+1419), hl
	ld (ws+1417), hl
	ld de, (ws+1413)
	exx
	ld de, (ws+1415)
	exx
	ld hl, (ws+1417)
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
;end_f116_MidConstant:
	ld hl, (ws+1417)
	ret


	; MidStartfile workspace at ws+1294 length ws+4
f118_MidStartfile:
	ld a,2
	call f109_AllocateNewNode
;	ld (ws+1296), hl
;	ld (ws+1294), hl
;end_f118_MidStartfile:
;	ld hl, (ws+1294)
	ret


	; MidStartsub workspace at ws+1359 length ws+6
f120_MidStartsub:
	ld (ws+1359), hl
	ld a,4
	call f109_AllocateNewNode
;	ld (ws+1363), hl
	ld (ws+1361), hl
	ld de, (ws+1359)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f120_MidStartsub:
	ld hl, (ws+1361)
	ret


	; MidPoparg workspace at ws+1378 length ws+11
f121_MidPoparg:
	ld (ws+1383), a
	pop bc
	pop hl
	ld (ws+1381), hl
	pop hl
	ld (ws+1379), hl
	pop af
	ld (ws+1378), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1386), a
	add 35
	call f109_AllocateNewNode
;	ld (ws+1387), hl
	ld (ws+1384), hl
	ld de, (ws+1379)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1381)
	ld hl, (ws+1384)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld a, (ws+1383)
	ld hl, (ws+1384)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl),a
;end_f121_MidPoparg:
	ld hl, (ws+1384)
	ret


	; MidEndinit workspace at ws+1355 length ws+4
f123_MidEndinit:
	ld a,15
	call f109_AllocateNewNode
;	ld (ws+1357), hl
;	ld (ws+1355), hl
;end_f123_MidEndinit:
;	ld hl, (ws+1355)
	ret


	; MidInitsubref workspace at ws+1369 length ws+6
f124_MidInitsubref:
	ld (ws+1369), hl
	ld a,14
	call f109_AllocateNewNode
;	ld (ws+1373), hl
	ld (ws+1371), hl
	ld de, (ws+1369)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f124_MidInitsubref:
	ld hl, (ws+1371)
	ret


	; MidEnd workspace at ws+1360 length ws+4
f125_MidEnd:
	ld a,1
	call f109_AllocateNewNode
;	ld (ws+1362), hl
;	ld (ws+1360), hl
;end_f125_MidEnd:
;	ld hl, (ws+1360)
	ret


	; MidArg workspace at ws+1360 length ws+15
f126_MidArg:
	ld (ws+1369), a
	pop bc
	pop hl
	ld (ws+1367), hl
	pop hl
	ld (ws+1365), hl
	pop hl
	ld (ws+1363), hl
	pop hl
	ld (ws+1361), hl
	pop af
	ld (ws+1360), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1372), a
	add 30
	call f109_AllocateNewNode
;	ld (ws+1373), hl
	ld (ws+1370), hl
	ld hl, (ws+1361)
	ld ix, (ws+1370)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1363)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1365)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1367)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld a, (ws+1369)
	push ix
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld (hl),a
;end_f126_MidArg:
	ld hl, (ws+1370)
	ret


	; MidJump workspace at ws+1361 length ws+6
f127_MidJump:
	ld (ws+1361), hl
	ld a,27
	call f109_AllocateNewNode
;	ld (ws+1365), hl
	ld (ws+1363), hl
	ld de, (ws+1361)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f127_MidJump:
	ld hl, (ws+1363)
	ret


	; MidWhencase workspace at ws+1361 length ws+12
f128_MidWhencase:
	ld (ws+1366), hl
	pop bc
	pop hl
	ld (ws+1362), hl
	pop hl
	ld (ws+1364), hl
	pop af
	ld (ws+1361), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1370), a
	add 76
	call f109_AllocateNewNode
;	ld (ws+1371), hl
	ld (ws+1368), hl
	ld de, (ws+1362)
	exx
	ld de, (ws+1364)
	exx
	ld hl, (ws+1368)
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
	ld hl, (ws+1366)
	ld ix, (ws+1368)
	ld (ix+4), l
	ld (ix+5), h
;end_f128_MidWhencase:
	ld hl, (ws+1368)
	ret


	; MidEndsub workspace at ws+1359 length ws+6
f129_MidEndsub:
	ld (ws+1359), hl
	ld a,5
	call f109_AllocateNewNode
;	ld (ws+1363), hl
	ld (ws+1361), hl
	ld de, (ws+1359)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f129_MidEndsub:
	ld hl, (ws+1361)
	ret


	; MidStartcase workspace at ws+1363 length ws+8
f134_MidStartcase:
	ld (ws+1364), hl
	pop bc
	pop af
	ld (ws+1363), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1368), a
	add 71
	call f109_AllocateNewNode
;	ld (ws+1369), hl
	ld (ws+1366), hl
	ld hl, (ws+1364)
	ld ix, (ws+1366)
	ld (ix+9), l
	ld (ix+10), h
;end_f134_MidStartcase:
	ld hl, (ws+1366)
	ret


	; MidBor workspace at ws+1355 length ws+15
f135_MidBor:
	ld (ws+1365), a
	pop bc
	pop hl
	ld (ws+1363), hl
	pop hl
	ld (ws+1361), hl
	pop hl
	ld (ws+1359), hl
	pop hl
	ld (ws+1357), hl
	pop hl
	ld (ws+1355), hl
	push bc
	ld a,55
	call f109_AllocateNewNode
;	ld (ws+1368), hl
	ld (ws+1366), hl
	ld hl, (ws+1355)
	ld ix, (ws+1366)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1357)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1359)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1361)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1363)
	ld (ix+4), l
	ld (ix+5), h
	ld a, (ws+1365)
	ld (ix+6), a
;end_f135_MidBor:
	ld hl, (ws+1366)
	ret


	; MidInitaddress workspace at ws+1369 length ws+8
f136_MidInitaddress:
	ld (ws+1371), hl
	pop bc
	pop hl
	ld (ws+1369), hl
	push bc
	ld a,13
	call f109_AllocateNewNode
;	ld (ws+1375), hl
	ld (ws+1373), hl
	ld de, (ws+1369)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1371)
	ld hl, (ws+1373)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
;end_f136_MidInitaddress:
	ld hl, (ws+1373)
	ret


	; MidPair workspace at ws+1355 length ws+8
f139_MidPair:
	ld (ws+1357), hl
	pop bc
	pop hl
	ld (ws+1355), hl
	push bc
	ld a,25
	call f109_AllocateNewNode
;	ld (ws+1361), hl
	ld (ws+1359), hl
	ld hl, (ws+1355)
	ld ix, (ws+1359)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1357)
	ld (ix+11), l
	ld (ix+12), h
;end_f139_MidPair:
	ld hl, (ws+1359)
	ret


	; MidAsmstart workspace at ws+1355 length ws+4
f141_MidAsmstart:
	ld a,18
	call f109_AllocateNewNode
;	ld (ws+1357), hl
;	ld (ws+1355), hl
;end_f141_MidAsmstart:
;	ld hl, (ws+1355)
	ret


	; MidAsmend workspace at ws+1355 length ws+4
f143_MidAsmend:
	ld a,23
	call f109_AllocateNewNode
;	ld (ws+1357), hl
;	ld (ws+1355), hl
;end_f143_MidAsmend:
;	ld hl, (ws+1355)
	ret


	; MidEndcase workspace at ws+1361 length ws+6
f144_MidEndcase:
	ld (ws+1361), a
	call f108_WidthToIndex
;	ld (ws+1364), a
	add 81
	call f109_AllocateNewNode
;	ld (ws+1365), hl
;	ld (ws+1362), hl
;end_f144_MidEndcase:
;	ld hl, (ws+1362)
	ret


	; MidAsmsymbol workspace at ws+1360 length ws+6
f147_MidAsmsymbol:
	ld (ws+1360), hl
	ld a,20
	call f109_AllocateNewNode
;	ld (ws+1364), hl
	ld (ws+1362), hl
	ld de, (ws+1360)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f147_MidAsmsymbol:
	ld hl, (ws+1362)
	ret


	; MidCall workspace at ws+1378 length ws+10
f148_MidCall:
	ld (ws+1382), hl
	pop bc
	pop hl
	ld (ws+1380), hl
	pop hl
	ld (ws+1378), hl
	push bc
	ld a,29
	call f109_AllocateNewNode
;	ld (ws+1386), hl
	ld (ws+1384), hl
	ld hl, (ws+1378)
	ld ix, (ws+1384)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1380)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1382)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
;end_f148_MidCall:
	ld hl, (ws+1384)
	ret


	; MidAsmgroupend workspace at ws+1397 length ws+4
f149_MidAsmgroupend:
	ld a,17
	call f109_AllocateNewNode
;	ld (ws+1399), hl
;	ld (ws+1397), hl
;end_f149_MidAsmgroupend:
;	ld hl, (ws+1397)
	ret


	; MidBltu workspace at ws+1377 length ws+17
f150_MidBltu:
	ld (ws+1388), a
	pop bc
	pop hl
	ld (ws+1386), hl
	pop hl
	ld (ws+1384), hl
	pop hl
	ld (ws+1382), hl
	pop hl
	ld (ws+1380), hl
	pop hl
	ld (ws+1378), hl
	pop af
	ld (ws+1377), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1391), a
	add 66
	call f109_AllocateNewNode
;	ld (ws+1392), hl
	ld (ws+1389), hl
	ld hl, (ws+1378)
	ld ix, (ws+1389)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1380)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1382)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1384)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1386)
	ld (ix+4), l
	ld (ix+5), h
	ld a, (ws+1388)
	ld (ix+6), a
;end_f150_MidBltu:
	ld hl, (ws+1389)
	ret


	; MidStore workspace at ws+1378 length ws+10
f152_MidStore:
	ld (ws+1381), hl
	pop bc
	pop hl
	ld (ws+1379), hl
	pop af
	ld (ws+1378), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1385), a
	add 49
	call f109_AllocateNewNode
;	ld (ws+1386), hl
	ld (ws+1383), hl
	ld hl, (ws+1379)
	ld ix, (ws+1383)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1381)
	ld (ix+11), l
	ld (ix+12), h
;end_f152_MidStore:
	ld hl, (ws+1383)
	ret


	; MidDeref workspace at ws+1390 length ws+8
f153_MidDeref:
	ld (ws+1391), hl
	pop bc
	pop af
	ld (ws+1390), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1395), a
	add 44
	call f109_AllocateNewNode
;	ld (ws+1396), hl
	ld (ws+1393), hl
	ld hl, (ws+1391)
	ld ix, (ws+1393)
	ld (ix+9), l
	ld (ix+10), h
;end_f153_MidDeref:
	ld hl, (ws+1393)
	ret


	; MidAddress workspace at ws+1378 length ws+8
f154_MidAddress:
	ld (ws+1380), hl
	pop bc
	pop hl
	ld (ws+1378), hl
	push bc
	ld a,42
	call f109_AllocateNewNode
;	ld (ws+1384), hl
	ld (ws+1382), hl
	ld de, (ws+1378)
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1380)
	ld hl, (ws+1382)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
;end_f154_MidAddress:
	ld hl, (ws+1382)
	ret


	; MidAsmgroupstart workspace at ws+1397 length ws+4
f156_MidAsmgroupstart:
	ld a,16
	call f109_AllocateNewNode
;	ld (ws+1399), hl
;	ld (ws+1397), hl
;end_f156_MidAsmgroupstart:
;	ld hl, (ws+1397)
	ret


	; MidEndfile workspace at ws+1294 length ws+4
f157_MidEndfile:
	ld a,3
	call f109_AllocateNewNode
;	ld (ws+1296), hl
;	ld (ws+1294), hl
;end_f157_MidEndfile:
;	ld hl, (ws+1294)
	ret


	; MidLabel workspace at ws+1390 length ws+6
f159_MidLabel:
	ld (ws+1390), hl
	ld a,26
	call f109_AllocateNewNode
;	ld (ws+1394), hl
	ld (ws+1392), hl
	ld de, (ws+1390)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f159_MidLabel:
	ld hl, (ws+1392)
	ret


	; MidInitstring workspace at ws+1369 length ws+6
f160_MidInitstring:
	ld (ws+1369), hl
	ld a,12
	call f109_AllocateNewNode
;	ld (ws+1373), hl
	ld (ws+1371), hl
	ld de, (ws+1369)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f160_MidInitstring:
	ld hl, (ws+1371)
	ret


	; MidBand workspace at ws+1355 length ws+15
f161_MidBand:
	ld (ws+1365), a
	pop bc
	pop hl
	ld (ws+1363), hl
	pop hl
	ld (ws+1361), hl
	pop hl
	ld (ws+1359), hl
	pop hl
	ld (ws+1357), hl
	pop hl
	ld (ws+1355), hl
	push bc
	ld a,54
	call f109_AllocateNewNode
;	ld (ws+1368), hl
	ld (ws+1366), hl
	ld hl, (ws+1355)
	ld ix, (ws+1366)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1357)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1359)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1361)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1363)
	ld (ix+4), l
	ld (ix+5), h
	ld a, (ws+1365)
	ld (ix+6), a
;end_f161_MidBand:
	ld hl, (ws+1366)
	ret


	; MidAsmtext workspace at ws+1355 length ws+6
f163_MidAsmtext:
	ld (ws+1355), hl
	ld a,19
	call f109_AllocateNewNode
;	ld (ws+1359), hl
	ld (ws+1357), hl
	ld de, (ws+1355)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f163_MidAsmtext:
	ld hl, (ws+1357)
	ret


	; MidBeq workspace at ws+1374 length ws+17
f164_MidBeq:
	ld (ws+1385), a
	pop bc
	pop hl
	ld (ws+1383), hl
	pop hl
	ld (ws+1381), hl
	pop hl
	ld (ws+1379), hl
	pop hl
	ld (ws+1377), hl
	pop hl
	ld (ws+1375), hl
	pop af
	ld (ws+1374), a
	push bc
	call f108_WidthToIndex
;	ld (ws+1388), a
	add 56
	call f109_AllocateNewNode
;	ld (ws+1389), hl
	ld (ws+1386), hl
	ld hl, (ws+1375)
	ld ix, (ws+1386)
	ld (ix+9), l
	ld (ix+10), h
	ld hl, (ws+1377)
	ld (ix+11), l
	ld (ix+12), h
	ld de, (ws+1379)
	push ix
	pop hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld de, (ws+1381)
	push ix
	pop hl
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+1383)
	ld (ix+4), l
	ld (ix+5), h
	ld a, (ws+1385)
	ld (ix+6), a
;end_f164_MidBeq:
	ld hl, (ws+1386)
	ret


	; MidReturn workspace at ws+1355 length ws+4
f166_MidReturn:
	ld a,28
	call f109_AllocateNewNode
;	ld (ws+1357), hl
;	ld (ws+1355), hl
;end_f166_MidReturn:
;	ld hl, (ws+1355)
	ret


	; MidAsmvalue workspace at ws+1360 length ws+8
f167_MidAsmvalue:
	ld (ws+1360), hl
	exx
	ld (ws+1362), hl
	exx
	ld a,22
	call f109_AllocateNewNode
;	ld (ws+1366), hl
	ld (ws+1364), hl
	ld de, (ws+1360)
	exx
	ld de, (ws+1362)
	exx
	ld hl, (ws+1364)
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
;end_f167_MidAsmvalue:
	ld hl, (ws+1364)
	ret


	; MidString workspace at ws+1357 length ws+6
f168_MidString:
	ld (ws+1357), hl
	ld a,41
	call f109_AllocateNewNode
;	ld (ws+1361), hl
	ld (ws+1359), hl
	ld de, (ws+1357)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f168_MidString:
	ld hl, (ws+1359)
	ret


	; MidSubref workspace at ws+1363 length ws+6
f169_MidSubref:
	ld (ws+1363), hl
	ld a,43
	call f109_AllocateNewNode
;	ld (ws+1367), hl
	ld (ws+1365), hl
	ld de, (ws+1363)
	ld (hl),e
	inc hl
	ld (hl),d
;end_f169_MidSubref:
	ld hl, (ws+1365)
	ret


	; AllocateNewNode workspace at ws+1421 length ws+5
f109_AllocateNewNode:
	ld (ws+1421), a
	ld hl, (ws+375)
	ld a,h
	or l
	jp z, c01_02ba
	ld hl, (ws+375)
	ld (ws+1422), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+375), hl
	ld hl, (ws+1422)
	push hl
	ld d,0
	push de
	ld hl,14
	call f8_MemSet
	jp c01_02b6
c01_02ba:
	ld hl,14
	call f75_InternalAlloc
;	ld (ws+1424), hl
	ld (ws+1422), hl
c01_02b6:
	ld a, (ws+1421)
	ld ix, (ws+1422)
	ld (ix+13), a
;end_f109_AllocateNewNode:
	ld hl, (ws+1422)
	ret


	; FreeNode workspace at ws+1421 length ws+2
f171_FreeNode:
	ld (ws+1421), hl
	ld hl, (ws+375)
	ld ix, (ws+1421)
	ld (ix+9), l
	ld (ix+10), h
	push ix
	pop hl
	ld (ws+375), hl
;end_f171_FreeNode:
	ret


	; PurgeAllFreeNodes workspace at ws+1434 length ws+2
f79_PurgeAllFreeNodes:
c01_02bb:
	ld hl, (ws+375)
	ld a,h
	or l
	jp z, c01_02c0
	ld hl, (ws+375)
	ld (ws+1434), hl
	push hl
	pop ix
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+375), hl
	ld hl, (ws+1434)
	call f40_Free
	jp c01_02bb
c01_02c0:
;end_f79_PurgeAllFreeNodes:
	ret


	; NodeWidth workspace at ws+1377 length ws+3
f172_NodeWidth:
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
c01_c250:
	db 98,97,100,32,102,111,108,100,0


	; midcodec_i_bad_fold workspace at ws+1430 length ws+0
f173_midcodec_i_bad_fold:
	ld hl,c01_c250
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f173_midcodec_i_bad_fold:
;	ret


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
	jp nz, c01_02c7
	ld hl, (ws+1383)
	exx
	ld hl, (ws+1385)
	exx
	call f484__not4
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
	jp nz, c01_02ca
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
	jp c01_02c9
c01_02ca:
	cp 131
	jp nz, c01_02cb
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
	jp c01_02c9
c01_02cb:
	cp 161
	jp nz, c01_02cc
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
	jp c01_02c9
c01_02cc:
	cp 136
	jp nz, c01_02cd
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
	jp c01_02c9
c01_02cd:
	cp 141
	jp nz, c01_02ce
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
	jp c01_02c9
c01_02ce:
	cp 146
	jp nz, c01_02cf
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
	jp c01_02c9
c01_02cf:
	cp 151
	jp nz, c01_02d0
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
	jp c01_02c9
c01_02d0:
	cp 166
	jp nz, c01_02d1
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
	jp c01_02c9
c01_02d1:
	cp 171
	jp nz, c01_02d2
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
	jp c01_02c9
c01_02d2:
	cp 176
	jp nz, c01_02d3
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
	jp c01_02c9
c01_02d3:
	cp 116
	jp nz, c01_02d4
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
	jp c01_02c9
c01_02d4:
	cp 121
	jp nz, c01_02d5
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
	jp c01_02c9
c01_02d5:
	cp 126
	jp nz, c01_02d6
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
	jp c01_02c9
c01_02d6:
	call f173_midcodec_i_bad_fold
c01_02c9:
;end_f176_FoldConstant2:
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
	jp p, c01_02e2
;c01_02e3:
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
	jp nz, c01_02e2
;c01_02e1:
c01_02e4:
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
	jp z, c01_02e9
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
	jp c01_02e4
c01_02e9:
c01_02e2:
;c01_02dc:
;end_f181_GetPowerOfTwo:
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
	call f116_MidConstant
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
	call f116_MidConstant
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
	cp 116
	jp z, c01_032d
;c01_0330:
	ld a, (ws+1380)
	cp 121
	jp z, c01_032d
;c01_032f:
	ld a, (ws+1380)
	cp 126
	jp nz, c01_032e
c01_032d:
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
	jp nz, c01_0335
	ld hl, (ws+1384)
	call f69_Discard
	ld hl, (ws+1382)
	ld (ws+1386), hl
	jp end_f183_MidC2Op
c01_0335:
;c01_0331:
c01_032e:
;c01_0326:
	ld a, (ws+1380)
	cp 156
	jp z, c01_033b
	ld a, (ws+1380)
	cp 131
	jp nz, c01_033c
c01_033b:
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
	jp nz, c01_0342
	ld hl, (ws+1384)
	call f69_Discard
	ld hl, (ws+1382)
	ld (ws+1386), hl
	jp end_f183_MidC2Op
c01_0342:
;c01_033e:
	ld ix, (ws+1382)
	ld a, (ix+13)
	cp 42
	jp nz, c01_0347
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
	jp nz, c01_0349
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
c01_0349:
	cp 131
	jp nz, c01_034a
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
c01_034a:
;c01_0348:
c01_0347:
;c01_0343:
c01_033c:
;c01_0336:
c01_0310:
;c01_030a:
	ld ix, (ws+1382)
	ld a, (ix+13)
	cp 40
	jp nz, c01_0351
;c01_0352:
	ld ix, (ws+1384)
	ld a, (ix+13)
	cp 40
	jp nz, c01_0351
;c01_0350:
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
c01_0351:
;c01_034b:
	ld a, (ws+1381)
	call f108_WidthToIndex
	ld (ws+1410), a
	ld a, (ws+1380)
	ld b,a
	ld a, (ws+1410)
	add a,b
	call f109_AllocateNewNode
;	ld (ws+1411), hl
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
	jp nz, c01_0357
	ld hl, (ws+1381)
	ld (ws+1384), hl
	jp end_f184_MidCCast
c01_0357:
;c01_0353:
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
	jp nz, c01_035c
	ld hl, (ws+1381)
	ld (ws+1384), hl
	jp c01_0358
c01_035c:
	ld a, (ws+1386)
	cp 1
	jp nz, c01_035e
	ld a,86
	ld (ws+1387), a
	jp c01_035d
c01_035e:
	cp 2
	jp nz, c01_035f
	ld a,91
	ld (ws+1387), a
	jp c01_035d
c01_035f:
	cp 4
	jp nz, c01_0360
	ld a,96
	ld (ws+1387), a
	jp c01_035d
c01_0360:
	cp 8
	jp nz, c01_0361
	ld a,101
	ld (ws+1387), a
c01_0361:
c01_035d:
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
c01_0358:
end_f184_MidCCast:
	ld hl, (ws+1384)
	ret


	; E_b8 workspace at ws+1415 length ws+1
f185_E_b8:
	ld (ws+1415), a
	ld bc,ws+377
	push bc
	call f62_FCBPutChar
;end_f185_E_b8:
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
	jp   f185_E_b8 ;	call f185_E_b8
;end_f186_E_b16:
;	ret


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
	jp   f186_E_b16 ;	call f186_E_b16
;end_f187_E_b32:
;	ret


	; E_bsize workspace at ws+1408 length ws+2
f188_E_bsize:
	ld (ws+1408), hl
	jp   f186_E_b16 ;	call f186_E_b16
;end_f188_E_bsize:
;	ret


	; E workspace at ws+1412 length ws+3
f195_E:
	ld (ws+1412), hl
c01_0362:
	ld hl, (ws+1412)
	ld a,(hl)
	ld (ws+1414), a
	inc hl
	ld (ws+1412), hl
	or a
;	jp nz, c01_0368
;	jp c01_0363
;c01_0368:
	jp z,c01_0363
;c01_0364:
	ld a, (ws+1414)
	call f185_E_b8
	jp c01_0362
c01_0363:
;end_f195_E:
	ret


	; E_countedstring workspace at ws+1408 length ws+4
f196_E_countedstring:
	ld (ws+1408), hl
	call f32_StrLen
	ld (ws+1410), hl
	ld a, (ws+1410)
	call f185_E_b8
	ld hl, (ws+1408)
	jp   f195_E ;	call f195_E
;end_f196_E_countedstring:
;	ret
c01_c251:
	db 99,97,110,110,111,116,32,111,112,101,110,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterOpenfile workspace at ws+1294 length ws+3
f207_EmitterOpenfile:
	ld (ws+1294), hl
	ld bc,ws+377
	push bc
	call f52_FCBOpenOut
;	ld (ws+1296), a
	or a
	jp z, c01_0389
	ld hl,c01_c251
	call f82_SimpleError
c01_0389:
;c01_0385:
;end_f207_EmitterOpenfile:
	ret
c01_c252:
	db 99,97,110,110,111,116,32,99,108,111,115,101,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterClosefile workspace at ws+1294 length ws+1
f208_EmitterClosefile:
	ld a,69
	call f185_E_b8
	ld hl,ws+377
	call f53_FCBClose
;	ld (ws+1294), a
	or a
	jp z, c01_038e
	ld hl,c01_c252
	call f82_SimpleError
c01_038e:
;c01_038a:
;end_f208_EmitterClosefile:
	ret


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
	jp   f196_E_countedstring ;	call f196_E_countedstring
;end_f209_EmitterDeclareSubrouti:  
;	ret


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
	call f196_E_countedstring
;end_f210_EmitterDeclareExternal:          
	ret


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
	call f186_E_b16
;end_f211_EmitterReferenceSubrou:        
	ret


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
;end_f212_EmitterReferenceSubrou:    
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
	call f188_E_bsize
;end_f213_EmitterDeclareWorkspac: 
	ret


	; EmitParameterList workspace at ws+1362 length ws+2
f214_EmitParameterList:
	ld (ws+1362), hl
c01_038f:
	ld hl, (ws+1362)
	ld a,h
	or l
	jp z, c01_0394
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
	jp c01_038f
c01_0394:
;end_f214_EmitParameterList:
	ret


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
;	ld (ws+1360), hl
	call f214_EmitParameterList
;end_f215_EmitterEmitInputParame:    
	ret


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
;	ld (ws+1360), hl
	call f214_EmitParameterList
;end_f216_EmitterEmitOutputParam:     
	ret


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
	jp   f185_E_b8 ;	call f185_E_b8
;end_f217_EmitterEmitSubroutineF:    
;	ret


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
c01_041d:
	ld hl, (ws+1392)
	ld a,h
	or l
	jp z, c01_0422
	ld ix, (ws+1392)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+1390)
	call f29_StrCmp
;	ld (ws+1394), a
	or a
	jp nz, c01_0427
c01_0428:
	ld ix, (ws+1392)
	ld a, (ix+10)
	cp 39
	jp nz, c01_042d
	ld hl, (ws+1392)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1392), hl
	jp c01_0428
c01_042d:
	jp end_f227_LookupSymbolInNamespac;
c01_0427:
;c01_0423:
	ld ix, (ws+1392)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1392), hl
	jp c01_041d
c01_0422:
	ld ix,0
	ld (ws+1392), ix
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
	jp nz, c01_0432
	ld hl, (ws+12)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+1377), hl
c01_0432:
;c01_042e:
c01_0433:
	ld hl, (ws+1377)
	ld a,h
	or l
	jp z, c01_0438
	ld hl, (ws+1377)
	push hl
	ld hl, (ws+1379)
	call f227_LookupSymbolInNamespace
;	ld (ws+1383), hl
	ld (ws+1381), hl
	ld a,h
	or l
	jp z, c01_043d
	jp end_f228_LookupSymbol
c01_043d:
;c01_0439:
	ld ix, (ws+1377)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1377), hl
	jp c01_0433
c01_0438:
	ld ix,0
	ld (ws+1381), ix
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
	jp nz, c01_0442
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
	jp c01_043e
c01_0442:
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
c01_043e:
	ld hl, (ws+1398)
	ld ix, (ws+1400)
	ld (ix+6), l
	ld (ix+7), h
;end_f229_AddToNamespace:
	ret
c01_c253:
	db 115,121,109,98,111,108,32,39,0
c01_c254:
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
	jp nz, c01_0447
	ld hl, (ws+12)
	inc hl
	inc hl
	inc hl
	inc hl
	ld (ws+1378), hl
c01_0447:
;c01_0443:
	call f70_AllocNewSymbol
;	ld (ws+1384), hl
	ld (ws+1382), hl
	ld hl, (ws+1380)
	ld a,h
	or l
	jp z, c01_044c
	ld hl, (ws+1378)
	push hl
	ld hl, (ws+1380)
	call f227_LookupSymbolInNamespace
;	ld (ws+1386), hl
	ld a,h
	or l
	jp z, c01_0451
	call f80_StartError
	ld hl,c01_c253
	call f9_print
	ld hl, (ws+1380)
	call f9_print
	ld hl,c01_c254
	call f9_print
	call f81_EndError
c01_0451:
;c01_044d:
	ld hl, (ws+1380)
	ld ix, (ws+1382)
	ld (ix+4), l
	ld (ix+5), h
	ld hl, (ws+1378)
	push hl
	push ix
	pop hl
	call f229_AddToNamespace
c01_044c:
;c01_0448:
;end_f230_AddSymbol:
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
;	ld (ws+1312), hl
;	ld (ws+1314), hl
;end_f232_AddAliasString:
	ret
c01_c255:
	db 39,0
c01_c256:
	db 39,32,105,115,32,97,32,112,97,114,116,105,97,108,32,116,121,112,101,0


	; CheckNotPartialType workspace at ws+1386 length ws+2
f233_CheckNotPartialType:
	ld (ws+1386), hl
	push hl
	pop ix
	ld a, (ix+15)
	cp 1
	jp nz, c01_0456
	call f80_StartError
	ld hl,c01_c255
	call f9_print
	ld ix, (ws+1386)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c256
	call f9_print
	call f81_EndError
c01_0456:
;c01_0452:
;end_f233_CheckNotPartialType:
	ret


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
	jp z, c01_045d
;c01_045e:
	ld ix, (ws+1400)
	ld b, (ix+15)
	ld a, (ws+1402)
	cp b
	jp nz, c01_045d
;c01_045c:
	ld a,1
	ld (ws+1403), a
c01_045d:
;c01_0457:
;end_f236_IsTypeOfKind:
	ld a, (ws+1403)
	ret


	; IsArray workspace at ws+1380 length ws+4
f237_IsArray:
	ld (ws+1380), hl
	push hl
	ld a,4
	call f236_IsTypeOfKind
;	ld (ws+1383), a
;	ld (ws+1382), a
;end_f237_IsArray:
;	ld a, (ws+1382)
	ret


	; IsPtr workspace at ws+1396 length ws+4
f74_IsPtr:
	ld (ws+1396), hl
	push hl
	ld a,3
	call f236_IsTypeOfKind
;	ld (ws+1399), a
;	ld (ws+1398), a
;end_f74_IsPtr:
;	ld a, (ws+1398)
	ret


	; IsSubroutine workspace at ws+1396 length ws+4
f238_IsSubroutine:
	ld (ws+1396), hl
	push hl
	ld a,6
	call f236_IsTypeOfKind
;	ld (ws+1399), a
;	ld (ws+1398), a
;end_f238_IsSubroutine:
;	ld a, (ws+1398)
	ret


	; IsNum workspace at ws+1396 length ws+4
f239_IsNum:
	ld (ws+1396), hl
	ld a,h
	or l
	jp nz, c01_0463
	ld a,1
	ld (ws+1398), a
	jp c01_045f
c01_0463:
	ld hl, (ws+1396)
	push hl
	ld a,2
	call f236_IsTypeOfKind
;	ld (ws+1399), a
	ld (ws+1398), a
c01_045f:
;end_f239_IsNum:
	ld a, (ws+1398)
	ret


	; IsSNum workspace at ws+1377 length ws+4
f240_IsSNum:
	ld (ws+1377), hl
	ld a,h
	or l
	jp nz, c01_0468
	ld a,1
	ld (ws+1379), a
	jp c01_0464
c01_0468:
	ld hl, (ws+1377)
	push hl
	ld a,2
	call f236_IsTypeOfKind
;	ld (ws+1380), a
	or a
	jp z, c01_046e
;c01_046f:
	ld hl, (ws+1377)
	ld a,(hl)
	or a
	jp z, c01_046e
;c01_046d:
	ld a,1
	ld (ws+1379), a
	jp c01_0464
c01_046e:
	xor a
	ld (ws+1379), a
c01_0464:
;end_f240_IsSNum:
	ld a, (ws+1379)
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
	jp nz, c01_0477
;c01_047a:
	ld a, (ws+1394)
	or a
	jp nz, c01_0477
;c01_0479:
	ld a, (ws+1395)
	or a
	jp z, c01_0478
c01_0477:
	ld a,1
	ld (ws+1392), a
	jp c01_0470
c01_0478:
	xor a
	ld (ws+1392), a
c01_0470:
;end_f241_IsScalar:
	ld a, (ws+1392)
	ret


	; IsRecord workspace at ws+1377 length ws+4
f242_IsRecord:
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
;	ld (ws+1387), a
	or a
	jp z, c01_047f
	ld de, (ws+1385)
	ld hl,11
	add hl,de
	ld a,(hl)
	ld (ws+1384), a
c01_047f:
;c01_047b:
	ld a, (ws+1384)
	push af
	ld hl, (ws+1380)
	call f153_MidDeref
;	ld (ws+1388), hl
	ld (ws+1382), hl
	ld hl, (ws+1385)
	ld ix, (ws+1382)
	ld (ix+7), l
	ld (ix+8), h
;end_f243_MakeLValue:
	ld hl, (ws+1382)
	ret
c01_c257:
	db 108,118,97,108,117,101,32,114,101,113,117,105,114,101,100,0


	; UndoLValue workspace at ws+1364 length ws+5
f244_UndoLValue:
	ld (ws+1364), hl
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1368), a
	cp 44
	jp c, c01_0485
;c01_0487:
	ld b,48
	ld a, (ws+1368)
	push af
	ld a,b
	pop bc
	cp b
	jp nc, c01_0486
c01_0485:
	ld hl,c01_c257
	call f82_SimpleError
c01_0486:
;c01_0480:
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
f245_IsLValue:
	ld (ws+1377), hl
	xor a
	ld (ws+1379), a
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1380), a
	cp 44
	jp c, c01_048e
;c01_048f:
	ld b,48
	ld a, (ws+1380)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_048e
;c01_048d:
	ld a,1
	ld (ws+1379), a
c01_048e:
;c01_0488:
;end_f245_IsLValue:
	ld a, (ws+1379)
	ret
c01_c258:
	db 112,111,105,110,116,101,114,32,111,114,32,108,118,97,108,117,101,32,114,101,113,117,105,114,101,100,0


	; MaybeUndoLValue workspace at ws+1380 length ws+6
f246_MaybeUndoLValue:
	ld (ws+1380), hl
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1384), a
	cp 44
	jp c, c01_0496
;c01_0497:
	ld b,48
	ld a, (ws+1384)
	push af
	ld a,b
	pop bc
	cp b
	jp c, c01_0496
;c01_0495:
	ld ix, (ws+1380)
	ld l, (ix+9)
	ld h, (ix+10)
	ld (ws+1382), hl
	ld (ix+9), 0
	ld (ix+10), 0
	jp c01_0490
c01_0496:
	ld ix, (ws+1380)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
;	ld (ws+1385), a
	or a
	jp z, c01_049b
	ld hl, (ws+1380)
	ld (ws+1382), hl
	jp c01_0490
c01_049b:
	ld hl,c01_c258
	call f82_SimpleError
c01_0490:
;end_f246_MaybeUndoLValue:
	ld hl, (ws+1382)
	ret


	; AllocLabel workspace at ws+1390 length ws+2
f247_AllocLabel:
	ld hl, (ws+14)
	ld (ws+1390), hl
	inc hl
	ld (ws+14), hl
;end_f247_AllocLabel:
	ld hl, (ws+1390)
	ret


	; AllocSubrId workspace at ws+1361 length ws+2
f248_AllocSubrId:
	ld hl, (ws+16)
	ld (ws+1361), hl
	inc hl
	ld (ws+16), hl
;end_f248_AllocSubrId:
	ld hl, (ws+1361)
	ret


	; MidWriter workspace at ws+1406 length ws+2
f249_MidWriter:
	ld (ws+1406), hl
;end_f249_MidWriter:
	ret


	; ArchAlignUp workspace at ws+1380 length ws+5
f250_ArchAlignUp:
	ld (ws+1382), a
	pop bc
	pop hl
	ld (ws+1380), hl
	push bc
;	ld (ws+1383), hl
;end_f250_ArchAlignUp:
;	ld hl, (ws+1383)
	ret
c01_c259:
	db 117,105,110,116,51,50,0
c01_c260:
	db 105,110,116,51,50,0
c01_c261:
	db 117,105,110,116,49,54,0
c01_c262:
	db 105,110,116,49,54,0
c01_c263:
	db 117,105,110,116,56,0
c01_c264:
	db 105,110,116,56,0
c01_c265:
	db 117,105,110,116,49,54,0
c01_c266:
	db 105,110,116,112,116,114,0


	; ArchInitTypes workspace at ws+1294 length ws+14
f251_ArchInitTypes:
	ld h,4
	push hl
	ld a,1
	push af
	ld d,0
	push de
	ld hl,c01_c259
	call f235_MakeNumberType
;	ld (ws+1294), hl
	ld (ws+543), hl
	ld h,4
	push hl
	ld a,1
	push af
	push af
	ld hl,c01_c260
	call f235_MakeNumberType
;	ld (ws+1296), hl
	ld (ws+545), hl
	ld b,2
	push bc
	ld a,1
	push af
	ld d,0
	push de
	ld hl,c01_c261
	call f235_MakeNumberType
;	ld (ws+1298), hl
	ld (ws+547), hl
	ld b,2
	push bc
	ld a,1
	push af
	push af
	ld hl,c01_c262
	call f235_MakeNumberType
;	ld (ws+1300), hl
	ld (ws+549), hl
	ld a,1
	push af
	push af
	ld d,0
	push de
	ld hl,c01_c263
	call f235_MakeNumberType
;	ld (ws+1302), hl
	ld (ws+551), hl
	ld a,1
	push af
	push af
	push af
	ld hl,c01_c264
	call f235_MakeNumberType
;	ld (ws+1304), hl
	ld (ws+553), hl
	ld hl, (ws+547)
	ld (ws+555), hl
	ld bc,0
	push bc
	ld hl,c01_c265
	call f228_LookupSymbol
	ld (ws+1306), hl
	ld hl,c01_c266
	push hl
	ld hl, (ws+1306)
	call f232_AddAliasString
;end_f251_ArchInitTypes:
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
	jp nz, c01_04a2
;c01_04a3:
	ld hl,255
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f487__cmps4
	jp m, c01_04a2
;c01_04a1:
	ld hl, (ws+551)
	ld (ws+1377), hl
	jp c01_049c
c01_04a2:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	ld de,65408
	exx
	ld de,65535
	exx
	call f487__cmps4
	jp m, c01_04a9
;c01_04aa:
	ld hl,127
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f487__cmps4
	jp m, c01_04a9
;c01_04a8:
	ld hl, (ws+553)
	ld (ws+1377), hl
	jp c01_049c
c01_04a9:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	exx
	bit 7,h
	exx
	jp nz, c01_04b0
;c01_04b1:
	ld hl,65535
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f487__cmps4
	jp m, c01_04b0
;c01_04af:
	ld hl, (ws+547)
	ld (ws+1377), hl
	jp c01_049c
c01_04b0:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	ld de,32768
	exx
	ld de,65535
	exx
	call f487__cmps4
	jp m, c01_04b7
;c01_04b8:
	ld hl,32767
	exx
	ld hl,0
	exx
	ld de, (ws+1373)
	exx
	ld de, (ws+1375)
	exx
	call f487__cmps4
	jp m, c01_04b7
;c01_04b6:
	ld hl, (ws+549)
	ld (ws+1377), hl
	jp c01_049c
c01_04b7:
	ld hl, (ws+1369)
	exx
	ld hl, (ws+1371)
	exx
	exx
	bit 7,h
	exx
	jp nz, c01_04bc
	ld hl, (ws+543)
	ld (ws+1377), hl
	jp c01_049c
c01_04bc:
	ld hl, (ws+545)
	ld (ws+1377), hl
c01_049c:
;end_f252_ArchGuessIntType:
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
;end_f253_ArchInitVariable:
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
	jp nc, c01_04c1
;c01_04c0:
	ld hl, (ws+1359)
	ld ix, (ws+1355)
	ld (ix+11), l
	ld (ix+12), h
c01_04c1:
;c01_04bd:
;end_f254_ArchInitMember:
	ret


	; WriteMid1 workspace at ws+1408 length ws+0
f255_WriteMid1:
	ld (ws+1406), hl
	ld a,(hl)
	jp   f185_E_b8 ;	call f185_E_b8
;end_f255_WriteMid1:
;	ret


	; WriteMid2 workspace at ws+1408 length ws+0
f256_WriteMid2:
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
;end_f256_WriteMid2:
;	ret


	; WriteMid3 workspace at ws+1408 length ws+0
f257_WriteMid3:
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
;end_f257_WriteMid3:
;	ret


	; WriteMid4 workspace at ws+1408 length ws+0
f258_WriteMid4:
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp   f196_E_countedstring ;	call f196_E_countedstring
;end_f258_WriteMid4:
;	ret


	; WriteMid5 workspace at ws+1408 length ws+0
f259_WriteMid5:
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
;end_f259_WriteMid5:
;	ret


	; WriteMid6 workspace at ws+1408 length ws+0
f260_WriteMid6:
	ld (ws+1406), hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	jp   f186_E_b16 ;	call f186_E_b16
;end_f260_WriteMid6:
;	ret


	; WriteMid7 workspace at ws+1408 length ws+0
f261_WriteMid7:
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
;end_f261_WriteMid7:
;	ret


	; WriteMid8 workspace at ws+1408 length ws+0
f262_WriteMid8:
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
;end_f262_WriteMid8:
;	ret


	; WriteMid9 workspace at ws+1408 length ws+0
f263_WriteMid9:
	ld (ws+1406), hl
;end_f263_WriteMid9:
	ret


	; WriteMid10 workspace at ws+1408 length ws+0
f264_WriteMid10:
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
;end_f264_WriteMid10:
;	ret


	; WriteMid11 workspace at ws+1408 length ws+0
f265_WriteMid11:
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
;end_f265_WriteMid11:
;	ret
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
	db 8
	db 8
	db 8
	db 6
	db 6
	db 7
	db 2
	db 2
	db 2
	db 2
	db 2
	db 3
	db 10
	db 6
	db 8
	db 8
	db 8
	db 8
	db 3
	db 7
	db 6
	db 2
	db 8
	db 8
	db 8
	db 5
	db 5
	db 8
	db 6
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
	db 3
	db 10
	db 6
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
	db 8
	db 8
	db 8
	db 8
	db 8
	db 4
	db 4
	db 4
	db 4
	db 4
	db 8
	db 8
	db 8
	db 8
	db 8
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
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8
	db 8


	; ReallyGenerate workspace at ws+1397 length ws+9
f267_ReallyGenerate:
	ld (ws+1397), hl
	ld a,77
	call f185_E_b8
	ld hl, (ws+64)
	ld (ws+1399), hl
	ld hl, (ws+1397)
	call f66_PushNode
c01_04cf:
	ld de, (ws+64)
	ld hl, (ws+1399)
	and a
	sbc hl,de
	jp z, c01_04d4
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
	jp c01_04cf
c01_04d4:
	ld hl, (ws+1397)
	jp   f69_Discard ;	call f69_Discard
;end_f267_ReallyGenerate:
;	ret


	; Generate workspace at ws+1390 length ws+7
f269_Generate:
	ld (ws+1390), hl
	push hl
	pop ix
	ld a, (ix+13)
	ld (ws+1392), a
	ld a, (ws+557)
	cp 27
	jp z, c01_04da
	ld a, (ws+557)
	cp 28
	jp nz, c01_04db
c01_04da:
	ld a, (ws+1392)
	cp 26
	jp z, c01_04e3
;c01_04e4:
	ld a, (ws+1392)
	cp 5
	jp z, c01_04e3
;c01_04e2:
	ld hl, (ws+1390)
	call f69_Discard
	ret
c01_04e3:
;c01_04dd:
c01_04db:
;c01_04d5:
	ld a, (ws+1392)
	cp 18
	jp nz, c01_04eb
;c01_04ec:
	ld a, (ws+557)
	cp 23
	jp z, c01_04eb
;c01_04ea:
	call f156_MidAsmgroupstart
;	ld (ws+1393), hl
	call f267_ReallyGenerate
c01_04eb:
;c01_04e5:
	ld a, (ws+557)
	cp 23
	jp nz, c01_04f3
;c01_04f4:
	ld a, (ws+1392)
	cp 18
	jp z, c01_04f3
;c01_04f2:
	call f149_MidAsmgroupend
;	ld (ws+1395), hl
	call f267_ReallyGenerate
c01_04f3:
;c01_04ed:
	ld a, (ws+1392)
	ld (ws+557), a
	ld hl, (ws+1390)
	jp   f267_ReallyGenerate ;	call f267_ReallyGenerate
;end_f269_Generate:
;	ret


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
	jp   f69_Discard ;	call f69_Discard
;end_f271_push_and_free:
;	ret


	; GenerateConditional workspace at ws+1361 length ws+29
f270_GenerateConditional:
	ld (ws+1361), hl
	ld hl, (ws+64)
	ld (ws+1363), hl
	ld hl, (ws+1361)
	call f66_PushNode
c01_04f5:
	ld de, (ws+64)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	jp z, c01_04fa
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
	jp z, c01_04ff
	ld hl, (ws+1369)
	ld (ws+1380), hl
	ld hl, (ws+1371)
	ld (ws+1369), hl
	ld hl, (ws+1380)
	ld (ws+1371), hl
c01_04ff:
;c01_04fb:
	ld a, (ws+1379)
	cp 55
	jp nz, c01_0501
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
	jp c01_04f5 ; c01_0500
c01_0501:
	cp 54
	jp nz, c01_0502
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
	jp c01_04f5 ; c01_0500
c01_0502:
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
	call f159_MidLabel
;	ld (ws+1388), hl
	call f269_Generate
c01_0500:
	jp c01_04f5
c01_04fa:
;end_f270_GenerateConditional:
	ret


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
	ld hl, (ws+1380)
	call f253_ArchInitVariable
;end_f272_InitVariable:
	ret


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
	jp nz, c01_0507
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
c01_0507:
;c01_0503:
;end_f273_MakePointerType:
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
	jp nc, c01_050c
;c01_050b:
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
c01_050c:
;c01_0508:
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
f277_QueueNamespace:
	ld (ws+1373), hl
c01_050d:
	ld hl, (ws+1373)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_0512
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
	jp c01_050d
c01_0512:
;end_f277_QueueNamespace:
	ret


	; DestructSubroutineContents workspace at ws+1359 length ws+14
f276_DestructSubroutineContents:
	ld (ws+1359), hl
	ld ix,0
	ld (ws+1361), ix
	ld ix, (ws+1359)
	ld a, (ix+27)
	or a
	jp z, c01_0517
	ld hl, (ws+1359)
	push hl
	push hl
	pop ix
	ld a, (ix+27)
	dec a
	call f106_GetOutputParameter
;	ld (ws+1365), hl
	ld (ws+1363), hl
	jp c01_0513
c01_0517:
	ld ix, (ws+1359)
	ld a, (ix+26)
	or a
	jp z, c01_051b
	ld hl, (ws+1359)
	push hl
	push hl
	pop ix
	ld a, (ix+26)
	dec a
	call f105_GetInputParameter
	ld (ws+1367), hl
	ld (ws+1363), hl
	jp c01_0513
c01_051b:
	ld ix,0
	ld (ws+1363), ix
c01_0513:
	ld ix, (ws+1359)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1361), hl
	ld hl, (ws+1363)
	ld a,h
	or l
	jp z, c01_0520
	ld ix, (ws+1363)
	ld l, (ix+8)
	ld h, (ix+9)
	ld (ws+1361), hl
c01_0520:
;c01_051c:
c01_0521:
	ld hl, (ws+1361)
	ld a,h
	or l
	jp z, c01_0526
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
	jp nz, c01_0528
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
	jp nz, c01_052a
	ld hl, (ws+1371)
	call f277_QueueNamespace
	jp c01_0529
c01_052a:
	cp 6
	jp nz, c01_052b
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
c01_052b:
c01_0529:
	ld hl, (ws+1371)
	call f73_FreeType
	jp c01_0527
c01_0528:
	cp 28
	jp nz, c01_052c
	ld hl, (ws+1369)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f40_Free
c01_052c:
c01_0527:
	ld ix, (ws+1369)
	ld l, (ix+4)
	ld h, (ix+5)
	call f40_Free
	ld hl, (ws+1369)
	call f71_FreeSymbol
	jp c01_0521
c01_0526:
	ld hl, (ws+1363)
	ld a,h
	or l
	jp z, c01_0531
	ld ix, (ws+1363)
	ld (ix+8), 0
	ld (ix+9), 0
	jp c01_052d
c01_0531:
	ld ix, (ws+1359)
	ld (ix+4), 0
	ld (ix+5), 0
c01_052d:
	ld hl, (ws+1363)
	ld ix, (ws+1359)
	ld (ix+6), l
	ld (ix+7), h
;end_f276_DestructSubroutineCont:    
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
c01_0532:
	ld hl, (ws+1358)
	ld a,h
	or l
	jp z, c01_0537
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
	jp z, c01_053c
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
c01_053c:
;c01_0538:
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
	jp c01_0532
c01_0537:
;end_f278_CopyParameterList:
	ret
c01_c267:
	db 95,95,109,97,105,110,0


	; CreateMainSubroutine workspace at ws+1294 length ws+10
f279_CreateMainSubroutine:
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
	ld hl,c01_c267
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
f280_ReportWorkspaces:
	ld (ws+1359), hl
	xor a
	ld (ws+1361), a
c01_053d:
	ld a, (ws+1361)
	cp 4
	jp z, c01_0542
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
	jp z, c01_0547
	ld hl, (ws+1359)
	push hl
	ld a, (ws+1361)
	push af
	ld hl, (ws+1362)
	call f213_EmitterDeclareWorkspace
c01_0547:
;c01_0543:
	ld a, (ws+1361)
	inc a
	ld (ws+1361), a
	jp c01_053d
c01_0542:
;end_f280_ReportWorkspaces:
	ret
c01_c268:
	db 32,97,110,100,32,0
c01_c269:
	db 32,97,114,101,32,110,111,116,32,99,111,109,112,97,116,105,98,108,101,32,105,110,32,116,104,105,115,32,99,111,110,116,101,120
db 116,0


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
	ld hl,c01_c268
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
	ld hl,c01_c269
	call f9_print
	call f81_EndError
;end_f281_expr_i_cant_do_that:
	ret
c01_c270:
	db 116,121,112,101,32,109,105,115,109,97,116,99,104,58,32,101,120,112,114,101,115,115,105,111,110,32,119,97,115,32,97,32,0
c01_c271:
	db 44,32,117,115,101,100,32,119,104,101,110,32,97,32,0
c01_c272:
	db 32,119,97,115,32,101,120,112,101,99,116,101,100,0
c01_c273:
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
	jp nz, c01_054c
	ld hl, (ws+1382)
	ld ix, (ws+1380)
	ld (ix+7), l
	ld (ix+8), h
c01_054c:
;c01_0548:
	ld ix, (ws+1380)
	ld e, (ix+7)
	ld d, (ix+8)
	ld hl, (ws+1382)
	and a
	sbc hl,de
	jp z, c01_0551
	call f80_StartError
	ld hl,c01_c270
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
	ld hl,c01_c271
	call f9_print
	ld ix, (ws+1382)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c272
	call f9_print
	call f81_EndError
c01_0551:
;c01_054d:
	ld hl, (ws+1382)
	call f241_IsScalar
;	ld (ws+1384), a
	or a
	jp nz, c01_0556
	call f80_StartError
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
c01_0556:
;c01_0552:
;end_f282_CheckExpressionType:
	ret
c01_c274:
	db 108,104,115,46,116,121,112,101,61,0
c01_c275:
	db 114,104,115,46,116,121,112,101,61,0
c01_c276:
	db 99,97,110,110,111,116,32,117,115,101,32,97,110,32,117,110,116,121,112,101,100,32,99,111,110,115,116,97,110,116,32,105,110,32
db 116,104,105,115,32,99,111,110,116,101,120,116,0
c01_c277:
	db 112,111,105,110,116,101,114,115,32,109,97,121,32,111,110,108,121,32,97,112,112,101,97,114,32,111,110,32,116,104,101,32,76,72
db 83,32,111,102,32,97,110,32,97,100,100,105,116,105,111,110,32,111,114,32,115,117,98,116,114,97,99,116,105,111,110,0


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
	jp z, c01_055d
;c01_055e:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp nz, c01_055d
;c01_055c:
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
;	ld (ws+1379), a
	or a
	jp z, c01_0563
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1377)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_055f
c01_0563:
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
;	ld (ws+1380), a
	or a
	jp z, c01_0567
	ld hl, (ws+555)
	ld ix, (ws+1377)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_055f
c01_0567:
	ld hl,c01_c274
	call f9_print
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	ld hl,c01_c275
	call f9_print
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	exx
	ld hl,0
	exx
	call f22_print_hex_i32
	call f10_print_nl
	ld hl,c01_c276
	call f82_SimpleError
c01_055f:
c01_055d:
;c01_0557:
	ld ix, (ws+1375)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp nz, c01_056e
;c01_056f:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld a,h
	or l
	jp z, c01_056e
;c01_056d:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
;	ld (ws+1381), a
	or a
	jp z, c01_0574
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1375)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_0570
c01_0574:
	ld ix, (ws+1377)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
;	ld (ws+1382), a
	or a
	jp z, c01_0578
	ld hl,c01_c277
	call f82_SimpleError
c01_0578:
c01_0570:
c01_056e:
;c01_0568:
;end_f283_ResolveUntypedConstant:            
	ret


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
	jp z, c01_057f
;c01_0580:
	ld hl, (ws+1387)
	ld a,h
	or l
	jp nz, c01_057f
;c01_057e:
	ld hl, (ws+1385)
	ld ix, (ws+1383)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_0579
c01_057f:
	ld hl, (ws+1385)
	ld a,h
	or l
	jp nz, c01_0586
;c01_0587:
	ld hl, (ws+1387)
	ld a,h
	or l
	jp z, c01_0586
;c01_0585:
	ld hl, (ws+1387)
	ld ix, (ws+1381)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_0579
c01_0586:
	ld de, (ws+1385)
	ld hl, (ws+1387)
	and a
	sbc hl,de
	jp z, c01_058b
	ld hl, (ws+1381)
	push hl
	ld hl, (ws+1383)
	call f281_expr_i_cant_do_that
c01_058b:
c01_0579:
;end_f284_ResolveUntypedConstant:       
	ret
c01_c278:
	db 110,117,109,98,101,114,32,114,101,113,117,105,114,101,100,0


	; CheckNumber workspace at ws+1374 length ws+3
f285_CheckNumber:
	ld (ws+1374), hl
	push hl
	pop ix
	ld l, (ix+7)
	ld h, (ix+8)
	call f239_IsNum
;	ld (ws+1376), a
	or a
	jp nz, c01_0590
	ld hl,c01_c278
	call f82_SimpleError
c01_0590:
;c01_058c:
;end_f285_CheckNumber:
	ret


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
	call f285_CheckNumber
;end_f286_ResolveUntypedConstant:               
	ret


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
	jp z, c01_0595
	ld hl, (ws+1377)
	push hl
	ld hl, (ws+1379)
	call f281_expr_i_cant_do_that
c01_0595:
;c01_0591:
;end_f287_CondSimple:
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
	ld (ws+1361), hl
	ld (ws+1358), hl
	ld ix, (ws+1356)
	ld l, (ix+7)
	ld h, (ix+8)
	ld ix, (ws+1358)
	ld (ix+7), l
	ld (ix+8), h
;end_f288_Expr1Simple:
	ld hl, (ws+1358)
	ret


	; cant_add_that workspace at ws+1372 length ws+0
f290_cant_add_that:
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	call f281_expr_i_cant_do_that
;end_f290_cant_add_that:
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
;	ld (ws+1365), a
	or a
	jp z, c01_059a
	ld hl, (ws+1363)
	call f74_IsPtr
;	ld (ws+1366), a
	or a
	jp nz, c01_05a0
	ld de, (ws+1363)
	ld hl, (ws+555)
	and a
	sbc hl,de
	jp z, c01_0596 ; c01_05a1
c01_05a0:
	call f290_cant_add_that
c01_05a1:
;c01_059b:
	jp c01_0596
c01_059a:
	ld hl, (ws+1363)
	call f74_IsPtr
	ld (ws+1367), a
	or a
	jp z, c01_05a6
	call f290_cant_add_that
	jp c01_0596
c01_05a6:
	ld hl, (ws+1361)
	call f74_IsPtr
;	ld (ws+1368), a
	or a
	jp nz, c01_05ac
;c01_05ad:
	ld de, (ws+1361)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	jp z, c01_05ac
;c01_05ab:
	call f290_cant_add_that
c01_05ac:
c01_0596:
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
;end_f289_ExprAdd:
	ld hl, (ws+1359)
	ret


	; cant_sub_that workspace at ws+1375 length ws+0
f292_cant_sub_that:
	ld hl, (ws+1355)
	push hl
	ld hl, (ws+1357)
	call f281_expr_i_cant_do_that
;end_f292_cant_sub_that:
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
	jp z, c01_05b6
;c01_05b8:
	ld a, (ws+1366)
	or a
	jp nz, c01_05b6
;c01_05b7:
	ld de, (ws+1363)
	ld hl, (ws+555)
	and a
	sbc hl,de
	jp z, c01_05b6
;c01_05b5:
	call f292_cant_sub_that
	jp c01_05ae
c01_05b6:
	ld hl, (ws+1361)
	call f239_IsNum
	ld (ws+1367), a
	ld hl, (ws+1363)
	call f74_IsPtr
	ld (ws+1368), a
	ld a, (ws+1367)
	or a
	jp z, c01_05be
;c01_05bf:
	ld a, (ws+1368)
	or a
	jp z, c01_05be
;c01_05bd:
	call f292_cant_sub_that
	jp c01_05ae
c01_05be:
	ld hl, (ws+1361)
	call f239_IsNum
	ld (ws+1369), a
	ld hl, (ws+1363)
	call f239_IsNum
	ld (ws+1370), a
	ld a, (ws+1369)
	or a
	jp z, c01_05c7
;c01_05c9:
	ld a, (ws+1370)
	or a
	jp z, c01_05c7
;c01_05c8:
	ld de, (ws+1361)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	jp z, c01_05c7
;c01_05c6:
	call f292_cant_sub_that
c01_05c7:
c01_05ae:
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
	jp z, c01_05d0
;c01_05d1:
	ld de, (ws+1361)
	ld hl, (ws+1363)
	and a
	sbc hl,de
	jp nz, c01_05d0
;c01_05cf:
	ld hl, (ws+555)
	ld ix, (ws+1359)
	ld (ix+7), l
	ld (ix+8), h
	jp c01_05ca
c01_05d0:
	ld hl, (ws+1361)
	ld ix, (ws+1359)
	ld (ix+7), l
	ld (ix+8), h
c01_05ca:
;end_f291_ExprSub:
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
	ld (ws+1364), a
	or a
	jp z, c01_05d6
	ld a, (ws+1355)
	ld (ws+1363), a
c01_05d6:
;c01_05d2:
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
;end_f293_Expr2Simple:
	ld hl, (ws+1361)
	ret
c01_c279:
	db 76,72,83,32,111,102,32,115,104,105,102,116,32,99,97,110,32,111,110,108,121,32,98,101,32,99,111,110,115,116,97,110,116,32,105
db 102,32,116,104,101,32,82,72,83,32,105,115,32,97,108,115,111,32,99,111,110,115,116,97,110,116,0


	; expr_i_checkrhsconst workspace at ws+1374 length ws+2
f294_expr_i_checkrhsconst:
	ld (ws+1374), hl
	push hl
	pop ix
	ld a, (ix+13)
	cp 40
	jp z, c01_05db
	ld hl,c01_c279
	call f82_SimpleError
c01_05db:
;c01_05d7:
;end_f294_expr_i_checkrhsconst:
	ret
c01_c280:
	db 110,117,109,98,101,114,32,114,101,113,117,105,114,101,100,32,111,110,32,76,72,83,32,111,102,32,115,104,105,102,116,0


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
;	ld (ws+1378), a
	or a
	jp nz, c01_05e0
	ld hl,c01_c280
	call f82_SimpleError
c01_05e0:
;c01_05dc:
	ld hl, (ws+1376)
	push hl
	ld hl, (ws+551)
	call f282_CheckExpressionType
;end_f295_expr_i_checkshift:
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
	ld (ws+1364), a
	or a
	jp z, c01_05e5
	ld a, (ws+1355)
	ld (ws+1363), a
c01_05e5:
;c01_05e1:
	ld ix, (ws+1357)
	ld a, (ix+13)
	cp 40
	jp nz, c01_05ea
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
c01_05ea:
;c01_05e6:
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
;	ld (ws+1372), hl
	ld (ws+1361), hl
	ld hl, (ws+1369)
	ld ix, (ws+1361)
	ld (ix+7), l
	ld (ix+8), h
end_f296_ExprShift:
	ld hl, (ws+1361)
	ret
c01_c281:
	db 110,111,100,101,32,115,116,97,99,107,32,111,118,101,114,102,108,111,119,0


	; PushNode workspace at ws+1425 length ws+2
f66_PushNode:
	ld (ws+1425), hl
	ld a,h
	or l
	jp z, c01_05ef
	ld de, (ws+64)
	ld hl,ws+64
	and a
	sbc hl,de
	jp nz, c01_05f4
	ld hl,c01_c281
	call f82_SimpleError
c01_05f4:
;c01_05f0:
	ld de, (ws+1425)
	ld hl, (ws+64)
	ld (hl),e
	inc hl
	ld (hl),d
	ld hl, (ws+64)
	inc hl
	inc hl
	ld (ws+64), hl
c01_05ef:
;c01_05eb:
;end_f66_PushNode:
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
;	ld (ws+1425), hl
;end_f67_PopNode:
;	ld hl, (ws+1425)
	ret


	; NextNode workspace at ws+1421 length ws+4
f68_NextNode:
	call f67_PopNode
;	ld (ws+1423), hl
	ld (ws+1421), hl
	ld a,h
	or l
	jp z, c01_05f9
	ld ix, (ws+1421)
	ld l, (ix+9)
	ld h, (ix+10)
	call f66_PushNode
	ld ix, (ws+1421)
	ld l, (ix+11)
	ld h, (ix+12)
	call f66_PushNode
c01_05f9:
;c01_05f5:
;end_f68_NextNode:
	ld hl, (ws+1421)
	ret


	; Discard workspace at ws+1413 length ws+8
f69_Discard:
	ld (ws+1413), hl
	ld hl, (ws+64)
	ld (ws+1415), hl
	ld hl, (ws+1413)
	call f66_PushNode
c01_05fa:
	ld de, (ws+64)
	ld hl, (ws+1415)
	and a
	sbc hl,de
	jp z, c01_05ff
	call f68_NextNode
	call f171_FreeNode
	jp c01_05fa
c01_05ff:
;end_f69_Discard:
	ret


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


	; Reducer workspace at ws+1353 length ws+0
f322_Reducer:
;end_f322_Reducer:
	ret


	; reduce_0 workspace at ws+1353 length ws+2
f323_reduce_0:
	call f166_MidReturn
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f323_reduce_0:
	ret


	; reduce_1 workspace at ws+1353 length ws+0
f324_reduce_1:
	ld hl, (ws+12)
	push hl
	ld hl, (ws+1325)
	push hl
	ld hl, (ws+1317)
	call f272_InitVariable
	ld h,6
	push hl
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f324_reduce_1:
	ret


	; reduce_2 workspace at ws+1353 length ws+7
f325_reduce_2:
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
	call f154_MidAddress
;	ld (ws+1354), hl
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
;	ld (ws+1358), hl
	call f269_Generate
	ld h,6
	push hl
	ld hl,ws+1329
	call f314_yy_destructor
	ld b,2
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f325_reduce_2:
	ret
c01_c363:
	db 116,121,112,101,115,32,99,97,110,110,111,116,32,98,101,32,105,110,102,101,114,114,101,100,32,102,111,114,32,110,117,109,101
db 114,105,99,32,99,111,110,115,116,97,110,116,115,0
c01_c364:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,97,115,115,105,103,110,32,116,111,32,108,118,97,108,117,101,115,0


	; reduce_3 workspace at ws+1353 length ws+10
f326_reduce_3:
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	ld (ws+1353), hl
	ld a,h
	or l
	jp nz, c01_066a
	ld hl,c01_c363
	call f82_SimpleError
c01_066a:
;c01_0666:
	ld hl, (ws+1353)
	call f241_IsScalar
	ld (ws+1355), a
	or a
	jp nz, c01_066f
	ld hl,c01_c364
	call f82_SimpleError
c01_066f:
;c01_066b:
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
	call f154_MidAddress
	ld (ws+1357), hl
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
	ld (ws+1361), hl
	call f269_Generate
	ld b,2
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f326_reduce_3:
	ret


	; reduce_4 workspace at ws+1353 length ws+11
f327_reduce_4:
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
	call f153_MidDeref
	ld (ws+1360), hl
	ld a, (ws+1359)
	push af
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1360)
	call f152_MidStore
;	ld (ws+1362), hl
	call f269_Generate
	ld b,2
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f327_reduce_4:
	ret


	; reduce_5 workspace at ws+1353 length ws+0
f328_reduce_5:
	ld hl, (ws+1325)
	call f298_TerminateNormalLoop
	ld d,10
	push de
	ld hl,ws+1317
	call f314_yy_destructor
	ld h,13
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f328_reduce_5:
	ret


	; reduce_6 workspace at ws+1353 length ws+4
f329_reduce_6:
	call f297_BeginNormalLoop
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld hl, (ws+20)
	call f159_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f329_reduce_6:
;	ret


	; reduce_7 workspace at ws+1353 length ws+0
f330_reduce_7:
	ld hl, (ws+1325)
	call f298_TerminateNormalLoop
	ld d,10
	push de
	ld hl,ws+1317
	call f314_yy_destructor
	ld h,13
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f330_reduce_7:
	ret


	; reduce_8 workspace at ws+1353 length ws+4
f331_reduce_8:
	call f297_BeginNormalLoop
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld hl, (ws+20)
	call f159_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f331_reduce_8:
;	ret


	; reduce_9 workspace at ws+1353 length ws+6
f332_reduce_9:
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
	call f314_yy_destructor
;end_f332_reduce_9:
	ret
c01_c365:
	db 110,111,116,104,105,110,103,32,116,111,32,98,114,101,97,107,32,116,111,0


	; reduce_10 workspace at ws+1353 length ws+2
f333_reduce_10:
	ld hl, (ws+18)
	ld a,h
	or l
	jp nz, c01_0674
	ld hl,c01_c365
	call f82_SimpleError
c01_0674:
;c01_0670:
	ld hl, (ws+18)
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f333_reduce_10:
	ret
c01_c366:
	db 110,111,116,104,105,110,103,32,116,111,32,99,111,110,116,105,110,117,101,32,116,111,0


	; reduce_11 workspace at ws+1353 length ws+2
f334_reduce_11:
	ld hl, (ws+20)
	ld a,h
	or l
	jp nz, c01_0679
	ld hl,c01_c366
	call f82_SimpleError
c01_0679:
;c01_0675:
	ld hl, (ws+20)
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f334_reduce_11:
	ret


	; reduce_12 workspace at ws+1353 length ws+4
f335_reduce_12:
	ld hl, (ws+22)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
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
	call f314_yy_destructor
	ld d,10
	push de
	ld hl,ws+1317
	call f314_yy_destructor
	ld h,12
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f335_reduce_12:
	ret


	; reduce_13 workspace at ws+1353 length ws+6
f336_reduce_13:
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
;end_f336_reduce_13:
	ret


	; reduce_14 workspace at ws+1353 length ws+8
f337_reduce_14:
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
;end_f337_reduce_14:
;	ret


	; reduce_15 workspace at ws+1353 length ws+2
f338_reduce_15:
	ld ix, (ws+22)
	ld l, (ix+4)
	ld h, (ix+5)
	call f159_MidLabel
;	ld (ws+1353), hl
	jp   f269_Generate ;	call f269_Generate
;end_f338_reduce_15:
;	ret


	; reduce_16 workspace at ws+1353 length ws+4
f339_reduce_16:
	ld hl, (ws+22)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld ix, (ws+22)
	ld l, (ix+4)
	ld h, (ix+5)
	call f159_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f339_reduce_16:
;	ret


	; reduce_17 workspace at ws+1353 length ws+4
f340_reduce_17:
	ld hl, (ws+22)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld ix, (ws+22)
	ld l, (ix+4)
	ld h, (ix+5)
	call f159_MidLabel
	ld (ws+1355), hl
	jp   f269_Generate ;	call f269_Generate
;end_f340_reduce_17:
;	ret


	; reduce_18 workspace at ws+1353 length ws+8
f341_reduce_18:
	ld ix, (ws+24)
	ld a, (ix+9)
	or a
	jp nz, c01_0680
;c01_0681:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_0680
;c01_067f:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
;	ld (ws+1353), hl
	call f269_Generate
c01_0680:
;c01_067a:
	ld hl, (ws+24)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
	ld (ws+1355), hl
	call f269_Generate
	ld ix, (ws+24)
	ld a, (ix+8)
	call f144_MidEndcase
	ld (ws+1357), hl
	call f269_Generate
	ld hl, (ws+24)
	ld (ws+1359), hl
	push hl
	pop ix
	ld l, (ix+6)
	ld h, (ix+7)
	ld (ws+24), hl
	ld hl, (ws+1359)
	call f40_Free
	ld d,10
	push de
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,64
	push af
	ld hl,ws+1317
	call f314_yy_destructor
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f341_reduce_18:
	ret
c01_c367:
	db 99,97,115,101,32,111,110,108,121,32,119,111,114,107,115,32,111,110,32,110,117,109,98,101,114,115,0


	; reduce_19 workspace at ws+1353 length ws+10
f342_reduce_19:
	ld hl,10
	call f75_InternalAlloc
;	ld (ws+1353), hl
	ld (ws+1355), hl
	ld hl, (ws+24)
	ld ix, (ws+1355)
	ld (ix+6), l
	ld (ix+7), h
	ld hl, (ws+18)
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
	jp nz, c01_0686
	ld hl,c01_c367
	call f82_SimpleError
c01_0686:
;c01_0682:
	ld hl, (ws+1317)
	call f172_NodeWidth
;	ld (ws+1360), a
	ld ix, (ws+1355)
	ld (ix+8), a
	ld a, (ix+8)
	push af
	ld hl, (ws+1317)
	call f134_MidStartcase
	ld (ws+1361), hl
	call f269_Generate
	ld h,65
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f342_reduce_19:
	ret
c01_c368:
	db 119,104,101,110,32,101,108,115,101,32,109,117,115,116,32,103,111,32,108,97,115,116,0


	; reduce_20 workspace at ws+1353 length ws+8
f343_reduce_20:
	ld ix, (ws+24)
	ld a, (ix+9)
	or a
	jp z, c01_068b
	ld hl,c01_c368
	call f82_SimpleError
c01_068b:
;c01_0687:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_0690
	ld hl, (ws+24)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
	ld (ws+1355), hl
	call f269_Generate
c01_0690:
;c01_068c:
	call f247_AllocLabel
	ld (ws+1357), hl
	ld d,h
	ld e,l
	ld hl, (ws+24)
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix, (ws+24)
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
	call f128_MidWhencase
;	ld (ws+1359), hl
	call f269_Generate
	ld d,6
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f343_reduce_20:
	ret
c01_c369:
	db 111,110,108,121,32,111,110,101,32,119,104,101,110,32,101,108,115,101,32,97,108,108,111,119,101,100,0


	; reduce_21 workspace at ws+1353 length ws+4
f344_reduce_21:
	ld ix, (ws+24)
	ld a, (ix+9)
	or a
	jp z, c01_0695
	ld hl,c01_c369
	call f82_SimpleError
c01_0695:
;c01_0691:
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,h
	or l
	jp z, c01_069a
	ld hl, (ws+24)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f127_MidJump
;	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+24)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f159_MidLabel
	ld (ws+1355), hl
	call f269_Generate
c01_069a:
;c01_0696:
	ld de,0
	ld hl, (ws+24)
	ld (hl),e
	inc hl
	ld (hl),d
	ld ix, (ws+24)
	ld (ix+9), 1
	ld a,9
	push af
	ld hl,ws+1317
	call f314_yy_destructor
	ld d,6
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f344_reduce_21:
	ret


	; reduce_22 workspace at ws+1353 length ws+0
f345_reduce_22:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f345_reduce_22:
	ret


	; reduce_23 workspace at ws+1353 length ws+0
f346_reduce_23:
	ld hl, (ws+1313)
	ld (ws+1309), hl
	jp   f299_Negate ;	call f299_Negate
;end_f346_reduce_23:
;	ret


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
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,46
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f347_reduce_24:
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
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,47
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f348_reduce_25:
	ret


	; reduce_26 workspace at ws+1353 length ws+2
f349_reduce_26:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	xor a
	call f300_ConditionalEq
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,54
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f349_reduce_26:
	ret


	; reduce_27 workspace at ws+1353 length ws+2
f350_reduce_27:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld a,1
	call f300_ConditionalEq
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,55
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f350_reduce_27:
	ret


	; reduce_28 workspace at ws+1353 length ws+2
f351_reduce_28:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	xor a
	call f301_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,50
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f351_reduce_28:
	ret


	; reduce_29 workspace at ws+1353 length ws+2
f352_reduce_29:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	push hl
	ld a,1
	call f301_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,53
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f352_reduce_29:
	ret


	; reduce_30 workspace at ws+1353 length ws+2
f353_reduce_30:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	push hl
	xor a
	call f301_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,52
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f353_reduce_30:
	ret


	; reduce_31 workspace at ws+1353 length ws+2
f354_reduce_31:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	push hl
	ld a,1
	call f301_ConditionalLt
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,51
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f354_reduce_31:
	ret


	; reduce_32 workspace at ws+1353 length ws+2
f355_reduce_32:
	ld hl, (ws+1313)
	exx
	ld hl, (ws+1315)
	exx
	call f116_MidConstant
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f355_reduce_32:
	ret


	; reduce_33 workspace at ws+1353 length ws+0
f356_reduce_33:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f356_reduce_33:
	ret


	; reduce_34 workspace at ws+1353 length ws+0
f357_reduce_34:
	ld hl, (ws+1313)
	ld (ws+1309), hl
;end_f357_reduce_34:
	ret


	; reduce_35 workspace at ws+1353 length ws+2
f358_reduce_35:
	ld h,111
	push hl
	ld hl, (ws+1313)
	call f288_Expr1Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f358_reduce_35:
	ret


	; reduce_36 workspace at ws+1353 length ws+2
f359_reduce_36:
	ld a,106
	push af
	ld hl, (ws+1313)
	call f288_Expr1Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f359_reduce_36:
	ret


	; reduce_37 workspace at ws+1353 length ws+2
f360_reduce_37:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f289_ExprAdd
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,19
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f360_reduce_37:
	ret


	; reduce_38 workspace at ws+1353 length ws+2
f361_reduce_38:
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f291_ExprSub
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,14
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f361_reduce_38:
	ret


	; reduce_39 workspace at ws+1353 length ws+2
f362_reduce_39:
	ld h,161
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,24
	push af
	ld hl,ws+1317
	call f314_yy_destructor
;end_f362_reduce_39:
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
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,23
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f363_reduce_40:
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
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,18
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f364_reduce_41:
	ret


	; reduce_42 workspace at ws+1353 length ws+2
f365_reduce_42:
	ld h,176
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,49
	push af
	ld hl,ws+1317
	call f314_yy_destructor
;end_f365_reduce_42:
	ret


	; reduce_43 workspace at ws+1353 length ws+2
f366_reduce_43:
	ld d,166
	push de
	push de
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,59
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f366_reduce_43:
	ret


	; reduce_44 workspace at ws+1353 length ws+2
f367_reduce_44:
	ld h,171
	push hl
	push hl
	ld hl, (ws+1321)
	push hl
	ld hl, (ws+1313)
	call f293_Expr2Simple
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,48
	push af
	ld hl,ws+1317
	call f314_yy_destructor
;end_f367_reduce_44:
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
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld b,56
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f368_reduce_45:
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
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,57
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f369_reduce_46:
	ret
c01_c370:
	db 99,97,115,116,32,98,101,116,119,101,101,110,32,112,111,105,110,116,101,114,32,97,110,100,32,110,111,110,45,112,111,105,110
db 116,101,114,32,111,102,32,100,105,102,102,101,114,101,110,116,32,115,105,122,101,0


	; reduce_47 workspace at ws+1353 length ws+5
f370_reduce_47:
	ld hl, (ws+1313)
	call f233_CheckNotPartialType
	ld ix, (ws+1321)
	ld a, (ix+13)
	cp 40
	jp z, c01_06a1
;c01_06a2:
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
	jp z, c01_06a1
;c01_06a0:
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
	jp nz, c01_06a8
	ld a, (ws+1354)
	or a
	jp z, c01_06a9
c01_06a8:
	ld hl,c01_c370
	call f82_SimpleError
c01_06a9:
;c01_06a3:
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
	jp c01_069b
c01_06a1:
	ld hl, (ws+1321)
	ld (ws+1309), hl
c01_069b:
	ld hl, (ws+1313)
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
	ld b,58
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f370_reduce_47:
	ret
c01_c371:
	db 121,111,117,32,99,97,110,110,111,116,32,116,97,107,101,32,116,104,101,32,97,100,100,114,101,115,115,32,111,102,32,115,99,97
db 108,97,114,32,118,97,114,105,97,98,108,101,115,0


	; reduce_48 workspace at ws+1353 length ws+5
f371_reduce_48:
	ld hl, (ws+1313)
	call f244_UndoLValue
;	ld (ws+1353), hl
	ld (ws+1309), hl
	push hl
	pop ix
	ld a, (ix+13)
	cp 42
	jp nz, c01_06af
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
	jp z, c01_06b4
	ld hl,c01_c371
	call f82_SimpleError
c01_06b4:
;c01_06b0:
c01_06af:
;c01_06ab:
;end_f371_reduce_48:
	ret


	; reduce_49 workspace at ws+1353 length ws+2
f372_reduce_49:
	ld hl, (ws+1313)
	call f244_UndoLValue
;	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,59
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f372_reduce_49:
	ret


	; reduce_50 workspace at ws+1353 length ws+5
f373_reduce_50:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	ld (ws+1353), a
	or a
;	jp nz, c01_06b9
;	call f302_parser_i_bad_next_prev
;c01_06b9:
	call z,f302_parser_i_bad_next_prev
;c01_06b5:
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
	call f116_MidConstant
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
;end_f373_reduce_50:
	ret


	; reduce_51 workspace at ws+1353 length ws+5
f374_reduce_51:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
	ld (ws+1353), a
	or a
;	jp nz, c01_06be
;	call f302_parser_i_bad_next_prev
;c01_06be:
	call z,f302_parser_i_bad_next_prev
;c01_06ba:
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
	call f116_MidConstant
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
;end_f374_reduce_51:
	ret


	; reduce_52 workspace at ws+1353 length ws+2
f375_reduce_52:
	ld ix, (ws+1313)
	ld l, (ix+11)
	ld h, (ix+12)
	exx
	ld hl,0
	exx
	call f116_MidConstant
;	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f375_reduce_52:
	ret
c01_c372:
	db 97,114,114,97,121,32,101,120,112,101,99,116,101,100,0


	; reduce_53 workspace at ws+1353 length ws+3
f376_reduce_53:
	ld hl, (ws+1313)
	call f237_IsArray
;	ld (ws+1353), a
	or a
	jp nz, c01_06c3
	ld hl,c01_c372
	call f82_SimpleError
c01_06c3:
;c01_06bf:
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
	call f116_MidConstant
;	ld (ws+1354), hl
	ld (ws+1309), hl
;end_f376_reduce_53:
	ret
c01_c373:
	db 32,105,115,32,110,111,116,32,97,32,118,97,108,117,101,0


	; not_a_value workspace at ws+1363 length ws+0
f378_not_a_value:
	call f80_StartError
	ld ix, (ws+1313)
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c373
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f378_not_a_value:
;	ret


	; reduce_54 workspace at ws+1353 length ws+10
f377_reduce_54:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 7
	jp nz, c01_06c5
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
	call f116_MidConstant
;	ld (ws+1353), hl
	ld (ws+1309), hl
	jp c01_06c4
c01_06c5:
	cp 28
	jp nz, c01_06c6
	ld hl, (ws+1313)
	push hl
	ld hl,0
	call f154_MidAddress
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
	jp c01_06c4
c01_06c6:
	cp 30
	jp nz, c01_06c7
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	pop ix
	ld a, (ix+15)
	cp 6
	jp nz, c01_06cc
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f169_MidSubref
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
	jp c01_06c4 ; c01_06c8
c01_06cc:
	call f378_not_a_value
c01_06c8:
	jp c01_06c4
c01_06c7:
	call f378_not_a_value
c01_06c4:
;end_f377_reduce_54:
	ret
c01_c374:
	db 99,97,110,110,111,116,32,100,101,114,101,102,101,114,101,110,99,101,32,110,111,110,45,112,111,105,110,116,101,114,115,0


	; reduce_55 workspace at ws+1353 length ws+3
f379_reduce_55:
	ld ix, (ws+1317)
	ld l, (ix+7)
	ld h, (ix+8)
	call f74_IsPtr
;	ld (ws+1353), a
	or a
	jp nz, c01_06d1
	ld hl,c01_c374
	call f82_SimpleError
c01_06d1:
;c01_06cd:
	ld hl, (ws+1317)
	call f243_MakeLValue
;	ld (ws+1354), hl
	ld (ws+1309), hl
	ld b,5
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f379_reduce_55:
	ret
c01_c375:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,105,110,100,101,120,32,97,110,32,97,114,114,97,121,44,32,110,111,116,32,97,32
db 0
c01_c376:
	db 97,114,114,97,121,32,105,110,100,105,99,101,115,32,109,117,115,116,32,98,101,32,110,117,109,98,101,114,115,0


	; reduce_56 workspace at ws+1353 length ws+27
f380_reduce_56:
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
	jp nz, c01_06d6
	call f80_StartError
	ld hl,c01_c375
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
c01_06d6:
;c01_06d2:
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
	jp nz, c01_06db
	ld hl,c01_c376
	call f82_SimpleError
c01_06db:
;c01_06d7:
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
	call f116_MidConstant
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
	call f314_yy_destructor
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f380_reduce_56:
	ret
c01_c377:
	db 32,105,115,32,110,111,116,32,97,32,114,101,99,111,114,100,32,111,114,32,112,111,105,110,116,101,114,32,116,111,32,97,32,114
db 101,99,111,114,100,0


	; BadType workspace at ws+1377 length ws+0
f382_BadType:
	call f80_StartError
	ld ix, (ws+1353)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c377
	call f9_print
	jp   f81_EndError ;	call f81_EndError
;end_f382_BadType:
;	ret
c01_c378:
	db 32,100,111,101,115,32,110,111,116,32,99,111,110,116,97,105,110,32,97,32,109,101,109,98,101,114,32,39,0
c01_c379:
	db 39,0


	; reduce_57 workspace at ws+1353 length ws+24
f381_reduce_57:
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
	jp z, c01_06e0
	ld hl, (ws+1321)
	call f246_MaybeUndoLValue
;	ld (ws+1358), hl
	ld (ws+1355), hl
c01_06e1:
	ld hl, (ws+1353)
	call f74_IsPtr
;	ld (ws+1360), a
	or a
	jp z, c01_06dc ; c01_06e6
;c01_06e5:
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
	call f153_MidDeref
	ld (ws+1361), hl
	ld (ws+1355), hl
	jp c01_06e1
c01_06e6:
	jp c01_06dc
c01_06e0:
	ld hl, (ws+1353)
	call f74_IsPtr
;	ld (ws+1363), a
	or a
	jp z, c01_06ea
	ld hl, (ws+1353)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	jp c01_06dc
c01_06ea:
	call f382_BadType
c01_06dc:
	ld hl, (ws+1353)
	call f233_CheckNotPartialType
	ld hl, (ws+1353)
	call f242_IsRecord
;	ld (ws+1364), a
	or a
;	jp nz, c01_06ef
;	call f382_BadType
;c01_06ef:
	call z,f382_BadType
;c01_06eb:
	ld hl, (ws+1353)
	push hl
	ld hl, (ws+1313)
	call f228_LookupSymbol
;	ld (ws+1365), hl
	ld (ws+1367), hl
	ld a,h
	or l
	jp nz, c01_06f4
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
	ld hl, (ws+1313)
	call f9_print
	ld hl,c01_c379
	call f9_print
	call f81_EndError
c01_06f4:
;c01_06f0:
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
	call f116_MidConstant
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
	call f314_yy_destructor
;end_f381_reduce_57:
	ret


	; reduce_58 workspace at ws+1353 length ws+4
f383_reduce_58:
	ld hl, (ws+1313)
	call f168_MidString
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld hl, (ws+551)
	call f273_MakePointerType
	ld (ws+1355), hl
	ld ix, (ws+1309)
	ld (ix+7), l
	ld (ix+8), h
;end_f383_reduce_58:
	ret


	; reduce_59 workspace at ws+1353 length ws+0
f384_reduce_59:
	ld ix, (ws+1313)
	ld a, (ix+13)
	cp 40
;	jp z, c01_06f9
;	call f303_parser_i_constant_error
;c01_06f9:
	call nz,f303_parser_i_constant_error
;c01_06f5:
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
;end_f384_reduce_59:
;	ret


	; reduce_60 workspace at ws+1353 length ws+0
f385_reduce_60:
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
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f385_reduce_60:
	ret
c01_c380:
	db 105,110,118,97,108,105,100,32,105,110,116,101,103,101,114,32,116,121,112,101,32,114,97,110,103,101,0


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
;c01_06fd:
	ld hl,c01_c380
	call f82_SimpleError
c01_06fe:
;c01_06fa:
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
	call f314_yy_destructor
	ld h,45
	push hl
	ld hl,ws+1321
	call f314_yy_destructor
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f386_reduce_61:
	ret
c01_c381:
	db 101,120,112,101,99,116,101,100,32,0
c01_c382:
	db 32,116,111,32,98,101,32,97,32,116,121,112,101,0


	; reduce_62 workspace at ws+1353 length ws+6
f387_reduce_62:
	ld hl, (ws+1313)
	ld (ws+1353), hl
	push hl
	pop ix
	ld a, (ix+10)
	or a
	jp nz, c01_0703
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
c01_0703:
;c01_06ff:
	ld ix, (ws+1353)
	ld a, (ix+10)
	cp 30
	jp z, c01_0708
	call f80_StartError
	ld hl,c01_c381
	call f9_print
	ld ix, (ws+1353)
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c382
	call f9_print
	call f81_EndError
c01_0708:
;c01_0704:
	ld hl, (ws+1353)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1309), hl
;end_f387_reduce_62:
	ret


	; reduce_63 workspace at ws+1353 length ws+2
f388_reduce_63:
	ld hl, (ws+1317)
	call f273_MakePointerType
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f388_reduce_63:
	ret


	; reduce_64 workspace at ws+1353 length ws+2
f389_reduce_64:
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
	call f314_yy_destructor
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f389_reduce_64:
	ret


	; reduce_65 workspace at ws+1353 length ws+2
f390_reduce_65:
	ld hl, (ws+1321)
	push hl
	ld hl,0
	call f274_MakeArrayType
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,17
	push de
	ld hl,ws+1317
	call f314_yy_destructor
	ld a,5
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f390_reduce_65:
	ret
c01_c383:
	db 32,105,115,32,110,111,116,32,97,110,32,97,114,114,97,121,0


	; reduce_66 workspace at ws+1353 length ws+1
f391_reduce_66:
	ld hl, (ws+1313)
	call f237_IsArray
	ld (ws+1353), a
	or a
	jp nz, c01_070d
	call f80_StartError
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c383
	call f9_print
	call f81_EndError
c01_070d:
;c01_0709:
	ld ix, (ws+1313)
	ld l, (ix+4)
	ld h, (ix+5)
	ld (ws+1309), hl
;end_f391_reduce_66:
	ret


	; reduce_67 workspace at ws+1353 length ws+4
f392_reduce_67:
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
	ld h,65
	push hl
	ld hl,ws+1321
	call f314_yy_destructor
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f392_reduce_67:
	ret


	; reduce_68 workspace at ws+1353 length ws+2
f393_reduce_68:
	ld de,0
	push de
	ld hl, (ws+1313)
	call f230_AddSymbol
	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f393_reduce_68:
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
	call f228_LookupSymbol
	ld (ws+1355), hl
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
;c01_070e:
	ld hl, (ws+1353)
	call f40_Free
	ld hl, (ws+1357)
	ld (ws+1309), hl
;end_f394_reduce_69:
	ret


	; reduce_70 workspace at ws+1353 length ws+8
f395_reduce_70:
	ld hl, (ws+1313)
	ld (ws+1353), hl
	ld de,0
	push de
	call f228_LookupSymbol
	ld (ws+1355), hl
	ld (ws+1357), hl
	ld a,h
	or l
	jp nz, c01_0717
	ld de,0
	push de
	ld hl, (ws+1353)
	call f230_AddSymbol
;	ld (ws+1359), hl
	ld (ws+1357), hl
	jp c01_0713
c01_0717:
	ld hl, (ws+1353)
	call f40_Free
c01_0713:
	ld hl, (ws+1357)
	ld (ws+1309), hl
;end_f395_reduce_70:
	ret
c01_c386:
	db 115,105,109,112,108,101,32,116,121,112,101,32,111,114,32,118,97,114,105,97,98,108,101,32,110,97,109,101,32,101,120,112,101
db 99,116,101,100,0


	; reduce_71 workspace at ws+1353 length ws+0
f396_reduce_71:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 28
	jp nz, c01_0719
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
	jp c01_0718
c01_0719:
	cp 30
	jp nz, c01_071a
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1309), hl
	jp c01_0718
c01_071a:
	ld hl,c01_c386
	call f82_SimpleError
c01_0718:
;end_f396_reduce_71:
	ret


	; reduce_72 workspace at ws+1353 length ws+0
f397_reduce_72:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f397_reduce_72:
	ret
c01_c387:
	db 115,117,98,114,111,117,116,105,110,101,115,32,99,97,108,108,101,100,32,97,115,32,102,117,110,99,116,105,111,110,115,32,109
db 117,115,116,32,104,97,118,101,32,101,120,97,99,116,108,121,32,111,110,101,32,111,117,116,112,117,116,32,112,97,114,97,109,101
db 116,101,114,0


	; reduce_73 workspace at ws+1353 length ws+25
f398_reduce_73:
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
	call f304_i_check_sub_call_args
	ld ix, (ws+1353)
	ld a, (ix+27)
	cp 1
	jp z, c01_071f
	ld hl,c01_c387
	call f82_SimpleError
c01_071f:
;c01_071b:
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
	call f148_MidCall
;	ld (ws+1364), hl
	call f269_Generate
	ld a, (ws+1359)
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
;	ld (ws+1368), hl
	ld a, (ws+1359)
	push af
	call f153_MidDeref
	ld (ws+1370), hl
	ld a, (ws+1359)
	push af
	ld hl, (ws+1366)
	push hl
	ld hl, (ws+1370)
	call f152_MidStore
;	ld (ws+1372), hl
	call f269_Generate
	call f305_i_end_call
	ld hl, (ws+1362)
	push hl
	ld hl,0
	call f154_MidAddress
;	ld (ws+1374), hl
	ld a, (ws+1359)
	push af
	call f153_MidDeref
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
;end_f398_reduce_73:
	ret
c01_c388:
	db 115,117,98,114,111,117,116,105,110,101,32,114,101,113,117,105,114,101,115,32,111,117,116,112,117,116,32,97,114,103,117,109
db 101,110,116,115,0


	; reduce_74 workspace at ws+1353 length ws+4
f399_reduce_74:
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	call f304_i_check_sub_call_args
	ld ix, (ws+1353)
	ld a, (ix+27)
	or a
	jp z, c01_0724
	ld hl,c01_c388
	call f82_SimpleError
c01_0724:
;c01_0720:
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+28)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1353)
	call f148_MidCall
	ld (ws+1355), hl
	call f269_Generate
	call f305_i_end_call
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f399_reduce_74:
	ret
c01_c389:
	db 116,111,111,32,109,97,110,121,32,111,117,116,112,117,116,32,97,114,103,117,109,101,110,116,115,0
c01_c390:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,97,115,115,105,103,110,32,116,111,32,108,118,97,108,117,101,115,0
c01_c391:
	db 116,111,111,32,102,101,119,32,111,117,116,112,117,116,32,97,114,103,117,109,101,110,116,115,0


	; reduce_75 workspace at ws+1353 length ws+24
f400_reduce_75:
	ld hl, (ws+28)
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1353), hl
	call f304_i_check_sub_call_args
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+28)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	push hl
	ld hl, (ws+1353)
	call f148_MidCall
	ld (ws+1355), hl
	call f269_Generate
	ld ix, (ws+1353)
	ld a, (ix+27)
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
	ld hl,c01_c389
	call f82_SimpleError
c01_072f:
;c01_072b:
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
	jp nz, c01_0734
	ld hl,c01_c390
	call f82_SimpleError
c01_0734:
;c01_0730:
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
	jp c01_0725
c01_072a:
	ld hl, (ws+1329)
	call f69_Discard
	ld a, (ws+1358)
	ld b,a
	ld ix, (ws+1353)
	ld a, (ix+27)
	cp b
	jp z, c01_0739
	ld hl,c01_c391
	call f82_SimpleError
c01_0739:
;c01_0735:
	call f305_i_end_call
	ld h,2
	push hl
	ld hl,ws+1325
	call f314_yy_destructor
	ld b,22
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f400_reduce_75:
	ret
c01_c392:
	db 101,120,112,101,99,116,101,100,32,0
c01_c393:
	db 32,116,111,32,98,101,32,97,32,115,117,98,114,111,117,116,105,110,101,0


	; reduce_76 workspace at ws+1353 length ws+11
f401_reduce_76:
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	call f238_IsSubroutine
	ld (ws+1353), a
	or a
	jp nz, c01_073e
	call f80_StartError
	ld hl,c01_c392
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
	ld hl,c01_c393
	call f9_print
	call f81_EndError
c01_073e:
;c01_073a:
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
;end_f401_reduce_76:
	ret


	; reduce_77 workspace at ws+1353 length ws+0
f402_reduce_77:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f402_reduce_77:
	ret


	; reduce_78 workspace at ws+1353 length ws+2
f403_reduce_78:
	call f125_MidEnd
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f403_reduce_78:
	ret


	; reduce_79 workspace at ws+1353 length ws+0
f404_reduce_79:
	ld hl, (ws+1313)
	ld (ws+1309), hl
;end_f404_reduce_79:
	ret


	; reduce_80 workspace at ws+1353 length ws+0
f405_reduce_80:
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
	ld h,45
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f405_reduce_80:
	ret
c01_c394:
	db 116,111,111,32,109,97,110,121,32,112,97,114,97,109,101,116,101,114,115,32,105,110,32,99,97,108,108,32,116,111,32,0


	; reduce_81 workspace at ws+1353 length ws+7
f406_reduce_81:
	ld ix, (ws+28)
	ld l, (ix+6)
	ld h, (ix+7)
	ld (ws+1353), hl
	ld a,h
	or l
	jp nz, c01_0743
	call f80_StartError
	ld hl,c01_c394
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
c01_0743:
;c01_073f:
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
	call f125_MidEnd
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
	call f126_MidArg
;	ld (ws+1358), hl
	ld (ws+1309), hl
;end_f406_reduce_81:
	ret


	; reduce_82 workspace at ws+1353 length ws+2
f407_reduce_82:
	ld hl, (ws+1317)
	push hl
	ld hl, (ws+1325)
	call f139_MidPair
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,45
	push hl
	ld hl,ws+1321
	call f314_yy_destructor
	ld d,4
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f407_reduce_82:
	ret


	; reduce_83 workspace at ws+1353 length ws+2
f408_reduce_83:
	ld hl, (ws+1313)
	push hl
	ld hl,0
	call f139_MidPair
	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f408_reduce_83:
	ret


	; reduce_84 workspace at ws+1353 length ws+2
f409_reduce_84:
	ld hl, (ws+1313)
	push hl
	ld hl, (ws+1321)
	call f139_MidPair
	ld (ws+1353), hl
	ld (ws+1309), hl
	ld h,45
	push hl
	ld hl,ws+1317
	call f314_yy_destructor
;end_f409_reduce_84:
	ret


	; reduce_85 workspace at ws+1353 length ws+2
f410_reduce_85:
	ld hl, (ws+1313)
	call f244_UndoLValue
	ld (ws+1353), hl
	ld (ws+1309), hl
;end_f410_reduce_85:
	ret


	; reduce_86 workspace at ws+1353 length ws+4
f411_reduce_86:
	ld ix, (ws+558)
	ld a, (ix+28)
	or 2
	ld (ix+28), a
	push ix
	pop hl
	call f217_EmitterEmitSubroutineFlags
	ld hl, (ws+558)
	ld (ws+12), hl
	call f120_MidStartsub
	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+12)
	call f129_MidEndsub
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
	call f314_yy_destructor
;end_f411_reduce_86:
	ret
c01_c395:
	db 116,121,112,101,32,105,115,32,110,111,116,32,97,110,32,105,110,116,101,114,102,97,99,101,0


	; not_an_interface workspace at ws+1358 length ws+0
f413_not_an_interface:
	ld hl,c01_c395
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f413_not_an_interface:
;	ret


	; reduce_87 workspace at ws+1353 length ws+5
f412_reduce_87:
	ld hl, (ws+1313)
	call f238_IsSubroutine
	ld (ws+1353), a
	or a
;	jp nz, c01_0748
;	call f413_not_an_interface
;c01_0748:
	call z,f413_not_an_interface
;c01_0744:
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
;	jp nz, c01_074d
;	call f413_not_an_interface
;c01_074d:
	call z,f413_not_an_interface
;c01_0749:
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
	jp z, c01_0752
	ld ix, (ws+1354)
	ld l, (ix+4)
	ld h, (ix+5)
	push hl
	ld hl, (ws+558)
	call f278_CopyParameterList
c01_0752:
;c01_074e:
	ld ix, (ws+1354)
	ld a, (ix+27)
	ld ix, (ws+558)
	ld (ix+27), a
	ld a, (ix+27)
	or a
	jp z, c01_0757
	ld hl, (ws+1354)
	push hl
	xor a
	call f106_GetOutputParameter
;	ld (ws+1356), hl
	push hl
	ld hl, (ws+558)
	call f278_CopyParameterList
c01_0757:
;c01_0753:
	ld hl, (ws+558)
	call f215_EmitterEmitInputParameters
	ld hl, (ws+558)
	call f216_EmitterEmitOutputParameter;
	ld hl, (ws+558)
	call f217_EmitterEmitSubroutineFlags
	ld d,68
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f412_reduce_87:
	ret


	; reduce_88 workspace at ws+1353 length ws+0
f414_reduce_88:
	ld ix, (ws+558)
	ld l, (ix+14)
	ld h, (ix+15)
	push hl
	ld hl, (ws+1317)
	call f210_EmitterDeclareExternalSubr;utine
	ld h,11
	push hl
	ld hl,ws+1325
	call f314_yy_destructor
	ld b,16
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld a,4
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f414_reduce_88:
	ret


	; reduce_89 workspace at ws+1353 length ws+8
f415_reduce_89:
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
;end_f415_reduce_89:
	ret
c01_c396:
	db 110,111,116,32,97,32,115,117,98,114,111,117,116,105,110,101,0
c01_c397:
	db 115,117,98,114,111,117,116,105,110,101,32,97,108,114,101,97,100,121,32,105,109,112,108,101,109,101,110,116,101,100,0
c01_c398:
	db 99,97,110,110,111,116,32,105,109,112,108,101,109,101,110,116,32,115,117,98,114,111,117,116,105,110,101,32,104,101,114,101,0


	; reduce_90 workspace at ws+1353 length ws+1
f416_reduce_90:
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
	jp nz, c01_075d
	ld a, (ws+1353)
	or a
	jp nz, c01_075e
c01_075d:
	ld hl,c01_c396
	call f82_SimpleError
c01_075e:
;c01_0758:
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
	jp z, c01_0764
	ld hl,c01_c397
	call f82_SimpleError
c01_0764:
;c01_0760:
	ld hl, (ws+558)
	inc hl
	inc hl
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+12)
	and a
	sbc hl,de
	jp z, c01_0769
	ld hl,c01_c398
	call f82_SimpleError
c01_0769:
;c01_0765:
	ld d,25
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f416_reduce_90:
	ret


	; reduce_91 workspace at ws+1353 length ws+6
f417_reduce_91:
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
	call f120_MidStartsub
	ld (ws+1357), hl
	call f269_Generate
	ld ix, (ws+12)
	ld a, (ix+28)
	or 1
	ld (ix+28), a
;end_f417_reduce_91:
	ret


	; reduce_92 workspace at ws+1353 length ws+6
f418_reduce_92:
	ld hl, (ws+12)
	call f129_MidEndsub
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
	call f314_yy_destructor
;end_f418_reduce_92:
	ret


	; reduce_93 workspace at ws+1353 length ws+0
f419_reduce_93:
	ld ix, (ws+558)
	ld (ix+27), 0
	push ix
	pop hl
	call f215_EmitterEmitInputParameters
	ld hl, (ws+558)
	jp   f216_EmitterEmitOutputParameter; ;	call f216_EmitterEmitOutputParameter;
;end_f419_reduce_93:
;	ret


	; reduce_94 workspace at ws+1353 length ws+1
f420_reduce_94:
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
	call f314_yy_destructor
;end_f420_reduce_94:
	ret


	; reduce_95 workspace at ws+1353 length ws+1
f421_reduce_95:
	ld hl, (ws+1313)
	call f104_CountParameters
	ld (ws+1353), a
	ld ix, (ws+558)
	ld (ix+26), a
;end_f421_reduce_95:
	ret


	; reduce_96 workspace at ws+1353 length ws+0
f422_reduce_96:
	ld ix,0
	ld (ws+1309), ix
	ld a,4
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f422_reduce_96:
	ret


	; reduce_97 workspace at ws+1353 length ws+0
f423_reduce_97:
	ld hl, (ws+1317)
	ld (ws+1309), hl
	ld a,4
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f423_reduce_97:
	ret


	; reduce_98 workspace at ws+1353 length ws+0
f424_reduce_98:
	ld hl, (ws+1313)
	ld (ws+1309), hl
;end_f424_reduce_98:
	ret


	; reduce_99 workspace at ws+1353 length ws+0
f425_reduce_99:
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
	ld b,45
	push bc
	ld hl,ws+1317
	call f314_yy_destructor
;end_f425_reduce_99:
	ret


	; reduce_100 workspace at ws+1353 length ws+2
f426_reduce_100:
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
	call f314_yy_destructor
;end_f426_reduce_100:
	ret


	; reduce_101 workspace at ws+1353 length ws+2
f427_reduce_101:
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
	ld d,65
	push de
	ld hl,ws+1325
	call f314_yy_destructor
	ld a,10
	push af
	ld hl,ws+1317
	call f314_yy_destructor
	ld b,20
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f427_reduce_101:
	ret


	; reduce_102 workspace at ws+1353 length ws+2
f428_reduce_102:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 30
	jp nz, c01_076b
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
	jp z, c01_076a ; c01_0770
;c01_076f:
	call f306_SymbolRedeclarationError
c01_0770:
;c01_076c:
	jp c01_076a
c01_076b:
	or a
	jp nz, c01_0771
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
	jp c01_076a
c01_0771:
	call f306_SymbolRedeclarationError
c01_076a:
	ld ix, (ws+26)
	ld (ix+15), 5
;end_f428_reduce_102:
	ret
c01_c399:
	db 32,105,115,32,110,111,116,32,97,32,114,101,99,111,114,100,32,116,121,112,101,0


	; reduce_103 workspace at ws+1353 length ws+1
f429_reduce_103:
	ld hl, (ws+1313)
	call f233_CheckNotPartialType
	ld hl, (ws+1313)
	call f242_IsRecord
	ld (ws+1353), a
	or a
	jp nz, c01_0776
	call f80_StartError
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	push hl
	pop ix
	ld l, (ix+4)
	ld h, (ix+5)
	call f9_print
	ld hl,c01_c399
	call f9_print
	call f81_EndError
c01_0776:
;c01_0772:
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
;end_f429_reduce_103:
	ret


	; reduce_104 workspace at ws+1353 length ws+2
f430_reduce_104:
	ld hl, (ws+1317)
	call f233_CheckNotPartialType
	ld ix, (ws+26)
	ld a, (ix+16)
	ld ix, (ws+1317)
	ld b, (ix+16)
	cp b
	jp nc, c01_077b
;c01_077a:
	ld ix, (ws+1317)
	ld a, (ix+16)
	ld ix, (ws+26)
	ld (ix+16), a
c01_077b:
;c01_0777:
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
	call f314_yy_destructor
	ld d,22
	push de
	ld hl,ws+1313
	call f314_yy_destructor
;end_f430_reduce_104:
	ret


	; reduce_105 workspace at ws+1353 length ws+0
f431_reduce_105:
	ld ix, (ws+26)
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+1309), hl
;end_f431_reduce_105:
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
	call f314_yy_destructor
	ld b,4
	push bc
	ld hl,ws+1313
	call f314_yy_destructor
;end_f432_reduce_106:
	ret


	; reduce_107 workspace at ws+1353 length ws+2
f433_reduce_107:
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
;end_f433_reduce_107:
	ret


	; reduce_108 workspace at ws+1353 length ws+2
f434_reduce_108:
	call f308_CheckEndOfInitialiser
	call f123_MidEndinit
	ld (ws+1353), hl
	call f269_Generate
	ld h,31
	push hl
	ld hl,ws+1325
	call f314_yy_destructor
	ld d,32
	push de
	ld hl,ws+1317
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f434_reduce_108:
	ret
c01_c400:
	db 115,116,97,116,105,99,32,105,110,105,116,105,97,108,105,115,101,114,115,32,111,110,108,121,32,119,111,114,107,32,111,110,32
db 97,114,114,97,121,115,32,111,114,32,114,101,99,111,114,100,115,0
c01_c401:
	db 121,111,117,32,99,97,110,39,116,32,115,116,97,116,105,99,97,108,108,121,32,105,110,105,116,105,97,108,105,115,101,32,97,110
db 32,105,110,104,101,114,105,116,101,100,32,114,101,99,111,114,100,0


	; reduce_109 workspace at ws+1353 length ws+10
f435_reduce_109:
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
	jp nz, c01_0782
;c01_0783:
	ld a, (ws+1358)
	or a
	jp nz, c01_0782
;c01_0781:
	ld hl,c01_c400
	call f82_SimpleError
c01_0782:
;c01_077c:
	ld hl, (ws+1317)
	call f242_IsRecord
;	ld (ws+1359), a
	or a
	jp z, c01_078a
;c01_078b:
	ld ix, (ws+1317)
	ld l, (ix+4)
	ld h, (ix+5)
	ld a,h
	or l
	jp z, c01_078a
;c01_0789:
	ld hl,c01_c401
	call f82_SimpleError
c01_078a:
;c01_0784:
	ld hl, (ws+1317)
	call f242_IsRecord
;	ld (ws+1360), a
	or a
	jp z, c01_0790
	ld hl, (ws+1317)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+560), hl
c01_0790:
;c01_078c:
	ld hl, (ws+1317)
	ld (ws+26), hl
	ld ix,0
	ld (ws+562), ix
	ld (ws+564), ix
	ld hl, (ws+1325)
	call f113_MidStartinit
	ld (ws+1361), hl
	call f269_Generate
	ld b,6
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
	ld h,2
	push hl
	ld hl,ws+1313
	call f314_yy_destructor
;end_f435_reduce_109:
	ret
c01_c402:
	db 105,110,105,116,105,97,108,105,115,101,114,32,109,117,115,116,32,98,101,32,97,110,32,110,117,109,98,101,114,0
c01_c403:
	db 105,110,105,116,105,97,108,105,115,101,114,32,109,117,115,116,32,98,101,32,97,32,115,116,114,105,110,103,0
c01_c404:
	db 105,110,105,116,105,97,108,105,115,101,114,32,111,102,32,119,114,111,110,103,32,116,121,112,101,0
c01_c405:
	db 105,110,105,116,105,97,108,105,115,101,114,32,111,102,32,119,114,111,110,103,32,116,121,112,101,0


	; reduce_110 workspace at ws+1353 length ws+16
f436_reduce_110:
	call f313_GetInitedMemberChecked
	ld (ws+1355), hl
	pop hl
	ld (ws+1353), hl
	ld ix, (ws+1355)
	ld a, (ix+16)
	call f311_AlignTo
	ld ix, (ws+1355)
	ld l, (ix+11)
	ld h, (ix+12)
	ld (ws+1357), hl
	ld ix, (ws+1313)
	ld a, (ix+13)
	cp 40
	jp nz, c01_0792
	ld hl, (ws+1355)
	call f239_IsNum
;	ld (ws+1359), a
	or a
	jp nz, c01_0797
	ld hl,c01_c402
	call f82_SimpleError
c01_0797:
;c01_0793:
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
	call f110_MidInit
;	ld (ws+1360), hl
	call f269_Generate
	jp c01_0791
c01_0792:
	cp 41
	jp nz, c01_0798
	ld hl, (ws+1355)
	call f74_IsPtr
;	ld (ws+1362), a
	or a
	jp z, c01_079e
	ld hl, (ws+1355)
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld hl, (ws+551)
	and a
	sbc hl,de
	jp z, c01_079f
c01_079e:
	ld hl,c01_c403
	call f82_SimpleError
c01_079f:
;c01_0799:
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f160_MidInitstring
;	ld (ws+1363), hl
	call f269_Generate
	jp c01_0791
c01_0798:
	cp 42
	jp nz, c01_07a1
	ld de, (ws+1355)
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	and a
	sbc hl,de
	jp z, c01_07a6
	ld hl,c01_c404
	call f82_SimpleError
c01_07a6:
;c01_07a2:
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
	call f136_MidInitaddress
;	ld (ws+1365), hl
	call f269_Generate
	jp c01_0791
c01_07a1:
	cp 43
	jp nz, c01_07a7
	ld de, (ws+1355)
	ld ix, (ws+1313)
	ld l, (ix+7)
	ld h, (ix+8)
	and a
	sbc hl,de
	jp z, c01_07ac
	ld hl,c01_c405
	call f82_SimpleError
c01_07ac:
;c01_07a8:
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f124_MidInitsubref
	ld (ws+1367), hl
	call f269_Generate
	jp c01_0791
c01_07a7:
	call f303_parser_i_constant_error
c01_0791:
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
;end_f436_reduce_110:
	ret


	; reduce_111 workspace at ws+1353 length ws+0
f437_reduce_111:
	call f308_CheckEndOfInitialiser
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
	call f314_yy_destructor
;end_f437_reduce_111:
	ret
c01_c406:
	db 98,114,97,99,101,100,32,105,110,105,116,105,97,108,105,115,101,100,32,99,97,110,32,111,110,108,121,32,105,110,105,116,105,97
db 108,105,115,101,32,97,114,114,97,121,115,32,111,114,32,114,101,99,111,114,100,115,0


	; reduce_112 workspace at ws+1353 length ws+8
f438_reduce_112:
	call f313_GetInitedMemberChecked
	ld (ws+1355), hl
	pop hl
	ld (ws+1353), hl
	ld ix, (ws+1355)
	ld a, (ix+16)
	call f311_AlignTo
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
	jp z, c01_07b1
	ld hl, (ws+1355)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+560), hl
	jp c01_07ad
c01_07b1:
	ld hl, (ws+1355)
	call f237_IsArray
;	ld (ws+1360), a
	or a
	jp z, c01_07b5
	ld ix,0
	ld (ws+560), ix
	jp c01_07ad
c01_07b5:
	ld hl,c01_c406
	call f82_SimpleError
c01_07ad:
;end_f438_reduce_112:
	ret


	; reduce_113 workspace at ws+1353 length ws+2
f439_reduce_113:
	call f143_MidAsmend
	ld (ws+1353), hl
	call f269_Generate
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f439_reduce_113:
	ret


	; reduce_114 workspace at ws+1353 length ws+2
f440_reduce_114:
	call f141_MidAsmstart
	ld (ws+1353), hl
	jp   f269_Generate ;	call f269_Generate
;end_f440_reduce_114:
;	ret


	; reduce_115 workspace at ws+1353 length ws+2
f441_reduce_115:
	ld hl, (ws+1313)
	call f163_MidAsmtext
	ld (ws+1353), hl
	call f269_Generate
	ld hl, (ws+1313)
	jp   f40_Free ;	call f40_Free
;end_f441_reduce_115:
;	ret


	; reduce_116 workspace at ws+1353 length ws+2
f442_reduce_116:
	ld hl, (ws+1313)
	exx
	ld hl, (ws+1315)
	exx
	call f167_MidAsmvalue
	ld (ws+1353), hl
	jp   f269_Generate ;	call f269_Generate
;end_f442_reduce_116:
;	ret
c01_c407:
	db 121,111,117,32,99,97,110,32,111,110,108,121,32,101,109,105,116,32,114,101,102,101,114,101,110,99,101,115,32,116,111,32,118
db 97,114,105,97,98,108,101,115,44,32,115,117,98,114,111,117,116,105,110,101,115,44,32,111,114,32,99,111,110,115,116,97,110,116
db 115,0


	; bad_reference workspace at ws+1360 length ws+0
f444_bad_reference:
	ld hl,c01_c407
	jp   f82_SimpleError ;	call f82_SimpleError
;end_f444_bad_reference:
;	ret


	; reduce_117 workspace at ws+1353 length ws+7
f443_reduce_117:
	ld ix, (ws+1313)
	ld a, (ix+10)
	cp 30
	jp nz, c01_07b7
	ld hl, (ws+1313)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	call f238_IsSubroutine
	ld (ws+1353), a
	or a
	jp z, c01_07bc
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
	call f114_MidAsmsubref
;	ld (ws+1354), hl
	call f269_Generate
	jp c01_07b6 ; c01_07b8
c01_07bc:
	call f444_bad_reference
c01_07b8:
	jp c01_07b6
c01_07b7:
	cp 28
	jp nz, c01_07bd
	ld hl, (ws+1313)
	call f147_MidAsmsymbol
;	ld (ws+1356), hl
	call f269_Generate
	jp c01_07b6
c01_07bd:
	cp 7
	jp nz, c01_07be
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
	call f167_MidAsmvalue
;	ld (ws+1358), hl
	call f269_Generate
	jp c01_07b6
c01_07be:
	call f444_bad_reference
c01_07b6:
;end_f443_reduce_117:
	ret


	; reduce_123 workspace at ws+1353 length ws+0
f445_reduce_123:
	ld b,26
	push bc
	ld hl,ws+1321
	call f314_yy_destructor
;end_f445_reduce_123:
	ret


	; reduce_127 workspace at ws+1353 length ws+0
f446_reduce_127:
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f446_reduce_127:
	ret


	; reduce_128 workspace at ws+1353 length ws+0
f447_reduce_128:
	ld h,25
	push hl
	ld hl,ws+1329
	call f314_yy_destructor
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f447_reduce_128:
	ret


	; reduce_129 workspace at ws+1353 length ws+0
f448_reduce_129:
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f448_reduce_129:
	ret


	; reduce_130 workspace at ws+1353 length ws+0
f449_reduce_130:
	ld a,22
	push af
	ld hl,ws+1313
	call f314_yy_destructor
;end_f449_reduce_130:
	ret


	; reduce_136 workspace at ws+1353 length ws+0
f450_reduce_136:
	ld d,45
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f450_reduce_136:
	ret


	; reduce_139 workspace at ws+1353 length ws+0
f451_reduce_139:
	ld d,45
	push de
	ld hl,ws+1317
	call f314_yy_destructor
;end_f451_reduce_139:
	ret


	; reduce_default workspace at ws+1353 length ws+0
f452_reduce_default:
;end_f452_reduce_default:
	ret
f321_yy_reduce_s07bf:
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
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f445_reduce_123
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f446_reduce_127
	dw f447_reduce_128
	dw f448_reduce_129
	dw f449_reduce_130
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f452_reduce_default
	dw f450_reduce_136
	dw f452_reduce_default
	dw f452_reduce_default
	dw f451_reduce_139


	; yy_reduce workspace at ws+1303 length ws+50
f321_yy_reduce:
	ld (ws+1305), a
	pop bc
	pop hl
	ld (ws+1303), hl
	push bc
	ld bc,f2___main_s065a
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
;	jp nz, c01_065f
;	call f318_yy_stack_overflow
;c01_065f:
	call z,f318_yy_stack_overflow
;c01_065b:
	ld iy,ws+1313
	ld (ws+1345), iy
	ld a, (ws+1308)
	ld (ws+1347), a
c01_0660:
	ld a, (ws+1347)
	or a
	jp z, c01_0665
	ld hl, (ws+566)
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, (ws+1345)
	call f320_CopyMinor
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
	jp c01_0660
c01_0665:
	ld de,f321_yy_reduce_s07bf
	ld a, (ws+1303)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld e,(hl)
	inc hl
	ld d,(hl)
	call f488__jpde
	ld hl,ws+1309
	push hl
	ld hl, (ws+566)
	ld bc,10
	add hl,bc
	call f320_CopyMinor
	ld de,f2___main_s0659
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
	ld bc,f2___main_s0641
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
	jp c, c01_07c4
;c01_07c3:
	ld de,f2___main_s0640
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
	jp c, c01_07cd
;c01_07cf:
	ld hl, (ws+1351)
	ld de,1316
	and a
	sbc hl,de
	jp nc, c01_07cd
;c01_07ce:
	ld bc,f2___main_s063e
	ld hl, (ws+1351)
	add hl,bc
	ld a,(hl)
	ld b,a
	ld a, (ws+1348)
	cp b
	jp nz, c01_07cd
;c01_07cc:
	ld de,f2___main_s063d
	ld hl, (ws+1351)
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1306), hl
c01_07cd:
;c01_07c5:
c01_07c4:
;c01_07c0:
	ld de, (ws+566)
	ld hl,7
	add hl,de
	ld (ws+566), hl
	ld de, (ws+1306)
	ld hl, (ws+566)
	ld (hl),e
	inc hl
	ld (hl),d
	ld a, (ws+1348)
	ld hl, (ws+566)
	inc hl
	inc hl
	ld (hl),a
;end_f321_yy_reduce:
	ld hl, (ws+1306)
	ret


	; yy_parse_failed workspace at ws+1303 length ws+0
f453_yy_parse_failed:
	jp   f317_yy_pop_all_parser_stack ;	call f317_yy_pop_all_parser_stack
;end_f453_yy_parse_failed:
;	ret
c01_c408:
	db 117,110,101,120,112,101,99,116,101,100,32,0


	; yy_syntax_error workspace at ws+1303 length ws+3
f454_yy_syntax_error:
	ld (ws+1304), hl
	pop bc
	pop af
	ld (ws+1303), a
	push bc
	call f80_StartError
	ld hl,c01_c408
	call f9_print
	ld bc,f2___main_s0642
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
;end_f454_yy_syntax_error:
;	ret


	; yy_accept workspace at ws+1303 length ws+0
f455_yy_accept:
;end_f455_yy_accept:
	ret


	; ParserInit workspace at ws+1294 length ws+0
f456_ParserInit:
	ld a,255
	ld (ws+1275), a
	ld iy,ws+568
	ld (ws+566), iy
	ld ix,0
	ld (ws+568), ix
	xor a
	ld (ws+570), a
;end_f456_ParserInit:
	ret


	; ParserDeinit workspace at ws+1294 length ws+0
f457_ParserDeinit:
c01_07d0:
	ld de, (ws+566)
	ld hl,ws+568
	and a
	sbc hl,de
	jp z, c01_07d5
	call f316_yy_pop_parser_stack
	jp c01_07d0
c01_07d5:
;end_f457_ParserDeinit:
	ret


	; ParserFeedToken workspace at ws+1294 length ws+9
f458_ParserFeedToken:
	ld (ws+1295), hl
	pop bc
	pop af
	ld (ws+1294), a
	push bc
	ld hl, (ws+566)
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1297), hl
c01_07d6:
	ld hl,220
	ld de, (ws+1297)
	and a
	sbc hl,de
	jp c, c01_07dc
;c01_07db:
	ld de,f2___main_s063f
	ld a, (ws+1297)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld a, (ws+1294)
	ld l,a
	ld h,0
	add hl,de
	ld (ws+1299), hl
	ld bc,f2___main_s063e
	add hl,bc
	ld a,(hl)
	ld b,a
	ld a, (ws+1294)
	cp b
	jp z, c01_07e1
	ld de,f2___main_s0641
	ld a, (ws+1297)
	ld l,a
	ld h,0
	add hl,hl
	add hl,de
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1297), hl
	jp c01_07dd
c01_07e1:
	ld bc,f2___main_s063d
	ld hl, (ws+1299)
	add hl,hl
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1297), hl
c01_07dd:
c01_07dc:
;c01_07d8:
	ld hl, (ws+1297)
	ld de,454
	and a
	sbc hl,de
	jp c, c01_07e6
;c01_07e5:
	ld de, (ws+1297)
	ld hl,65082
	add hl,de
	push hl
	ld a, (ws+1294)
	call f321_yy_reduce
;	ld (ws+1301), hl
	ld (ws+1297), hl
	jp c01_07e2
c01_07e6:
	ld hl,450
	ld de, (ws+1297)
	and a
	sbc hl,de
	jp c, c01_07ea
;c01_07e9:
	ld de, (ws+566)
	ld hl,ws+1268
	and a
	sbc hl,de
	jp nz, c01_07ef
	call f318_yy_stack_overflow
	ret
c01_07ef:
;c01_07eb:
	ld hl, (ws+566)
	ld bc,7
	add hl,bc
	ld (ws+566), hl
	ld hl,220
	ld de, (ws+1297)
	and a
	sbc hl,de
	jp nc, c01_07f4
;c01_07f3:
	ld hl, (ws+1297)
	ld de,143
	add hl,de
	ld (ws+1297), hl
c01_07f4:
;c01_07f0:
	ld de, (ws+1297)
	ld hl, (ws+566)
	ld (hl),e
	inc hl
	ld (hl),d
	ld a, (ws+1294)
	ld hl, (ws+566)
	inc hl
	inc hl
	ld (hl),a
	ld hl, (ws+1295)
	push hl
	ld hl, (ws+566)
	inc hl
	inc hl
	inc hl
	call f320_CopyMinor
	ld a, (ws+1275)
	or a
	jp m, c01_07d7 ; c01_07f9
;c01_07f8:
	ld a, (ws+1275)
	dec a
	ld (ws+1275), a
c01_07f9:
;c01_07f5:
	jp c01_07d7
c01_07ea:
	ld hl, (ws+1297)
	ld de,65084
	add hl,de
	ld a,h
	or l
	jp nz, c01_07fd
	ld hl, (ws+566)
	ld bc,65529
	add hl,bc
	ld (ws+566), hl
	call f455_yy_accept
	jp c01_07d7
c01_07fd:
	ld b,0
	ld a, (ws+1275)
	push af
	ld a,b
	pop bc
	sub b
	jp po, 1f;
	xor 128
1:
	jp m, c01_0802
;c01_0801:
	ld a, (ws+1294)
	push af
	ld hl, (ws+1295)
	call f454_yy_syntax_error
c01_0802:
;c01_07fe:
	ld a,3
	ld (ws+1275), a
	ld a, (ws+1294)
	push af
	ld hl, (ws+1295)
	call f314_yy_destructor
	ld a, (ws+1294)
	or a
	jp nz, c01_07d7 ; c01_0807
;c01_0806:
	call f453_yy_parse_failed
	ld a,255
	ld (ws+1275), a
c01_0807:
;c01_0803:
	jp c01_07d7
c01_07e2:
	ld de, (ws+566)
	ld hl,ws+568
	and a
	sbc hl,de
	jp nz, c01_07d6 ; c01_080c
;c01_080b:
	jp c01_07d7
c01_080c:
;c01_0808:
	jp c01_07d6
c01_07d7:
;end_f458_ParserFeedToken:
	ret
c01_c409:
	db 107,66,32,102,114,101,101,10,0


	; PrintFreeMemory workspace at ws+1294 length ws+2
f459_PrintFreeMemory:
	call f41_GetFreeMemory
;	ld (ws+1294), hl
	ld a,10
	call f466__lsr2
	call f16_print_i16
	ld hl,c01_c409
	jp   f9_print ;	call f9_print
;end_f459_PrintFreeMemory:
;	ret
c01_c410:
	db 115,121,110,116,97,120,32,101,114,114,111,114,58,32,99,111,119,102,101,32,91,45,73,112,97,116,104,93,32,60,105,110,102,105
db 108,101,62,32,60,111,117,116,102,105,108,101,62,10,0


	; SyntaxError workspace at ws+1298 length ws+0
f460_SyntaxError:
	ld hl,c01_c410
	call f9_print
	jp   f4_ExitWithError ;	call f4_ExitWithError
;end_f460_SyntaxError:
;	ret


	; ParseArguments workspace at ws+1294 length ws+4
f461_ParseArguments:
	call f27_ArgvInit
c01_080d:
	call f28_ArgvNext
;	ld (ws+1294), hl
	ld (ws+1296), hl
	ld a,h
	or l
;	jp nz, c01_0813
;	jp c01_080e
;c01_0813:
	jp z,c01_080e
;c01_080f:
	ld hl, (ws+1296)
	ld a,(hl)
	cp 45
	jp nz, c01_0818
	ld hl, (ws+1296)
	inc hl
	ld (ws+1296), hl
	ld a,(hl)
	cp 73
	jp nz, c01_081d
	ld hl, (ws+1296)
	inc hl
	ld (ws+1296), hl
	call f83_LexerAddIncludePath
	jp c01_080d ; c01_0819
c01_081d:
	call f460_SyntaxError
c01_0819:
	jp c01_080d ; c01_0814
c01_0818:
	ld hl, (ws+8)
	ld a,h
	or l
	jp nz, c01_0822
	ld hl, (ws+1296)
	ld (ws+8), hl
	jp c01_080d ; c01_081e
c01_0822:
	ld hl, (ws+10)
	ld a,h
	or l
	jp nz, c01_0826
	ld hl, (ws+1296)
	ld (ws+10), hl
	jp c01_080d ; c01_081e
c01_0826:
	call f460_SyntaxError
c01_081e:
c01_0814:
	jp c01_080d
c01_080e:
	ld hl, (ws+8)
	ld a,h
	or l
	jp z, c01_082c
	ld hl, (ws+10)
	ld a,h
	or l
	jp nz, c01_082d
c01_082c:
	call f460_SyntaxError
c01_082d:
;c01_0827:
;end_f461_ParseArguments:
	ret
c01_c411:
	db 67,79,87,70,69,58,32,0
c01_c412:
	db 0
c01_c413:
	db 100,111,110,101,58,32,0


	; __main workspace at ws+0 length ws+1294
f2___main:
	ld hl, __Hbss
	ld ( ws+0 ), hl 
	ld hl, (6) 
	ld ( ws+2 ), hl 
	ld hl, (ws+0)
	ld (ws+6), hl
	ld bc,0
	ld (hl),c
	inc hl
	ld (hl),b
	ld hl, (ws+2)
	ld de, (ws+0)
	and a
	sbc hl,de
	ex de,hl
	ld hl, (ws+6)
	inc hl
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ld bc,0
	ld (ws+8), bc
	ld (ws+10), bc
	ld ix,1
	ld (ws+14), ix
	ld (ws+16), ix
	ld (ws+30), bc
	ld iy,ws+32
	ld (ws+64), iy
	ld bc,0
	ld (ws+66), bc
	ld bc,0
	ld (ws+68), bc
	ld bc,0
	ld (ws+70), bc
	ld (ws+72), bc
	xor a
	ld (ws+74), a
	xor a
	ld (ws+203), a
	xor a
	ld (ws+374), a
	ld ix,0
	ld (ws+375), ix
	xor a
	ld (ws+557), a
	ld hl,c01_c411
	call f9_print
	call f459_PrintFreeMemory
	call f461_ParseArguments
	ld hl,c01_c412
	call f83_LexerAddIncludePath
	ld hl, (ws+8)
	call f87_LexerIncludeFile
	call f279_CreateMainSubroutine
	call f251_ArchInitTypes
	ld hl, (ws+10)
	call f207_EmitterOpenfile
	ld hl, (ws+12)
	call f209_EmitterDeclareSubroutine
	call f118_MidStartfile
	ld (ws+1276), hl
	call f269_Generate
	ld hl, (ws+12)
	call f120_MidStartsub
	ld (ws+1278), hl
	call f269_Generate
	call f456_ParserInit
c01_082f:
	call f88_LexerReadToken
	ld (ws+1280), a
	ld (ws+1281), a
	cp 34
	jp nz, c01_0832
	ld hl, (ws+204)
	exx
	ld hl, (ws+206)
	exx
	ld (ws+1282), hl
	exx
	ld (ws+1284), hl
	exx
	jp c01_0831
c01_0832:
	cp 33
	jp nz, c01_0833
	ld hl,ws+75
	call f78_InternalStrDup
	ld (ws+1286), hl
	ld (ws+1282), hl
	jp c01_0831
c01_0833:
	cp 41
	jp nz, c01_0834
	ld hl,ws+75
	call f78_InternalStrDup
	ld (ws+1288), hl
	ld (ws+1282), hl
	jp c01_0831
c01_0834:
	ld hl,0
	ld (ws+1282), hl
	ld (ws+1284), hl
c01_0831:
	ld a, (ws+1281)
	push af
	ld hl,ws+1282
	call f458_ParserFeedToken
	ld a, (ws+1281)
	or a
	jp nz, c01_082f ; c01_0839
;c01_0838:
	jp c01_0830
c01_0839:
;c01_0835:
	jp c01_082f
c01_0830:
	call f457_ParserDeinit
	ld hl, (ws+12)
	call f129_MidEndsub
	ld (ws+1290), hl
	call f269_Generate
	ld hl, (ws+12)
	call f280_ReportWorkspaces
	call f157_MidEndfile
	ld (ws+1292), hl
	call f269_Generate
	call f208_EmitterClosefile
	ld hl,c01_c413
	call f9_print
	call f459_PrintFreeMemory
;end_f2___main:
	ret
    ; _lsr1
f463__lsr1:
    dec b
    ret m
    srl a
    jp f463__lsr1

    ; _lsr2
f466__lsr2:
    dec a
    ret m
    srl h
    rr l
    jp f466__lsr2

    ; _lsr4
f469__lsr4:
    dec a
    ret m
    exx
    srl h
    rr l
    exx
    rr h
    rr l
    jp f469__lsr4

    ; _asl4
f470__asl4:
    dec a
    ret m
    add hl, hl
    exx
    adc hl, hl
    exx
    jp f470__asl4

    ; _asr4
f471__asr4:
    dec a
    ret m
    exx
    sra h
    rr l
    exx
    rr h
    rr l
    jp f471__asr4

    ; _mul2
f473__mul2:
    ld hl, 0
    ld a, 16            ; number of iterations
f473__mul2_loop:
    add hl, hl
    rl e
    rl d
    jp nc, f473__mul2_noadd
    add hl, bc
    jr nc, 1f;
    inc de              ; if carry increment high word
1:
f473__mul2_noadd:
    dec a
    jp nz, f473__mul2_loop
    ret

    ; _mul4
f474__mul4:
    and a               ; reset carry
    sbc hl, hl          ; lower result to 0
    exx
    sbc hl, hl          ; upper result to 0
    exx
    ld a, 32            ; number of iterations
f474__mul4_loop:
    exx
    sra b               ; right shift lhs
    rr c
    exx
    rr b
    rr c                ; lowest bit to carry
    jp nc, f474__mul4_noadd
    add hl, de          ; result += rhs
    exx
    adc hl, de
    exx
f474__mul4_noadd:
    sla e               ; left shift rhs
    rl d
    exx
    rl e
    rl d
    exx
    dec a
    jp nz, f474__mul4_loop
    ret

    ; _dvrmu2
f477__dvrmu2:
    ld a, 16            ; bit count
    ld hl, 0            ; reset remainder
    jp f477__dvrmu2_entry
f477__dvrmu2_loop1:
    add hl, de
f477__dvrmu2_loop2:
    dec a
    ret z
f477__dvrmu2_entry:
    sla c               ; left shift LHS
    rl b
    adc hl, hl          ; top bit of LHS goes into remainder
    or a                ; clear carry
    sbc hl, de          ; sets carry if remainder(hl) < de
    jp c, f477__dvrmu2_loop1      ; if re;ainder < de, undo add and go round again
    inc c               ; we know the bottom bit is clear
    jp f477__dvrmu2_loop2

    ; _dvrmu4
f479__dvrmu4:
    ld a, 32            ; bit count
    and a               ; reset carry
    sbc hl, hl          ; reset remainder
    exx
    sbc hl, hl
    exx
    jp f479__dvrmu4_entry
f479__dvrmu4_loop1:
    add hl, de
    exx
    adc hl, de
    exx
f479__dvrmu4_loop2:
    dec a
    ret z
f479__dvrmu4_entry:
    sla c               ; left shift LHS
    rl b
    exx
    rl c
    rl b
    exx
    adc hl, hl          ; top bit of LHS goes into remainder
    exx
    adc hl, hl
    exx
    or a                ; clear carry
    sbc hl, de          ; sets carry if remainder < RHS
    exx
    sbc hl, de
    exx
    jp c, f479__dvrmu4_loop1      ; if re;ainder < RHS, undo add and go round again
    inc c               ; we know the bottom bit is clear
    jp f479__dvrmu4_loop2

    ; _dvrms4
f480__dvrms4:
    exx
    ld a, b
    xor d               ; discover sign of result
    push af             ; save for later
    xor d               ; recover b (and sign of remainder) (and clear carry)
    push af             ; save for later
    exx

    jp p, f480__dvrms4_bcbc_positive
    sbc hl, hl          ; set hl to 0
    sbc hl, bc          ; negate bc
    ld b, h
    ld c, l
    exx
    ld hl, 0
    sbc hl, bc
    ld b, h
    ld c, l
    exx
f480__dvrms4_bcbc_positive:

    exx
    bit 7, d            ; get sign of dede
    exx
    jp z, f480__dvrms4_dede_positive
    ld hl, 0
    and a
    sbc hl, de
    ex de, hl
    exx
    ld hl, 0
    sbc hl, de
    ex de, hl
    exx                 ; negate dede
f480__dvrms4_dede_positive:

    call f479__dvrmu4       ; actually d; the division
    ex de, hl           ; put remainder in de as we need hl
    exx
    ex de, hl
    exx

    pop af              ; recover sign of remainder
    jp p, f480__dvrms4_remainder_positive
    and a               ; clear carry
    sbc hl, hl
    sbc hl, de          ; invert remainder
    ex de, hl
    exx
    ld hl, 0
    sbc hl, de
    ex de, hl
    exx
f480__dvrms4_remainder_positive:

    pop af              ; recover sign of result
    ret p               ; return now if we're good
    and a
    sbc hl, hl
    sbc hl, bc          ; invert result
    ld b, h
    ld c, l
    exx
    ld hl, 0
    sbc hl, bc
    ld b, h
    ld c, l
    exx
    ret

    ; _and4
f481__and4:
    ld a, l
    and e
    ld l, a
    ld a, h
    and d
    ld h, a
    exx

    ld a, l
    and e
    ld l, a
    ld a, h
    and d
    ld h, a
    exx
    ret

    ; _or4
f482__or4:
    ld a, l
    or e
    ld l, a
    ld a, h
    or d
    ld h, a
    exx

    ld a, l
    or e
    ld l, a
    ld a, h
    or d
    ld h, a
    exx
    ret

    ; _eor4
f483__eor4:
    ld a, l
    xor e
    ld l, a
    ld a, h
    xor d
    ld h, a
    exx

    ld a, l
    xor e
    ld l, a
    ld a, h
    xor d
    ld h, a
    exx
    ret

    ; _not4
f484__not4:
    ld a, l
    cpl
    ld l, a
    ld a, h
    cpl
    ld h, a
    exx

    ld a, l
    cpl
    ld l, a
    ld a, h
    cpl
    ld h, a
    exx
    ret

    ; _cmpu4
f486__cmpu4:
    and a               ; clear carry
    sbc hl, de
    ret nz
    exx
    sbc hl, de
    exx
    ret

    ; _cmps4
f487__cmps4:
    and a               ; clear carry
    sbc hl, de
    exx
    sbc hl, de          ; leaves C set on unsigned overflow
    ld a, h             ; preserve high byte
    exx
    jp po, 1f;
    xor 080h            ; invert sign byte, spoil Z
1:
    ret

    ; _jpbc
f488__jpde:
    push de
    ret
 


global _exit
_exit: rst 0
psect data
ws:
defs 1472
psect bss
defs 128
TOPSTACK:
