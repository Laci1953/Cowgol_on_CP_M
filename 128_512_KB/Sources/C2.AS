include w.mac

	global f104_CountParam
	global f105_GetInputPa
	global f106_GetOutputP
	global f108_WidthToInd
	global f109_AllocateNe
	global f171_FreeNode
	global f172_NodeWidth
	global f66_PushNode
	global f67_PopNode
	global f68_NextNode
	global f69_Discard
	global f280_ReportWork
	global f279_CreateMain
	global f278_CopyParame
	global f288_Expr1Simpl
	global f290_cant_add_t
	global f289_ExprAdd
	global f292_cant_sub_t
	global f291_ExprSub
	global f293_Expr2Simpl
	global f294_expr_i_che
	global f295_expr_i_che
	global f296_ExprShift
	global f284_ResolveUnt
	global f285_CheckNumbe
	global f286_ResolveUnt
	global f287_CondSimple
	global f283_ResolveUnt
	global f459_PrintFreeM
	global f460_SyntaxErro
	global f461_ParseArgum
	global 	f463__lsr1
	global 	f466__lsr2
	global 	f469__lsr4
	global	f470__asl4
	global	f471__asr4
	global	f473__mul2
	global	f474__mul4
	global	f477__dvrmu2
	global	f479__dvrmu4
	global	f480__dvrms4
	global	f481__and4
	global	f482__or4
	global	f483__eor4
	global	f484__not4
	global	f486__cmpu4
	global	f487__cmps4
	global	f488__jpde

        ; CountParameters workspace at ws+1354 length ws+5 OK
f104_CountParam:
        ld (ws+1354), hl	;param
        xor a
        ld (ws+1356), a
c01_0296:
        ld hl, (ws+1354)
        ld a,h
        or l
        jp z, c01_029b
				;count := count + 1;
        ld a, (ws+1356)
        inc a
        ld (ws+1356), a
				;param := param.vardata.next_parameter;
        ld hl,( ws+1354 )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord		;BC=param.vardata
				;param := param.vardata.next_parameter;
;        push bc
;        pop ix
;        ld l, (ix+4)
;        ld h, (ix+5)

	ld	h,b
	ld	l,c		;HL=param.vardata
	ld	c,V_nextparam
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;returns BC

;       ld (ws+1354), hl

	ld	(ws+1354),bc

        jp c01_0296
c01_029b:
        ld a, (ws+1356)
        ret


        ; GetInputParameter workspace at ws+1373 length ws+5 OK
f105_GetInputPa:
        ld (ws+1375), a
        pop bc
        pop hl
        ld (ws+1373), hl	;subr
        push bc

;        push hl
;        pop ix
;        ld a, (ix+26)
	ld c,U_numi
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

	or a
        jp z, c01_02a0

;        ld ix, (ws+1373)
;        ld l, (ix+4)
;        ld h, (ix+5)
;        ld (ws+1376), hl	;param := subr.namespace.first;
	ld hl,(ws+1373)
	ld c,U_namespace	;offset of namespace.first
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld (ws+1376), bc	;param := subr.namespace.first;

c01_02a1:
        ld a, (ws+1375)
        or a
        jp z, c01_02a6
        ld hl,( ws+1376 )
        ld c,S_next
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( ws+1376 ),bc
        ld a, (ws+1375)
        dec a
        ld (ws+1375), a
        jp c01_02a1
c01_02a6:
        jp c01_029c
c01_02a0:
        ld hl,0
        ld (ws+1376), hl
c01_029c:
        ld hl, (ws+1376)
        ret


        ; GetOutputParameter workspace at ws+1378 length ws+5 OK
f106_GetOutputP:
        ld (ws+1380), a
        pop bc
        pop hl
        ld (ws+1378), hl	;subr
	push bc

;        push bc
;        push hl
;        pop ix
;        ld a, (ix+27)
	ld c,U_numo
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte

        or a
        jp z, c01_02ab
        ld a, (ws+1380)
        ld b,a

;        ld ix, (ws+1378)
;        ld a, (ix+26)
	push bc
	ld hl,(ws+1378)
	ld c,U_numi
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetByte
	pop bc

        add a,b
        ld (ws+1380), a

;        ld l, (ix+4)
;        ld h, (ix+5)
;        ld (ws+1381), hl	;param := subr.namespace.first;
	ld hl,(ws+1378)
	ld c,U_namespace	;offset of namespace.first
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld (ws+1381), bc	;param := subr.namespace.first;

c01_02ac:
        ld a, (ws+1380)
        or a
        jp z, c01_02b1
        ld hl,( ws+1381 )
        ld c,S_next
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( ws+1381 ),bc
        ld a, (ws+1380)
        dec a
        ld (ws+1380), a
        jp c01_02ac
c01_02b1:
        jp c01_02a7
c01_02ab:
        ld hl,0
        ld (ws+1381), hl
c01_02a7:
        ld hl, (ws+1381)
        ret


        ; WidthToIndex workspace at ws+1413 length ws+2 OK
f108_WidthToInd:
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
;!!!    ld a, (ws+1414)
        ret

        ; AllocateNewNode workspace at ws+1421 length ws+5
f109_AllocateNe:
        ld (ws+1421), a
        ld hl, (node_freelist)
        ld a,h
        or l
        jp z, c01_02ba
        ld hl, (node_freelist)
        ld (ws+1422), hl
