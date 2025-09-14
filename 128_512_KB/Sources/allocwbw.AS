;
;	Dynamic memory routines for ROMWBW
;
;	Szilagyi Ladislau
;
;	Jan 2024
;
;--------------------------------------------------------
;	this code must be executed at addresses > 8000H
;--------------------------------------------------------

	GLOBAL	_InitDynM
	GLOBAL	_GetTotalFree
	GLOBAL	_Alloc
	GLOBAL	_Free
	GLOBAL	_GetString
	GLOBAL	_PutString
	GLOBAL	_StringLen
	GLOBAL	_GetByte
	GLOBAL	_PutByte
	GLOBAL	_GetWord
	GLOBAL	_PutWord
	GLOBAL	_PutWordNoCheck
	GLOBAL	_GetWordNoCheck
	GLOBAL	_ReadMem
	GLOBAL	_WriteMem
	GLOBAL	_FillZero
	GLOBAL	_IsValid


HBIOS		equ	0FFF0H
BNKSEL		equ	0FFF3H

SYSGETBNK	equ	0F3H
APPBNKSB	equ	0F8H
APPBNKSC	equ	0F5H

Buf		equ	0000H	;address of dynamic memory bank
MAX_SIZE	equ	11	;max block = 8000H
BANKS_CNT	equ	8	;8 x 32KB allowed
;
; Memory block structure
;
; 	defw	next 	;pointer to next block
;	defw	prev 	;pointer to prev block
;	defb	status 	;0=available, CrtID=allocated
;	defb	size	;block size : from 0(=10H) to MAX_SIZE(=4000H or 8000H)
;	data
;
OFF_STS		equ	4
OFF_SIZE	equ	5
OFF_DATA	equ	6
;

LISTS_NR	equ	MAX_SIZE+1
AVAILABLE	equ	0

	psect bss
;
;	Available block list headers
;
L0:	defs	4*BANKS_CNT	;L0 bank0,L0 bank1,...L0 bank3
L1:	defs	4*BANKS_CNT
L2:	defs	4*BANKS_CNT
L3:	defs	4*BANKS_CNT
L4:	defs	4*BANKS_CNT
L5:	defs	4*BANKS_CNT
L6:	defs	4*BANKS_CNT
L7:	defs	4*BANKS_CNT
L8:	defs	4*BANKS_CNT
L9:	defs	4*BANKS_CNT
L10:	defs	4*BANKS_CNT
L11:	defs	4*BANKS_CNT
;
Lists:	defs	LISTS_NR*2*BANKS_CNT	;bank0(L0,L1,...L10),bank1(L0+4,L1+4,...L10+4)... 
;
Buddy:	defs	LISTS_NR*2
;
;	Maximum Available
;	contains (Size+1) if available, or zero if unavailable
;
MaxAv:	defs	BANKS_CNT
;
;	Base bank index & count
;
count:	defs	1
base:	defs	1

;
;	Initial bank index
;
default:defs	1
;

MACRO	DEFAULT
	ld	a,(default)
	call	BNKSEL
ENDM

	psect top

;	_InitDynM
;
;	Init dynamic memory
;
_InitDynM:
	di
	ld	b,SYSGETBNK
	call	HBIOS		;C=crt bank
	ld	a,c
	ld	(default),a	;default bank at 0000H
	ld	b,APPBNKSB
	ld	c,APPBNKSC
	call	HBIOS		;H=base,L=count
	ld	(count),hl	;init base & count
	ld	a,(count)	;allow only up to 8 banks
	cp	9
	jr	c,1f
	ld	a,8
	ld	(count),a
1:				;init list headers for each bank
	ld	bc,BANKS_CNT * LISTS_NR	;total lists counter
	ld	hl,L0		;HL=first list header
initL:	
	ld	d,h		;DE=HL
	ld	e,l
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	dec	bc
	ld	a,b
	or	c
	jr	nz,initL
				;init lists pointers for each bank
	ld	iy,Lists
	ld	a,BANKS_CNT
	ld	bc,4 * BANKS_CNT;delta for list headers
	ld	de,0		;offset in lists headers
