;	IsDigit(): (is: uint8)
__IsDigit::
	cp	30h
	jr	c,1f
	cp	3ah
	jr	nc,1f
	ld	a,1
	ret
1:
	xor	a
	ret

;	 ToLower(c: uint8): (cc: uint8)
__ToLower::
	cp 'A'		;less than A, return-it
	ret c
	cp 'Z'+1	;more than Z, return-it
	ret nc
	or 20H		;to lower case
	ret

;	CopyString(src: [uint8], dest: [uint8])
__CopyString::		;HL=src, DE=dest
	ld	a,(hl)
	ld	(de),a
	or	a
	ret	z
	inc	hl
	inc	de
	jr	__CopyString

;	StrCmp(s1: [uint8], s2: [uint8]): (res: int8)
__StrCmp::
			;HL=s1, DE=s2
	ex de,hl	;HL=s2, DE=s1
loop:
	ld a,(de)
	cp (hl)
	jr nz,noteq
	or a		;equal if 0
	ret z		;ret 0 if equal
	inc hl
	inc de
	jr loop
noteq:	ld a,1		;ret 1 if >
	ret nc
	ld a,0FFH	;ret -1 if <
	ret		

;	StrICmp(s2: [uint8], s1: [uint8]): (res: int8)
__StrICmp::
			;HL=s1, DE=s2
loopi:
	ld a,(de)
	call __ToLower
	ld c,a
	ld a,(hl)
	call __ToLower
	cp c
	jr nz,noteq
	or a		;equal if 0
	ret z		;ret 0 if equal
	inc hl
	inc de
	jr loopi

;	StrLen(s: [uint8]): (size: uint16)
__StrLen::
	ex de,hl	;DE=string pointer
	ld hl,0		;HL=size
loop1:
	ld a,(de)
	or a		;return size if 0
	ret z
	inc de		;increment pointer
	inc hl		;increment size
	jr loop1