;        ld hl,( node_freelist )
        ld c,N_left
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( node_freelist ),bc
        ld hl,( ws+1422 )
        ld c,NODE_SIZE
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _FillZero
        jp c01_02b6
c01_02ba:
        ld hl,NODE_SIZE
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call f75_ExternalAl
        ld (ws+1422), hl
c01_02b6:
        ld hl,( ws+1422 )
        ld a,( ws+1421 )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutByte
        ld hl, (ws+1422)
        ret


        ; FreeNode workspace at ws+1421 length ws+2 OK
f171_FreeNode:
        ld (ws+1421), hl
;        ld hl,( ws+1421 )
        ld c,N_left
        ld de,( node_freelist )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1421)
        ld (node_freelist), hl
        ret


        ; NodeWidth workspace at ws+1377 length ws+3 CHANGED
f172_NodeWidth:
        ld (ws+1377), hl
        xor a
        ld (ws+1379), a
        ld hl,( ws+1377 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        ld a,h
        or l
        jp z, c01_02c5
        ld c,T_width
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _GetWord
	ld a,c
        ld (ws+1379), a
c01_02c5:
        ld a, (ws+1379)
        ret


;c01_c281:db 110,111,100,101,32,115,116,97,99,107,32,111,118,101,114,102,108,111,119,0

        ; PushNode workspace at ws+1425 length ws+2 OK
f66_PushNode:
        ld (ws+1425), hl
	ld a,h
        or l
;!!!    jp z, c01_05ef
        ret z   ;!!!
        ld de, (next_node)
        ld hl,nodes+32
        and a
        sbc hl,de
        jp nz, c01_05f4
;        ld hl,c01_c281
;        call f82_SimpleError
	ld a,46
	call SimpleErrorNr
c01_05f4:
        ld de, (ws+1425)
        ld hl, (next_node)
        ld (hl),e
        inc hl
        ld (hl),d
        ld hl, (next_node)
        inc hl
        inc hl
        ld (next_node), hl
;!!!c01_05ef:
        ret


        ; PopNode workspace at ws+1425 length ws+2 OK
f67_PopNode:
        ld hl, (next_node)
        dec hl
        dec hl
        ld (next_node), hl
        ld a,(hl)
        inc hl
        ld h,(hl)
        ld l,a
;!!!    ld (ws+1425), hl
;!!!    ld hl, (ws+1425)
        ret


        ; NextNode workspace at ws+1421 length ws+6, wdata+14 length 2 OK
f68_NextNode:
        call f67_PopNode
        ld (ws+1421), hl
        ld a,h
        or l
;        jp z, c01_05f9
	ret z
;        ld hl,( ws+1421 )
        ld c,N_left
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        call f66_PushNode
        ld hl,( ws+1421 )
        ld c,N_right
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        call f66_PushNode
;c01_05f9:
        ld hl, (ws+1421)
        ret


        ; Discard workspace at ws+1413 length ws+8 OK
f69_Discard:
        ld (ws+1413), hl
        ld hl, (next_node)
        ld (ws+1415), hl
        ld hl, (ws+1413)
        call f66_PushNode
c01_05fa:
        ld de, (next_node)
        ld hl, (ws+1415)
        and a
        sbc hl,de
;!!!    jp z, c01_05ff
        ret z   ;!!!
        call f68_NextNode
;        ld (ws+1419), hl
        call f171_FreeNode
        jp c01_05fa
;!!!c01_05ff:
;!!!    ret


        ; CopyParameterList workspace at ws+1358 length ws+14 CHANGED
f278_CopyParame:
        ld (ws+1360), hl	;subr
        pop bc
        pop hl
        ld (ws+1358), hl	;param
        push bc
        ld bc,0
        ld (ws+1362), bc	;lastparam
c01_0532:
        ld hl, (ws+1358)
        ld a,h
        or l
	ret z
        ld hl,( ws+1358 )
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord		;BC = vp param.name
	ld 	h,b
	ld 	l,c
	ld	de,buf1
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_GetString	;param.name in buf1
				;ExternalStrDup(param.name)
	ld	hl,buf1
        call f78_ExternalStr
        ld (ws+1364), hl	;vp param.name

        ld hl, (ws+1360)	;&subr.namespace
        push hl
        ld hl, (ws+1364)	;vp param.name
        call f230_AddSymbol
        ld (ws+1368), hl	;p
				;p.kind = VAR
        ld a,28
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte
				;allocate vardata
        ld hl,VARDATA_SIZE
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	f75_ExternalAl
        ld (f278_pvardata), hl	;vardata
				;p.vardata = vardata
        ld hl,( ws+1368 )	;p
        ld de,( f278_pvardata )
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
				;get param.vardata
        ld hl,( ws+1358 )	;param
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _GetWord
        ld ( f278_paramvar ),bc	;BC=param.vardata
				;read param.vardata in f214_vardatabuf
	ld	c,VARDATA_SIZE
	ld	hl,( f278_paramvar )
	ld	de,f214_vardatabuf
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_ReadMem
				;set f214_vardatabuf.nextparam to NULL
	ld	bc,0
	ld	(f214_vardatabuf+V_nextparam),bc
				;move param.vardata to vardatabuf
	ld	hl,f214_vardatabuf
	ld	de,vardatabuf
	ld	bc,VARDATA_SIZE
	ldir
				;write vardatabuf to vardata
	ld	hl,( f278_pvardata )
	ld	de,vardatabuf
	ld	c,VARDATA_SIZE
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_WriteMem
				;if lastparam != 0 as [Symbol] then
        ld hl, (ws+1362)	;lastparam
        ld a,h
        or l
        jp z, c01_053c
				;lastparam.vardata.next_parameter := p;
        ld hl,( ws+1362 )	;lastparam
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call 	_GetWord	;BC=lastparam.vardata
	ld	h,b
	ld	l,c
	ld	de,(ws+1368)	;p
	ld	c,V_nextparam
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_PutWord

c01_053c:
        ld hl, (ws+1368)	;p
        ld (ws+1362), hl	;lastparam := p;
				;param := param.vardata.next_parameter;
	ld	hl,(f278_paramvar)
	ld	c,V_nextparam
IF	CHECK_TYPE
	ld b,VARDATA_TYPE
ENDIF
	call	_GetWord	;BC=param.vardata.next_parameter
	ld	(ws+1358),bc	;store-it to param

        jp c01_0532


c01_c267:
        db 95,95,109,97,105,110,0

        ; CreateMainSubroutine workspace at ws+1294 length ws+10 OK
f279_CreateMain:
        call f72_AllocNewTyp
        ld (ws+1296), hl	;type
;        ld hl,( ws+1296 )	;type.kind := TYPE_SUBROUTINE;
        ld a,6 ;TYPE_SUBROUTINE = 6
        ld c,T_kind
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutByte
        call f70_AllocNewSym
        ld (ws+1300), hl	;sym
;        ld hl,( ws+1300 )	;sym.kind := TYPE;
        ld a,30; TYPE = 30
        ld c,S_kind
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutByte
;        ld hl,( ws+1300 )	;sym.name := "__main";
;        ld de,c01_c267
	ld	hl,10		;allocate space for "__main"
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	f75_ExternalAl
	push	hl		;save vp
	ld	de,c01_c267	;copy "__main" 
IF	CHECK_TYPE
	ld b,STRING_TYPE
ENDIF
	call	_PutString
	ld hl,( ws+1300 )	;sym
	pop	de		;vp
        ld c,S_name
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1300 )	;sym.typedata := type;
        ld de,( ws+1296 )	;type
        ld c,S_base
