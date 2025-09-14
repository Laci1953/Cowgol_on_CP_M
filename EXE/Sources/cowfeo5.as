	; ParserInit workspace at ws+1294 length ws+0
f459_ParserInit::
	ld a,255
	ld (ws+1275), a
	ld iy,ws+568
	ld (ws+566), iy
	ld ix,0
	ld (ws+568), ix
	xor a
	ld (ws+570), a
;end_f459_ParserInit:
	ret


	; ParserDeinit workspace at ws+1294 length ws+0
f460_ParserDeinit::
c01_07e7:
	ld de, (ws+566)
	ld hl,ws+568
	and a
	sbc hl,de
	jp z, c01_07ec
;c01_07eb:
	call f318_yy_pop_parser_stack
	jp c01_07e7
c01_07ec:
;end_f460_ParserDeinit:
	ret


	; ParserFeedToken workspace at ws+1294 length ws+9
f461_ParserFeedToken::
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
c01_07ed:
	ld hl,220
	ld de, (ws+1297)
	and a
	sbc hl,de
	jp c, c01_07f3
;c01_07f2:
	ld de,f2___main_s0656
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
	ld bc,f2___main_s0655
	add hl,bc
	ld a,(hl)
	ld b,a
	ld a, (ws+1294)
	cp b
	jp z, c01_07f8
;c01_07f7:
	ld de,f2___main_s0658
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
	jp c01_07f4
c01_07f8:
	ld bc,f2___main_s0654
	ld hl, (ws+1299)
	add hl,hl
	add hl,bc
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	ld (ws+1297), hl
c01_07f4:
c01_07f3:
;c01_07ef:
	ld hl, (ws+1297)
	ld de,456
	and a
	sbc hl,de
	jp c, c01_07fd
;c01_07fc:
	ld de, (ws+1297)
	ld hl,65080
	add hl,de
	push hl
	ld a, (ws+1294)
	call f323_yy_reduce
;	ld (ws+1301), hl
	ld (ws+1297), hl
	jp c01_07f9
c01_07fd:
	ld hl,452
	ld de, (ws+1297)
	and a
	sbc hl,de
	jp c, c01_0801
;c01_0800:
	ld de, (ws+566)
	ld hl,ws+1268
	and a
	sbc hl,de
	jp nz, c01_0806
	call f320_yy_stack_overflow
	ret
c01_0806:
;c01_0802:
	ld hl, (ws+566)
	ld bc,7
	add hl,bc
	ld (ws+566), hl
	ld hl,220
	ld de, (ws+1297)
	and a
	sbc hl,de
	jp nc, c01_080b
;c01_080a:
	ld hl, (ws+1297)
	ld de,144
	add hl,de
	ld (ws+1297), hl
c01_080b:
;c01_0807:
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
	call f322_CopyMinor
	ld a, (ws+1275)
	or a
	jp m, c01_07ee ; c01_0810
;c01_080f:
	ld a, (ws+1275)
	dec a
	ld (ws+1275), a
c01_0810:
;c01_080c:
	jp c01_07ee
c01_0801:
	ld hl, (ws+1297)
	ld de,65082
	add hl,de
	ld a,h
	or l
	jp nz, c01_0814
	ld hl, (ws+566)
	ld bc,65529
	add hl,bc
	ld (ws+566), hl
	call f458_yy_accept
	jp c01_07ee
c01_0814:
	ld b,0
	ld a, (ws+1275)
	push af
	ld a,b
	pop bc
	sub b
	jp po, 1f;
	xor 128
1:
	jp m, c01_0819
;c01_0818:
	ld a, (ws+1294)
	push af
	ld hl, (ws+1295)
	call f457_yy_syntax_error
c01_0819:
;c01_0815:
	ld a,3
	ld (ws+1275), a
	ld a, (ws+1294)
	push af
	ld hl, (ws+1295)
	call f316_yy_destructor
	ld a, (ws+1294)
	or a
	jp nz, c01_07ee ; c01_081e