initLHB:			;for each bank
	push	af
	ld	hl,L0
	add	hl,de
	ld	a,LISTS_NR
initLH:				
	ld	(iy+0),l
	ld	(iy+1),h
	inc	iy
	inc	iy
	add	hl,bc
	dec	a
	jr	nz,initLH
				;next bank
	inc	de		;increment offset in list headers
	inc	de
	inc	de
	inc	de	
	pop	af
	dec	a
	jr	nz,initLHB
				;init Buddy
	ld	hl,Buddy
	ld	de,10H
	ld	a,LISTS_NR
initBDY:ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	ex	de,hl
	add	hl,hl
	ex	de,hl
	dec	a
	jr	nz,initBDY
				;init largest block list headers for each bank
	ld	a,(count)
	ld	b,a		;B=banks counter
	ld	a,(base)
	ld	hl,L11		;HL=L11 lists header
initLMAX:
	push	af
	push	bc
	push	hl
	call	BNKSEL		;select bank A
	ld	de,Buf
	call	__AddToL	;add DE to HL header
	ld	hl,Buf+OFF_STS	;HL=pointer of block status
	ld	(hl),AVAILABLE	;set block status = free
	inc	hl		;HL=pointer of block size
	ld	(hl),MAX_SIZE	;set size = 16KB
				;next bank
	pop	hl
	pop	bc
	pop	af
	inc	hl		;next header
	inc	hl
	inc	hl
	inc	hl
	inc	a		;next bank
	djnz	initLMAX
				;init MaxAv vector
	ld	a,(count)
	ld	b,a
	ld	hl,MaxAv
	ld	a,MAX_SIZE+1
loopav:	ld	(hl),a
	inc	hl
	djnz	loopav
	DEFAULT			;restore default bank
	ei
	ret	

	psect text

	defs	180H		;to keep code above 8000H
;
;	__AddToL
;
;	must be called under interrupts DISABLED
;	HL=list header, DE=new
;	return HL=new
;	affected regs: A,BC,DE,HL
;	IX,IY not affected
;
__AddToL:
        ld      a,l
        ld      (de),a
        inc     de
        ld      a,h
        ld      (de),a
        dec     de              ;New.Next=ListHeader
        inc     hl
        inc     hl
        ld      c,(hl)
        ld      (hl),e
        inc     hl
        ld      b,(hl)
        ld      (hl),d          ;BC=Last, ListHeader.Last=New
        ld      a,e
        ld      (bc),a
        inc     bc
        ld      a,d
        ld      (bc),a
        dec     bc              ;Last.Next=New
        ld      l,e
        ld      h,d             ;return HL=New
        inc     de
        inc     de
        ld      a,c
        ld      (de),a
        inc     de
        ld      a,b
        ld      (de),a          ;New.Prev=Last
	ret
;
;	__RemoveFromL
;
;	must be called under interrupts DISABLED
;	HL=elem to be removed
;	Returns HL=Element
;	affected regs: A,BC,DE,HL
;	IX,IY not affected
;
__RemoveFromL:
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        inc     hl              ;DE=Next
        ld      c,(hl)
        inc     hl
        ld      b,(hl)          ;BC=Prev
        ld      a,e
        ld      (bc),a
        inc     bc
        ld      a,d
        ld      (bc),a          ;Prev.Next=Next
        dec     bc
        inc     de
        inc     de
        ld      a,c
        ld      (de),a
        inc     de
        ld      a,b
        ld      (de),a          ;Next.Prev=Prev
	dec	hl
	dec	hl
	dec	hl		;HL=element
	ret
