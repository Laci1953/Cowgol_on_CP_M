include w.mac

	global f247_AllocLabel
	global f230_AddSymbol
	global f228_LookupSymb;lf
	global f248_AllocSubrI;
	global f118_MidStartfi;e
	global f129_MidEndsub
	global f208_EmitterClo;efile
	global f207_EmitterOpe;file
	global f269_Generate
	global f209_EmitterDec;areSubroutine
	global f120_MidStartsu;
	global f157_MidEndfile
	global f183_MidC2Op
	global f180_MidC1Op
	global f106_GetOutputP;rameter
	global f105_GetInputPa;ameter
	global f176_FoldConsta;t2
	global f153_MidDeref
	global f196_E_counteds;ring
	global f110_MidInit
	global f150_MidBltu
	global f212_EmitterRef;renceSubroutine
	global f113_MidStartin;t
	global f160_MidInitstr;ng
	global f136_MidInitadd;ess
	global f124_MidInitsub;ef
	global f121_MidPoparg
	global f139_MidPair
	global f215_EmitterEmi;InputParameters
	global f210_EmitterDec;areExternalSubr
	global f123_MidEndinit
	global f126_MidArg
	global f123_MidEndinit
	global f163_MidAsmtext
	global f147_MidAsmsymb;l
	global f141_MidAsmstar;
	global f143_MidAsmend
	global f167_MidAsmvalu;
	global f114_MidAsmsubr;f
	global f128_MidWhencas;
	global f116_MidConstan;
	global f134_MidStartca;e
	global f149_MidAsmgrou;end
	global f164_MidBeq
	global f135_MidBor
	global f161_MidBand
	global f148_MidCall
	global f111_MidBlts
	global f156_MidAsmgrou;start
	global f127_MidJump
	global f217_EmitterEmi;SubroutineFlags
	global f211_EmitterRef;renceSubroutine
	global f184_MidCCast
	global f152_MidStore
	global f216_EmitterEmi;OutputParameter
	global f169_MidSubref
	global f168_MidString
	global f166_MidReturn
	global f144_MidEndcase
	global f154_MidAddress
	global f159_MidLabel
	global f213_EmitterDec;areWorkspace
	global f251_ArchInitTy;es
	global f276_DestructSu;routineContents
	global f250_ArchAlignU;
	global f254_ArchInitMe;ber
	global f288_Expr1Simpl;
	global f293_Expr2Simpl;
	global f272_InitVariab;e
	global f238_IsSubrouti;e
	global f274_MakeArrayT;pe
	global f246_MaybeUndoL;alue
	global f239_IsNum
	global f74_IsPtr
	global f273_MakePointe;Type
	global f240_IsSNum
	global f252_ArchGuessI;tType
	global f237_IsArray
	global f291_ExprSub
	global f231_AddAlias
	global f245_IsLValue
	global f241_IsScalar
	global f242_IsRecord
	global f233_CheckNotPa;tialType
	global f296_ExprShift
	global f270_GenerateCo;ditional
	global f243_MakeLValue
	global f282_CheckExpre;sionType
	global f244_UndoLValue
	global f246_MaybeUndoL;alue
	global f279_CreateMain;ubroutine
	global f125_MidEnd
	global f229_AddToNames
	global f281_expr_i_can

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
        call f108_WidthToInd
;        ld (ws+1387), a
        add 7
        call f109_AllocateNe
        ld (ws+1385), hl
;        ld hl,( ws+1385 )
        ld c,N_base
        ld de,( ws+1381 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1385 )
        ld c,N_base+2
        ld de,( ws+1381 +2)
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1385)
        ret


	global _ZeroFillNode

_ZeroFillNode:
	xor a
	ld b,14		;node size
1:	ld (hl),a
	inc hl
	djnz 1b
	ret


        ; MidBlts workspace at ws+1377 length ws+17 CHANGED
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
;        ld (ws+1377), a
        push bc
        ld hl,mid_node
        ld (pmid_node), hl
        call f108_WidthToInd
;        ld (ws+1391), a
        add 61
        call f109_AllocateNe
        ld (ws+1389), hl
        ld hl,( pmid_node )
        call _ZeroFillNode
        ld hl, (ws+1378)
        ld (mid_node+N_left), hl
        ld hl, (ws+1380)
        ld (mid_node+N_right), hl
        ld hl, (ws+1382)
        ld (mid_node), hl
        ld hl, (ws+1384)
        ld (mid_node+2), hl
        ld hl, (ws+1386)
        ld (mid_node+4), hl
        ld a, (ws+1388)
        ld (mid_node+6), a
        ld de,( pmid_node )
        ld hl,( ws+1389 )
        ld c, NODE_SIZE-1
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _WriteMem
        ld hl, (ws+1389)
        ret


        ; MidStartinit workspace at ws+1363 length ws+6 CHANGED
f113_MidStartin:
        ld (ws+1363), hl
        ld a,6
        call f109_AllocateNe
        ld (ws+1365), hl
        ld c,N_base
        ld de,( ws+1363 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1365)
        ret


        ; MidAsmsubref workspace at ws+1360 length ws+6 CHANGED
f114_MidAsmsubr:
        ld (ws+1360), hl
        ld a,21
        call f109_AllocateNe
        ld (ws+1362), hl
        ld c,N_base
        ld de,( ws+1360 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1362)
        ret


        ; MidConstant workspace at ws+1413 length ws+8 CHANGED
f116_MidConstan:
        ld (ws+1413), hl
        exx
        ld (ws+1415), hl
        exx
        ld a,40
        call f109_AllocateNe
        ld (ws+1417), hl
        ld c,N_base
        ld de,( ws+1413 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1417 )
        ld c,N_base+2
        ld de,( ws+1413 +2)
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1417)
        ret


	; MidStartfile workspace at ws+1294 length ws+4  OK
f118_MidStartfi:  
	ld a,2
;	call f109_AllocateNe;Node
	jp f109_AllocateNe
;	ld (ws+1294), hl
;!!!	ld hl, (ws+1294)
;	ret


        ; MidStartsub workspace at ws+1359 length ws+6 OK
f120_MidStartsu: 
        ld (ws+1359), hl
        ld a,4
        call f109_AllocateNe;Node
        ld (ws+1361), hl
;        ld hl,( ws+1361 )
        ld de,( ws+1359 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1361)
        ret


        ; MidPoparg workspace at ws+1378 length ws+11 CHANGED
f121_MidPoparg:
        ld (ws+1383), a
        pop bc
        pop hl
        ld (ws+1381), hl
        pop hl
        ld (ws+1379), hl
        pop af
;        ld (ws+1378), a
        push bc
        call f108_WidthToInd
        add 35
        call f109_AllocateNe
        ld (ws+1386), hl
        ld c,N_base
        ld de,( ws+1379 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1386 )
        ld c,N_base+2
        ld de,( ws+1381 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1386 )
        ld c,N_base+4
        ld a,( ws+1383 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutByte
        ld hl, (ws+1386)
        ret


	; MidEndinit workspace at ws+1355 length ws+4  OK
f123_MidEndinit:
	ld a,15
;	call f109_AllocateNe;Node
	jp f109_AllocateNe
;	ld (ws+1355), hl
;!!!	ld hl, (ws+1355)
;	ret

        ; MidInitsubref workspace at ws+1369 length ws+6 CHANGED
f124_MidInitsub:
        ld (ws+1369), hl
        ld a,14
        call f109_AllocateNe
        ld (ws+1371), hl
        ld c,N_base
        ld de,( ws+1369 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1371)
        ret


	; MidEnd workspace at ws+1360 length ws+4   OK
f125_MidEnd:
	ld a,1
;	call f109_AllocateNe;Node
	jp f109_AllocateNe
;	ld (ws+1360), hl
;!!!	ld hl, (ws+1360)
;	ret


        ; MidArg workspace at ws+1360 length ws+15 CHANGED
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
        ld hl,argnode
        ld (pargnode), hl
        call f108_WidthToInd
;        ld (ws+1372), a
        add 30
        call f109_AllocateNe
        ld (ws+1370), hl
        ld hl,( pargnode )
        call _ZeroFillNode
        ld hl, (ws+1361)
        ld (argnode+N_left), hl
        ld hl, (ws+1363)
        ld (argnode+N_right), hl
        ld hl, (ws+1365)
        ld (argnode), hl
        ld hl, (ws+1367)
        ld (argnode+2), hl
        ld a, (ws+1369)
        ld (argnode+4), a
        ld de,( pargnode )
        ld hl,( ws+1370 )
        ld c, NODE_SIZE-1
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _WriteMem
        ld hl, (ws+1370)
        ret


        ; MidJump workspace at ws+1361 length ws+6 CHANGED
f127_MidJump:
        ld (ws+1361), hl
        ld a,27
        call f109_AllocateNe
        ld (ws+1363), hl
        ld c,N_base
        ld de,( ws+1361 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1363)
        ret


        ; MidWhencase workspace at ws+1361 length ws+12 CHANGED
f128_MidWhencas:
        ld (ws+1366), hl
        pop bc
        pop hl
        ld (ws+1362), hl
        pop hl
        ld (ws+1364), hl
        pop af
;        ld (ws+1361), a
        push bc
        call f108_WidthToInd
        add 76
        call f109_AllocateNe
        ld (ws+1370), hl
        ld c,N_base
        ld de,( ws+1362 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1370 )
        ld c,N_base+2
        ld de,( ws+1362 +2)
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1370 )
        ld c,N_base+4
        ld de,( ws+1366 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1370)
        ret



        ; MidEndsub workspace at ws+1359 length ws+6 OK
f129_MidEndsub:
        ld (ws+1359), hl
        ld a,5
        call f109_AllocateNe;Node
        ld (ws+1361), hl
;        ld hl,( ws+1361 )
        ld de,( ws+1359 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1361)
        ret


        ; MidStartcase workspace at ws+1363 length ws+8 CHANGED
f134_MidStartca:
        ld (ws+1364), hl
        pop bc
        pop af
;        ld (ws+1363), a
        push bc
        call f108_WidthToInd
;        ld (ws+1368), a
        add 71
        call f109_AllocateNe
        ld (ws+1366), hl
        ld c,N_left
        ld de,( ws+1364 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1366)
        ret


        ; MidBor workspace at ws+1355 length ws+15 CHANGED
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
        ld bc,mid_node
        ld (pmid_node), bc
        ld a,55
        call f109_AllocateNe
        ld (ws+1366), hl
        ld hl,( pmid_node )
        call _ZeroFillNode
        ld hl, (ws+1355)
	ld (mid_node+N_left),hl
        ld hl, (ws+1357)
	ld (mid_node+N_right),hl	
        ld hl, (ws+1359)
	ld (mid_node),hl
        ld hl, (ws+1361)
	ld (mid_node+2),hl
        ld hl, (ws+1363)
	ld (mid_node+4),hl
        ld a, (ws+1365)
        ld (mid_node+6), a
        ld de,( pmid_node )
        ld hl,( ws+1366 )
        ld c, NODE_SIZE-1
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _WriteMem
        ld hl, (ws+1366)
        ret


        ; MidInitaddress workspace at ws+1369 length ws+8 CHANGED
f136_MidInitadd:
        ld (ws+1371), hl
        pop bc
        pop hl
        ld (ws+1369), hl
        push bc
        ld a,13
        call f109_AllocateNe
        ld (ws+1373), hl
;        ld hl,( ws+1373 )
        ld c,N_base
        ld de,( ws+1369 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1373 )
        ld c,N_base+2
        ld de,( ws+1371)
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1373)
        ret


        ; MidPair workspace at ws+1355 length ws+8 CHANGED
f139_MidPair:
        ld (ws+1357), hl
        pop bc
        pop hl
        ld (ws+1355), hl
        push bc
        ld a,25
        call f109_AllocateNe
        ld (ws+1359), hl
        ld c,N_left
        ld de,( ws+1355 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1359 )
        ld c,N_right
        ld de,( ws+1357 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1359)
        ret


	; MidAsmstart workspace at ws+1355 length ws+4  OK
