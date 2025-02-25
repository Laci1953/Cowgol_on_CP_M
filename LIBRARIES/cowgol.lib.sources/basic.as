;	MemSet(buf: [uint8], ch: uint8, len: uint16)
__MemSet::
			;HL=buf,DE=len, A=ch
	ld c,a		;C=byte
loopm:
	ld a,e
	or d
	ret z		;return if len=0
	ld (hl),c
	inc hl
	dec de
	jr loopm

;	MemCopy(src: [uint8], len: uint16, dest: [uint8])
__MemCopy::
			;HL=src, DE=dest, BC=len
	ld a,b
	or c
	ret z		;return if size = 0
	ldir		;(HL) ---> (DE) BC bytes
	ret