;
;	__GetFromL
;
;	must be called under interrupts DISABLED
;	HL=list header
;	returns (HL=elem and Z=0) or (HL=0 and Z=1 if list empty)
;	affected regs: A,BC,DE,HL
;	IX,IY not affected
;
__GetFromL:
        ld      e,(hl)
        inc     hl
        ld      d,(hl)
        dec     hl		;DE=First, HL=ListHeader
				;compare HL ? DE 
	or	a		;CARRY=0
	sbc	hl,de
        ret	z	        ;list empty, return HL=0
	ex	de,hl		;HL will be returned after removing element from list
        ld      e,(hl)		;Remove HL=Element
        inc     hl
        ld      d,(hl)
        inc     hl              ;DE=Next
        ld      c,(hl)
        inc     hl
        ld      b,(hl)          ;BC=Prev
        ld      a,e
        ld      (bc),a
        inc     bc
        ld      a,d
        ld      (bc),a          ;Prev.Next=Next
        dec     bc
        inc     de
        inc     de
        ld      a,c
        ld      (de),a
        inc     de
        ld      a,b
        ld      (de),a          ;Next.Prev=Prev
	dec	hl
	dec	hl
	dec	hl		;HL=element to be returned
	or	h		;Z=0
	ret
;	
;	allocS
;
;	BC=memory size (must be <= 4000H or 8000H)
;	Affected regs: A,BC
;	Returns C=bElement size
;
__allocS:
	dec	bc		;bc = memory size-1
	ld	a,b
	and	7FH		;keep it <= 7FH
	or	a
	jr	z,1f
				;high part != 0
	ld	c,11		;prepare bSize for 8000H
	bit	6,a
	ret	nz		;if bit#14=1 return 11 for 8000H
	dec	c		;C=10
	bit	5,a
	ret	nz		;if bit#13=1 return 10 for 4000H
	dec	c		;C=9
	bit	4,a
	ret	nz		;if bit#12=1 return 9 for 2000H
	dec	c		;C=8
	bit	3,a
	ret	nz		;if bit#11=1 return 8 for 1000H
	dec	c		;C=7
	bit	2,a
	ret	nz		;if bit#10=1 return 7 for 800H
	dec	c		;C=6
	bit	1,a
	ret	nz		;if bit#9=1 return 6 for 400H
	dec	c		;C=5
	ret			;else return 5 for 200H
1:	ld	a,c		;high part == 0
	ld	c,4		;C=4
	bit	7,a
	ret	nz		;if bit#7=1 return 4 for 100H
	dec	c		;C=3
	bit	6,a
	ret	nz		;if bit#6=1 return 3 for 80H
	dec	c		;C=2
	bit	5,a
	ret	nz		;if bit#5=1 return 2 for 40H
	dec	c		;C=1
	bit	4,a		
	ret	nz		;if bit#4=1 return 1 for 20H
	dec	c		;C=0
	ret			;else return 0 for 10H
;
;	Virtual Pointer to allocated buffer (size = 10H to 16KB))
;
;	01aaaaaa aaaaabbb
;where
;                     bbb : 0 to 7 = virtual RAM bank 
;	0aaaaaaa aaaa0000 : 0000H to 7FF0H = offset in RAM bank
;
;	Converts bank & offset to virtual pointer
;
;	A = virtual bank (bbb = 0...7)
;	HL = offset in RAM bank (0aaaaaaa aaaa0000)
;
;	returns HL = 01aaaaaa aaaaabbb
;
ToVirtual:
	srl	h		;shift HL right 1 bits
	rr	l
	or	l
	ld	l,a		
	set	6,h		;HL = 01aaaaaa aaaaabbb
	ret
;
;	Converts virtual pointer to bank & offset
;
;	HL = virtual pointer (01aaaaaa aaaaabbb)
;
;	returns A = virtual bank (bbb = 0...7)
;		HL = offset (0aaaaaaa aaaa0000)
;	affects B
;
FromVirtual:
	ld	b,l
	ld	a,l
	and	0F8H
	ld	l,a
	res	6,h
	add	hl,hl
	ld	a,b
	and	7
	ret