f141_MidAsmstar: 
	ld a,18
;	call f109_AllocateNe;Node
	jp f109_AllocateNe
;	ld (ws+1355), hl
;!!!	ld hl, (ws+1355)
;	ret


	; MidAsmend workspace at ws+1355 length ws+4  OK
f143_MidAsmend:
	ld a,23
;	call f109_AllocateNe;Node
	jp f109_AllocateNe
;	ld (ws+1355), hl
;!!!	ld hl, (ws+1355)
;	ret


	; MidEndcase workspace at ws+1361 length ws+6  OK
f144_MidEndcase:
;	ld (ws+1361), a
	call f108_WidthToInd;x
;	ld (ws+1364), a
	add 81
;	call f109_AllocateNe;Node
	jp f109_AllocateNe
;	ld (ws+1362), hl
;!!!	ld hl, (ws+1362)
;	ret


        ; MidAsmsymbol workspace at ws+1360 length ws+6 CHANGED
f147_MidAsmsymb:
        ld (ws+1360), hl
        ld a,20
        call f109_AllocateNe
        ld (ws+1362), hl
        ld c,N_base
        ld de,( ws+1360 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1362)
        ret


        ; MidCall workspace at ws+1378 length ws+10 CHANGED
f148_MidCall:
        ld (ws+1382), hl
        pop bc
        pop hl
        ld (ws+1380), hl
        pop hl
        ld (ws+1378), hl
        push bc
        ld a,29
        call f109_AllocateNe
        ld (ws+1384), hl
        ld c,N_left
        ld de,( ws+1378 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1384 )
        ld c,N_right
        ld de,( ws+1380 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1384 )
        ld c,N_base
        ld de,( ws+1382 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1384)
        ret


	; MidAsmgroupend workspace at ws+1397 length ws+4 OK
f149_MidAsmgrou:    
	ld a,17
;	call f109_AllocateNe;Node
	jp f109_AllocateNe
;	ld (ws+1397), hl
;!!!	ld hl, (ws+1397)
;	ret


        ; MidBltu workspace at ws+1377 length ws+17 CHANGED
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
;        ld (ws+1377), a
        push bc
        ld bc,mid_node
        ld (pmid_node), bc
        call f108_WidthToInd
;        ld (ws+1391), a
        add 66
        call f109_AllocateNe
        ld (ws+1389), hl
        ld hl,( pmid_node )
        call _ZeroFillNode
        ld hl, (ws+1378)
	ld (mid_node+N_left),hl
        ld hl, (ws+1380)
	ld (mid_node+N_right),hl
        ld de, (ws+1382)
	ld (mid_node),hl
        ld de, (ws+1384)
	ld (mid_node+2),hl
        ld hl, (ws+1386)
	ld (mid_node+4),hl
        ld a, (ws+1388)
	ld (mid_node+6),a
        ld de,( pmid_node )
        ld hl,( ws+1389 )
        ld c, NODE_SIZE-1
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _WriteMem
        ld hl, (ws+1389)
        ret




        ; MidStore workspace at ws+1378 length ws+10 OK
f152_MidStore:
        ld (ws+1381), hl
        pop bc
        pop hl
        ld (ws+1379), hl
        pop af
        ld (ws+1378), a
        push bc
        call f108_WidthToInd;x
        ld (ws+1385), a
        add 49
        call f109_AllocateNe;Node
        ld (ws+1383), hl
;        ld hl,( ws+1383 )
        ld de,( ws+1379 )
        ld c,N_left
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1383 )
        ld de,( ws+1381 )
        ld c,N_right
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1383)
        ret


        ; MidDeref workspace at ws+1390 length ws+8 OK
f153_MidDeref:
        ld (ws+1391), hl
        pop bc
        pop af
        ld (ws+1390), a
        push bc
        call f108_WidthToInd;x
        ld (ws+1395), a
        add 44
        call f109_AllocateNe;Node
        ld (ws+1393), hl
;        ld hl,( ws+1393 )
        ld de,( ws+1391 )
        ld c,N_left
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1393)
        ret


        ; MidAddress workspace at ws+1378 length ws+8 OK
f154_MidAddress:
        ld (ws+1380), hl
        pop bc
        pop hl
        ld (ws+1378), hl
        push bc
        ld a,42
        call f109_AllocateNe
        ld (ws+1382), hl
;        ld hl,( ws+1382 )
        ld c,N_base
        ld de,( ws+1378 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1382 )
        ld c,N_base+2
        ld de,( ws+1380 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1382)
        ret


	; MidAsmgroupstart workspace at ws+1397 length ws+4 
f156_MidAsmgrou:      
	ld a,16
;	call f109_AllocateNe;Node
	jp f109_AllocateNe
;	ld (ws+1397), hl
;!!!	ld hl, (ws+1397)
;	ret


	; MidEndfile workspace at ws+1294 length ws+4   OK
f157_MidEndfile:
	ld a,3
;	call f109_AllocateNe;Node
	jp f109_AllocateNe
;	ld (ws+1294), hl
;!!!	ld hl, (ws+1294)
;	ret


        ; MidLabel workspace at ws+1390 length ws+6 CHANGED
f159_MidLabel:
        ld (ws+1390), hl
        ld a,26
        call f109_AllocateNe
        ld (ws+1392), hl
        ld c,N_base
        ld de,( ws+1390 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1392)
        ret


        ; MidInitstring workspace at ws+1369 length ws+6 CHANGED
f160_MidInitstr:
        ld (ws+1369), hl
        ld a,12
        call f109_AllocateNe
        ld (ws+1371), hl
        ld c,N_base
        ld de,( ws+1369 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1371)
        ret


        ; MidBand workspace at ws+1355 length ws+15 CHANGED
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
        ld bc,mid_node
        ld (pmid_node), bc
        ld a,54
        call f109_AllocateNe
        ld (ws+1366), hl
        ld hl,( pmid_node )
        call _ZeroFillNode
        ld hl, (ws+1355)
	ld (mid_node+N_left),hl
        ld hl, (ws+1357)
	ld (mid_node+N_right),hl
        ld hl, (ws+1359)
	ld (mid_node),hl
        ld hl, (ws+1361)
	ld (mid_node+2),hl
        ld hl, (ws+1363)
	ld (mid_node+4),hl
        ld a, (ws+1365)
	ld (mid_node+6),a
        ld de,( pmid_node )
        ld hl,( ws+1366 )
        ld c, NODE_SIZE-1
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _WriteMem
        ld hl, (ws+1366)
        ret


        ; MidAsmtext workspace at ws+1355 length ws+6 CHANGED
f163_MidAsmtext:
        ld (ws+1355), hl
        ld a,19
        call f109_AllocateNe
        ld (ws+1357), hl
        ld c,N_base
        ld de,( ws+1355 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1357)
        ret


        ; MidBeq workspace at ws+1374 length ws+17 CHANGED
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
        ld bc,mid_node
        ld (pmid_node), bc
        call f108_WidthToInd
;        ld (ws+1388), a
        add 56
        call f109_AllocateNe
        ld (ws+1386), hl
        ld hl,( pmid_node )
        call _ZeroFillNode
        ld hl, (ws+1375)
	ld (mid_node+N_left),hl
        ld hl, (ws+1377)
	ld (mid_node+N_right),hl
        ld hl, (ws+1379)
	ld (mid_node),hl
        ld hl, (ws+1381)
	ld (mid_node+2),hl
        ld hl, (ws+1383)
	ld (mid_node+4),hl
        ld a, (ws+1385)
	ld (mid_node+6),a
        ld de,( pmid_node )
        ld hl,( ws+1386 )
        ld c, NODE_SIZE-1
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
  	call _WriteMem
        ld hl, (ws+1386)
        ret


	; MidReturn workspace at ws+1355 length ws+4  OK
f166_MidReturn:
	ld a,28
;	call f109_AllocateNe;Node
	jp f109_AllocateNe
;	ld (ws+1355), hl
;!!!	ld hl, (ws+1355)
;	ret


        ; MidAsmvalue workspace at ws+1360 length ws+8 CHANGED
f167_MidAsmvalu:
        ld (ws+1360), hl
        exx
        ld (ws+1362), hl
        exx
        ld a,22
        call f109_AllocateNe;wNode
        ld (ws+1364), hl
        ld c,N_base
        ld de,( ws+1360 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1364 )
        ld c,N_base+2
        ld de,( ws+1362)
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1364)
        ret


        ; MidString workspace at ws+1357 length ws+6 CHANGED
f168_MidString:
        ld (ws+1357), hl
        ld a,41
        call f109_AllocateNe
        ld (ws+1359), hl
        ld c,N_base
        ld de,( ws+1357 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1359)
        ret


        ; MidSubref workspace at ws+1363 length ws+6 CHANGED
f169_MidSubref:
        ld (ws+1363), hl
        ld a,43
        call f109_AllocateNe
        ld (ws+1365), hl
        ld c,N_base
        ld de,( ws+1363 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1365)
        ret


;c01_c250:
;	db 98,97,100,32,102,111,108,100,0


	; midcodec_i_bad_fold workspace at ws+1430 length ws+0 OK
f173_midcodec_i:         
;	ld hl,c01_c250
;!!!	call f82_SimpleError
;	jp f82_SimpleError	;!!!
;!!!	ret
	ld a,9
	call SimpleErrorNr

        ; FoldConstant1 workspace at ws+1376 length ws+11 CHANGED
f174_FoldConsta:
        ld (ws+1377), hl
        pop bc
        pop af
        ld (ws+1376), a
        push bc
;        ld hl,( ws+1377 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1383 ),bc
        ld hl,( ws+1377 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1385),bc
        ld a, (ws+1376)
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
        call f173_midcodec_i
c01_02c6:
        ld hl, (ws+1379)
        exx
        ld hl, (ws+1381)
        exx
        ret


        ; FoldConstant2 workspace at ws+1413 length ws+17 CHANGED
f176_FoldConsta:
        ld (ws+1416), hl
        pop bc
        pop hl
        ld (ws+1414), hl
        pop af
        ld (ws+1413), a
        push bc
        ld hl,( ws+1414 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1422 ),bc
        ld hl,( ws+1414 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1424),bc
        ld hl,( ws+1416 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1426 ),bc
        ld hl,( ws+1416 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1428),bc
        ld a, (ws+1413)
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
        call f173_midcodec_i
c01_02c9:
        ld hl, (ws+1418)
        exx
        ld hl, (ws+1420)
        exx
        ret


        ; MidC1Op workspace at ws+1363 length ws+13 CHANGED
f180_MidC1Op:
        ld (ws+1365), hl
        pop bc
        pop af
        ld (ws+1364), a
        pop af
        ld (ws+1363), a
        push bc
        ld hl,( ws+1365 )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        cp 40
        jp nz, c01_02db
        ld a, (ws+1363)
        push af
        ld hl, (ws+1365)
        call f174_FoldConsta
        ld (ws+1369), hl
        exx
        ld (ws+1371), hl
        exx
        ld hl,( ws+1365 )
        ld c,N_base
        ld de,( ws+1369 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1365 )
        ld c,N_base+2
        ld de,( ws+1371)
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1365)
        ld (ws+1367), hl
        jp c01_02d7
c01_02db:
        ld a, (ws+1364)
        call f108_WidthToInd