IF	CHECK_TYPE
	ld b,SYMBOL_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1296 )	;type.symbol := sym;
        ld de,( ws+1300 )	;sym
        ld c,T_symbol
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord

;        ld hl,29
;        call f75_InternalAll
        ld hl,SUBR_SIZE
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
        call f75_ExternalAl

        ld (current_subr), hl	;current_subr

;        ld de, (ws+1300)
;        ld (hl),e
;        inc hl
;        ld (hl),d		;current_subr.symbol := sym;
	ld de,(ws+1300)
	ld c,U_symbol
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
        call _PutWord

;        ld hl, (ws+1296)
;        ld ix, (current_subr)
;        ld (ix+10), l
;        ld (ix+11), h		;current_subr.type := type;
	ld hl,(current_subr)
	ld de,(ws+1296)
	ld c,U_type
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
        call _PutWord

;        push ix
;        pop hl
;        ld (ix+12), l
;        ld (ix+13), h		;current_subr.intfsubr := current_subr;
	ld hl,(current_subr)
	ld de,(current_subr)
	ld c,U_intfsubr
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
        call _PutWord

        ld hl,( ws+1296 )	;type.subrtype.subr := current_subr;
        ld de,( current_subr )	;current_subr
        ld c,T_base
IF	CHECK_TYPE
	ld b,TYPE_TYPE
ENDIF
        call _PutWord

;        ld hl, (current_subr)
;        inc hl
;        inc hl
;        inc hl
;        inc hl
	ld hl, (current_subr)	;HL = &current_subr.namespace
	push hl

        ld hl, (ws+1300)
        call f229_AddToNames
        ret


        ; ReportWorkspaces workspace at ws+1359 length ws+5 OK
f280_ReportWork:
        ld (ws+1359), hl	;subr
        xor a
        ld (ws+1361), a
c01_053d:
        ld a, (ws+1361)
        cp 4
;!!!    jp z, c01_0542
        ret z   ;!!!

        ld hl, (ws+1359)

;        ld de,16
;        add hl,de
;        ex de,hl
;        ld a, (ws+1361)
;        ld l,a
;        ld h,0
;        add hl,hl
;        add hl,de
;        ld a,(hl)
;        inc hl
;        ld h,(hl)
;        ld l,a
;        ld (ws+1362), hl
;        ld a,h
;        or l

	add a,a
	add a,U_workspace
	ld c,a			;offset of workspace[a]
IF	CHECK_TYPE
	ld b,SUBR_TYPE
ENDIF
	call _GetWord
	ld (ws+1362),bc
	ld a,b
	or c

        jp z, c01_0547
        ld hl, (ws+1359)
        push hl
        ld a, (ws+1361)
        push af
        ld hl, (ws+1362)
        call f213_EmitterDec;areWorkspace