;c01_081d:
	call f456_yy_parse_failed
	ld a,255
	ld (ws+1275), a
c01_081e:
;c01_081a:
	jp c01_07ee
c01_07f9:
	ld de, (ws+566)
	ld hl,ws+568
	and a
	sbc hl,de
	jp nz, c01_07ed ; c01_0823
;c01_0822:
	jp c01_07ee
c01_0823:
;c01_081f:
	jp c01_07ed
c01_07ee:
;end_f461_ParserFeedToken:
	ret


c01_c410:
	db 107,66,32,102,114,101,101,10,0

	; PrintFreeMemory workspace at ws+1294 length ws+2
f462_PrintFreeMemory::
	call f41_GetFreeMemory
;	ld (ws+1294), hl
	ld a,10
	call f469__lsr2
	call f16_print_i16
	ld hl,c01_c410
	jp   f9_print ;	call f9_print
;end_f462_PrintFreeMemory:
;	ret


c01_c411:
	db 115,121,110,116,97,120,32,101,114,114,111,114,58,32,99,111,119,102,101,32,91,45,73,112,97,116,104,93,32,60,105,110,102,105
	db 108,101,62,32,60,111,117,116,102,105,108,101,62,10,0

	; SyntaxError workspace at ws+1298 length ws+0
f463_SyntaxError::
	ld hl,c01_c411
	call f9_print
	jp   f4_ExitWithError ;	call f4_ExitWithError
;end_f463_SyntaxError:
;	ret


	; ParseArguments workspace at ws+1294 length ws+4
f464_ParseArguments::
	call f27_ArgvInit
c01_0824:
	call f28_ArgvNext
;	ld (ws+1294), hl
	ld (ws+1296), hl
	ld a,h
	or l
;	jp nz, c01_082a
;	jp c01_0825
;c01_082a:
	jp z,c01_0825
;c01_0826:
	ld hl, (ws+1296)
	ld a,(hl)
	cp 45
	jp nz, c01_082f
	ld hl, (ws+1296)
	inc hl
	ld (ws+1296), hl
	ld a,(hl)
	cp	'S'
	jr nz,1f
	ld a,1
	ld (symbols),a		;switch symbols ON
	jp c01_0824
1:
	cp 73
	jp nz, c01_0834
	ld hl, (ws+1296)
	inc hl
	ld (ws+1296), hl
	call f83_LexerAddIncludePath
	jp c01_0824 ; c01_0830
c01_0834:
	call f463_SyntaxError
c01_0830:
	jp c01_0824 ; c01_082b
c01_082f:
	ld hl, (ws+8)
	ld a,h
	or l
	jp nz, c01_0839
	ld hl, (ws+1296)
	ld (ws+8), hl
	jp c01_0824 ; c01_0835
c01_0839:
	ld hl, (ws+10)
	ld a,h
	or l
	jp nz, c01_083d
	ld hl, (ws+1296)
	ld (ws+10), hl
	jp c01_0824 ; c01_0835
c01_083d:
	call f463_SyntaxError
c01_0835:
c01_082b:
	jp c01_0824
c01_0825:
	ld hl, (ws+8)
	ld a,h
	or l
	jp z, c01_0843
;c01_0845:
	ld hl, (ws+10)
	ld a,h
	or l
	jp nz, c01_0844
c01_0843:
	call f463_SyntaxError
c01_0844:
;c01_083e:
;end_f464_ParseArguments:
	ret


c01_c412:
	db 67,79,87,70,69,58,32,0
c01_c413:
	db 0
c01_c414:
	db 100,111,110,101,58,32,0

	; __main workspace at ws+0 length ws+1294