;        ld (ws+1373), a
;        ld a, (ws+1363)
;        ld b,a
;        ld a, (ws+1373)
	ld b,a
	ld a, (ws+1363)
        add a,b
        call f109_AllocateNe
        ld (ws+1367), hl
        ld c,N_left
        ld de,( ws+1365 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
c01_02d7:
        ld hl, (ws+1367)
        ret


	; GetPowerOfTwo workspace at ws+1413 length ws+5 OK
f181_GetPowerOf:   
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
	ld a, (ws+1417)
	ret


        ; MidC2Op workspace at ws+1380 length ws+33 CHANGED
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
        ld hl,( ws+1384 )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        ld ( f183_rhsop ),a
        ld hl,( ws+1382 )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        ld ( f183_lhsop ),a
        ld a, (ws+1380)
        cp 131
        jp nz, c1c_1830
        ld a, (f183_rhsop)
        cp 40
        jp nz, c1c_1830
        ld hl,( ws+1384 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_value ),bc
        ld hl,( ws+1384 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_value +2),bc
        ld de, (f183_value)
        exx
        ld de, (f183_value+2)
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
        ld (f183_value), hl
        exx
        ld (f183_value+2), hl
        exx
        ld hl,( ws+1384 )
        ld c,N_base
        ld de,( f183_value )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1384 )
        ld c,N_base+2
        ld de,( f183_value +2)
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld a,156
        ld (ws+1380), a
c1c_1830:
        ld a, (ws+1380)
        cp 156
        jp c, c1c_1834
        ld a, (f183_lhsop)
        cp 40
        jp nz, c1c_1831
        ld hl, (ws+1382)
        ld (ws+1388), hl
        ld hl, (ws+1384)
        ld (ws+1382), hl
        ld hl, (ws+1388)
        ld (ws+1384), hl
        ld a, (f183_lhsop)
        ld (f183_optmp), a
        ld a, (f183_rhsop)
        ld (f183_lhsop), a
        ld a, (f183_optmp)
        ld (f183_rhsop), a
c1c_1831:
        ld a, (f183_rhsop)
        cp 40
        jp nz, c1c_1833
;        ld a, (f183_lhsop)
;        push af
;        ld a, (ws+1380)
;        ld b,a
;        pop af
;        cp b
	ld a,(ws+1380)
	ld b,a
	ld a, (f183_lhsop)
	cp b
        jp c, c1c_1833
;        ld a, (ws+1380)
;        add 4
;        push af
;        ld a, (f183_lhsop)
;        ld b,a
;        pop af
;        cp b
	ld a,(f183_lhsop)
	ld b,a
        ld a, (ws+1380)
        add 4
	cp b
        jp c, c1c_1833
        ld hl,( ws+1382 )
        ld c,N_right
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_lhsright ),bc
        ld hl,( f183_lhsright )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
;        ld ( f183_lhsrightop ),a
;        ld a, (f183_lhsrightop)
        cp 40
        jp nz, c1c_1832
        ld a, (ws+1380)
        push af
        ld hl, (f183_lhsright)
        push hl
        ld hl, (ws+1384)
        call f176_FoldConsta
;        ld (ws+1390), hl
;        exx
;        ld (ws+1392), hl
;        exx
;        ld hl, (ws+1390)
;        exx
;        ld hl, (ws+1392)
;        exx
        call f116_MidConstan
        ld (ws+1388), hl
        ld hl, (ws+1384)
        call f69_Discard
        ld hl, (ws+1388)
        ld (ws+1384), hl
        ld hl,( ws+1382 )
        ld c,N_left
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
;        ld ( f183_lhsleft ),bc
;        ld hl, (f183_lhsleft)
	ld h,b
	ld l,c
        ld (ws+1388), hl
        ld hl,( ws+1382 )
        ld c,N_left
        ld de,0
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1382)
        call f69_Discard
        ld hl, (ws+1388)
        ld (ws+1382), hl
c1c_1832:
c1c_1833:
c1c_1834:
        ld a, (f183_lhsop)
        cp 40
        jp z, c1c_183l
        ld a, (f183_rhsop)
        cp 40
        jp nz, c1c_183l
        ld a, (ws+1380)
        cp 161
        jp z, c1c_1835
        ld a, (ws+1380)
        cp 141
        jp z, c1c_1835
        ld a, (ws+1380)
        cp 136
        jp nz, c1c_183b
c1c_1835:
        ld hl,( ws+1384 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_value ),bc
        ld hl,( ws+1384 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_value +2),bc
        ld hl, (f183_value)
        exx
        ld hl, (f183_value+2)
        exx
        call f181_GetPowerOf
        ld (ws+1401), a
        or a
        jp z, c1c_183a
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
        call f116_MidConstan
        ld (ws+1384), hl
        ld a, (ws+1380)
        cp 161
        jp nz, c1c_1836
        ld a,116
        ld (ws+1380), a
        jp c1c_1839
c1c_1836:
        cp 141
        jp nz, c1c_1837
        ld a,126
        ld (ws+1380), a
        jp c1c_1839
c1c_1837:
        cp 136
        jp nz, c1c_1838
        ld a,121
        ld (ws+1380), a
c1c_1838:
c1c_1839:
c1c_183a:
c1c_183b:
        ld a, (ws+1380)
        cp 116
        jp z, c1c_183c
        ld a, (ws+1380)
        cp 121
        jp z, c1c_183c
        ld a, (ws+1380)
        cp 126
        jp nz, c1c_183e
c1c_183c:
        ld hl,( ws+1384 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_value ),bc
        ld hl,( ws+1384 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_value +2),bc
        ld hl, (f183_value)
        exx
        ld hl, (f183_value+2)
        exx
        ld a,h
        or l
        exx
        or h
        or l
        exx
        jp nz, c1c_183d
        ld hl, (ws+1384)
        call f69_Discard
        ld hl, (ws+1382)
        ld (ws+1386), hl
        jp end_f183_MidC2O
c1c_183d:
c1c_183e:
        ld a, (ws+1380)
        cp 156
        jp z, c1c_183f
        ld a, (ws+1380)
        cp 131
        jp nz, c1c_183k
c1c_183f:
        ld hl,( ws+1384 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_value ),bc
        ld hl,( ws+1384 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_value +2),bc
        ld hl, (f183_value)
        exx
        ld hl, (f183_value+2)
        exx
        ld a,h
        or l
        exx
        or h
        or l
        exx
        jp nz, c1c_183g
        ld hl, (ws+1384)
        call f69_Discard
        ld hl, (ws+1382)
        ld (ws+1386), hl
        jp end_f183_MidC2O
c1c_183g:
        ld a, (f183_lhsop)
        cp 42
        jp nz, c1c_183j
        ld hl,( ws+1384 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_value ),bc
        ld hl,( ws+1384 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_value +2),bc
        ld hl, (f183_value)
        exx
        ld hl, (f183_value+2)
        exx
        ld (ws+1404), hl
        ld hl,( ws+1382 )
        ld c, N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f183_lhsaddressoff ),bc
        ld a, (ws+1380)
        cp 156
        jp nz, c1c_183h
        ld de, (f183_lhsaddressoff)
        ld hl, (ws+1404)
        add hl,de
        ld (f183_lhsaddressoff), hl
        ld hl,( ws+1382 )
        ld c, N_base+2
        ld de,( f183_lhsaddressoff )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1384)
        call f69_Discard
        ld hl, (ws+1382)
        ld (ws+1386), hl
        jp end_f183_MidC2O
c1c_183h:
        cp 131
        jp nz, c1c_183i
        ld hl, (f183_lhsaddressoff)
        ld de, (ws+1404)
        and a
        sbc hl,de
        ld (f183_lhsaddressoff), hl
        ld hl,( ws+1382 )
        ld c, N_base+2
        ld de,( f183_lhsaddressoff )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1384)
        call f69_Discard
        ld hl, (ws+1382)
        ld (ws+1386), hl
        jp end_f183_MidC2O
c1c_183i:
c1c_183j:
c1c_183k:
c1c_183l:
        ld a, (f183_lhsop)
        cp 40
        jp nz, c1c_183m
        ld a, (f183_rhsop)
        cp 40
        jp nz, c1c_183m
        ld a, (ws+1380)
        push af
        ld hl, (ws+1382)
        push hl
        ld hl, (ws+1384)
        call f176_FoldConsta
        ld (ws+1406), hl
        exx
        ld (ws+1408), hl
        exx
        ld hl, (ws+1406)
        exx
        ld hl, (ws+1408)
        exx
        ld (f183_value), hl
        exx
        ld (f183_value+2), hl
        exx
        ld hl,( ws+1382 )
        ld c,N_base
        ld de,( f183_value )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1382 )
        ld c,N_base+2
        ld de,( f183_value +2)
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1384)
        call f69_Discard
        ld hl, (ws+1382)
        ld (ws+1386), hl
        jp end_f183_MidC2O
c1c_183m:
        ld a, (ws+1381)
        call f108_WidthToInd
        ld (ws+1410), a
        ld a, (ws+1380)
        ld b,a
        ld a, (ws+1410)
        add a,b
        call f109_AllocateNe
        ld (ws+1386), hl
