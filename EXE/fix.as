	psect text

	global _buf1

LF	equ	10
TAB	equ	9

buf:	defs	64	;space for a large string
;
;	labels : 	c??_?...?
;	end labels :	end_?...?
;	functions :	f?...?
;
	global _ZeroFill
;
;	Fill with 5 ASCII zeros
;
;void	ZeroFill(char* p);
;
_ZeroFill:
	ld	hl,2
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)		;DE=pointer of area to fill
	ld	a,'0'
	ld	b,5
fillz:	ld	(de),a
	inc	de
	djnz	fillz
	ret
;
	global _IsLabelRef
;
;	checks for '	jr (x(x),) c???'
;	returns HL = label ref pointer, as string
;			or NULL if no label ref
_IsLabelRef:
	ld	hl,_buf1
				;find first 'jr'
	ld	a,(hl)
	cp	LF		;empty line?
	jr	z,retnull
	cp	TAB		;first char must be TAB
	jr	nz,retnull
	inc	hl
	ld	a,(hl)		;second must be 'j'
	cp	'j'
	jr	nz,retnull
	inc	hl		;skip 'j'
	inc	hl		;skip next 'r'
	inc	hl		;skip next blank
	ld	a,(hl)		;should be 'c'
	cp	'e'		;if endf ref, ret NULL
	jr	z,retnull
	cp	'c'
	jr	nz,trycond	;try the flags
				;first char is 'c' ,
	inc	hl		;may be label ref, or 'c,'
	ld	a,(hl)		;check first 'c,'
	cp	','
	jr	z,trycond1	;try skiping flags
	dec	hl
	ret			;HL=pointer of label
trycond:			;its a 'jr x(x), ' look for ','
				;HL is pointing 'x(x), '
	inc	hl		;pointing '(x), '
	ld	a,(hl)
	cp	','
	jr	z,trycond1	;it was ', '
	inc	hl		;no, skip next 'x'
trycond1:
	inc	hl		;skip ','
	inc	hl		;skip blank, now pointing label ref
	ld	a,(hl)
	cp	'c'		;check first 'c'
	ret	z		;HL=pointer of label
retnull:			;should not happen...
	ld	hl,0
	ret
;
	global _IsEndLabelRef
;
;	checks for '	jr (x(x),) end_???'
;	returns HL = label ref pointer, as string
;			or NULL if no label ref
_IsEndLabelRef:
	ld	hl,_buf1
				;find first 'jr'
	ld	a,(hl)
	cp	LF		;empty line?
	jr	z,retnull
	cp	TAB		;first char must be TAB
	jr	nz,retnull
	inc	hl
	ld	a,(hl)		;second must be 'j'
	cp	'j'
	jr	nz,retnull
	inc	hl		;skip 'j'
	inc	hl		;skip next 'r'
	inc	hl		;skip next blank
	ld	a,(hl)		;should be 'e'
	cp	'e'		;check first 'e'
	ret	z		;HL=pointer of end label
				;no, may be label ref, or 'x(x), '
	cp	'c'
	jr	nz,1f
	inc	hl
	ld	a,(hl)			
	cp	','
	dec	hl
	jr	nz,retnull	;its a label ref...
1:				;its a 'jr x(x), ' look for ','
				;HL is pointing 'x(x), '
	inc	hl		;pointing '(x), '
	ld	a,(hl)
	cp	','
	jr	z,2f		;it was ', '
	inc	hl		;no, skip next 'x'
2:
	inc	hl		;skip ','
	inc	hl		;skip blank, now pointing (end)label ref
	ld	a,(hl)
	cp	'e'		;check first 'e'
	ret	z		;HL=pointer of end label 
	jp	retnull		;its a label ref...
;
	global _FindString
;
;char*	FindString(char* str);
;
;	returns HL = pointer or NULL
;
_FindString:
	ld	hl,2
	add	hl,sp
	ld	e,(hl)
	inc	hl
	ld	d,(hl)		;DE = str
	ld	hl,_buf1
loop:
	ld	a,(de)		;find first char
	cp	(hl)
	jr	z,foundfirst
	inc	hl
	ld	a,(hl)
	cp	LF
	jr	nz,loop
notfound:
	ld	hl,0
	ret
foundfirst:			;compare rest of string
	ld	b,d		;save string pointer to BC
	ld	c,e
	inc	de		;incr pointer in string
	ld	a,(de)
	or	a		;end-of-string?
	ret	z		;yes, return HL=pointer in buf
	push	hl		;save pointer in buf on stack
	inc	hl		;incr pointer in buf
check:
	ld	a,(de)
	cp	(hl)
	jr	nz,notequal
	inc	hl
	inc	de
	ld	a,(de)
	or	a		;end-of-string?
	jr	z,equal
	ld	a,(hl)
	cp	LF
	jr	nz,check
				;buf ended, failed...
	pop	hl
	jr	notfound
;
equal:	pop	hl		;restore pointer in buf
	ret			;...and return-it
;
notequal:
	pop	hl		;restore pointer in buf
	inc	hl		;incr pointer in buf
	ld	a,(hl)
	cp	LF		;end-of-string?
	jr	z,notfound	;yes, failed to find str
	ld	d,b		;restore pointer to str
	ld	e,c
	jr	loop		;keep secrching...
;
	global _FindChar
;
;char*	FindChar(char ch);
;
;	returns HL = pointer or NULL
;
_FindChar:
	ld	hl,2
	add	hl,sp
	ld	c,(hl)		;C = ch
	ld	hl,_buf1
loopch:
	ld	a,c
	cp	(hl)
	ret	z		;found
	inc	hl
	ld	a,(hl)
	cp	LF
	jr	nz,loopch
	ld	hl,0		;not found
	ret
;
	end
	