c01_0547:
        ld a, (ws+1361)
        inc a
        ld (ws+1361), a
        jp c01_053d
;!!!c01_0542:
;!!!    ret


        ; Expr1Simple workspace at ws+1355 length ws+8 CHANGED
f288_Expr1Simpl:
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
        ld hl,( ws+1356 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
;        ld ( f288_type ),bc
	ld d,b
	ld e,c
        ld hl,( ws+1358 )
        ld c,N_type
;        ld de,( f288_type )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1358)
        ret


        ; cant_add_that workspace at ws+1372 length ws+0 OK
f290_cant_add_t:
        ld hl, (ws+1355)
        push hl
        ld hl, (ws+1357)
        call f281_expr_i_can;_do_that
        ret


        ; ExprAdd workspace at ws+1355 length ws+17 CHANGED
f289_ExprAdd:
        ld (ws+1357), hl
        pop bc
        pop hl
        ld (ws+1355), hl
        push bc
        push hl
        ld hl, (ws+1357)
        call f283_ResolveUnt
        ld hl,( ws+1355 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f289_ltype ),bc
        ld hl,( ws+1357 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f289_rtype ),bc
        ld hl, (f289_ltype)
        call f74_IsPtr
        or a
        jp z, c01_059a
        ld hl, (f289_rtype)
        call f74_IsPtr
        or a
        jp nz, c01_05a0
        ld de, (f289_rtype)
        ld hl, (intptr_type)
        and a
        sbc hl,de
        jp z, c01_0596 ;;
c01_05a0:
        call f290_cant_add_t
c01_05a1:
        jp c01_0596
c01_059a:
        ld hl, (f289_rtype)
        call f74_IsPtr
        or a
        jp z, c01_05a6
        call f290_cant_add_t
        jp c01_0596
c01_05a6:
        ld hl, (f289_ltype)
        call f74_IsPtr
        or a
        jp nz, c01_05ac
        ld de, (f289_ltype)
        ld hl, (f289_rtype)
        and a
        sbc hl,de
;;        jp z, c01_05ac
;;        call f290_cant_add_t
	call nz,f290_cant_add_t ;;
c01_05ac:
c01_0596:
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
        ld c,N_type
        ld de,( f289_ltype )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1359)
        ret


        ; cant_sub_that workspace at ws+1375 length ws+0 OK
f292_cant_sub_t:
        ld hl, (ws+1355)
        push hl
        ld hl, (ws+1357)
        call f281_expr_i_can;_do_that
        ret


        ; ExprSub workspace at ws+1355 length ws+20 CHANGED
f291_ExprSub:
        ld (ws+1357), hl
        pop bc
        pop hl
        ld (ws+1355), hl
        push bc
        push hl
        ld hl, (ws+1357)
        call f283_ResolveUnt
        ld hl,( ws+1355 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f291_ltype ),bc
        ld hl,( ws+1357 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f291_rtype ),bc
        ld hl, (f291_ltype)
        call f74_IsPtr
        ld (ws+1365), a
        ld hl, (f291_rtype)
        call f74_IsPtr
        ld (ws+1366), a
        ld a, (ws+1365)
        or a
        jp z, c01_05b6
        ld a, (ws+1366)
        or a
        jp nz, c01_05b6
        ld de, (f291_rtype)
        ld hl, (intptr_type)
        and a
        sbc hl,de
        jp z, c01_05b6
        call f292_cant_sub_t
        jp c01_05ae
c01_05b6:
        ld hl, (f291_ltype)
        call f239_IsNum
        ld (ws+1367), a
        ld hl, (f291_rtype)
        call f74_IsPtr
        ld (ws+1368), a
        ld a, (ws+1367)
        or a
        jp z, c01_05be
        ld a, (ws+1368)
        or a
        jp z, c01_05be
        call f292_cant_sub_t
        jp c01_05ae
c01_05be:
        ld hl, (f291_ltype)
        call f239_IsNum
        ld (ws+1369), a
        ld hl, (f291_rtype)
        call f239_IsNum
        ld (ws+1370), a
        ld a, (ws+1369)
        or a
        jp z, c01_05c7
        ld a, (ws+1370)
        or a
        jp z, c01_05c7
        ld de, (f291_ltype)
        ld hl, (f291_rtype)
        and a
        sbc hl,de
;;        jp z, c01_05c7
;;        call f292_cant_sub_t
	call nz,f292_cant_sub_t ;;
c01_05c7:
c01_05ae:
        ld hl, (ws+1355)
        call f172_NodeWidth
        ld d,131
        push de
        push af
        ld hl, (ws+1355)
        push hl
        ld hl, (ws+1357)
        call f183_MidC2Op
        ld (ws+1359), hl
        ld hl, (f291_ltype)
        call f74_IsPtr
        or a
        jp z, c01_05d0
        ld de, (f291_ltype)
        ld hl, (f291_rtype)
        and a
        sbc hl,de
        jp nz, c01_05d0
        ld hl,( ws+1359 )
        ld c,N_type
        ld de,( intptr_type )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        jp c01_05ca
c01_05d0:
        ld hl,( ws+1359 )
        ld c,N_type
        ld de,( f291_ltype )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
c01_05ca:
        ld hl, (ws+1359)
        ret


        ; Expr2Simple workspace at ws+1355 length ws+15 CHANGED