;        ld hl,( ws+1386 )
        ld c,N_left
        ld de,( ws+1382 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1386 )
        ld c,N_right
        ld de,( ws+1384 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
end_f183_MidC2O:
        ld hl, (ws+1386)
        ret


        ; MidCCast workspace at ws+1380 length ws+11 CHANGED
f184_MidCCast:
        ld (ws+1383), a
        pop bc
        pop hl
        ld (ws+1381), hl
        pop af
        ld (ws+1380), a
        push bc
        ld hl,( ws+1381 )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        cp 40
        jp nz, c01_0357
        ld hl, (ws+1381)
        ld (ws+1384), hl
        jp end_f184_MidCCa
c01_0357:
        ld hl,( ws+1381 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
;        ld ( f184_lhstype ),bc
;        ld hl,( f184_lhstype )
	ld h,b
	ld l,c
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
;        ld ( f184_lhstypewidth ),bc
;        ld a, (f184_lhstypewidth)
	ld a,c
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
        call f108_WidthToInd
;        ld (ws+1388), a
;        ld a, (ws+1387)
;        ld b,a
;        ld a, (ws+1388)
	ld b,a
	ld a, (ws+1387)
        add a,b
        call f109_AllocateNe
        ld (ws+1384), hl
;        ld hl,( ws+1384 )
        ld c,N_left
        ld de,( ws+1381 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1384 )
        ld c,N_base
        ld a,( ws+1383 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutByte
c01_0358:
end_f184_MidCCa:
        ld hl, (ws+1384)
        ret


	; E_b8 workspace at ws+1415 length ws+1 OK
f185_E_b8:
;	ld (ws+1415), a
IF	TRACE_OUT
	ld (ws+1415), a
	call	_TraceStack
	ld	a,(ws+1415)
	call	_TraceA
	ld	a,(ws+1415)
ENDIF
	ld bc,ws+377
	push bc
	call f62_FCBPutChar
	ret


	; E_b16 workspace at ws+1412 length ws+2 OK
f186_E_b16:
	ld (ws+1412), hl
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
ENDIF
	ld a, (ws+1412)		;low
	call f185_E_b8
;	ld hl, (ws+1412)
;	ld a,8
;	call f466__lsr2
;	ld a,l
	ld	a,(ws+1413)	;high
;!!!	call f185_E_b8
IF	TRACE_OUT
	call f185_E_b8
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f185_E_b8	
ENDIF

	; E_b32 workspace at ws+1408 length ws+4 OK
f187_E_b32:
	ld (ws+1408), hl
	exx
	ld (ws+1410), hl
	exx
IF	TRACE_OUT
	call	_TraceStack
	ld	a,(_TraceEnabled)
	inc	a
	ld	(_TraceEnabled),a
	ld	hl,(ws+1408)
ENDIF
	call f186_E_b16
;	ld hl, (ws+1408)
;	exx
;	ld hl, (ws+1410)
;	exx
;	ld a,16
;	call f469__lsr4
	ld	hl,(ws+1410)
IF	TRACE_OUT
	call f186_E_b16
	ld	a,(_TraceEnabled)
	dec	a
	ld	(_TraceEnabled),a
	ret
ELSE
	jp f186_E_b16
ENDIF


	; E_bsize workspace at ws+1408 length ws+2 OK
f188_E_bsize:
;	ld (ws+1408), hl
;!!!	call f186_E_b16
	jp f186_E_b16 ;!!!
;!!!	ret


	; E workspace at ws+1412 length ws+3 OK
f195_E:
				;HL = pv
	ld	de,buf1
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_GetString
	ld	hl,buf1
f195_E_str:			;HL = string
	ld (ws+1412), hl
c01_0362:
	ld hl, (ws+1412)
	ld a,(hl)
	ld (ws+1414), a
	inc hl
	ld (ws+1412), hl
	or a
;!!!	jp nz, c01_0368
;!!!	jp c01_0363
	ret z	;!!!
c01_0368:
	ld a, (ws+1414)
	call f185_E_b8
	jp c01_0362
;!!!c01_0363:
;!!!	ret


	; E_countedstring workspace at ws+1408 length ws+4 OK
f196_E_counteds:
				;HL = pv
	ld	de,buf1
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_GetString
	ld	hl,buf1
	ld (ws+1408), hl
	call f32_StrLen
	ld (ws+1410), hl
	ld a, (ws+1410)
	call f185_E_b8
	ld hl, (ws+1408)
;!!!	call f195_E
	jp f195_E_str	;!!!
;!!!	ret

;c01_c251:
;	db 99,97,110,110,111,116,32,111,112,101,110,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterOpenfile workspace at ws+1294 length ws+3 OK
f207_EmitterOpe:     
;	ld (ws+1294), hl
	ld bc,ws+377
	push bc
	call f52_FCBOpenOut
;	ld (ws+1296), a
	or a
;!!!	jp z, c01_0389
	ret z	;!!!
;	ld hl,c01_c251
;!!!	call f82_SimpleError
;	jp f82_SimpleError
;!!!c01_0389:
;!!!	ret
	ld a,4
	jp SimpleErrorNr;

;c01_c252:
;	db 99,97,110,110,111,116,32,99,108,111,115,101,32,111,117,116,112,117,116,32,102,105,108,101,0


	; EmitterClosefile workspace at ws+1294 length ws+1 OK
f208_EmitterClo:      
	ld a,69
	call f185_E_b8
	ld hl,ws+377
	call f53_FCBClose
;	ld (ws+1294), a
	or a
;!!!	jp z, c01_038e
	ret z
;	ld hl,c01_c252
;!!!	call f82_SimpleError
;	jp f82_SimpleError	;!!!
;!!!c01_038e:
;!!!	ret
	ld a,5
	jp SimpleErrorNr

	; EmitterDeclareSubroutine workspace at ws+1361 length ws+2 OK
f209_EmitterDec:
        ld (ws+1361), hl
        ld a,78
        call f185_E_b8

;        ld ix, (ws+1361)
;        ld l, (ix+14)
;        ld h, (ix+15)		;HL=subr.id
	ld hl,(ws+1361)
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c

        call f186_E_b16

;        ld hl, (ws+1361)
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a			;HL=subr.symbol
	ld hl,(ws+1361)
	ld c,U_symbol
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c

        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        jp f196_E_counteds;ring


	; EmitterDeclareExternalSubroutine workspace at ws+1353 length ws+4 OK
f210_EmitterDec:                      
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
;!!!	call f196_E_counteds;ring
	jp f196_E_counteds;ring	;!!!
;!!!	ret


	; EmitterReferenceSubroutineById workspace at ws+1384 length ws+4 OK
f211_EmitterRef:                    
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
;!!!	call f186_E_b16
	jp f186_E_b16	;!!!
;!!!	ret


	; EmitterReferenceSubroutine workspace at ws+1380 length ws+4 OK
f212_EmitterRef:                
	ld (ws+1382), hl
	pop bc
	pop hl

;	ld (ws+1380), hl
	push bc
;	push hl
;	pop ix
;	ld l, (ix+14)
;	ld h, (ix+15)		;HL = .id
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
;	push hl
	push bc

;	ld ix, (ws+1382)
;	ld l, (ix+14)
;	ld h, (ix+15)		;HL = .id
	ld hl,(ws+1382)
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c

	call f211_EmitterRef;renceSubroutine;yId
	ret


	; EmitterDeclareWorkspace workspace at ws+1364 length ws+5 OK
f213_EmitterDec:             
	ld (ws+1367), hl
	pop bc
	pop af
	ld (ws+1366), a
	pop hl
	ld (ws+1364), hl
	push bc
	ld a,87
	call f185_E_b8

;	ld ix, (ws+1364)
;	ld l, (ix+14)
;	ld h, (ix+15)		;HL=subr.id
	ld hl,(ws+1364)
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c

	call f186_E_b16
	ld a, (ws+1366)
	call f185_E_b8
	ld hl, (ws+1367)
;!!!	call f188_E_bsize
	jp f188_E_bsize	;!!!
;!!!	ret


        ; EmitParameterList workspace at ws+1362 length ws+2 CHANGED
f214_EmitParame:
        ld (ws+1362), hl	;param
				;while param != (0 as [Symbol]) loop
c01_038f:
        ld hl, (ws+1362)
        ld a,h
        or l
	ret z
				;HL=param
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld	h,b
	ld	l,c		;HL=param.vardata

	ld	de,f214_vardatabuf
	ld	c,VARDATA_SIZE
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_ReadMem
				;f214_vardatabuf contains param.vardata
;        ld hl, (f214_vardata)
;        inc hl
;        inc hl
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a			;HL=param.vardata.subr

	ld	hl,(f214_vardatabuf+V_subr)	;HL=param.vardata.subr

;        push hl
;        pop ix
;        ld l, (ix+14)
;        ld h, (ix+15)

	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c			;HL=param.vardata.subr.id

        call f186_E_b16

;        ld ix, (f214_vardata)
;        ld a, (ix+8)

	ld	a,(f214_vardatabuf+V_wsid)	;A=param.vardata.wsid

        call f185_E_b8

;        ld ix, (f214_vardata)
;        ld l, (ix+6)
;        ld h, (ix+7)

	ld	hl,(f214_vardatabuf+V_offset)	;HL=param.vardata.offset

        call f188_E_bsize

        ld hl,( ws+1362 )	;param
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c			;HL=param.name vp

        call f196_E_counteds;ring

;        ld hl, (f214_vardata)
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a

	ld	hl,(f214_vardatabuf+V_type)	;HL=param.vardata.type

        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte		;returns A=param.vardata.type.width as uint8

        call f185_E_b8
				;param := param.vardata.next_parameter;
;        ld ix, (f214_vardata)
;        ld l, (ix+4)
;        ld h, (ix+5)

	ld	hl,(f214_vardatabuf+V_nextparam) ;HL=param.vardata.nextparam
        ld (ws+1362), hl
        jp c01_038f


	; EmitterEmitInputParameters workspace at ws+1358 length ws+4 OK
f215_EmitterEmi:                
	ld (ws+1358), hl
	ld a,73
	call f185_E_b8

;	ld ix, (ws+1358)
;	ld l, (ix+14)
;	ld h, (ix+15)		;HL=subr.id
	ld hl,(ws+1358)
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c

	call f186_E_b16

;	ld ix, (ws+1358)
;	ld a, (ix+26)		;A=subr.num_input_parameters
	ld hl,(ws+1358)
	ld c,U_numi
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

	call f185_E_b8
	ld hl, (ws+1358)
	push hl
	xor a
	call f105_GetInputPa;ameter
	ld (ws+1360), hl
;!!!	call f214_EmitParame;erList
	jp f214_EmitParame;erList	;!!!
;!!!	ret


	; EmitterEmitOutputParameters workspace at ws+1358 length ws+4 OK
f216_EmitterEmi:                 
	ld (ws+1358), hl
	ld a,79
	call f185_E_b8

;	ld ix, (ws+1358)
;	ld l, (ix+14)
;	ld h, (ix+15)		;HL=subr.id
	ld hl,(ws+1358)
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c

	call f186_E_b16

;	ld ix, (ws+1358)
;	ld a, (ix+27)		;A=subr.num_output_parameters
	ld hl,(ws+1358)
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

	call f185_E_b8
	ld hl, (ws+1358)
	push hl
	xor a
	call f106_GetOutputP;rameter
	ld (ws+1360), hl
;!!!	call f214_EmitParame;erList
	jp f214_EmitParame;erList	;!!!
;!!!	ret


	; EmitterEmitSubroutineFlags workspace at ws+1358 length ws+2 OK
f217_EmitterEmi:                
	ld (ws+1358), hl
	ld a,70
	call f185_E_b8

;	ld ix, (ws+1358)
;	ld l, (ix+14)
;	ld h, (ix+15)		;HL=subr.id
	ld hl,(ws+1358)
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld h,b
	ld l,c

	call f186_E_b16

;	ld ix, (ws+1358)
;	ld a, (ix+28)		;A=subr.flags
	ld hl,(ws+1358)
	ld c,U_flags
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

;!!!	call f185_E_b8
	jp f185_E_b8	;!!!
;!!!	ret

;sub LookupSymbolInNamespace(namespace: [Namespace], name: string): (symbol: [Symbol])
        ; LookupSymbolInNamespace workspace at ws+1388 length ws+7
f227_LookupSymb:
        ld (ws+1390), hl	;vp name
	pop bc
        pop hl
        ld (ws+1388), hl	;namespace
        push bc

	ld hl, 	(ws+1390)	;HL = vp name
	ld	de,buf2
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_GetString	;name as string in buf2

	;symbol := namespace.first;

	ld hl, (ws+1388)	;namespace
        ld c,0			; #offset of first in Namespace
        call _GetWordNoCheck
        ld ( ws+1392 ),bc	;symbol

	;while symbol != (0 as [Symbol]) loop

c01_2272:
        ld hl, (ws+1392)	;symbol
        ld a,h
        or l
        jp z, c01_2277

		;if StrCmp(symbol.name, name) == 0 then

        ld hl,( ws+1392 )
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord		;BC = vp symbol.name
					;symbol name ?  name
					; compare strings
	ld 	h,b
	ld 	l,c		;HL = vp symbol.name
	ld	de,buf1
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_GetString
	ld	hl,buf1
	push	hl
	ld	hl,buf2
	call	f29_StrCmp
	or a

        jp nz, c01_2276

			;while symbol.kind == TYPEDEF loop
c01_2273:
        ld hl,( ws+1392 )
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetByte
        cp 39
	jp nz,c01_2278	;return
				;symbol := symbol.alias;
        ld hl,( ws+1392 )
        ld c,S_base+0		; # alias offset in Symbol
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( ws+1392 ),bc
        jp c01_2273
			;end loop;
			;return
		;end if;
c01_2276:
		;symbol := symbol.next;

        ld hl,( ws+1392 )
        ld c,S_next		; # next offset in Symbol
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( ws+1392 ),bc
        jp c01_2272

	;end loop;

c01_2277:

	;symbol := (0 as [Symbol]);

        ld hl,0
        ld (ws+1392), hl
c01_2278:
        ld hl, (ws+1392)	;return symbol
        ret

;sub LookupSymbol(namespace: [Namespace], name: string): (symbol: [Symbol])
        ; LookupSymbol workspace at ws+1377 length ws+10 CHANGED
f228_LookupSymb:
        ld (ws+1379), hl	;vp name
	pop bc
        pop hl
        ld (ws+1377), hl	;namespace
        push bc

	;if namespace == (0 as [Namespace]) then

        ld a,h
        or l
        jp nz, c01_2280

		;namespace := &current_subr.namespace;

        ld hl, (current_subr)	;&current_subr.namespace
;        inc hl
;        inc hl
;        inc hl
;        inc hl
        ld (ws+1377), hl	;namespace := &current_subr.namespace;
	;end if
c01_2280:
	;while namespace != (0 as [Namespace]) loop
c01_2282:
        ld hl, (ws+1377)
        ld a,h
        or l
        jp z, c01_2286
		;symbol := LookupSymbolInNamespace(namespace, name);
        ld hl, (ws+1377)	;namespace
        push hl
        ld hl, (ws+1379)	;vp name
        call f227_LookupSymb	;LookupSymbolInNamespace
;        ld (ws+1381), hl
		;if symbol != (0 as [Symbol]) then
			;return;
        ld a,h
        or l
        ret nz
		;namespace := namespace.parent;
        ld hl,( ws+1377 )	;namespace
        ld c,4			; #offset of parent in Namespace
        call _GetWordNoCheck
        ld ( ws+1377 ),bc
        jp c01_2282
	;end loop;
c01_2286:
	;symbol := (0 as [Symbol]);
        ld hl,0
        ret


        ; AddToNamespace workspace at ws+1398 length ws+4 CHANGED
f229_AddToNames:
        ld (ws+1400), hl	;symbol
	pop bc
        pop hl
        ld (ws+1398), hl	;namespace
        push bc
        ld hl,( ws+1398 )
        ld c,2			; #offset of last in Namespace
        call _GetWordNoCheck
        ld ( f229_last ),bc
        ld hl, (f229_last)
        ld a,h
        or l
        jp nz, c01_2292
	;namespace.first := symbol;
        ld hl,( ws+1398 )	;namespace
        ld c,0			;#offset of first in Namespace
        ld de,( ws+1400 )	;symbol
        call _PutWordNoCheck
	;namespace.last := symbol;
        ld hl,( ws+1398 )	;namespace
        ld c,2			;#offset of last in Namespace
        ld de,( ws+1400 )	;symbol
        call _PutWordNoCheck
        jp c01_2299
c01_2292:
	;namespace.last.next := symbol;
        ld hl,( ws+1398 )	;namespace
        ld c,2			; #offset of last in Namespace
        call _GetWordNoCheck
        ld h,b
        ld l,c
        ld c,S_next
        ld de,( ws+1400 )	;symbol
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
	;namespace.last := symbol;
        ld hl,( ws+1398 )	;namespace
        ld c,2			; #offset of last in Namespace
        ld de,( ws+1400 )	;symbol
        call _PutWordNoCheck
c01_2298:
c01_2299:
	;symbol.namespace := namespace;
        ld hl,( ws+1400 )	;symbol
        ld c,S_namespace
        ld de,( ws+1398 )	;namespace
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        jp _PutWord

c01_c253:
	db 115,121,109,98,111,108,32,39,0
c01_c254:
	db 39,32,105,115,32,97,108,114,101,97,100,121,32,100,101,102,105,110,101,100,0

;sub AddSymbol(namespace: [Namespace], name: string): (symbol: [Symbol])
        ; AddSymbol workspace at ws+1378 length ws+11 CHANGED
f230_AddSymbol:
        ld (ws+1380), hl	;vp name
	pop bc
        pop hl
        ld (ws+1378), hl	;namespace
        push bc
	;if namespace == (0 as [Namespace]) then
        ld a,h
        or l
        jp nz, c01_0447

;        ld hl, (current_subr)
;        inc hl
;        inc hl
;        inc hl
;        inc hl
;        ld (ws+1378), hl	;namespace := &current_subr.namespace;
	ld hl,(current_subr)
	ld (ws+1378), hl	;namespace := &current_subr.namespace;

c01_0447:
        call f70_AllocNewSym
        ld (ws+1382), hl	;symbol
	;if name != (0 as string) then
        ld hl, (ws+1380)
        ld a,h
        or l
        jp z, c01_044c
		;if LookupSymbolInNamespace(namespace, name) != (0 as [Symbol]) then
        ld hl, (ws+1378)
        push hl
        ld hl, (ws+1380)
        call f227_LookupSymb
;        ld (ws+1386), hl
        ld a,h
        or l
        jp z, c01_0451
        call f80_StartError
        ld hl,c01_c253
        call f9_print
        ld hl, (ws+1380)	;vp name
        call f9_print_vp
        ld hl,c01_c254
        call f9_print
        call f81_EndError
		;end if;
c01_0451:
		;symbol.name := name;
        ld hl,( ws+1382 )	;symbol
        ld de,( ws+1380 )	;name
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
		;AddToNamespace(namespace, symbol);
        ld hl, (ws+1378)	;namespace
        push hl
        ld hl, (ws+1382)	;symbol
        call f229_AddToNames
c01_044c:
        ld hl, (ws+1382)	;return symbol
        ret

;sub AddAlias(namespace: [Namespace], name: string, real: [Symbol]): (symbol: [Symbol])
        ; AddAlias workspace at ws+1357 length ws+10 CHANGED
f231_AddAlias:
        ld (ws+1361), hl	;real
	pop bc
        pop hl
        ld (ws+1359), hl	;name
        pop hl
        ld (ws+1357), hl	;namespace
        push bc			;ret addr
	;symbol := AddSymbol(namespace, name);
        push hl			;namespace
        ld hl, (ws+1359)	;name
        call f230_AddSymbol
        ld (ws+1363), hl	;symbol
;        ld hl,( ws+1363 )
        ld a,39
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte
        ld hl,( ws+1363 )
        ld de,( ws+1361 )
        ld c,S_base+0		; # offset of alias in Symbol
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1363)
        ret

;sub AddAliasString(name: string, real: [Symbol])
        ; AddAliasString workspace at ws+1308 length ws+8 CHANGED
f232_AddAliasSt:
        ld (ws+1310), hl	;real
        pop bc
        pop hl
        ld (ws+1308), hl	;name
        push bc
	;symbol := AddAlias(0 as [Namespace], name, real);
        ld bc,0
        push bc			;namespace
        push hl			;name
        ld hl, (ws+1310)	;real
        call f231_AddAlias
;        ld (ws+1314), hl
        ret

c01_c255:
	db 39,0
c01_c256:
	db 39,32,105,115,32,97,32,112,97,114,116,105,97,108,32,116,121,112,101,0


        ; CheckNotPartialType workspace at ws+1386 length ws+2
f233_CheckNotPa:
        ld (ws+1386), hl
;        ld hl,( ws+1386 )
        ld c,T_kind
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        cp 1
        ret nz
        call f80_StartError
        ld hl,c01_c255
        call f9_print
        ld hl,( ws+1386 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
;        ld ( ws+1 ),bc
;        ld hl,( ws+1 )
	ld h,b
	ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
;        ld ( ws+3 ),bc
;        ld hl, (ws+3)
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c256
        call f9_print
        jp f81_EndError

;sub AddTypeToNamespace(namespace: [Namespace], type: [Type], name: string)
        ; AddTypeToNamespace workspace at ws+1388 length ws+10 CHANGED
f234_AddTypeToN:
        ld (ws+1392), hl	;name
	pop bc
        pop hl
        ld (ws+1390), hl	;type
        pop hl
        ld (ws+1388), hl	;namespace
        push bc			;ret addr
        call f70_AllocNewSym
        ld (ws+1396), hl	;symbol
;        ld hl,( ws+1396 )
        ld a,30
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte
        ld hl,( ws+1396 )
        ld de,( ws+1390 )
        ld c,S_base+0		; # offset of typedata in Symbol
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1396 )
        ld de,( ws+1392 )
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1390 )
        ld de,( ws+1396 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1388)	;namespace
        push hl
        ld hl, (ws+1396)	;symbol
        call f229_AddToNames
        ret

        ; MakeNumberType workspace at ws+1308 length ws+9 CHANGED
f235_MakeNumber:
        ld (ws+1311), hl	;name
        pop bc
        pop af
        ld (ws+1310), a		;is_signed
        pop af
        ld (ws+1309), a		;alignment
        pop af
        ld (ws+1308), a		;width
        push bc
        call f72_AllocNewTyp
        ld (ws+1313), hl
;        ld hl,( ws+1313 )
        ld a,2			;TYPE_NUMBER
        ld c,T_kind
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutByte
        ld hl,( ws+1313 )
        ld a,( ws+1308 )
        ld e,a
        ld d,0
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1313 )
        ld a,( ws+1308 )
        ld e,a
        ld d,0
        ld c,T_stride
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1313 )
        ld a,( ws+1309 )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutByte
        ld hl,( ws+1313 )
        ld a,( ws+1310 )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutByte
        ld hl, (current_subr)
