;	get_char(): (ch: uint8)
__get_char::
	ld c,1
	jp 5

;	get_str(buf: [uint8])
__get_str::
	push	hl
	call	__get_char
	pop	hl
	cp	0DH
	jr	z,1f
	ld	(hl),a
	inc	hl
	jr	__get_str
1:	xor	a
	ld	(hl),a
	ret

;	print_nl()
__print_nl::
	ld a,10

;	print_char(ch: uint8)
__print_char::
	cp 10
	jr nz, 1f
	ld e, 13 
	ld c, 2 
	call 5 
	ld a,10
1:
	ld e, a 
	ld c, 2 
	jp   5

;	print_hex_i16(n: int16)
__print_hex_i16::
				;HL=value
	push	hl
	ld	a,h
	call	__print_hex_i8
	pop	hl
	ld	a,l

;	print_hex_i8(n: int8)
__print_hex_i8::
				;A = value
	call	Bin2Hex
	push	bc
	call	__print_char
	pop	bc
	ld	a,c
	jr	__print_char

;	print(buf: [uint8])
__print::
	ld a,(hl)
	or a
	ret z
	push hl
	call __print_char
	pop hl
	inc hl
	jr __print

; 	print_i8(n: int8)
__print_i8::
				;A = value
	ld	e,a
	ld	d,0		;DE = value
	ld	hl,buf6		;HL=buffer
	call	Bn2Dec
	ld	hl,buf6
	jp 	__print

;	print_i16(n: int16)
__print_i16::
	ex	de,hl		;DE = value
	ld	hl,buf6		;HL=buffer
	call	Bn2Dec
	ld	hl,buf6
	jp 	__print
;
;	Converts 16bit value to ASCII
;
;	DE = value
;	HL = output buffer
;
Bn2Dec:
	ld	(bufptr),hl	;save pointer to buffer	
	ld	(buffer),hl
	ex	de,hl
	xor	a
	ld	(curlen),a
cnvert:	
	ld	e,0
	ld	b,16
	or	a
dvloop:
	rl	l
	rl	h
	rl	e
	ld	a,e
	sub	10
	ccf
	jr	nc,deccnt
	ld	e,a
deccnt:
	djnz	dvloop
	rl	l
	rl	h
chins:
	ld	a,e
	add	a,'0'
	call	insert
	ld	a,h
	or	l
	jr	nz,cnvert
;
;	buffer contains: len,chars
;	convert-it to string
;
	ld	hl,(buffer)
	ld	c,(hl)
	ld	b,0
	ld	d,h
	ld	e,l
	inc	hl
	ldir
	xor	a
	ld	(de),a
	ret
;
insert:
	push	hl
	push	af
	ld	hl,(bufptr)
	ld	d,h
	ld	e,l
	inc	de
	ld	(bufptr),de
	ld	a,(curlen)
	or	a
	jr	z,exitmr
	ld	c,a
	ld	b,0
	lddr
exitmr:
	ld	a,(curlen)
	inc	a
	ld	(curlen),a
	ld	(hl),a
	ex	de,hl
	pop	af
	ld	(hl),a
	pop	hl
	ret
;
buffer:	defs	2
bufptr:	defs	2
curlen:	defs	1
buf6:	defs	6
;
;------------------------------------------------------------
;	Bin2Hex
;
;	A = byte
;
;	returns BC = hexa representation of A
;		A = high nibble in hexa (ready to be stored/printed)
;------------------------------------------------------------
Bin2Hex:
	ld	c,a		;C = byte
	and	0FH		;A = low nibble
	call	nibble2hex	;B = hexa
	ld	a,c		;A = byte
	ld	c,b		;C = low nibble in hexa
	and	0F0H		;A = (high nibble, 0000)
	rrca
	rrca
	rrca
	rrca			;A = high nibble
				;falls through, will return A = B = high nibble in hexa
;
;	A = bin
;	returns A = B = hexa
;
nibble2hex:			;A = bin
	add     a,090h
        daa
        adc     a,040h
        daa			;A = hexa
	ld	b,a
	ret
;