;
;	AdjustAddr
;
;	HL = virtual pointer
;	selects the correct RAM bank
;	returns HL = real address to data
;
AdjustAddr:
	call	FromVirtual
				;A = bank index (bb = 0...7)
				;HL = offset (0aaaaaaa aaaa0000)
	ld	b,a
	ld	a,(base)
	add	a,b
	push	hl
	call	BNKSEL		;select bank A
	pop	hl
	ld	a,l		;add 6=OFF_DATA
	add	a,OFF_DATA
	ld	l,a		;now HL points to data part
	ret
;
;	Get available memory size in KB
;
;	_GetTotalFree
;
;	returns HL=total amount of free memory in KB
;
_GetTotalFree:
	di
	ld	iy,0		;IY=grand total
	ld	b,0		;B=CARRY=0
	ld	a,(count)
	ld	c,a		;C = banks counter
bigloop:
	ld	ix,0		;IX=crt bank total
	push	bc		;save BC
				;compute (base) + (count) - C
	ld	a,(base)	;A=base
	ld	l,a
	ld	a,(count)
	add	l		;A=base+count
	sub	c		;A=base+count-C
	call	BNKSEL		;IX,IY not affected
				;compute (count) - C
	pop	bc
	push	bc
	ld	a,(count)
	sub	c
	ld	de,LISTS_NR*2	;DE=LISTS_NR*2
				;compute HL=Lists+(crt.bank)*(LISTS_NR*2)
	ld	hl,Lists
1:	or	a
	jr	z,2f
	add	hl,de
	dec	a
	jr	1b
2:
	ld	a,LISTS_NR	;A=counter of lists
	ld	bc,10H		;BC=size of blocks
nextl:	push	af
	ld	e,(hl)
	inc	hl
	ld	d,(hl)		;DE=crt list header
	inc	hl
	push	hl		;pointer of lists on stack
	ex	de,hl		;HL=crt list header
	push	hl		;on stack
nextb:	ld	e,(hl)
	inc	hl
	ld	d,(hl)		;DE=first
	pop	hl		;HL=header
	push	hl
	or	a
	sbc	hl,de
	jr	z,1f
	add	ix,bc
	ex	de,hl
	jr	nextb
1:	sla	c
	rl	b		;BC=BC*2
	pop	hl		;drop header
	pop	hl		;HL=pointer of lists
	pop	af		;A=counter
	dec	a
	jr	nz,nextl
				;done with crt bank
	pop	bc		;B = CARRY, C = banks counter
	push	ix
	pop	de		;DE=crt bank total
	add	iy,de		;add to grand total		
	jr	nc,2f
	inc	b		;increment carry if needed
2:
	dec	c
	jp	nz,bigloop

	push	iy
	pop	de
				;rotate (B,D) right 2 times
	srl	b
	rr	d
	srl	b
	rr	d

	ld	h,b
	ld	l,d
	DEFAULT
	ei
	ret
;
;	_Alloc
;
;	Allocate dynamic memory
;	HL = size
;	returns HL = virtual pointer or NULL
;
_Alloc:
	di
	ld	bc,OFF_DATA	;add 6 to size
	add	hl,bc
	ld	b,h
	ld	c,l		;BC=size
	call	__allocS	;C=bSize
	ld	a,(count)
	ld	b,a		;B=banks counter
	ld	hl,MaxAv	;HL=MaxAv vector
loop:
				;compare bSize ? MaxAv[bank]
	ld	a,c
	cp	(hl)		;bSize ? MaxAv[bank]
	jr	c,try		;if < , try to allocate in this bank
	jr	toobig		;if >= , it's too big, try to allocate in the next bank