;        inc hl
;        inc hl
;        inc hl
;        inc hl
        push hl
        ld hl, (ws+1313)
        push hl
        ld hl, (ws+1311)
        call f234_AddTypeToN
        ld hl, (ws+1313)
        ret



        ; IsTypeOfKind workspace at ws+1400 length ws+4 CHANGED
f236_IsTypeOfKi:
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
        ld hl,( ws+1400 )
        ld c,T_kind
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        ld b,a
        ld a, (ws+1402)
        cp b
        jp nz, c01_045d
        ld a,1
        ld (ws+1403), a
c01_045d:
        ld a, (ws+1403)
        ret


	; IsArray workspace at ws+1380 length ws+4 OK
f237_IsArray:
;	ld (ws+1380), hl
	push hl
	ld a,4
	call f236_IsTypeOfKi;d
;	ld (ws+1382), a
;!!!	ld a, (ws+1382)
	ret


	; IsPtr workspace at ws+1396 length ws+4 OK
f74_IsPtr:
;	ld (ws+1396), hl
	push hl
	ld a,3
	call f236_IsTypeOfKi;d
;	ld (ws+1398), a
;!!!	ld a, (ws+1398)
	ret


	; IsSubroutine workspace at ws+1396 length ws+4 OK
f238_IsSubrouti:  
;	ld (ws+1396), hl
	push hl
	ld a,6
	call f236_IsTypeOfKi;d
;	ld (ws+1398), a
;!!!	ld a, (ws+1398)
	ret

	; IsNum workspace at ws+1396 length ws+4 OK
f239_IsNum:
	ld a,h
	or l
	jp nz, c01_0463
	ld a,1
	ret
c01_0463:
	push hl
	ld a,2
	call f236_IsTypeOfKi;d
	ret

        ; IsSNum workspace at ws+1377 length ws+4 CHANGED
f240_IsSNum:
	ld (ws+1377),hl
        ld a,h
        or l
        jp nz, c01_0468
        ld a,1
	ret
c01_0468:
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        ld ( f240_is_signed ),a
        ld hl, (ws+1377)
        push hl
        ld a,2
        call f236_IsTypeOfKi
        or a
	ret z
        ld a, (f240_is_signed)
        or a
	ret z
        ld a,1
	ret


	; IsScalar workspace at ws+1390 length ws+6 OK
f241_IsScalar:
	ld (ws+1390), hl
	call f74_IsPtr
	ld (ws+1393), a
	ld hl, (ws+1390)
	call f239_IsNum
	ld (ws+1394), a
	ld hl, (ws+1390)
	call f238_IsSubrouti;e
	ld (ws+1395), a
	ld a, (ws+1393)
	or a
	jp nz, c01_0477
	ld a, (ws+1394)
	or a
	jp nz, c01_0477
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
;!!!	ld a, (ws+1392)
	ret


	; IsRecord workspace at ws+1377 length ws+4 OK
f242_IsRecord:
;	ld (ws+1377), hl
	push hl
	ld a,5
	call f236_IsTypeOfKi;d
;	ld (ws+1379), a
;!!!	ld a, (ws+1379)
	ret


        ; MakeLValue workspace at ws+1380 length ws+10 CHANGED
f243_MakeLValue:
        ld (ws+1380), hl
;        ld hl,( ws+1380 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( f243_elementtype ),bc
        xor a
        ld (ws+1384), a
        ld hl, (f243_elementtype)
        call f241_IsScalar
;        ld (ws+1387), a
        or a
        jp z, c01_047f
        ld hl,( f243_elementtype )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld a,c
        ld ( ws+1384 ),a
c01_047f:
        ld a, (ws+1384)
        push af
        ld hl, (ws+1380)
        call f153_MidDeref
        ld (ws+1382), hl
;        ld hl,( ws+1382 )
        ld c,N_type
        ld de,( f243_elementtype )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1382)
        ret


;c01_c257:
;	db 108,118,97,108,117,101,32,114,101,113,117,105,114,101,100,0


        ; UndoLValue workspace at ws+1364 length ws+5 CHANGED
