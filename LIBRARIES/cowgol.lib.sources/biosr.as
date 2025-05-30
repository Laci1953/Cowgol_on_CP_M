
;sub BiosSetup()
__BiosSetup::
	ld  	hl,(1)
	inc 	hl
	inc 	hl
	inc 	hl
	ld  	de,BiosConst
	ld  	bc,9
	ldir
	ret

BiosConst:  jp 0
BiosConin:  jp 0
BiosConout: jp 0

;sub ConOut(ch: uint8)
__ConOut::
        ld      c,a
        jp   	BiosConout

;sub ConIn(): (ret: uint8)
__ConIn::
	jp 	BiosConin

;sub ConSts()
__ConSts::
	jp	BiosConst

;sub putstr(str: [uint8])
__putstr::
	ld      a,(hl)
        or      a
        ret     z
        inc     hl
        push    hl
        call    _x_ConOut
        pop     hl
        jr      __putstr