try:
				;compute (base) + (count) - B
	ld	a,(base)	;A=base
	ld	l,a
	ld	a,(count)
	add	l		;A=base+count
	sub	b		;A=base+count-B
	push	hl		;save MaxAv
	push	bc		;B=banks counter, C=bSize on stack
	call	BNKSEL
	pop	bc		;B=banks counter, C=bSize
	push	bc		;B=banks counter, C=bSize on stack
				;compute bank index = (count) - B
	ld	a,(count)
	sub	b		;A=bank index(0...7)
	call	__alloc		;try to alloc
	push	af
	push	hl
	DEFAULT
	pop	hl
	pop	af
	jr	nz,alloc_ok
				;local alloc failed
	pop	bc		;B=banks counter, C=bSize
	pop	hl		;HL=MaxAv
	ld	(hl),c		;store failed bSize
toobig:
	inc	hl		;increment MaxAv pointer
	djnz	loop
				;global alloc failed
	ld	hl,0		;return NULL
	ei
	ret
;
alloc_ok:			;HL=allocated block
	pop	bc		;B=banks counter
	pop	de		;drop MaxAv
				;compute bank index = (count) - B
	ld	a,(count)
	sub	b		;A=current bank nr.
	call	ToVirtual	;return HL=virtual pointer
	ei
	ret
;
;	Allocate a memory block of given size
;
;	called under DI
;	A=current bank index (0...7) 
;	C=size
;	returns Z=0 and HL=pointer to memory block if available, 
;		else Z=1 if no memory available
;	Local variables: DE = Element, 
;			BC on stack (B=Size, C=CrtSize), 
;			IY=Lists[crt.bank],
;	Affected regs: A,BC,DE,HL
;	IX not affected
;
__alloc:
				;compute IY=Lists+(crt.bank)*(LISTS_NR*2)
				;A=current bank nr. (0...7)
	ld	de,LISTS_NR*2	;DE=LISTS_NR*2
	ld	iy,Lists
	ld	b,3		;how many times to shift A
2:
	rra			;shift right A
	jr	nc,1f
	add	iy,de
1:
	sla	e		;DE=DE*2
	rl	d
	djnz	2b
				;IY=Lists+(crt.bank)*(LISTS_NR*2)
;CrtSize=Size
	ld	b,c		;CrtSize=Size