f244_UndoLValue:
        ld (ws+1364), hl
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
;        ld ( ws+1368 ),a
        cp 44
        jp c, c01_0485
;        ld b,48
;        ld a, (ws+1368)
;        push af
;        ld a,b
;        pop bc
;        cp b
	ld b,a
	ld a,48
	cp b
        jp nc, c01_0486
c01_0485:
;        ld hl,c01_c257
;        call f82_SimpleError
	ld a,10
	call SimpleErrorNr
c01_0486:
        ld hl,( ws+1364 )
        ld c,N_left
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1366 ),bc
        ld hl,( ws+1364 )
        ld c,N_left
        ld de,0
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1364)
        call f69_Discard
        ld hl, (ws+1366)
        ret


        ; IsLValue workspace at ws+1377 length ws+4 CHANGED
f245_IsLValue:
;;        ld (ws+1377), hl
        xor a
        ld (ws+1379), a
;;        ld hl,( ws+1377 )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
;;        ld ( ws+1380 ),a
;;        ld a, (ws+1380)
        cp 44
        jp c, c01_048e
;        ld b,48
;        ld a, (ws+1380)
;        push af
;        ld a,b
;        pop bc
;        cp b
	ld b,a
	ld a,48
	cp b
        jp c, c01_048e
        ld a,1
;        ld (ws+1379), a
	ret
c01_048e:
        ld a, (ws+1379)
        ret


;c01_c258:
;        db 112,111,105,110,116,101,114,32,111,114,32,108,118,97
;	db 108,117,101,32,114,101,113,117,105,114,101,100,0


        ; MaybeUndoLValue workspace at ws+1380 length ws+6 CHANGED
f246_MaybeUndoL:
        ld (ws+1380), hl
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        ld ( ws+1384 ),a
        ld hl,( ws+1380 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f246_type ),bc
        ld a, (ws+1384)
        cp 44
        jp c, c01_0496
;        ld b,48
;        ld a, (ws+1384)
;        push af
;        ld a,b
;        pop bc
;        cp b
	ld b,a
	ld a,48
	cp b
        jp c, c01_0496
        ld hl,( ws+1380 )
        ld c,N_left
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1382 ),bc
        ld hl,( ws+1380 )
        ld c,N_left
        ld de,0
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        jp c01_0490
c01_0496:
        ld hl, (f246_type)
        call f74_IsPtr
;        ld (ws+1385), a
        or a
        jp z, c01_049b
        ld hl, (ws+1380)
;        ld (ws+1382), hl
;        jp c01_0490
	ret
c01_049b:
;        ld hl,c01_c258
;        call f82_SimpleError
	ld a,11
	call SimpleErrorNr
c01_0490:
        ld hl, (ws+1382)
        ret


	; AllocLabel workspace at ws+1390 length ws+2 OK
f247_AllocLabel:
	ld hl, (next_label_id)
	ld (ws+1390), hl
	inc hl
	ld (next_label_id), hl
	ld hl, (ws+1390)
	ret


	; AllocSubrId workspace at ws+1361 length ws+2 OK
f248_AllocSubrI: 
	ld hl, (next_subr_id)
;;	ld (ws+1361), hl
	inc hl
	ld (next_subr_id), hl
;;	ld hl, (ws+1361)
	dec hl ;;
	ret


	; MidWriter workspace at ws+1406 length ws+2 OK
f249_MidWriter:
;	ld (ws+1406), hl
	ret


	; ArchAlignUp workspace at ws+1380 length ws+5 OK
f250_ArchAlignU: 
;!!!	ld (ws+1382), a
	pop bc
	pop hl
;!!!	ld (ws+1380), hl
	push bc
;!!!	ld (ws+1383), hl
;!!!	ld hl, (ws+1383)
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


	; ArchInitTypes workspace at ws+1294 length ws+14 OK
f251_ArchInitTy:   
	ld h,4
	push hl
	ld a,1
	push af
	ld d,0
	push de
	ld	hl,10
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl
	push	hl		;vp on stack
	ld	de,c01_c259
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;vp
;	ld hl,c01_c259
	call f235_MakeNumber;ype
	ld (uint32_type), hl

	ld h,4
	push hl
	ld a,1
	push af
	push af
	ld	hl,10
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl
	push	hl		;vp on stack
	ld	de,c01_c260
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;vp
;	ld hl,c01_c260
	call f235_MakeNumber;ype
	ld (int32_type), hl

	ld b,2
	push bc
	ld a,1
	push af
	ld d,0
	push de
	ld	hl,10
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl
	push	hl		;vp on stack
	ld	de,c01_c261
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;vp
;	ld hl,c01_c261
	call f235_MakeNumber;ype
	ld (uint16_type), hl

	ld b,2
	push bc
	ld a,1
	push af
	push af
	ld	hl,10
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl
	push	hl		;vp on stack
	ld	de,c01_c262
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;vp
;	ld hl,c01_c262
	call f235_MakeNumber;ype
	ld (int16_type), hl
	ld a,1
	push af
	push af
	ld d,0
	push de
	ld	hl,10
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl
	push	hl		;vp on stack
	ld	de,c01_c263
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;vp
;	ld hl,c01_c263
	call f235_MakeNumber;ype
	ld (uint8_type), hl

	ld a,1
	push af
	push af
	push af
	ld	hl,10
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl
	push	hl		;vp on stack
	ld	de,c01_c264
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;vp
;	ld hl,c01_c264
	call f235_MakeNumber;ype
	ld (int8_type), hl

	ld hl, (uint16_type)
	ld (intptr_type), hl
	ld bc,0
	push bc
	ld	hl,10
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl
	push	hl		;vp on stack
	ld	de,c01_c265	; "uint16"
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;vp
	call f228_LookupSymb;l
	ld (ws+1306), hl	;sym
	ld	hl,10
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
        call 	f75_ExternalAl
	push	hl		;vp on stack
	ld	de,c01_c266	;"intptr"
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	pop	hl		;vp
	push	hl
	ld hl, (ws+1306)	;sym
	call f232_AddAliasSt;ing
	ret


	; ArchGuessIntType workspace at ws+1369 length ws+10 OK
f252_ArchGuessI:      
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
	ld hl, (uint8_type)
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
	ld hl, (int8_type)
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
	ld hl, (uint16_type)
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
	ld hl, (int16_type)
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
	ld hl, (uint32_type)
	ld (ws+1377), hl
	jp c01_049c
c01_04bc:
	ld hl, (int32_type)
	ld (ws+1377), hl
c01_049c:
;!!!	ld hl, (ws+1377)
	ret



        ; ArchInitVariable workspace at ws+1386 length ws+6 CHANGED
f253_ArchInitVa:
				;get symbol.vardata
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( f253_vardata ),bc
				;subr := symbol.vardata.subr;
;        inc hl
;        inc hl
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a

	ld	h,b
	ld	l,c		;HL=symbol.vardata
	ld	c,V_subr
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
	ld	h,b
	ld	l,c
        ld (ws+1388), hl	;subr
				;offset := subr.workspace[0];
;        push hl
;        pop ix
;        ld l, (ix+16)
;        ld h, (ix+17)
;       ld (ws+1390), hl	;offset

	ld c,U_workspace
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld (ws+1390),bc		;offset
				;symbol.vardata.offset := offset;
;        ld ix, (f253_vardata)
;        ld (ix+6), c
;        ld (ix+7), b

	ld	hl,(f253_vardata)
	ld	de,(ws+1390)	;offset
	ld	c,V_offset
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_PutWord

;        push ix
;        pop hl
				;get symbol.vardata.type	
	ld hl,	(f253_vardata)

;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a			;HL=symbol.vardata.type	

	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
	ld	h,b
	ld	l,c		;HL=symbol.vardata.type	

        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( f253_width ),bc	;BC=symbol.vardata.type.width;
        ld de, (ws+1390)	;offset
        ld hl, (f253_width)
        add hl,de		;HL=offset + symbol.vardata.type.width;

				;subr.workspace[0] := offset + symbol.vardata.type.width;
;        ld ix, (ws+1388)	
;        ld (ix+16), l
;        ld (ix+17), h

	ex de,hl		;DE = offset + symbol.vardata.type.width
	ld hl,(ws+1388)		;subr
	ld c,U_workspace
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	jp _PutWord


        ; ArchInitMember workspace at ws+1355 length ws+6 CHANGED
f254_ArchInitMe:
        ld (ws+1359), hl	;position
        pop bc
        pop hl
        ld (ws+1357), hl	;member
        pop hl
        ld (ws+1355), hl	;containing
        push bc
        ld hl,( ws+1357 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( f254_vardata ),bc
				;member.vardata.offset := position;
;        ld hl, (ws+1359)
;        ld ix, (f254_vardata)
;        ld (ix+6), l
;        ld (ix+7), h

	ld	h,b
	ld	l,c		;HL=member.vardata
	ld	de,(ws+1359)	;position
	ld	c,V_offset
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_PutWord
				;position := position + member.vardata.type.width;
;        push ix
;        pop hl
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
;        ld (f254_type), hl
;        ld hl,( f254_type )

	ld hl,(f254_vardata)
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC
	ld 	(f254_type),bc
	ld	h,b
	ld	l,c		;HL=member.vardata.type

        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( f254_width ),bc
        ld de, (ws+1359)	;position
        ld hl, (f254_width)
        add hl,de
        ld (ws+1359), hl	;position
				;if position > containing.width then
        ld hl,( ws+1355 )	;containing
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
;        ld ( f254_width ),bc
;        ld hl, (f254_width)
	ld h,b
	ld l,c			;HL=containing.width
        ld de, (ws+1359)	;position
        and a
        sbc hl,de
        ret nc
				;containing.width := position;
        ld hl,( ws+1355 )	;containing
        ld c,T_width
        ld de,( ws+1359 )	;position
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        jp _PutWord


        ; WriteMid1 workspace at ws+1408 length ws+1 CHANGED
f255_WriteMid1:
;        ld (ws+1406), hl
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        jp f185_E_b8


        ; WriteMid2 workspace at ws+1408 length ws+0 CHANGED
f256_WriteMid2:
;        ld (ws+1406), hl
        ld de,f256_bltu
        ld c,7
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _ReadMem
        ld hl,(f256_bltu)
        call f186_E_b16
        ld hl,(f256_bltu+2)
        call f186_E_b16
        ld hl,(f256_bltu+4)
        call f186_E_b16
        ld a,(f256_bltu+6)
        jp f185_E_b8


        ; WriteMid3 workspace at ws+1408 length ws+4 CHANGED
f257_WriteMid3:
        ld (ws+1406), hl
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f257_value ),bc
        ld hl,( ws+1406 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f257_value +2),bc
        ld hl, (f257_value)
        exx
        ld hl, (f257_value+2)
        exx
        jp f187_E_b32

        ; WriteMid4 workspace at ws+1408 length ws+2 CHANGED
f258_WriteMid4:
;        ld (ws+1406), hl
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        jp f196_E_counteds;ring



        ; WriteMid5 workspace at ws+1408 length ws+0
f259_WriteMid5:
;        ld (ws+1406), hl
        ld de,f259_whencase
        ld c,6
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _ReadMem
        ld hl,(f259_whencase)
        call f186_E_b16
        ld hl,(f259_whencase+2)
        call f186_E_b16
        ld hl,(f259_whencase+4)
        jp f186_E_b16


        ; WriteMid6 workspace at ws+1408 length ws+2
f260_WriteMid6:
;        ld (ws+1406), hl
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        jp f186_E_b16


        ; WriteMid7 workspace at ws+1408 length ws+4 CHANGED