f293_Expr2Simpl:
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
        call f286_ResolveUnt
        ld a, (ws+1356)
        ld (ws+1363), a
        ld hl,( ws+1357 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f293_type ),bc
        ld hl, (f293_type)
        call f240_IsSNum
;        ld (ws+1364), a
        or a
        jp z, c01_05d6
        ld a, (ws+1355)
        ld (ws+1363), a
c01_05d6:
        ld hl,( ws+1357 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1365 ),bc
        ld hl, (ws+1357)
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
;        ld hl,( ws+1361 )
        ld c,N_type
        ld de,( ws+1365 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1361)
        ret


;c01_c279:
; db 76,72,83,32,111,102,32,115,104,105,102,116,32,99,97,110,32,111,110,108,121
; db 32,98,101,32,99,111,110,115,116,97,110,116,32,105,102,32,116,104,101,32,82
; db 72,83,32,105,115,32,97,108,115,111,32,99,111,110,115,116,97,110,116,0

        ; expr_i_checkrhsconst workspace at ws+1374 length ws+2 CHANGED
f294_expr_i_che:
;;        ld (ws+1374), hl
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        cp 40
        ret z
;        ld hl,c01_c279
;        jp f82_SimpleError
	ld a,7
	jp SimpleErrorNr


;c01_c280:
; db 110,117,109,98,101,114,32,114,101,113,117,105,114,101,100,32,111
; db 110,32,76,72,83,32,111,102,32,115,104,105,102,116,0


        ; expr_i_checkshift workspace at ws+1374 length ws+5 CHANGED