5:	
;do {
;  Element=FirstFromL(Lists[Lists[CrtSize])
				;
	push	bc		;B=Size, C=CrtSize on stack
	ld	a,c
	add	a,a		;A=CrtSize*2
	push	iy
	pop	hl		;HL=Lists+(crt.bank)*(LISTS_NR*2)		
	ld	d,0
	ld	e,a
	add	hl,de		;HL=Lists+(crt.bank)*(LISTS_NR*2)+(CrtSize*2)
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a		;HL=CrtL=Lists[CrtSize]
	call	__GetFromL	;HL=GetFromL(CrtL)
	jr	z,7f
				;
;  if (Element) {
				;HL=Element
	ld	d,h
	ld	e,l		;save DE=Element
;    Element->Status=ALLOCATED
	ld	a,OFF_STS
	add	a,l
	ld	l,a		;HL=&El.Status
	ld	a,0FFH
	ld	(hl),a		;ALLOCATED
				;
	pop	bc		;B=Size, C=CrtSize
	inc	l		;HL=&El.Size
;    Element->Size=Size
	ld	(hl),b		;set ElSize = Size
	ld	a,c
;    if ( CrtSize == Size)
	cp	b	
;      return Element
	jr	nz,6f
fill0:				;DE=Element, B=size (0 = 10H...)
	inc	b		;B = 1: 10H, 2:20H, 3:40H...
	ld	a,8
loopsz:				;compute real size of block
	add	a,a
	djnz	loopsz
				;A=size of block
	sub	6		;A=size of data area
	ld	b,a		;B=size of data area
	ex	de,hl		;HL=Element
	push	hl		;save pointer
	ld	a,l
	add	a,6
	ld	l,a		;HL=data area pointer
	xor	a
loopz:	ld	(hl),a		;fill data area with 0
	inc	hl
	djnz	loopz
	pop	hl		;restore pointer
	inc	a		;Z=0
	ret			;return HL=Element
6:	
;    do {
;      CrtSize--
	dec	c		;decrement CrtSize
				;
	push	bc		;B=Size, C=CrtSize back on stack
				;
;      ElementBuddy = Element XOR Buddy_XOR_Mask
	ld	a,c
	add	a,a		;A=CrtSize*2
	ld	hl,Buddy
	add	a,l
	ld	l,a
	jr	nc,1f
	inc	h		
1:				;HL=pointer to Buddy_XOR_mask
	push	de		;DE=Element on stack
	ld	a,e
	xor	(hl)
	ld	e,a
	inc	l
	ld	a,d
	xor	(hl)
	ld	d,a		;DE = ElementBuddy = Element XOR Buddy_XOR_Mask
;      CrtL=Lists[CrtSize]
	ld	a,c		;C=CrtSize
	add	a,a		;A=CrtSize*2
	push	iy
	pop	hl		;HL=Lists+(crt.bank)*(LISTS_NR*2)		
	ld	b,0
	ld	c,a
	add	hl,bc		;HL=Lists+(crt.bank)*(LISTS_NR*2)+(CrtSize*2)
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a		;HL=CrtL=Lists[CrtSize]
;      AddToL(CrtL, ElementBuddy)
	call	__AddToL	;AddToL(HL=CrtL, DE=ElementBuddy)
				;returned HL=ElementBuddy
	pop	de		;DE=Element
;      ElementBuddy->Status=AVAILABLE
	ld	a,OFF_STS
	add	a,l
	ld	l,a
	ld	(hl),AVAILABLE	
;      ElementBuddy->Size=CrtSize
				;
	pop	bc		;B=Size, C=CrtSize
				;
	inc	l
	ld	a,c
	ld	(hl),a		;set ElBuddy Size = CrtSize	
;    while (--CrtSize != Size)
	cp	b
	jr	nz,6b
	jr	fill0		;fill data area with zero & return pointer
;   end if (Element) }
7:	
;}
;while (CrtSize++ < MAX_SIZE)
	pop	bc		;B=Size, C=CrtSize
	inc	c		;++CrtSize
	ld	a,c
	cp	MAX_SIZE+1
	jr	nz,5b
;				;alloc failed
	xor	a		;Z=1, no available memory
	ret	
;
;	Free dynamic memory
;	HL = virtual pointer
;
_Free:
	di
	call	FromVirtual	;HL = offset, A = bank index (0...3)
	push	hl
	push	af
	ld	l,a
	ld	a,(base)
	add	a,l		;A=base+index
	call	BNKSEL
	pop	af
	pop	de		;DE=Buf
	ld	hl,MaxAv	;HL=MaxAv vector
	ld	b,0
	ld	c,a
	add	hl,bc
	ld	(hl),MAX_SIZE+1	;set availability at full range...first alloc will settle-it
	ex	de,hl		;HL=Buf
;
;	Deallocate a memory block of given size
;
;	HL=memory block addr
;	A=current bank index (0...7)
;	Local variables : DE = Element, 
;			C=CrtSize, 
;			IY=Lists[crt.bank],
;	Affected regs: A,BC,DE,HL,IY
;	IX not affected
;
				;compute IY=Lists+(crt.bank)*(LISTS_NR*2)
				;A=current bank index (0...7)
	ld	de,LISTS_NR*2	;DE=LISTS_NR*2
	ld	iy,Lists
	ld	b,3		;how many times to shift A
2:
	rra			;shift right A
	jr	nc,1f
	add	iy,de
1:
	sla	e		;DE=DE*2
	rl	d
	djnz	2b
				;IY=Lists+(crt.bank)*(LISTS_NR*2)
	ld	d,h
	ld	e,l		;DE=HL=Element
	ld	a,OFF_SIZE
	add	a,l
	ld	l,a
	ld	c,(hl)		;C=CrtSize=Size
	ld	b,0		;B=0
;CrtSize=Size
;while (CrtSize < MAX_SIZE) {
10:	
	push	de		;DE=Element on stack
	ld	a,c		;A=CrtSize
	cp	MAX_SIZE
	jr	z,11f		;quit while loop when CrtSize == MAX_SIZE
				;
;  ElementBuddy = Element XOR Buddy_XOR_Mask
	ld	a,c
	add	a,a		;A=CrtSize*2
	ld	hl,Buddy
	add	a,l
	ld	l,a		
	jr	nc,1f
	inc	h		
1:				;HL=pointer to Buddy_XOR_mask
	ld	a,e
	xor	(hl)
	ld	e,a
	inc	l
	ld	a,d
	xor	(hl)
	ld	d,a		;DE = ElementBuddy = Element XOR Buddy_XOR_Mask
	ex	de,hl		;HL=ElementBuddy
	ld	a,OFF_STS
	add	a,l
	ld	l,a
	ld	a,(hl)		;A=BuddyStatus
	or	a		;is AVAILABLE ?
	jr	nz,11f		;break if ElementBuddy->Status != AVAILABLE
	inc	l
	ld	a,(hl)		;A=BuddySize
	cp	c		;is BuddySize == CrtSize ?
	jr	nz,11f		;break if ElementBuddy->Size != CrtSize
				;CARRY=0
	ld	a,l
	sub	OFF_SIZE
	ld	l,a		;HL=ElementBuddy
;  RemoveFromL(ElementBuddy)
	push	bc		;save CrtSize
	call	__RemoveFromL	;HL is still = ElementBuddy
	pop	bc		;restore CrtSize
	ex	de,hl		;DE=ElementBuddy
	pop	hl		;HL=Element
				;must set Element = min (Element,Buddy)
;  if (ElementBuddy < Element)
				;compare DE(buddy) ? HL(element)
	ld	a,d
	cp	h
	jr	c,12f
				;buddy high (D) >= element high (H)
	ld	a,e
	cp	l
	jr	c,12f
				;buddy low (E) >= element low (L)
				;buddy (DE) >= HL (element)...
;    then Element = ElementBuddy
	ex	de,hl		;so set DE (element) = HL
12:
	inc	c		;C=CrtSize++
	jr	10b
				;
;} end while (CrtSize < MAX_SIZE)
11:
	pop	de		;DE=Element
	ld	h,d
	ld	l,e		;HL=DE=Element
	inc	l
	inc	l
	inc	l
	inc	l
;Element->Status=AVAILABLE
	ld	(hl),AVAILABLE	
	inc	l
;Element->Size = CrtSize;
	ld	(hl),c		;set Element Size=CrtSize
	ld	a,c
	add	a,a		;A=CrtSize*2
	push	iy
	pop	hl		;HL=Lists+(crt.bank)*(LISTS_NR*2)		
	ld	b,0
	ld	c,a
	add	hl,bc		;HL=Lists+(crt.bank)*(LISTS_NR*2)+(CrtSize*2)
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a		;HL=CrtL=Lists[CrtSize]
;CrtL=Lists[CrtSize]
;AddToL(CrtL, Element);
	call	__AddToL
	DEFAULT
	ei
	ret
;
;	GetString
;	Get string (destination is in Lower RAM)
;	HL = source virtual pointer, DE = dest
;	
_GetString:
	di
	push	de
	call	AdjustAddr
	pop	de
2:				;HL=source, DE=dest
	ld	a,(hl)
	ld	(de),a
	inc	hl
	inc	de
	or	a		;if end-of-string
	jr	nz,2b
	DEFAULT
	ei
	ret
;
;	PutString
;	Put string (source is in Lower RAM)
;	HL = dest virtual pointer, DE = source
;	
_PutString:
	di
	push	de
	call	AdjustAddr
	pop	de
2:				;HL=dest, DE=source
	ld	a,(de)
	ld	(hl),a
	inc	de
	inc	hl
	or	a		;if end-of-string
	jr	nz,2b
	DEFAULT
	ei
	ret
;
;	StringLen
;	Get string length
;	HL = string virtual pointer
;	return HL
;
_StringLen:
	di
	call	AdjustAddr
	ld	b,0FFH
2:	ld	a,(hl)
	inc	hl
	inc	b
	or	a
	jr	nz,2b
	ld	h,a
	ld	l,b
	push	hl
	DEFAULT
	pop	hl
	ei
	ret
;
;	PutByte
;	HL = dest virtual pointer, C = offset, A = byte
;	dest is in Upper RAM
;
_PutByte:
	di
	push	af
	push	bc
	call	AdjustAddr
	pop	bc
	pop	af
	ld	b,0		;BC=offset
	add	hl,bc		;HL=dest+offset
	ld	(hl),a
	DEFAULT
	ei
	ret
;
;	GetByte
;	HL = dest virtual pointer, C = offset
;	returns A
;	source is in Upper RAM
;
_GetByte:
	di
	push	bc
	call	AdjustAddr
	pop	bc
	ld	b,0		;BC=offset
	add	hl,bc		;HL=dest+offset
	ld	a,(hl)
	push	af
	DEFAULT
	pop	af
	ei
	ret
;
;	PutWord
;	HL = dest virtual pointer, C = offset, DE = word
;
;	dest is in Upper RAM
;
_PutWord:
_PutWordNoCheck:
	di
	push	bc
	push	de
	call	AdjustAddr
	pop	de
	pop	bc
	ld	b,0		;BC=offset
	add	hl,bc		;HL=dest+offset
	ld	(hl),e
	inc	hl
	ld	(hl),d
	DEFAULT
	ei
	ret
;
;	GetWord
;	HL = dest virtual pointer, C = offset;
;	returns BC
;	source is in Upper RAM
;
_GetWord:
_GetWordNoCheck:
	di
	push	bc
	call	AdjustAddr
	pop	bc
	ld	b,0		;BC=offset
	add	hl,bc		;HL=dest+offset
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	push	bc
	DEFAULT
	pop	bc
	ei
	ret
;
;	ReadMem
;	HL = source virtual pointer, DE = dest, C = size
;	source is in Upper RAM
;	destination is in Lower RAM
;
_ReadMem:
	di
	push	de
	push	bc
	call	AdjustAddr
	pop	bc
	pop	de
	ld	b,0		;BC=size
	ldir
	DEFAULT
	ei
	ret
;
;	WriteMem
;	HL = dest virtual pointer, DE = source, C = size
;	source is in Lower RAM
;	destination is in Upper RAM
;
_WriteMem:
	di
	push	de
	push	bc
	call	AdjustAddr
	pop	bc
	pop	de
	ex	de,hl		;DE=dest,HL=source
	ld	b,0		;BC=size
	ldir
	DEFAULT
	ei
	ret
;
;	FillZero
;	HL = dest virtual pointer, C = count
;
_FillZero:
	di
	push	bc
	call	AdjustAddr
	pop	bc
	ld	b,c		;B= count
	xor	a
1:	ld	(hl),a
	inc	hl
	djnz	1b
	DEFAULT
	ei
	ret
;
;	IsValid (is in extended memory?)
;	HL=virtual pointer
;	returns A=1: OK, 0: Not in extended memory
;
_IsValid:
	di
	bit	6,h
	jr	nz,1f
	xor	a
	ei
	ret
1:
	call	FromVirtual
				;A = virtual bank (bb = 0...7)
				;HL = offset (0aaaaaaa aaaa0000)
	ld	b,a
	ld	a,(base)
	add	a,b
	push	hl
	call	BNKSEL		;select bank A
	pop	hl
	ld	a,l
	add	a,OFF_STS
	ld	l,a
	ld	a,(hl)
	cp	0FFH
	push	af
	DEFAULT
	pop	af
	ld	a,1
	jr	z,ok
	dec	a
ok:
	ei
	ret
;