f261_WriteMid7:
;        ld (ws+1406), hl
;        ld hl,( ws+1406 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
;        ld ( wdata+16 ),bc
;        ld ix, (wdata+16)
;	push bc
;	pop ix
;        ld l, (ix+14)
;        ld h, (ix+15)
	ld h,b
	ld l,c
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c

        jp f186_E_b16


        ; WriteMid8 workspace at ws+1408 length ws+8
f262_WriteMid8:
;        ld (ws+1406), hl
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord		;BC=sym
	ld h,b
	ld l,c
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord		;BC=vardata
        ld ( f262_vardata ),bc
	ld	h,b
	ld	l,c
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;BC=type
	ld	h,b
	ld	l,c
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( f262_width ),bc
        ld hl, (f262_vardata)
	ld	c,V_subr
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;BC=subr
	ld	h,b
	ld	l,c
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
        call _GetWord		;BC=id
	ld h,b
	ld l,c
        call f186_E_b16
        ld hl, (f262_vardata)
	ld	c,V_wsid
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetByte	;A=wsid
        call f185_E_b8
        ld hl, (f262_vardata)
	ld	c,V_offset
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;BC=offset
	ld	h,b
	ld	l,c
        call f188_E_bsize
        ld a, (f262_width)
        jp f185_E_b8


	; WriteMid9 workspace at ws+1408 length ws+0 OK
f263_WriteMid9:
;	ld (ws+1406), hl
	ret


        ; WriteMid10 workspace at ws+1408 length ws+11
f264_WriteMid10:
				;record MidcodePoparg is
				;	subr: [Subroutine];
				;	sym: [Symbol];
				;	remaining: uint8;
				;end record;
        ld de,f264_poparg
        ld c,5
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _ReadMem
        ld hl,( f264_sym )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( f264_vardata ),bc	;BC=node.poparg.sym.vardata
        ld	h,b
	ld	l,c
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;BC=type
	ld	h,b
	ld	l,c
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( f264_width ),bc	;BC=width
	ld hl,(f264_subr)
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
        call _GetWord		;BC=id
	ld h,b
	ld l,c
        call f186_E_b16
        ld hl, (f264_vardata)
	ld	c,V_subr
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;BC=subr
	ld	h,b
	ld	l,c
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f186_E_b16
        ld hl, (f264_vardata)
	ld	c,V_wsid
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetByte	;A=wsid
        call f185_E_b8
        ld hl, (f264_vardata)
	ld	c,V_offset
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;BC=offset
	ld	h,b
	ld	l,c
        call f188_E_bsize
        ld a, (f264_width)
        call f185_E_b8
        ld a, (f264_remaining)
        jp f185_E_b8


        ; WriteMid11 workspace at ws+1408 length ws+7
f265_WriteMid11:
        ld (ws+1406), hl
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord		;BC=node.address.off
        ld ( f265_addr_off ),bc
        ld hl,(ws+1406)
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord		;BC=node.address.sym
        ld h,b
        ld l,c
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord		;BC=node.address.sym.vardata
        ld ( f265_vardata ),bc
	ld	h,b
	ld	l,c
	ld	c,V_subr
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;BC=subr
	ld	h,b
	ld	l,c
	ld c,U_id
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
        call _GetWord		;BC=id
	ld h,b
	ld l,c
        call f186_E_b16
	ld	hl,(f265_vardata)
	ld	c,V_wsid
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetByte	;A=wsid
        call f185_E_b8
        ld hl, (f265_vardata)
	ld	c,V_offset
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;BC=offset
	ld	h,b
	ld	l,c
        call f188_E_bsize
        ld hl, (f265_vardata)
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;BC=type
	ld	h,b
	ld	l,c
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord		;BC=width
        ld a,c
        call f185_E_b8
        ld hl, (f265_addr_off)
        jp f188_E_bsize


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


        ; ReallyGenerate workspace at ws+1397 length ws+10 OK
f267_ReallyGene:    
        ld (ws+1397), hl
        ld a,77
        call f185_E_b8
        ld hl, (next_node)
        ld (ws+1399), hl
        ld hl, (ws+1397)
        call f66_PushNode
c01_04cf:
        ld de, (next_node)
        ld hl, (ws+1399)
        and a
        sbc hl,de
        jp z, c01_04d4
        call f68_NextNode
        ld (ws+1403), hl
;        ld hl,( ws+1403 )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        ld ( f267_op ),a
;        ld a, (f267_op)
        call f185_E_b8
        ld bc,f2___main_s04c3
        ld a, (f267_op)
        dec a
        ld l,a
        ld h,0
        add hl,bc
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
	ld hl,(ws+1403)
	call f488__jpde
        jp c01_04cf
c01_04d4:
        ld hl, (ws+1397)
        call f69_Discard
        ret


        ; Generate workspace at ws+1390 length ws+7 OK
f269_Generate:
        ld (ws+1390), hl
;        ld hl,( ws+1390 )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        ld ( ws+1392 ),a
        ld a, (old_op)
        cp 27
        jp z, c01_04da
;        ld a, (ws+557)
        cp 28
        jp nz, c01_04db
c01_04da:
        ld a, (ws+1392)
        cp 26
        jp z, c01_04e3
;        ld a, (ws+1392)
        cp 5
        jp z, c01_04e3
        ld hl, (ws+1390)
        jp f69_Discard
c01_04e3:
c01_04db:
        ld a, (ws+1392)
        cp 18
        jp nz, c01_04eb
        ld a, (old_op)
        cp 23
        jp z, c01_04eb
        call f156_MidAsmgrou;start
;        ld (ws+1393), hl
        call f267_ReallyGene;ate
c01_04eb:
        ld a, (old_op)
        cp 23
        jp nz, c01_04f3
        ld a, (ws+1392)
        cp 18
        jp z, c01_04f3
        call f149_MidAsmgrou;end
;        ld (ws+1395), hl
        call f267_ReallyGene;ate
c01_04f3:
        ld a, (ws+1392)
        ld (old_op), a
        ld hl, (ws+1390)
        jp f267_ReallyGene;ate


        ; push_and_free workspace at ws+1390 length ws+0 CHANGED
f271_push_and_f:
        ld hl,( ws+1377 )
        ld de,( ws+1369 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1377 )
        ld de,( ws+1371 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1377 )
        ld de,( ws+1373 )
        ld c,N_base+4
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1367 )
        ld de,0
        ld c,N_left
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1367 )
        ld de,0
        ld c,N_right
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1377)
        call f66_PushNode
        ld hl, (ws+1375)
        call f66_PushNode
        ld hl, (ws+1367)
        jp f69_Discard


        ; GenerateConditional workspace at ws+1361 length ws+30 CHANGED
f270_GenerateCo:
        ld (ws+1361), hl
        ld hl, (next_node)
        ld (ws+1363), hl
        ld hl, (ws+1361)
        call f66_PushNode
c01_04f5:
        ld de, (next_node)
        ld hl, (ws+1363)
        and a
        sbc hl,de
        ret z
        call f67_PopNode
        ld (ws+1367), hl
;        ld hl,( ws+1367 )
        ld de,f270_n
        ld c,NODE_SIZE
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _ReadMem
        ld hl,(f270_n)
        ld ( ws+1369 ),hl
        ld hl,(f270_n+2)
        ld ( ws+1371 ),hl
        ld hl,(f270_n+4)
        ld ( ws+1373 ),hl
        ld hl,(f270_n+9)
        ld ( ws+1375 ),hl
        ld hl,(f270_n+11)
        ld ( ws+1377 ),hl
        ld a,(f270_n+13)
        ld ( ws+1379 ),a
        ld a,(f270_n+6)
;        ld ( ws+53 ),a
;        ld a, (ws+53)
        or a
        jp z, c01_04ff
        ld hl, (ws+1369)
        ld (ws+1380), hl
        ld hl, (ws+1371)
        ld (ws+1369), hl
        ld hl, (ws+1380)
        ld (ws+1371), hl
c01_04ff:
        ld a, (ws+1379)
        cp 55
        jp nz, c01_0501
        call f247_AllocLabel
        ld (ws+1382), hl
        ld hl,( ws+1375 )
        ld de,( ws+1369 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1375 )
        ld de,( ws+1382 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1375 )
        ld de,( ws+1382 )
        ld c,N_base+4
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        call f271_push_and_f
;        jp c01_0500
	jp c01_04f5
c01_0501:
        cp 54
        jp nz, c01_0502
        call f247_AllocLabel
        ld (ws+1382), hl
        ld hl,( ws+1375 )
        ld de,( ws+1382 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1375 )
        ld de,( ws+1371 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1375 )
        ld de,( ws+1382 )
        ld c,N_base+4
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        call f271_push_and_f
;        jp c01_0500
	jp c01_04f5
c01_0502:
        ld hl,( ws+1367 )
        ld de,( ws+1369 )
        ld c,N_base
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1367 )
        ld de,( ws+1371 )
        ld c,N_base+2
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1367)
        call f269_Generate
        ld hl, (ws+1373)
        call f159_MidLabel
        ld (ws+62), hl
        call f269_Generate
;c01_0500:
        jp c01_04f5


        ; InitVariable workspace at ws+1378 length ws+10 OK
f272_InitVariab:  
        ld (ws+1382), hl
        pop bc
        pop hl
        ld (ws+1380), hl
        pop hl
        ld (ws+1378), hl
        push bc
        ld hl, (ws+1382)
        call f233_CheckNotPa;tialType
				;symbol.kind := VAR;
        ld hl,( ws+1380 )
        ld a,28
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte

        ld hl,VARDATA_SIZE
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	f75_ExternalAl
;        call f75_InternalAll;c
        ld (f272_block), hl	;vardata
				;symbol.vardata := vardata;
        ld hl,( ws+1380 )
        ld de,( f272_block )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
				;symbol.vardata.type := type;
        ld de, (ws+1382)	;type
        ld hl, (f272_block)
;        ld (hl),e
;        inc hl
;        ld (hl),d
	ld	c,V_type
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_PutWord
				;symbol.vardata.subr := subr;
        ld de, (ws+1378)	;subr
        ld hl, (f272_block)
;        inc hl
;        inc hl
;        ld (hl),e
;        inc hl
;        ld (hl),d
	ld	c,V_subr
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_PutWord

        ld hl, (ws+1380)
        jp f253_ArchInitVa;iable


        ; MakePointerType workspace at ws+1380 length ws+8 CHANGED
f273_MakePointe:
        ld (ws+1380), hl	;type
        ld c,T_pointerto
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1382 ),bc	;ptrtype
        ld a,b
        or c
        jp nz, c01_0507
        call f72_AllocNewTyp
        ld (ws+1382), hl
				;prepare Type structure
        ld hl,tmp_type
        call _ZeroFillType
				;fill-it
	ld a,3
	ld (tmp_type+T_kind),a
;        ld c,T_kind
;        ld a,3
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutByte

        ld hl,( intptr_type )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld (tmp_type+T_width),bc
;        ld d,b
;        ld e,c
;        ld hl,( ws+1382 )
;        ld c,T_width
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutWord

        ld hl,( intptr_type )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
	ld (tmp_type+T_alignment),a
;        ld hl,( ws+1382 )
;        ld c,T_alignment
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutByte

        ld hl,( intptr_type )
        ld c,T_stride
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld (tmp_type+T_stride),bc
;        ld d,b
;        ld e,c
;        ld hl,( ws+1382 )
;        ld c,T_stride
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutWord

        ld de,( ws+1380 )
	ld (tmp_type+T_base),de
;        ld hl,( ws+1382 )
;        ld c,T_base
;        ld de,( ws+1380 )
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutWord
				;write the Type
        ld de, tmp_type
        ld hl,( ws+1382 )
        ld c, TYPE_SIZE
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _WriteMem
				;done with Type
        ld hl,( ws+1380 )
        ld c,T_pointerto
        ld de,( ws+1382 )
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1380 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( f273_symbol ),bc
        ld h,b
        ld l,c
        ld c,S_namespace
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( f273_namespace ),bc
        ld hl,( f273_symbol )
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( f273_name ),bc
        ld hl, (f273_name)
	ld de,buf1
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_GetString
	ld	hl,buf1
        call f76_StrDupBrace
        ld (ws+1386), hl
        ld hl, (f273_namespace)	;type.symbol.namespace
        push hl
        ld hl, (ws+1382)	;ptrtype
        push hl
        ld hl, (ws+1386)	;StrDupBraced(type.symbol.name)
        call f234_AddTypeToN