f2___main::
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
	ld (ws+375), bc
	ld (ws+30), bc
	ld (ws+66), bc
	ld (ws+68), bc
	ld (ws+70), bc
	ld (ws+72), bc

	inc bc
	ld (ws+14), bc
	ld (ws+16), bc

	ld bc,ws+32
	ld (ws+64), bc

	xor a
	ld (ws+74), a
	ld (ws+203), a
	ld (ws+374), a
	ld (ws+557), a
	ld (symbols),a

	ld hl,c01_c412
	call f9_print
	call f462_PrintFreeMemory
	call f464_ParseArguments
	ld hl,c01_c413
	call f83_LexerAddIncludePath
	ld hl, (ws+8)
	call f87_LexerIncludeFile
	call f279_CreateMainSubroutine
	call f251_ArchInitTypes
	ld hl, (ws+10)
	call f207_EmitterOpenfile
	ld hl, (ws+12)
	call f209_EmitterDeclareSubroutine
	call f161_MidStartfile
	ld (ws+1276), hl
	call f269_Generate
	ld hl, (ws+12)
	call f168_MidStartsub
	ld (ws+1278), hl
	call f269_Generate
	call f459_ParserInit
c01_0846:
	call f88_LexerReadToken
	ld (ws+1280), a
	ld (ws+1281), a
	cp 34
	jp nz, c01_0849
	ld hl, (ws+204)
	exx
	ld hl, (ws+206)
	exx
	ld (ws+1282), hl
	exx
	ld (ws+1284), hl
	exx
	jp c01_0848
c01_0849:
	cp 33
	jp nz, c01_084a
	ld hl,ws+75
	call f78_InternalStrDup
	ld (ws+1286), hl
	ld (ws+1282), hl
	jp c01_0848
c01_084a:
	cp 41
	jp nz, c01_084b
	ld hl,ws+75
	call f78_InternalStrDup
	ld (ws+1288), hl
	ld (ws+1282), hl
	jp c01_0848
c01_084b:
	ld hl,0
	ld (ws+1282), hl
	ld (ws+1284), hl
c01_0848:
	ld a, (ws+1281)
	push af
	ld hl,ws+1282
	call f461_ParserFeedToken
	ld a, (ws+1281)
	or a
	jp nz, c01_0846 ; c01_0850
;c01_084f:
	jp c01_0847
c01_0850:
;c01_084c:
	jp c01_0846
c01_0847:
	call f460_ParserDeinit
	ld hl, (ws+12)
	call f138_MidEndsub
	ld (ws+1290), hl
	call f269_Generate
	ld hl, (ws+12)
	call f280_ReportWorkspaces
	call f139_MidEndfile
	ld (ws+1292), hl
	call f269_Generate
	call f208_EmitterClosefile
				;if symbols, close $SUBSYMS.$$$
	ld	a,(symbols)
	or	a
	jr	z,skipclose
	ld	hl,FCBsubsyms
	call	f_FCBClose
skipclose:

	ld hl,c01_c414
	call f9_print
	call f462_PrintFreeMemory
;end_f2___main:
	ret


    ; _lsr1
f466__lsr1::
    dec b
    ret m
    srl a
    jr f466__lsr1

    ; _lsr2
f469__lsr2::
    dec a
    ret m
    srl h
    rr l
    jr f469__lsr2

    ; _lsr4
f472__lsr4::
    dec a
    ret m
    exx
    srl h
    rr l
    exx
    rr h
    rr l
    jr f472__lsr4

    ; _asl4
f473__asl4::
    dec a
    ret m
    add hl, hl
    exx
    adc hl, hl
    exx
    jr f473__asl4

    ; _asr4
f474__asr4::
    dec a
    ret m
    exx
    sra h
    rr l
    exx
    rr h
    rr l
    jr f474__asr4

    ; _mul2
f476__mul2::
    ld hl, 0
    ld a, 16            ; number of iterations
f476__mul2_loop:
    add hl, hl
    rl e
    rl d
    jr nc, f476__mul2_noadd
    add hl, bc
    jr nc, 1f;
    inc de              ; if carry increment high word