f295_expr_i_che:
        ld (ws+1376), hl
        pop bc
        pop hl
        ld (ws+1374), hl
        push bc
        ld hl,( ws+1374 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        call f239_IsNum
;        ld (ws+1378), a
        or a
        jp nz, c01_05e0
;        ld hl,c01_c280
;        call f82_SimpleError
	ld a,3
	call SimpleErrorNr
c01_05e0:
        ld hl, (ws+1376)
        push hl
        ld hl, (ws+551)
        call f282_CheckExpre
        ret


        ; ExprShift workspace at ws+1355 length ws+19 CHANGED
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
        ld hl,( ws+1357 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld h,b
        ld l,c
        call f240_IsSNum
;        ld (ws+1364), a
        or a
        jp z, c01_05e5
        ld a, (ws+1355)
        ld (ws+1363), a
c01_05e5:
        ld hl,( ws+1357 )
        ld c,N_op
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetByte
        cp 40
        jp nz, c01_05ea
        ld hl, (ws+1359)
        call f294_expr_i_che
        ld a, (ws+1363)
        push af
        ld hl, (ws+1357)
        push hl
        ld hl, (ws+1359)
        call f176_FoldConsta
        ld (f296_value), hl
        exx
        ld (f296_value+2), hl
        exx
        ld hl,( ws+1357 )
        ld c,N_base
        ld de,( f296_value )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl,( ws+1357 )
        ld c,N_base+2
        ld de,( f296_value+2 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        ld hl, (ws+1357)
        ld (ws+1361), hl
        ld hl, (ws+1359)
        call f69_Discard
        jp end_f296_ExprSh
c01_05ea:
        ld hl, (ws+1357)
        push hl
        ld hl, (ws+1359)
        call f295_expr_i_che
        ld hl,( ws+1357 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1369 ),bc
        ld hl, (ws+1357)
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
;        ld hl,( ws+1361 )
        ld c,N_type
        ld de,( ws+1369 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
end_f296_ExprSh:
        ld hl, (ws+1361)
        ret

        ; ResolveUntypedConstantsSimply workspace at ws+1381 length ws+8 CHANGED
f284_ResolveUnt:
        ld (ws+1383), hl
        pop bc
        pop hl
        ld (ws+1381), hl
        push bc
        ld hl,( ws+1381 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1385 ),bc
        ld hl,( ws+1383 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( ws+1387 ),bc
        ld hl, (ws+1385)
        ld a,h
        or l
        jp z, c01_057f
        ld hl, (ws+1387)
        ld a,h
        or l
        jp nz, c01_057f
        ld hl,( ws+1383 )
        ld c,N_type
        ld de,( ws+1385 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        jp _PutWord
c01_057f:
        ld hl, (ws+1385)
        ld a,h
        or l
        jp nz, c01_0586
        ld hl, (ws+1387)
        ld a,h
        or l
        jp z, c01_0586
        ld hl,( ws+1381 )
        ld c,N_type
        ld de,( ws+1387 )
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        jp _PutWord
c01_0586:
        ld de, (ws+1385)
        ld hl, (ws+1387)
        and a
        sbc hl,de
        ret z
        ld hl, (ws+1381)
        push hl
        ld hl, (ws+1383)
        call f281_expr_i_can
        ret

;c01_c278:
;        db 110,117,109,98,101,114,32,114,101,113,117,105,114,101,100,0


        ; CheckNumber workspace at ws+1374 length ws+3 CHANGED
f285_CheckNumbe:
;;        ld (ws+1374), hl
;        ld hl,( ws+1374 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
	ld h,b
	ld l,c
        call f239_IsNum
;        ld (ws+1376), a
        or a
	ret nz
;        ld hl,c01_c278
;        jp f82_SimpleError
	ld a,6
	jp SimpleErrorNr


	; ResolveUntypedConstantsNeedingNumbers workspace at ws+1370 length ws+4 OK
f286_ResolveUnt:                           
	ld (ws+1372), hl
	pop bc
	pop hl
	ld (ws+1370), hl
	push bc
	push hl
	ld hl, (ws+1372)
	call f284_ResolveUnt;pedConstantsSim;ly
	ld hl, (ws+1370)
	call f285_CheckNumbe;
	ld hl, (ws+1372)
;!!!	call f285_CheckNumbe;
	jp f285_CheckNumbe; ;!!!
;!!!	ret


        ; CondSimple workspace at ws+1377 length ws+8 CHANGED
f287_CondSimple:
        ld (ws+1379), hl
        pop bc
        pop hl
        ld (ws+1377), hl
        push bc
        push hl
        ld hl, (ws+1379)
        call f284_ResolveUnt
        ld hl,( ws+1377 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f287_lhstype ),bc
        ld hl,( ws+1379 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f287_rhstype ),bc
        ld de, (f287_lhstype)
        ld hl, (f287_rhstype)
        and a
        sbc hl,de
        ret z
        ld hl, (ws+1377)
        push hl
        ld hl, (ws+1379)
        call f281_expr_i_can
        ret

c01_c274:
	db 108,104,115,46,116,121,112,101,61,0
c01_c275:
	db 114,104,115,46,116,121,112,101,61,0
;c01_c276:
; db 99,97,110,110,111,116,32,117,115,101,32,97,110,32,117,110,116,121,112
; db 101,100,32,99,111,110,115,116,97,110,116,32,105,110,32,116,104
; db 105,115,32,99,111,110,116,101,120,116,0
;c01_c277:
; db 112,111,105,110,116,101,114,115,32,109,97,121,32,111,110,108,121,32,97,112
; db 112,101,97,114,32,111,110,32,116,104,101,32,76,72,83,32,111,102,32
; db 97,110,32,97,100,100,105,116,105,111,110,32,111,114,32,115,117
; db 98,116,114,97,99,116,105,111,110,0


        ; ResolveUntypedConstantsForAddOrSub workspace at ws+1375 length ws+8 CHANGED
f283_ResolveUnt:
        ld (ws+1377), hl
        pop bc
        pop hl
        ld (ws+1375), hl
        push bc
        ld hl,( ws+1375 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f283_ltype ),bc
        ld hl,( ws+1377 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f283_rtype ),bc
        ld hl, (f283_ltype)
        ld a,h
        or l
        jp z, c01_055d
        ld hl, (f283_rtype)
        ld a,h
        or l
        jp nz, c01_055d
        ld hl, (f283_ltype)
        call f239_IsNum
        or a
        jp z, c01_0563
        ld hl,( ws+1377 )
        ld de,( f283_ltype )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        jp c01_055f
c01_0563:
        ld hl, (f283_ltype)
        call f74_IsPtr
        or a
        jp z, c01_0567
        ld hl,( ws+1377 )
        ld de,( intptr_type )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _PutWord
        jp c01_055f
c01_0567:
        ld hl,c01_c274
        call f9_print
        ld hl, (f283_ltype)
        call print_hex_i16
        call f10_print_nl
        ld hl,c01_c275
        call f9_print
        ld hl, (f283_rtype)
        call print_hex_i16
        call f10_print_nl
;        ld hl,c01_c276
;        call f82_SimpleError
	ld a,1
	call SimpleErrorNr
c01_055f:
c01_055d:
        ld hl,( ws+1375 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f283_ltype ),bc
        ld hl,( ws+1377 )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        call _GetWord
        ld ( f283_rtype ),bc
        ld hl, (f283_ltype)
        ld a,h
        or l
        ret nz
        ld hl, (f283_rtype)
        ld a,h
        or l
        ret z
        ld hl, (f283_rtype)
        call f239_IsNum
        or a
        jp z, c01_0574
        ld hl,( ws+1375 )
        ld de,( f283_rtype )
        ld c,N_type
IF	CHECK_TYPE
	ld b,NODE_TYPE
ENDIF
        jp _PutWord
c01_0574:
        ld hl, (f283_rtype)
        call f74_IsPtr
        or a
        ret z
;        ld hl,c01_c277
;        jp f82_SimpleError
	ld a,2
	jp SimpleErrorNr

c01_c409:
        db 107,66,32,102,114,101,101,32,109,97,105,110,32,109,101,109,111,114,121,10,0
c01_c40x:
        db 107,66,32,102,114,101,101,32,101,120,116,101,110,100,101,100,32,109,101,109,111,114,121,10,0

        ; PrintFreeMemory workspace at ws+1294 length ws+2 OK
f459_PrintFreeM:     
        call f41_GetFreeMemo;y
        ld a,10
        call f466__lsr2
        call f16_print_i16
        ld hl,c01_c409
        call f9_print
        call _GetTotalFree
        call f16_print_i16
        ld hl,c01_c40x
;!!!    call f9_print
	jp f9_print
;!!!    ret

c01_c410:
 db  115,121,110,116,97,120,32,101,114,114,111,114,58,32,99,111,119,102,101,32,91,45,73
 db 112,97,116,104,93,32,60,105,110,102,105,108,101,62,32,60,111,117,116,102,105,108,101,62,10,0


	; SyntaxError workspace at ws+1298 length ws+0
f460_SyntaxErro: 
	ld hl,c01_c410
	call f9_print
;!!!	call f4_ExitWithErro;
	jp f4_ExitWithErro; ;!!!
;!!!	ret


	; ParseArguments workspace at ws+1294 length ws+4
f461_ParseArgum:    
	call f27_ArgvInit
c01_080d:
	call f28_ArgvNext
	ld (ws+1296), hl
	ld a,h
	or l
	jp nz, c01_0813
	jp c01_080e
c01_0813:
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
	call f83_LexerAddInc;udePath
;!!!	jp c01_0819
	jp c01_080d	;!!!
c01_081d:
	call f460_SyntaxErro;
;!!!c01_0819:
;!!!	jp c01_0814
	jp c01_080d	;!!!
c01_0818:
	ld hl, (ws+8)
	ld a,h
	or l
	jp nz, c01_0822
	ld hl, (ws+1296)
	ld (ws+8), hl
;!!!	jp c01_081e
	jp c01_080d	;!!!
c01_0822:
	ld hl, (ws+10)
	ld a,h
	or l
	jp nz, c01_0826
	ld hl, (ws+1296)
	ld (ws+10), hl
;!!!	jp c01_081e
	jp c01_080d	;!!!
c01_0826:
	call f460_SyntaxErro;
;!!!c01_081e:
;!!!c01_0814:
	jp c01_080d
c01_080e:
	ld hl, (ws+8)
	ld a,h
	or l
	jp z, c01_082c
	ld hl, (ws+10)
	ld a,h
	or l
;!!!	jp nz, c01_082d
	ret nz	;!!!
c01_082c:
;!!!	call f460_SyntaxErro;
	jp f460_SyntaxErro; ;!!!
;!!!c01_082d:
;!!!	ret

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
f473_loop:
    add hl, hl
    rl e
    rl d
    jp nc, f473_noadd
    add hl, bc
    jp nc, tmp2		;$+3
    inc de              ; if carry increment high word
tmp2:
f473_noadd:
    dec a
    jp nz, f473_loop
    ret

    ; _mul4
f474__mul4:
    and a               ; reset carry
    sbc hl, hl          ; lower result to 0
    exx
    sbc hl, hl          ; upper result to 0
    exx
    ld a, 32            ; number of iterations
f474_loop:
    exx
    sra b               ; right shift lhs
    rr c
    exx
    rr b
    rr c                ; lowest bit to carry
    jp nc, f474_noadd
    add hl, de          ; result += rhs
    exx
    adc hl, de
    exx
f474_noadd:
    sla e               ; left shift rhs
    rl d
    exx
    rl e
    rl d
    exx
    dec a
    jp nz, f474_loop
    ret

    ; _dvrmu2
f477__dvrmu2:
    ld a, 16            ; bit count
    ld hl, 0            ; reset remainder
    jp f477_entry
f477_loop1:
    add hl, de
f477_loop2:
    dec a
    ret z
f477_entry:
    sla c               ; left shift LHS
    rl b
    adc hl, hl          ; top bit of LHS goes into remainder
    or a                ; clear carry
    sbc hl, de          ; sets carry if remainder(hl) < de
    jp c, f477_loop1      ; if remainder < de, undo add and go round again
    inc c               ; we know the bottom bit is clear
    jp f477_loop2

    ; _dvrmu4
f479__dvrmu4:
    ld a, 32            ; bit count
    and a               ; reset carry
    sbc hl, hl          ; reset remainder
    exx
    sbc hl, hl
    exx
    jp f479_entry
f479_loop1:
    add hl, de
    exx
    adc hl, de
    exx
f479_loop2:
    dec a
    ret z
f479_entry:
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
    jp c, f479_loop1      ; if remainder < RHS, undo add and go round again
    inc c               ; we know the bottom bit is clear
    jp f479_loop2

    ; _dvrms4
f480__dvrms4:
    exx
    ld a, b
    xor d               ; discover sign of result
    push af             ; save for later
    xor d               ; recover b (and sign of remainder) (and clear carry)
    push af             ; save for later
    exx

    jp p, f480_positivebc
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
f480_positivebc:

    exx
    bit 7, d            ; get sign of dede
    exx
    jp z, f480_positivede
    ld hl, 0
    and a
    sbc hl, de
    ex de, hl
    exx
    ld hl, 0
    sbc hl, de
    ex de, hl
    exx                 ; negate dede
f480_positivede:

    call f479__dvrmu4       ; actually d; the division
    ex de, hl           ; put remainder in de as we need hl
    exx
    ex de, hl
    exx

    pop af              ; recover sign of remainder
    jp p, f480_positiver
    and a               ; clear carry
    sbc hl, hl
    sbc hl, de          ; invert remainder
    ex de, hl
    exx
    ld hl, 0
    sbc hl, de
    ex de, hl
    exx
f480_positiver:

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
    jp po, tmp3		;$+5
    xor 080h            ; invert sign byte, spoil Z
tmp3:
    ret

    ; _jpbc
f488__jpde:
IF	TRACE
	call	_TraceDE
ENDIF
    push de
    ret


	global f321_yy_reduce

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
	jp nz, c01_065f
	call f318_yy_stack_o;erflow
c01_065f:
	ld bc,ws+1313
	ld (ws+1345), bc
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
	ld de,f321_yy_reduce_;s07bf
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
	ld hl, (ws+1351)
	ld de,1316
	and a
	sbc hl,de
	jp nc, c01_07cd
	ld bc,f2___main_s063e
	ld hl, (ws+1351)
	add hl,bc
	ld a,(hl)
	ld b,a
	ld a, (ws+1348)
	cp b
	jp nz, c01_07cd
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
c01_07c4:
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
	ld hl, (ws+1306)
	ret

	psect bss

IF	CHECK_TYPE

	global obj_type

obj_type:defs 1

ENDIF

	global f278_pvardata
	global f278_paramvar

f278_pvardata:	defs	2
f278_paramvar:	defs	2

	global f289_ltype
	global f289_rtype

f289_ltype:     defs    2
f289_rtype:     defs    2

	global f291_ltype
	global f291_rtype

f291_ltype:     defs    2
f291_rtype:     defs    2

	global f293_type

f293_type:      defs    2

	global f296_value

f296_value:     defs    4

	global f287_lhstype
	global f287_rhstype

f287_lhstype:	defs	2
f287_rhstype:	defs	2

	global f283_ltype
	global f283_rtype

f283_ltype:	defs	2
f283_rtype:	defs	2

	global mid_node
	global pmid_node

mid_node:	defs	14
pmid_node:	defs	2

	global argnode
	global pargnode

argnode:	defs	14
pargnode:	defs	2

	global f183_value
	global f183_rhsop
	global f183_lhsop
	global f183_optmp
	global f183_lhsright
	global f183_lhsaddressoff

f183_value: defs	4
f183_rhsop: defs	1
f183_lhsop: defs	1
f183_optmp: defs	1
f183_lhsright: defs	2
f183_lhsaddressoff: defs 2

;	global f214_vardata

;f214_vardata:	defs	2

	global f229_last
	global f229_inExt

f229_last:	defs	2
f229_inExt:	defs	1

	global f230_valid

f230_valid:	defs	2

	global f234_InExt

f234_InExt:	defs	1

	global f240_is_signed

f240_is_signed:	defs	1

	global f243_elementtype

f243_elementtype:	defs	2

	global f246_type

f246_type:	defs	2

	global f253_vardata
	global f253_width

f253_vardata:	defs	2
f253_width:	defs	2

	global f254_vardata
	global f254_width
	global f254_type

f254_vardata:	defs	2
f254_width:	defs	2
f254_type:	defs	2

	global f256_bltu

f256_bltu:	defs	7

	global f257_value

f257_value:defs 4

	global f259_whencase

f259_whencase:	defs	6

	global f262_vardata
	global f262_width

f262_vardata:	defs	2;
f262_width:	defs	2;

	global f264_poparg
	global f264_subr
	global f264_sym
	global f264_remaining
	global f264_vardata
	global f264_width

f264_poparg:	
f264_subr: 	defs 2
f264_sym:	defs 2
f264_remaining: defs 1
f264_vardata:	defs 2
f264_width: 	defs 2

	global f265_addr_off
	global f265_vardata

f265_addr_off:	defs 2
f265_vardata:	defs 2

	global f267_op

f267_op:	defs	1

	global f270_n

f270_n:	defs	14

	global f272_block

f272_block:	defs	2

	global f273_symbol
	global f273_namespace
	global f273_name

f273_symbol:	defs	2
f273_namespace:	defs	2
f273_name:	defs	2

	global f274_stride
	global f274_width
	global f274_tstride
	global f274_n
	global f274_sym

f274_stride:	defs	2
f274_width:	defs	2
f274_tstride:	defs	2
f274_n:		defs	2
f274_sym:	defs	2

	global f277_next

f277_next: 	defs	2

	global f276_next
	global f276_type
	global f276_subrn

f276_next: 	defs	2
f276_type:	defs	2
f276_subrn: 	defs	2

	global f282_nodetype

f282_nodetype:	defs	2

	global sym
	global vardata
	global node139
	global type139
	global type139width
	global op
	global type79
	global type79width
	global width 
	global element
	global stride
	global size
	global kind
	global constant
	global type
	global subr
	global name
	global indextype
	global alignment
	global align
	global tmp_type
	global ptmp_type
	global f308_element
	global f308_alignment
	global f308_width
	global intfsubr

sym:		defs	2
vardata:	defs	2
node139: 	defs	2
type139:	defs 	2
type139width:	defs	2
op:		defs	1
type79:		defs	2
type79width:	defs	2
width:		defs	2 
element:	defs	2
stride:		defs	2
size:		defs	2
kind:		defs	1
constant:	defs	4
type:		defs	2
subr:		defs	2
name:		defs	2
indextype:	defs	2
alignment:	defs	1
align:		defs	1

tmp_type:	defs	17
ptmp_type:	defs	2

f308_element:	defs	2
f308_alignment:	defs	1
f308_width:	defs	2
intfsubr:	defs	2

	global	buf1, buf2

buf1:	defs	65
buf2:	defs	65

	global	f214_vardatabuf

f214_vardatabuf:defs	9
vardatabuf:	defs	9


;--------------------------------