c01_0507:
        ld hl, (ws+1382)
        ret


       ; MakeArrayType workspace at ws+1355 length ws+16
f274_MakeArrayT:
        ld (ws+1357), hl	;size
        pop bc
        pop hl
        ld (ws+1355), hl	;type
        push bc
        ld bc,0
        ld (ws+1363), bc	;w=0
        call f233_CheckNotPa
        call f72_AllocNewTyp
        ld (ws+1359), hl	;arraytype

        ld hl,( ws+1355 )
        ld c,T_stride
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( f274_stride ),bc
        ld hl,( ws+1355 )
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( f274_width ),bc
        ld hl,0
        ld de, (ws+1357)
        and a
        sbc hl,de
        jp nc, c01_050c
        ld de, (f274_stride)
        ld bc, (ws+1357)
        dec bc
        call f473__mul2
        ex de,hl
        ld hl, (f274_width)
        add hl,de
        ld (ws+1363), hl	;w
c01_050c:
				;prepare Type structure
        ld hl,tmp_type
        call _ZeroFillType
				;fill-it
	ld a,4
	ld (tmp_type+T_kind),a
;        ld hl,( ws+1359 )
;        ld c,T_kind
;        ld a,4
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutByte

        ld de,( ws+1363 )	;w
	ld (tmp_type+T_width),de
;        ld hl,( ws+1359 )
;        ld de,( ws+1363 )
;        ld c,T_width
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutWord

        ld hl,( ws+1355 )
        ld c,T_alignment
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
	ld (tmp_type+T_alignment),a
;        ld hl,( ws+1359 )
;        ld c,T_alignment
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutByte

        ld hl,( ws+1355 )	;type
        ld c,T_stride
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld d,b
	ld e,c			;DE=type.stride
        ld bc, (ws+1357)	;size
        call f473__mul2
				;HL=type.stride * size
	ld (tmp_type+T_stride),hl
;        ld (f274_stride), hl
;        ld hl,( ws+1359 )
;        ld de,( T_stride );???
;        ld c,T_stride
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutWord

        ld hl,( ws+1355 )
	ld (tmp_type+T_base),hl	;arraytype.element := type
;        ld hl,( ws+1359 )
;        ld de,( ws+1355 )
;        ld c,T_base
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutWord

        ld hl,( ws+1357 )
	ld (tmp_type+T_base+2),hl ;arraytype.size := size
;        ld hl,( ws+1359 )
;        ld de,( ws+1357 )
;        ld c,T_base+2
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutWord

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
        call f252_ArchGuessI
	ld (tmp_type+T_base+4),hl ;arraytype.indextype:= ...
;        ex de,hl
;        ld hl,( ws+1359 )
;        ld c,T_base+4
;IF	CHECK_TYPE
;	ld b,TYPE_TYPE
;ENDIF
;        call _PutWord
				;write the Type
        ld de, tmp_type
        ld hl,( ws+1359 )	;arraytype
        ld c, TYPE_SIZE
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _WriteMem
				;done with Type
        ld hl,( ws+1355 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld ( f274_sym ),bc
        ld h,b
        ld l,c
        ld c,S_namespace
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( f274_n ),bc
        ld hl,( f274_sym )
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord		;BC = vp type.symbol.name
;        push bc
	ld	h,b
	ld	l,c
	ld	de,buf1
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_GetString
	ld	hl,buf1
	push	hl
        ld hl, (ws+1357)	;size
        call f77_StrDupArray
        ld (ws+1367), hl
        ld hl, (f274_n)
        push hl
        ld hl, (ws+1359)
        push hl
        ld hl, (ws+1367)
        call f234_AddTypeToN
        ld hl, (ws+1359)
        ret


        ; QueueNamespace workspace at ws+1373 length ws+5 CHANGED
f277_QueueNames:
        ld (ws+1373), hl	;namespace
c01_2770:
        ld hl,( ws+1373 )
        ld c,T_base		;#offset of first in Namespace
        call _GetWordNoCheck
        ld a,b
        or c
	ret z
        ld ( ws+1375 ),bc	;s
        ld hl,( ws+1375 )
        ld c,S_next
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( f277_next ),bc

	;namespace.first := s.next;

        ld hl,( ws+1373 )	;namespace
        ld c,T_base		;#offset of first in Namespace
        ld de,( f277_next )
        call _PutWordNoCheck

	;s.next := pending;

        ld hl,( ws+1375 )	;s	
        ld de,( ws+1361 )	;pending
        ld c,S_next
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord

	;pending := s;

        ld hl, (ws+1375)
        ld (ws+1361), hl

        jp c01_2770


        ; DestructSubroutineContents workspace at ws+1359 length ws+24 CHANGED
f276_DestructSu:
        ld (ws+1359), hl	;subr
        ld bc,0
        ld (ws+1361), bc	;pending=0

;        ld ix, (ws+1359)
;        ld a, (ix+27)
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

        or a
        jp z, c01_0517
        ld hl, (ws+1359)
        push hl

;        push hl
;        pop ix
;        ld a, (ix+27)

        dec a
        call f106_GetOutputP
        ld (ws+1363), hl	;last_parameter
        jp c01_0513
c01_0517:

;        ld ix, (ws+1359)
;        ld a, (ix+26)
	ld hl, (ws+1359)
	ld c,U_numi
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

        or a
        jp z, c01_051b
        ld hl, (ws+1359)
        push hl

;        push hl
;        pop ix
;        ld a, (ix+26)

        dec a
        call f105_GetInputPa
        ld (ws+1363), hl	;last_parameter
        jp c01_0513
c01_051b:
        ld bc,0
        ld (ws+1363), bc
c01_0513:

;        ld ix, (ws+1359)
;        ld l, (ix+4)
;        ld h, (ix+5)
;        ld (ws+1361), hl
	ld hl, (ws+1359)
	ld c,U_namespace	;offset of namespace.first
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
        ld (ws+1361), bc	;pending

        ld hl, (ws+1363)
        ld a,h
        or l
        jp z, c01_0520
        ld hl,( ws+1363 )
        ld c,S_next
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( f276_next ),bc
        ld hl, (f276_next)
        ld (ws+1361), hl
c01_0520:
c01_0521:
        ld hl, (ws+1361)
        ld a,h
        or l
        jp z, c01_0526
        ld hl, (ws+1361)
        ld (ws+1369), hl	;symbol
;        ld hl,( ws+1361 )
        ld c,S_next
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
				;BC=pending.next
        ld (ws+1361), bc	;pending := pending.next;
        ld hl,( ws+1369 )	;symbol
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetByte
        cp 30
        jp nz, c01_0528
        ld hl, (ws+1369 )	;symbol
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( f276_type ),bc	;type := symbol.typedata
        ld hl,( f276_type )
        ld c,T_kind
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetByte
        cp 5
        jp nz, c01_052a
        ld hl, (f276_type)	;&type.recordtype.namespace
        call f277_QueueNames
        jp c01_0529
c01_052a:
        cp 6
        jp nz, c01_052b
        ld hl,( f276_type )
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
				;BC=&type.subrtype.subr.namespace == type.subrtype.subr
	ld h,b
	ld l,c
	push hl
        call f277_QueueNames
        pop hl			;HL=type.subrtype.subr

;        call f40_Free
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _Free

c01_052b:
c01_0529:
        ld hl, (f276_type)
        call f73_FreeType
        jp c01_0527
c01_0528:
        cp 28
        jp nz, c01_052c
        ld hl,( ws+1369 )	;symbol
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord		;BC=symbol.vardata
	ld h,b			
	ld l,c
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call _Free
;        call f40_Free
c01_052c:
c01_0527:
        ld hl,( ws+1369 )	;symbol
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord		;BC=symbol.name
	ld h,b
	ld l,c
;        call f40_Free
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_Free		;free vp
        ld hl, (ws+1369)	;symbol
        call f71_FreeSymbol
        jp c01_0521
c01_0526:
        ld hl, (ws+1363)
        ld a,h
        or l
        jp z, c01_0531
        ld hl,( ws+1363 )
        ld c,S_next
        ld de,0
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        jp c01_052d
c01_0531:

;        ld ix, (ws+1359)
;        ld (ix+4), 0
;        ld (ix+5), 0
	ld hl,(ws+1359)		;subr
	ld c,U_namespace	;offset of namespace.first
	ld de,0
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _PutWord

c01_052d:

	;subr.namespace.last := last_parameter;

;        ld ix, (ws+1359)
;        ld (ix+6), l
;        ld (ix+7), h

        ld de, (ws+1363)	;last_parameter
	ld hl,(ws+1359)		;namespace
	ld c,U_namespace+2	;offset of namespace.last
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	jp _PutWord


c01_c268:
	db 32,97,110,100,32,0
c01_c269:
 db  32,97,114,101,32,110,111,116,32,99,111,109,112,97,116,105,98,108,101,32,105
 db 110,32,116,104,105,115,32,99,111,110,116,101,120,116,0


        ; expr_i_cant_do_that workspace at ws+1389 length ws+4 CHANGED
f281_expr_i_can:
        ld (ws+1391), hl
        pop bc
        pop hl
        ld (ws+1389), hl
        push bc
        call f80_StartError
        ld hl,( ws+1389 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
;        ld ( f281_name ),bc
;        ld hl, (f281_name)
        ld h,b
        ld l,c
        call f9_print_vp
        ld hl,c01_c268
        call f9_print
        ld hl,( ws+1391 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
;        ld ( f281_name ),bc
;        ld hl, (f281_name)
        ld h,b
        ld l,c
        call f9_print_vp
        ld hl,c01_c269
        call f9_print
        jp f81_EndError


c01_c270:
	db 116,121,112,101,32,109,105,115,109,97,116,99,104,58,32,101,120,112,114,101,115
 db 115,105,111,110,32,119,97,115,32,97,32,0
c01_c271:
	db 44,32,117,115,101,100,32,119,104,101,110,32,97,32,0
c01_c272:
	db 32,119,97,115,32,101,120,112,101,99,116,101,100,0
c01_c273:
	db 32,99,97,110,110,111,116,32,98,101,32,117,115,101,100,32,104,101,114,101,0


        ; CheckExpressionType workspace at ws+1380 length ws+9 CHANGED
f282_CheckExpre:
        ld (ws+1382), hl
        pop bc
        pop hl
        ld (ws+1380), hl
        push bc
        ld hl,( ws+1380 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f282_nodetype ),bc
	ld hl, (f282_nodetype)	
        ld a,h
        or l
        jp nz, c01_054c
        ld hl,( ws+1380 )
        ld de,( ws+1382 )
	ld ( f282_nodetype ),de
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
c01_054c:
        ld de, (f282_nodetype)
        ld hl, (ws+1382)
        and a
        sbc hl,de
        jp z, c01_0551
        call f80_StartError
        ld hl,c01_c270
        call f9_print
        ld hl,( f282_nodetype )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
;        ld ( f282_name ),bc
;        ld hl, (f282_name)
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c271
        call f9_print
        ld hl,( ws+1382 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
;        ld ( f282_name ),bc
;        ld hl, (f282_name)
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c272
        call f9_print
        call f81_EndError
c01_0551:
        ld hl, (ws+1382)
        call f241_IsScalar
        ld (ws+8), a
        or a
;!!!        jp nz, c1c_000f
	ret nz ;!!!
        call f80_StartError
        ld hl,( ws+1382 )
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
;        ld ( f282_name ),bc
;        ld hl, (f282_name)
	ld h,b
	ld l,c
        call f9_print_vp
        ld hl,c01_c273
        call f9_print
;!!!        call f81_EndError
	jp f81_EndError ;!!!
;!!!c1c_000f:
;!!!        ret
;--------------------------------