1:
f476__mul2_noadd:
    dec a
    jr nz, f476__mul2_loop
    ret

    ; _mul4
f477__mul4::
    and a               ; reset carry
    sbc hl, hl          ; lower result to 0
    exx
    sbc hl, hl          ; upper result to 0
    exx
    ld a, 32            ; number of iterations
f477__mul4_loop:
    exx
    sra b               ; right shift lhs
    rr c
    exx
    rr b
    rr c                ; lowest bit to carry
    jr nc, f477__mul4_noadd
    add hl, de          ; result += rhs
    exx
    adc hl, de
    exx
f477__mul4_noadd:
    sla e               ; left shift rhs
    rl d
    exx
    rl e
    rl d
    exx
    dec a
    jr nz, f477__mul4_loop
    ret

    ; _dvrmu2
f480__dvrmu2::
    ld a, 16            ; bit count
    ld hl, 0            ; reset remainder
    jr f480__dvrmu2_entry
f480__dvrmu2_loop1:
    add hl, de
f480__dvrmu2_loop2:
    dec a
    ret z
f480__dvrmu2_entry:
    sla c               ; left shift LHS
    rl b
    adc hl, hl          ; top bit of LHS goes into remainder
    or a                ; clear carry
    sbc hl, de          ; sets carry if remainder(hl) < de
    jr c, f480__dvrmu2_loop1      ; if remainder < de, undo add and go round again
    inc c               ; we know the bottom bit is clear
    jr f480__dvrmu2_loop2

    ; _dvrmu4
f482__dvrmu4::
    ld a, 32            ; bit count
    and a               ; reset carry
    sbc hl, hl          ; reset remainder
    exx
    sbc hl, hl
    exx
    jr f482__dvrmu4_entry
f482__dvrmu4_loop1:
    add hl, de
    exx
    adc hl, de
    exx
f482__dvrmu4_loop2:
    dec a
    ret z
f482__dvrmu4_entry:
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
    jr c, f482__dvrmu4_loop1      ; if remainder < RHS, undo add and go round again
    inc c               ; we know the bottom bit is clear
    jr f482__dvrmu4_loop2

    ; _dvrms4
f483__dvrms4::
    exx
    ld a, b
    xor d               ; discover sign of result
    push af             ; save for later
    xor d               ; recover b (and sign of remainder) (and clear carry)
    push af             ; save for later
    exx

    jp p, f483__dvrms4_bcbc_positive
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
f483__dvrms4_bcbc_positive:

    exx
    bit 7, d            ; get sign of dede
    exx
    jr z, f483__dvrms4_dede_positive
    ld hl, 0
    and a
    sbc hl, de
    ex de, hl
    exx
    ld hl, 0
    sbc hl, de
    ex de, hl
    exx                 ; negate dede
f483__dvrms4_dede_positive:

    call f482__dvrmu4       ; actually do the division
    ex de, hl           ; put remainder in de as we need hl
    exx
    ex de, hl
    exx

    pop af              ; recover sign of remainder
    jp p, f483__dvrms4_remainder_positive
    and a               ; clear carry
    sbc hl, hl
    sbc hl, de          ; invert remainder
    ex de, hl
    exx
    ld hl, 0
    sbc hl, de
    ex de, hl
    exx
f483__dvrms4_remainder_positive:

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
f484__and4::
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
f485__or4::
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
f486__eor4::
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
f487__not4::
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
f489__cmpu4::
    and a               ; clear carry
    sbc hl, de
    ret nz
    exx
    sbc hl, de
    exx
    ret

    ; _cmps4
f490__cmps4::
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
f491__jpde::
    push de
    ret

_exit:: rst 0

	psect data
ws::
	defs 1475

	psect bss

	global	symbols
	global	FCBsubsyms
	global	subsyms_name

symbols:	defs	1
subsyms_name:	defz	'$SUBSYMS.$$$'
FCBsubsyms:	defs	167


	defs 128
TOPSTACK::
	end

