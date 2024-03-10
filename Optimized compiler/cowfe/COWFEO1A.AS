 global f10_print_nl
 global f104_CountParameters
 global f105_GetInputParameter
 global f106_GetOutputParameter
 global f108_WidthToIndex
 global f109_AllocateNewNode
 global f110_MidInit
 global f111_MidBlts
 global f113_MidStartinit
 global f114_MidAsmsubref
 global f116_MidConstant
 global f118_MidStartfile
 global f120_MidStartsub
 global f121_MidPoparg
 global f123_MidEndinit
 global f124_MidInitsubref
 global f125_MidEnd
 global f126_MidArg
 global f127_MidJump
 global f128_MidWhencase
 global f129_MidEndsub
 global f134_MidStartcase
 global f135_MidBor
 global f136_MidInitaddress
 global f139_MidPair
 global f141_MidAsmstart
 global f143_MidAsmend
 global f144_MidEndcase
 global f147_MidAsmsymbol
 global f148_MidCall
 global f149_MidAsmgroupend
 global f150_MidBltu
 global f152_MidStore
 global f153_MidDeref
 global f154_MidAddress
 global f156_MidAsmgroupstart
 global f157_MidEndfile
 global f159_MidLabel
 global f16_print_i16
 global f160_MidInitstring
 global f161_MidBand
 global f163_MidAsmtext
 global f164_MidBeq
 global f166_MidReturn
 global f167_MidAsmvalue
 global f168_MidString
 global f169_MidSubref
 global f17_print_i8
 global f171_FreeNode
 global f27_ArgvInit
 global f34_MemCopy
 global f4_ExitWithError
 global f40_Free
 global f41_GetFreeMemory
 global f52_FCBOpenOut
 global f53_FCBClose
 global f62_FCBPutChar
 global f70_AllocNewSymbol
 global f71_FreeSymbol
 global f72_AllocNewType
 global f73_FreeType
 global f74_IsPtr
 global f75_InternalAlloc
 global f76_StrDupBraced
 global f77_StrDupArrayed
 global f78_InternalStrDup
 global f80_StartError
 global f81_EndError
 global f82_SimpleError
 global f83_LexerAddIncludePath
 global f87_LexerIncludeFile
 global f88_LexerReadToken
 global f9_print
 global f29_StrCmp
 global f22_print_hex_i32
 global f28_ArgvNext
 global f32_StrLen

	ld sp, TOP+128
	call f2___main
	ld hl,0
	ld (80H),hl
	rst 0


	; ExitWithError workspace at ws+1434 length ws+0
f4_ExitWithError:
	ld hl,1
	ld (80h),hl
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

