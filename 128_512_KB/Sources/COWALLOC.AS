;
;	Dynamic memory routines
;
;	for 128KB / 512KB RAM
;
;	Szilagyi Ladislau
;
;	December 2023 - Jan 2024
;
;	only one of ?2X64K , ?512K, ?Z80ALL must be set to 1
;
?2X64K	equ	0	;1 : SC108 or 32KB ROM + 128KB RAM Phillip Stevens memory module or SC114 or Simple80
?512K	equ	1	;1 : 512KB RAM + 512KB EPROM
?Z80ALL equ	0	;1 : Z80ALL 4 x 32KB RAM
;
;	in case ?2X64K is set to 1,
;	only one of SC108, MM, S80 must be set to 1
;
SC108	equ	1	;1 : SC108
MM	equ	0	;1 : 32KB ROM + 128KB RAM Phillip Stevens memory module or SC114
S80	equ	0	;1 : Simple80 

CHECK_POINTER	equ	0	;1 : check pointers
CHECK_TYPE	equ	0	;1 : check allocated object type
TRACE		equ	0	;1 : trace

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
	GLOBAL	_GetWordNoCheck
	GLOBAL	_PutWord
	GLOBAL	_PutWordNoCheck
	GLOBAL	_ReadMem
	GLOBAL	_WriteMem
	GLOBAL	_FillZero
	GLOBAL	_IsValid

;--------------------------------------------------------CHECK_POINTER
IF	CHECK_POINTER

	psect text
;
;	BIOS shortcuts
;
BiosConst:  jp	0
BiosConin:  jp	0
BiosConout: jp	0
;
IF	CHECK_TYPE

TypeStamp:defs	1	;0F1H = TYPE, 0F2H = NODE

ENDIF

;
;	Bin2Hex
;
;	A = byte
;
;	returns BC = hexa representation of A
;		A = high nibble in hexa (ready to be stored/printed)
;
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
;	Prints "Wrong object type used at ADDR (in hexa)"
;	HL = addr
;
ErrTypeMsg:defm	'Wrong object type used at '
	defb 	0

PrintErrTypeHL:
	ld	de,ErrTypeMsg
	jp	loopp
;
;	Prints "Wrong pointer used at ADDR (in hexa)"
;	HL = addr
;
ErrMsg:	defm	'Wrong pointer used at '
	defb 	0

PrintErrHL:
	ld	de,ErrMsg
loopp:	ld	a,(de)
	or	a
	jr	z,printHL
	inc	de
	ld	c,a
	call	BiosConout
	jr	loopp
printHL:
	ld	a,h
	call	Bin2Hex		;A=B,C = chars to type
	ld	b,c
	ld	c,a		;high
	call	BiosConout
	ld	c,b		;low
	call	BiosConout
	ld	a,l
	call	Bin2Hex		;A=B,C = chars to type
	ld	b,c
	ld	c,a		;high
	call	BiosConout
	ld	c,b		;low
	call	BiosConout
	jp	0		;quit to CP/M

IF	TRACE
	global	_TraceA, _TraceDE, _TraceStack, _TraceEnabled

Offset:	defw	0
TraceMsg:defm	'Out: '
	defb	0
;
;	A = byte written to output file
;
_TraceA:
	push	af
	ld	de,(Offset)
	ld	a,d
	call	Bin2Hex		;A=B,C = chars to type
	ld	b,c
	ld	c,a		;high
	call	BiosConout
	ld	c,b		;low
	call	BiosConout
	ld	a,e
	call	Bin2Hex		;A=B,C = chars to type
	ld	b,c
	ld	c,a		;high
	call	BiosConout
	ld	c,b		;low
	call	BiosConout
	ld	c,' '
	call	BiosConout
	inc	de
	ld	(Offset),de
	ld	de,TraceMsg
loopt:	ld	a,(de)
	or	a
	jr	z,printA
	inc	de
	ld	c,a
	call	BiosConout
	jr	loopt
printA:
	pop	af
	call	Bin2Hex		;A=B,C = chars to type
	ld	b,c
	ld	c,a		;high
	call	BiosConout
	ld	c,b		;low
	call	BiosConout
crlf:
	ld	c,0DH
	call	BiosConout
	ld	c,0AH
	jp	BiosConout
;
;	DE = address to be traced
;
_TraceDE:
	ld	c,"X"
	call	BiosConout
	ld	c,'@'
	call	BiosConout
	ld	a,d
	call	Bin2Hex		;A=B,C = chars to type
	ld	b,c
	ld	c,a		;high
	call	BiosConout
	ld	c,b		;low
	call	BiosConout
	ld	a,e
	call	Bin2Hex		;A=B,C = chars to type
	ld	b,c
	ld	c,a		;high
	call	BiosConout
	ld	c,b		;low
	call	BiosConout
	jr	crlf
;
;	address to be traced is on the stack
;
_TraceEnabled:	defb	0
_TraceStack:
	ld	a,(_TraceEnabled)
	or	a
	ret	nz
	pop	hl
	pop	de
	ld	c,"O"
	call	BiosConout
	ld	c,'@'
	call	BiosConout
	ld	a,d
	call	Bin2Hex		;A=B,C = chars to type
	ld	b,c
	ld	c,a		;high
	call	BiosConout
	ld	c,b		;low
	call	BiosConout
	ld	a,e
	call	Bin2Hex		;A=B,C = chars to type
	ld	b,c
	ld	c,a		;high
	call	BiosConout
	ld	c,b		;low
	call	BiosConout
	ld	c,' '
	call	BiosConout
	push	de
	push	hl
	ret
ENDIF


ENDIF
;--------------------------------------------------------CHECK_POINTER

;--------------------------------------------------------------------------------------2X64K
IF	?2X64K

DYNM_START	equ	1
IF 	SC108 .or. MM
DYNM_END	equ	0FF63H
ENDIF
IF	S80
DYNM_END	equ	0FF00H
ENDIF

IF 	SC108 .or. MM

$ReadByte 	equ 	0FF63H
$WriteByte	equ 	0FF6DH
$ReadWord	equ 	0FF77H
$WriteWord	equ 	0FF83H
$WriteString	equ 	0FF8FH
$ReadString	equ 	0FFA1H
$StringLen	equ	0FFB2H
$ReadMem	equ	0FFC7H
$WriteMem	equ	0FFD7H
$FillZero	equ	0FFE7H

ENDIF

IF	S80

$ReadByte	equ        0FF00H
$WriteByte	equ        0FF11H
$ReadWord	equ        0FF22H
$WriteWord	equ        0FF35H
$WriteString	equ        0FF48h
$ReadString	equ        0FF61H
$StringLen	equ        0FF79H
$ReadMem        equ        0FF95H
$WriteMem       equ        0FFACH
$FillZero       equ        0FFC3H

ENDIF

FreeBHeader	equ	0FFFAH
;	defs	2	;first free+NEXTFREE
;	defs	2	;last free+NEXTFREE
;
FREE		equ	0
ALLOCATED	equ	0FFH
;
;	allocated/free bloc header structure (11 bytes)
;
HEADERSIZE	equ	9
;
NEXTBLOCK	equ	0	;+0	word - link to next block (0=EOL)
PREVBLOCK	equ	2	;+2	word - link to prev block (0=EOL)
NEXTFREE	equ	4	;+4	word - link to next free+NEXTFREE (or FreeBHeader=EOL)
PREVFREE	equ	6	;+6	word - link to prev free+NEXTFREE (or FreeBHeader=EOL)
STATUS		equ	8	;+8	byte - status (0=free,FF=allocated)
				;+9	data
;
;	HL = block
;
;	calculate BC=SIZE of block
;	HL not affected
;	DE affected
;
MACRO	GetSIZE
	call	$ReadWord
	dec	hl
	ld	a,b
	or	c		;carry=0
	jr	nz,1f
	ld	bc,DYNM_END
1:
	ex	de,hl
	ld	h,b
	ld	l,c
	sbc	hl,de
	ld	b,h
	ld	c,l
	ex	de,hl
ENDM

MACRO	PutByte
	call	$WriteByte
ENDM

MACRO	GetByte
	call	$ReadByte
ENDM

MACRO	PutWord
	call	$WriteWord
ENDM

MACRO	GetWord
	call	$ReadWord
ENDM

	psect top

;	_InitDynM
;
;	Init dynamic memory
;
_InitDynM:
IF	CHECK_POINTER
	ld  	hl,(1)		;fetch BIOS console routines
	inc 	hl
	inc 	hl
	inc 	hl
	ld  	de,BiosConst
	ld  	bc,9
	ldir
ENDIF
IF	SC108 .or. MM
	call	StoreShared		;setup shadow routines
ENDIF
					;init upper ram with 0
	ld	hl,DYNM_START
	ld	de,DYNM_END-DYNM_START
	ld	c,0
loopi:	PutByte
	inc	hl
	dec	de
	ld	a,d
	or	e
	jr	nz,loopi
;
	ld	hl,DYNM_START+NEXTFREE	;init free blocks header
	ld	(FreeBHeader),hl
	ld	(FreeBHeader+2),hl
					;init big block
	ld	bc,0			;EOL
	ld	hl,DYNM_START		;stored at NEXTBLOCK
	PutWord		
	inc	hl			;and at PREVBLOCK
	PutWord		
	inc	hl
	ld	bc,FreeBHeader		;EOL
	PutWord				;stored at NEXTFREE
	inc	hl
	PutWord				;and at PREVFREE
	inc	hl
	ld	c,FREE			;0=free
	PutByte				;stored at STATUS
	ret
;
	psect text

;	Split free block
;
;	HL=block addr
;	DE=to-be-allocated block size (including header)
;
;	if block size - (to-be-allocated block size) <= HEADERSIZE,
;		remove block from free block list
;	else
;		split block in two parts
;		low part remains free, with next block link updated
;		high part is allocated, with block links set, status=allocated
;
;	returns HL=allocated block addr
;	
SplitFree:
	push	de
	GetSIZE				;BC=size
	pop	de		
	push	hl			;block addr on stack
	ld	h,b
	ld	l,c			;HL=block size
	xor	a			;carry=0
	sbc	hl,de			;subtract requested size
	ld	bc,HEADERSIZE+1
	sbc	hl,bc			;if block size - (to-be-allocated block size) < HEADERSIZE,
	jp	c,full			;	 alloc the full block

					;split the block

	add	hl,bc			;HL=remaining size
	ld	b,h
	ld	c,l			;BC=remaining size

	pop	hl			;HL=block addr
	push	hl			;back on stack
	add	hl,bc			;HL=high part of the block, to-be-allocated
	ld	b,h
	ld	c,l			;BC=high part of the block, to-be-allocated
	pop	hl			;HL=block addr
	push	bc			;to-be-allocated on stack
	GetWord				;BC=next block
	ld	d,b
	ld	e,c			;DE=next block
	pop	bc			;BC=high part of the block, to-be-allocated
	dec	hl			;HL=block addr
	PutWord				;set BC as NEXTBLOCK for the low (free) part of the block
					;for the low (free) part of the block,
					;PREVBLOCK, STATUS,NEXTFREE,PREVFREE links remain unchanged
					;now, fix the new to-be-allocated block header (BC=block addr, DE=size)
	dec	hl			;HL=block addr
	push	hl			;exchange BC <--> HL
	push	bc
	pop	hl
	pop	bc			;HL=to-be-allocated, BC=block, DE=next block
	push	hl			;to-be-allocated on stack
	inc	hl
	inc	hl
	PutWord				;set to-be-allocated PREVBLOCK link = block
	dec	hl
	dec	hl
	dec	hl
	ld	b,d
	ld	c,e			;BC=next block
	PutWord				;set to-be-allocated NEXTBLOCK link = next block
					
	ld	a,d			;next block is EOL?
	or	e
	jr	z,isEOL
					;no, must adjust next block prev link

	pop	bc			;BC=to-be-allocated
	push	bc
	ex	de,hl			;HL=next block
	inc	hl
	inc	hl
	PutWord				;set next block.prev = to-be-allocated
isEOL:
	pop	hl			;HL=to-be-allocated
	
setsts:
	push	hl
	ld	bc,STATUS
	add	hl,bc			;HL=to-be-allocated STATUS pointer
IF	CHECK_TYPE
	ld	a,(TypeStamp)
	ld	c,a
ELSE
	ld	c,ALLOCATED		;allocated
ENDIF
	PutByte				;set to-be-allocated STATUS=allocated
	pop	hl			;HL=to-be-allocated block
	ret

full:					;transform full block from free to allocated

	pop	hl			;HL=block
	push	hl			;block on stack
	call	RemoveFree		;remove block from free list
					;mark block allocated
	pop	hl			;HL=block
	jr	setsts			;go mark allocated
;
;	Remove Free
;
;	removes block from the free blocks list
;
;	HL=block
;
RemoveFree:
	ld	bc,NEXTFREE
	add	hl,bc
	GetWord				;BC=nextfree+NEXTFREE
	ld	d,b
	ld	e,c			;DE=nextfree+NEXTFREE
	inc	hl
	GetWord				;BC=prevfree+NEXTFREE

					;is nextfree==header?

	ld	hl,FreeBHeader		;carry=0
	sbc	hl,de
	jr	nz,seeprev
					;yes, the block is the last one in the list, remove-it
					;BC=prev
	ld	hl,FreeBHeader+2
	ld	(hl),c
	inc	hl
	ld	(hl),b			;header.last=prev

	ld	h,b
	ld	l,c
	ld	bc,FreeBHeader
	PutWord				;prev.next=header
	ret
	
seeprev:				;is prevfree==header?

	ld	hl,FreeBHeader		;carry=0
	sbc	hl,bc
	jr	nz,remove
					;yes, the block is the first one in the list, remove-it
					;DE=next
	ld	hl,FreeBHeader
	ld	(hl),e
	inc	hl
	ld	(hl),d			;header.first=next

	ld	h,d
	ld	l,e
	inc	hl
	inc	hl
	ld	bc,FreeBHeader
	PutWord				;next.prev=header
	ret

remove:					;block is not the first or the last one, simply remove-it

					;store prevfree+NEXTFREE at nextfree+NEXTFREE.prev
	ld	hl,2
	add	hl,de			;HL=nextfree+NEXTFREE+2
	PutWord
					;store nextfree+NEXTFREE at prevfree+NEXTFREE.next
	ld	h,b
	ld	l,c			;HL=prevfree+NEXTFREE
	ld	b,d
	ld	c,e			;BC=nextfree+NEXTFREE
	PutWord
	ret
;
;	AddFree
;
;	adds block to the free blocks list as last one
;
;	HL=block
;
AddFree:
	ld	bc,NEXTFREE
	add	hl,bc		;HL=block+NEXTFREE
	push	hl		;on stack
				;check header
	ld	de,(FreeBHeader+2);DE=lastfree+NEXTFREE (or FreeBHeader)
	ld	hl,FreeBHeader
	xor	a		;carry=0
	sbc	hl,de
	jr	z,empty
				;list is not empty, DE=lastfree+NEXTFREE
				;set lastfree next link
	ld	h,d
	ld	l,e		;HL=lastfree+NEXTFREE
	pop	bc		;BC=block+NEXTFREE
	PutWord
				;set block prev link
	ld	h,b
	ld	l,c
	inc	hl
	inc	hl		;HL=pointer to block.PREVFREE
	push	bc		;block+NEXTFREE on stack
	ld	b,d
	ld	c,e		;BC=lastfree+NEXTFREE
	PutWord
				;set block next link
	pop	hl		;HL=block+NEXTFREE
	ld	bc,FreeBHeader
	PutWord
	dec	hl		;HL=block+NEXTFREE
	ld	(FreeBHeader+2),hl;set FreeBHeader.last
	ret
empty:				;free block list is empty, set new block as the only one
	pop	hl		;HL=block+NEXTFREE
	push	hl		;on stack
	ld	bc,FreeBHeader
	PutWord
	inc	hl
	PutWord
	pop	hl		;hl=block+NEXTFREE
	ld	(FreeBHeader),hl
	ld	(FreeBHeader+2),hl
	ret
;	
;	Alloc dynamic memory in Upper 64KB RAM
;
;	DE=size (without header)
;
;	returns HL (or NULL if no more available memory)
;
AllocDyn:
	ld	hl,HEADERSIZE
	add	hl,de		;add header size
	ex	de,hl		;DE=size+header
	ld	bc,(FreeBHeader);HL=first available block (or FreeBHeader=EOL)
alloc_loop:
	ld	hl,FreeBHeader
	xor	a		;carry=0
	sbc	hl,bc		;if equal to header,
	ret	z		;return-it, no more memory
				;BC=free block+NEXTFREE
	ld	hl,-NEXTFREE
	add	hl,bc		;HL=free block
	push	hl		;free block on stack
	push	de		;size on stack
	GetSIZE			;BC=block size
	pop	de		;DE=size
	ld	h,b
	ld	l,c		;HL=free block size
	xor	a		;carry=0
	sbc	hl,de
	pop	hl		;HL=free block
	jr	c,trynext
	jp	SplitFree	;free block is big enough, split-it
trynext:			;free block is too small, try to get next one
	ld	bc,NEXTFREE
	add	hl,bc
	GetWord			;BC=next free block+NEXTFREE (or FreeBHeader+NEXTFREE)
	jr	alloc_loop
;
;	Free dynamic memory
;
;	HL=addr of the header of block to be deallocated
;	B = type stamp (if check enabled)
;
FreeDyn:
	push	hl		;save block addr
	ld	de,STATUS	;get block status
	add	hl,de
	GetByte
	pop	hl		;restore block addr
IF	CHECK_TYPE
	cp	b
ELSE
	ld	a,c		;should be 0FFH
	inc	a
ENDIF
	ret	nz		;return if status is NOT ALLOCATED
	GetWord			;BC=next block
	dec	hl		;HL=block
	ld	a,c
	or	b
	jr	z,tryprev	;next block is EOL, so try to join with prev block
				;try to join with next block
	push	hl		;block on stack
	ld	h,b
	ld	l,c		;HL=next block, check its status
	push	hl		;next on stack
	ld	bc,STATUS
	add	hl,bc		;HL=next status pointer
	GetByte		
	ld	a,c
	or	a
	jp	z,nextisfree
				;next block not free
	pop	hl		;drop next
	pop	hl		;HL=block
	jp	tryprev		;so try to join the prev block
;
nextisfree:			;is free, so join with next free block
				;next link must be updated
				;prev link is not affected

	pop	hl		;HL=next
	push	hl		;back on stack
	call	RemoveFree	;remove next from free blocks list
	pop	hl		;HL=next
	GetWord			;BC=next.nextblock

	pop	hl		;HL=block
	PutWord			;set block next link	
	dec	hl		;HL=block		
	ld	a,b		;next.nextblock is null?
	or	c		
	jr	z,tryprev	;yes, see prev block
				;not null, set next block prev link (BC=next, HL=block)
	push	hl		;block on stack
	ld	d,b
	ld	e,c		;DE=next
	ld	b,h
	ld	c,l		;BC=block
	ex	de,hl		;HL=next
	inc	hl
	inc	hl
	PutWord			;next.prev = block	
	pop	hl		;HL=block
	
tryprev:			;try to join with prev block

	push	hl		;block on stack
	inc	hl
	inc	hl
	GetWord			;BC=prev block
	ld	a,b
	or	c
	jr	nz,prevnotnull
				;prev block is NULL
addtofree:
	pop	hl		;HL=block
	push	hl		;back on stack
	call	AddFree		;add block to free block's list as the last one
	pop	hl		;HL=block
	jp	markfree
;
prevnotnull:			;prev block is not null, check its status
	push	bc		;prev on stack
	ld	h,b
	ld	l,c		;HL=prev block
	ld	bc,STATUS
	add	hl,bc		;HL=prev status pointer
	GetByte		
	ld	a,c
	or	a
	pop	de		;DE=prev
	jr	nz,addtofree	;prev not free, so add block to the free list, mark-it free	

				;is free, so join with the previous free block
				;prev.next link must be updated
				;prev.prev link is not affected
				;prev free links remain unchanged
				;...so no need to add the block to the free block's list

				;DE=prev block 
	pop	hl		;HL=block
	GetWord			;BC=next
	ex	de,hl		;HL=prev
	PutWord			;set prev.next = next
	dec	hl		;HL=prev=block
	ld	a,b
	or	c		;next is null?
	jr	z,markfree	;yes, go mark free
	push	hl		;block on stack

				;no, set next block prev link (BC=next, HL=block)

	ld	d,b
	ld	e,c		;DE=next
	ld	b,h
	ld	c,l		;BC=block
	ex	de,hl		;HL=next
	inc	hl
	inc	hl
	PutWord			;next.prev = block	
	pop	hl		;HL=block

markfree:
	ld	bc,STATUS
	add	hl,bc
	ld	c,FREE		;free
	PutByte			;set status=free
	ret

;------------------------------------------------------SC108
IF	SC108

MEMP_PORT       equ     38H

;       ROM     0000 to 8000H
;
ROM_OUT_CMD     equ     00000001B
ROM_IN_CMD      equ     00000000B
LOWER_64RAM     equ     00000000B
UPPER_64RAM     equ     10000000B
;
MACRO	LOW_RAM
	ld	a,LOWER_64RAM .or. ROM_OUT_CMD
	out	(MEMP_PORT),a
ENDM

MACRO	UP_RAM
	ld	a,UPPER_64RAM .or. ROM_OUT_CMD
	out	(MEMP_PORT),a	
ENDM

MACRO	ROM_IN
	ld	a,LOWER_64RAM .or. ROM_IN_CMD
	out	(MEMP_PORT),a
ENDM

MACRO	ROM_OUT
	ld	a,LOWER_64RAM .or. ROM_OUT_CMD
	out	(MEMP_PORT),a
ENDM

ENDIF
;---------------------------------------------------SC108

;---------------------------------------------------MM
IF	MM

MM_RAM_P	equ	30H

MM_UP_RAM	equ	1
MM_LOW_RAM	equ	0

MACRO	LOW_RAM
	ld	a,MM_LOW_RAM
	out	(MM_RAM_P),a
ENDM

MACRO	UP_RAM
	ld	a,MM_UP_RAM
	out	(MM_RAM_P),a
ENDM

MM_ROM_P	equ	38H

MM_ROM_IN	equ	0
MM_ROM_OUT	equ	1

MACRO	ROM_IN
	ld	a,MM_ROM_IN
	out	(MM_ROM_P),a
ENDM

MACRO	ROM_OUT
	ld	a,MM_ROM_OUT
	out	(MM_ROM_P),a
ENDM

ENDIF
;------------------------------------------------------MM

;------------------------------------------------------SC108 .or. MM
IF SC108 .or. MM

	psect top

SHARED		equ	0FF63H

;
;	Store shared code to Upper & Lower RAM
;
;	SP must be set at top of TPA 
;
StoreShared:
				;move shared code to Lower RAM
	ld	de,SHARED	;to
	ld	hl,SHARED_START	;from
	ld	bc,SHARED_END - SHARED_START
	ldir
				;move shared code to Upper RAM
	ROM_IN
				;first search at 7F00H
	ld	hl,7F00H
	ld	a,(hl)
	cp	0c3H
	jr	nz,searchscm
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	cp	0c3H
	jr	nz,searchscm
				;found "mover" in CPM BOOT EPROM
	inc	hl
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a		;HL=address of "move 1 byte to upper RAM" routine
	jp	moveit
;
searchscm:
				;search "move 1 byte to upper RAM" routine in SCM
	ld	hl,69H
searchjp:
	ld	a,(hl)
	cp	0c3H
	jr	z,jpfound
	inc	hl
	jr	searchjp
jpfound:
	ld	b,6
searchj7thjp:
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	cp	0c3H
	jr	nz,searchjp
	djnz	searchj7thjp
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ex	de,hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ex	de,hl
	ld	bc,2bH
	add	hl,bc
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ex	de,hl		;HL=LTOUP_SCM
moveit:				
	push	hl
	pop	iy		;IY=SCM function to move A --> UpperRAM in (DE)
	ld	ix,SHARED	;from
	ld	de,SHARED	;to
	ld	a,SHARED_END - SHARED_START
looptoup:
	push	af
	ld	a,(ix+0)
	ld	hl,retadr
	push	hl
	jp	(iy)
retadr:	inc	ix
	inc	de
	pop	af
	dec	a
	jr	nz,looptoup
	ROM_OUT
	ret
;

SHARED_START:
;
;	Read one byte from Upper 64KB RAM
;
;	HL=address of the byte
;
;	returns C=byte
;
;	affects reg A
;
$$ReadByte:
	UP_RAM
	ld	c,(hl)
	LOW_RAM
	ret
;
;	Write one byte to Upper 64KB RAM
;
;	HL=address of the byte
;	C=byte
;
;	affects reg A
;
$$WriteByte:
	UP_RAM
	ld	(hl),c
	LOW_RAM
	ret
;
;	Read one word from Upper 64KB RAM
;
;	HL=address of the byte
;
;	returns BC=word
;
;	affects reg A,HL
;
$$ReadWord:
	UP_RAM
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	LOW_RAM
	ret
;
;	Write one word to Upper 64KB RAM
;
;	HL=address of the byte
;	BC=word
;
;	affects reg A
;
$$WriteWord:
	UP_RAM
	ld	(hl),c
	inc	hl
	ld	(hl),b
	LOW_RAM
	ret
;
;	WriteString to Upper 64KB RAM
;
;	DE=source (in Lower RAM)
;	HL=destination (in Upper RAM)
;
;	Reg C affected
;
$$WriteString:
	ld	a,(de)
	ld	c,a
	UP_RAM
	ld	(hl),c
	LOW_RAM
	ld	a,c
	or	a
	ret	z
	inc	de
	inc	hl
	jr	$$WriteString
;
;	ReadString from Upper 64KB RAM
;
;	HL=source (in Upper RAM)
;	DE=destination (in Lower RAM)
;
;	Reg C affected
;
$$ReadString:
	UP_RAM
	ld	c,(hl)
	LOW_RAM
	ld	a,c
	ld	(de),a
	or	a
	ret	z
	inc	de
	inc	hl
	jr	$$ReadString
;
;	StringLen from Upper 64KB RAM
;
;	HL = string (in Upper RAM)
;
	ld	b,0FFH
$$loop:	UP_RAM
	ld	c,(hl)
	LOW_RAM
	inc	hl
	inc	b
	ld	a,c
	or	a
	jr	nz,$$loop
	ld	h,0
	ld	l,b
	ret
;
;	Read up to 256 bytes from the Upper 64KB RAM
;
;	HL = source (in Upper RAM)
;	DE = dest (in Lower RAM)
;	B = count (256 if 0)
;
;	returns HL=HL+B
;		DE=DE+B
;
$$ReadMem:
	UP_RAM
	ld	c,(hl)
	LOW_RAM
	ld	a,c
	ld	(de),a
	inc	hl
	inc	de
	djnz	$$ReadMem
	ret
;
;	Write up to 256 bytes from the Upper 64KB RAM
;
;	HL = dest (in Upper RAM)
;	DE = source (in Lower RAM)
;	B = count (256 if 0)
;
;	returns HL=HL+B
;		DE=DE+B
;
$$WriteMem:
	ld	a,(de)
	ld	c,a
	UP_RAM
	ld	(hl),c
	LOW_RAM
	inc	hl
	inc	de
	djnz	$$WriteMem
	ret
;
;	Fill with 00H in Upper 64KB RAM
;
;	HL = start
;	B = count
;
$$FillZero:
	UP_RAM
	xor	a
1:	ld	(hl),a
	inc	hl
	djnz	1b
	LOW_RAM
	ret
;	
SHARED_END:			;at 0FFF6H

ENDIF
;------------------------------------------------------SC108 .or. MM

	psect text
;
;	Get available memory size in KB
;
;	_GetTotalFree
;
;	returns HL=total amount of free memory in KB
;
_GetTotalFree:

	call	__GetTotalFree	;DE=total free bytes
	srl	d
	srl	d		;D=#KB in upper RAM
	ld	l,d
	ld	h,0		;HL=#KB in lower & upper RAM
	ret
;
;	Returns DE=total size of Upper RAM free memory
;
__GetTotalFree:
	ld	de,0		;total
	ld	bc,(FreeBHeader);HL=first available block (or FreeBHeader=EOL)
get_loop:
	ld	hl,FreeBHeader
	xor	a		;carry=0
	sbc	hl,bc		;if equal to header,
	ret	z		;return, no more memory
				;BC=free block+NEXTFREE
	ld	hl,-NEXTFREE
	add	hl,bc		;HL=free block
	push	de
	GetSIZE			;BC=size
	pop	de
	ex	de,hl
	add	hl,bc		;add to total
	ex	de,hl
	ld	bc,NEXTFREE
	add	hl,bc
	GetWord			;BC=next free block+NEXTFREE (or FreeBHeader+NEXTFREE)
	jr	get_loop
;
;	_Alloc
;
;	Allocate dynamic memory
;	HL = size
;	B = object type stamp (if type check enabled)
;	returns HL = virtual pointer or NULL
;
_Alloc:
IF	CHECK_TYPE
	ld	a,b
	ld	(TypeStamp),a
ENDIF
	push	hl		;size on stack
	ex	de,hl		;DE = size
	call	AllocDyn
	pop	de		;E=size
	ld	a,h
	or	l
	ret	z		;AllocDyn failed, no more available memory
				;AllocDyn ok
	ld	bc,HEADERSIZE	;add the size of header
	add	hl,bc
	ld	b,e		;B=size
	push	hl		;save pointer
	ld	c,0		;fill buffer with 0
fillz:	PutByte
	inc	hl
	djnz	fillz
	pop	hl		;HL=pointer
	ret
;
;	Free dynamic memory
;	B = object type stamp (if type checking enabled)
;	HL = virtual pointer
;
_Free:
IF	CHECK_POINTER
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp	b
ELSE
	cp	0FFH
ENDIF
	jr	z,1f
	pop	hl
IF	CHECK_TYPE
	jp	PrintErrTypeHL
ELSE
	jp	PrintErrHL
ENDIF
1:	inc	hl
ENDIF
	or	a		;carry=0			
	ld	de,HEADERSIZE	
	sbc	hl,de		;HL=addr of block header, B = object type stamp (if type checking enabled)
	jp	FreeDyn
;
;	GetString
;	Get string (destination is in Lower RAM)
;	HL = source virtual pointer, DE = dest
;	
_GetString:
IF	CHECK_POINTER
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp	b
ELSE
	cp	0FFH
ENDIF
	jr	z,1f
	pop	hl
	jp	PrintErrHL
1:	inc	hl
ENDIF
	jp	$ReadString
;
;	PutString
;	Put string (source is in Lower RAM)
;	HL = dest virtual pointer, DE = source
;	
_PutString:
IF	CHECK_POINTER
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp	b
ELSE
	cp	0FFH
ENDIF
	jr	z,1f
	pop	hl
	jp	PrintErrHL
1:	inc	hl
ENDIF
	jp	$WriteString
;
;	StringLen
;	Get string length
;	HL = string virtual pointer
;	return HL
;
_StringLen:
IF	CHECK_POINTER
	dec	hl
	GetByte
	ld	a,c
	cp	0FFH
	jr	z,1f
	pop	hl
	jp	PrintErrHL
1:	inc	hl
ENDIF
	jp	$StringLen
;
;	PutByte
;	HL = dest virtual pointer, C = offset, A = byte
;	B = object type stamp (if type checking enabled)
;	dest is in Upper RAM
;
_PutByte:
IF	CHECK_POINTER
	ld	e,a		;save byte in E
	ld	d,c		;save offset in D
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp	b
ELSE
	cp	0FFH
ENDIF
	ld	c,d		;restore offset
	jr	z,1f
	pop	hl
IF	CHECK_TYPE
	jp	PrintErrTypeHL
ELSE
	jp	PrintErrHL
ENDIF
1:	inc	hl
	ld	a,e		;restore byte
ENDIF
	ld	b,0		;BC=offset
	add	hl,bc		;HL=dest+offset
	ld	c,a		;C=byte		
	jp	$WriteByte
;
;	GetByte
;	HL = dest virtual pointer, C = offset
;	B = object type stamp (if type checking enabled)
;	returns A
;	source is in Upper RAM
;
_GetByte:
IF	CHECK_POINTER
	ld	d,c		;save offset
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp	b
ELSE
	cp	0FFH
ENDIF
	ld	c,d		;restore offset
	jr	z,1f
	pop	hl
IF	CHECK_TYPE
	jp	PrintErrTypeHL
ELSE
	jp	PrintErrHL
ENDIF
1:	inc	hl
ENDIF
	ld	b,0
	add	hl,bc		;HL=source+offset
	call	$ReadByte
	ld	a,c
	ret
;
;	PutWord
;	HL = dest virtual pointer, C = offset, DE = word
;	B = object type stamp (if type checking enabled)
;
;	dest is in Upper RAM
;
_PutWord:
IF	CHECK_POINTER
	push	bc		;save offset
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp	b
ELSE
	cp	0FFH
ENDIF
	pop	bc		;restore offset
	jr	z,1f
	pop	hl
IF	CHECK_TYPE
	jp	PrintErrTypeHL
ELSE
	jp	PrintErrHL
ENDIF
1:	inc	hl
ENDIF
_PutWordNoCheck:
	ld	b,0
	add	hl,bc
	ld	b,d
	ld	c,e		;HL=dest+offset, BC=word
	jp	$WriteWord
;
;	GetWord
;	HL = dest virtual pointer, C = offset;
;	B = object type stamp (if type checking enabled)
;	returns BC
;	source is in Upper RAM
;
_GetWord:
IF	CHECK_POINTER
	ld	d,c		;save offset
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp 	b
ELSE
	cp	0FFH
ENDIF
	ld	c,d		;restore offset
	jr	z,1f
	pop	hl
IF	CHECK_TYPE
	jp	PrintErrTypeHL
ELSE
	jp	PrintErrHL
ENDIF
1:	inc	hl
ENDIF
_GetWordNoCheck:
	ld	b,0
	add	hl,bc		;HL=source+offset
	call	$ReadWord
	ld	h,b
	ld	l,c
	ret
;
;	ReadMem
;	HL = source virtual pointer, DE = dest, C = size
;	B = object type stamp (if type checking enabled)
;	source is in Upper RAM
;	destination is in Lower RAM
;
_ReadMem:
IF	CHECK_POINTER
	push	bc		;save size
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp	b
ELSE
	cp	0FFH
ENDIF
	pop	bc		;restore size
	jr	z,1f
	pop	hl
IF	CHECK_TYPE
	jp	PrintErrTypeHL
ELSE
	jp	PrintErrHL
ENDIF
1:	inc	hl
ENDIF
	ld	b,c		;B=count
	jp	$ReadMem
;
;	WriteMem
;	HL = dest virtual pointer, DE = source, C = size
;	B = object type stamp (if type checking enabled)
;	source is in Lower RAM
;	destination is in Upper RAM
;
_WriteMem:
IF	CHECK_POINTER
	push	bc		;save size
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp	b
ELSE
	cp	0FFH
ENDIF
	pop	bc		;restore size
	jr	z,1f
	pop	hl
IF	CHECK_TYPE
	jp	PrintErrTypeHL
ELSE
	jp	PrintErrHL
ENDIF
1:	inc	hl
ENDIF
	ld	b,c		;B=count
	jp	$WriteMem
;
;	FillZero
;	HL = dest virtual pointer, C = count
;	B = object type stamp (if type checking enabled)
;
_FillZero:
IF	CHECK_POINTER
	ld	d,c		;save count
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp	b
ELSE
	cp	0FFH
ENDIF
	ld	c,d		;restore count
	jr	z,1f
	pop	hl
IF	CHECK_TYPE
	jp	PrintErrTypeHL
ELSE
	jp	PrintErrHL
ENDIF
1:	inc	hl
ENDIF
	ld	b,c		;B=count
	jp	$FillZero
;
;	IsValid (is in extended memory?)
;	HL=virtual pointer
;	B = object type stamp (if type checking enabled)
;	returns A=1: OK, 0: Not in extended memory
;
_IsValid:
	dec	hl
	GetByte
	ld	a,c
IF	CHECK_TYPE
	cp	b
ELSE
	cp	0FFH
ENDIF
	ld	a,1
	ret	z
	dec	a
	ret
;
ENDIF
;--------------------------------------------------------------------------------------2X64K

;--------------------------------------------------------------------------------------?512K .or. ?Z80ALL
IF	?512K .or. ?Z80ALL

IF	?512K
Buf16K		equ	4000H	;address of dynamic memory bank
BANKS_CNT	equ	28	;28 banks of 16KB each are available (total 448 KB)
MAX_SIZE	equ	10	;max block = 4000H
ELSE
Buf32K		equ	0000H	;address of dynamic memory bank
BANKS_CNT	equ	2	;2 banks of 32KB each are available
MAX_SIZE	equ	11	;max block = 8000H
ENDIF

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
L0:	defs	4*BANKS_CNT	;L0 bank0,L0 bank1,...L0 bank27
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
IF	?Z80ALL
L11:	defs	4*BANKS_CNT
ENDIF
;
Lists:	defs	LISTS_NR*2*BANKS_CNT	;bank0(L0,L1,...L10),bank1(L0+4,L1+4,...L10+4)... 
;
Buddy:	defs	LISTS_NR*2
;
;	Maximum Available
;	contains (Size+1) if available, or zero if unavailable
;
MaxAv:	defs	BANKS_CNT

	psect top

;	_InitDynM
;
;	Init dynamic memory
;
_InitDynM:
IF	CHECK_POINTER
	ld  	hl,(1)		;fetch BIOS console routines
	inc 	hl
	inc 	hl
	inc 	hl
	ld  	de,BiosConst
	ld  	bc,9
	ldir
ENDIF
				;init list headers for each bank
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
;				;fill each bank with 0
	ld	de,BANKS_CNT	;D=0,E=counter
filll:
	ld	a,d
IF	?512K
	add	a,32+4
	out	(79H),a		;select physical RAM bank number A in logical bank 1 (4000-8000)
	ld	hl,Buf16K
ELSE
	inc	a
	out	(1FH),a		;select physical RAM bank number A in logical bank 0000-8000
	ld	hl,Buf32K
ENDIF
	xor	a
IF	?512K
	ld	c,40H		;4000H = 40H x 100H
ELSE
	ld	c,80H		;8000H = 80H x 100H
ENDIF
4:	ld	b,0
3:	ld	(hl),a
	inc	hl
	djnz	3b
	dec	c
	jr	nz,4b
				;next bank
	inc	d
	dec	e
	jr	nz,filll
				;init largest block list headers for each bank
	ld	b,BANKS_CNT
	xor	a
IF	?512K
	ld	hl,L10		;HL=L10 lists header
ELSE
	ld	hl,L11		;HL=L11 lists header
ENDIF
initLMAX:
	push	af
	push	bc
	push	hl
IF	?512K
	add	a,32+4
	out	(79H),a		;select physical RAM bank number A in logical bank 1 (4000-8000)
	ld	de,Buf16K
	call	__AddToL	;add DE to HL header
	ld	hl,Buf16K+OFF_STS;HL=pointer of block status
ELSE
	inc	a
	out	(1FH),a		;select physical RAM bank number A in logical bank 0000-8000
	ld	de,Buf32K
	call	__AddToL	;add DE to HL header
	ld	hl,Buf32K+OFF_STS;HL=pointer of block status
ENDIF
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
	ld	b,BANKS_CNT
	ld	hl,MaxAv
	ld	a,MAX_SIZE+1
loopav:	ld	(hl),a
	inc	hl
	djnz	loopav

IF	?Z80ALL
	xor 	a		;A=0
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
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
IF	?512K
	and	3FH		;keep it <= 3FH
ELSE
	and	7FH		;keep it <= 7FH
ENDIF
	or	a
	jr	z,1f
				;high part != 0
IF	?Z80ALL
	ld	c,11		;prepare bSize for 8000H
	bit	6,a
	ret	nz		;if bit#14=1 return 11 for 8000H
	dec	c		;C=10
ELSE
	ld	c,10		;prepare bSize for 4000H
ENDIF
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
;Virtual Pointer to allocated buffer (size = 10H to 8KB))
;
;1aaaaaaa aaabbbbb : for 512K
;1aaaaaaa aaaa000b : for Z80ALL
;where
;            bbbbb : 0 to 28 = virtual RAM bank 
;				(Physical RAM bank = 32 + 4 + virtual RAM bank for 512K)
;		 b : 0 or 1 = virtual RAM bank
;				(Physical RAM bank = 1 + virtual RAM bank for Z80ALL)
;00aaaaaa aaaa0000 : 0000H to 3FF0H for 512K = offset in RAM bank
;0aaaaaaa aaaa0000 : 0000H to 7FF0H for Z80ALL = offset in RAM bank
;
;	Converts bank & offset to virtual pointer
;
;	A = virtual bank 
;	HL = offset in RAM bank 
;
;	returns HL = virtual pointer
;
ToVirtual:
IF	?512K
	sla	l		;shift HL left 1 bit
	rl	h
ENDIF
	or	l
	ld	l,a		
	set	7,h
	ret
;
;	Converts virtual pointer to bank & offset
;
;	HL = virtual pointer 
;
;	returns A = virtual bank 
;		HL = offset 
;
FromVirtual:
	ld	b,l
	ld	a,l
IF	?512K
	and	0E0H
ELSE
	and	0F0H
ENDIF
	ld	l,a		
	res	7,h
IF	?512K
	srl	h		;shift HL rigth 1 bit
	rr 	l
ENDIF
	ld	a,b		
IF	?512K
	and	1FH
ELSE
	and	1
ENDIF		
	ret
;
;	AdjustAddr
;
;	HL = virtual pointer
;	selects the correct RAM bank
;	returns HL = real address to data
;
AdjustAddr:
IF	CHECK_POINTER
	bit	7,h
	jr	nz,1f
	pop	hl
	pop	hl
	jp	PrintErrHL
1:
ENDIF
	call	FromVirtual
				;A = virtual bank (bbbbb = 0...27)
				;HL = offset (00aaaaaa aaaa0000)
IF	?512K
	add	a,32+4
	out	(79H),a		;select physical RAM bank number A in logical bank 1 (4000H-8000H)
	set	6,h		;adjust offset to 4000H+offset
ELSE
	inc	a
	out	(1FH),a
ENDIF
IF	CHECK_POINTER
	ld	a,l
	add	a,OFF_STS
	ld	l,a
	ld	a,(hl)
	cp	0FFH
	jr	z,2f
	pop	hl
	pop	hl
IF	?Z80ALL
	ld	a,0
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	jp	PrintErrHL
2:
	inc	l
	inc	l
	ret
ELSE
	ld	a,l		;add 6=OFF_DATA
	add	a,OFF_DATA
	ld	l,a		;now HL points to data part
	ret
ENDIF
;
;	Get available memory size in KB
;
;	_GetTotalFree
;
;	returns HL=total amount of free memory in KB
;
_GetTotalFree:
	ld	iy,0		;IY=grand total
	ld	bc,BANKS_CNT	;B = CARRY = 0, C = banks counter
bigloop:
	ld	ix,0		;IX=crt bank total
	push	bc		;save BC
	ld	a,BANKS_CNT
	sub	c		;A=crt bank (0,1...)
IF	?512K
	add	a,32+4
	out	(79H),a		;select physical RAM bank number A in logical bank 1 (4000-8000)
	sub	32+4		;A=crt bank (0,1...)
ELSE
	inc	a
	out	(1FH),a
	dec 	a
ENDIF
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
IF	?Z80ALL
	xor 	a		;A=0
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	_Alloc
;
;	Allocate dynamic memory
;	HL = size
;	returns HL = virtual pointer or NULL
;
_Alloc:
	ld	bc,OFF_DATA	;add 6 to size
	add	hl,bc
	ld	b,h
	ld	c,l		;BC=size
	call	__allocS	;C=bSize
	ld	b,BANKS_CNT	;B=banks counter
	ld	hl,MaxAv	;HL=MaxAv vector
loop:
				;compare bSize ? MaxAv[bank]
	ld	a,c
	cp	(hl)		;bSize ? MaxAv[bank]
	jr	c,try		;if < , try to allocate in this bank
	jr	toobig		;if >= , it's too big, try to allocate in the next bank
try:
	ld	a,BANKS_CNT
	sub	b		;try to allocate in this bank (A=bank nr)
IF	?512K
	add	a,32+4 		;select physical RAM bank number A in logical bank 2 (8000-C000)
	out	(79H),a
	push	hl		;save MaxAv
	push	bc		;B=banks counter, C=bSize on stack
	sub	32+4		;A=current bank nr. (0,1,...27)
ELSE
	inc	a 		;select physical RAM bank number A in 0000-8000
	out	(1FH),a
	push	hl		;save MaxAv
	push	bc		;B=banks counter, C=bSize on stack
	dec	a		;A=current bank nr. (0,1)
ENDIF
	call	__alloc		;try to alloc
IF	?Z80ALL
	ld	a,0
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
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
	ret
;
alloc_ok:			;HL=allocated block
IF	?512K
	res	6,h		;-4000H
ENDIF
	pop	bc		;B=banks counter
	pop	de		;drop MaxAv
	ld	a,BANKS_CNT
	sub	b		;A=current bank nr.
	jp	ToVirtual	;return HL=virtual pointer
;
;	Allocate a memory block of given size
;
;	called under DI
;	A=current bank nr. (0,1,...27)
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
				;A=current bank nr. (0,1,...27)
	ld	de,LISTS_NR*2	;DE=LISTS_NR*2
	ld	iy,Lists
	ld	b,5		;how many times to shift A
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
IF	CHECK_POINTER
	bit	7,h
	jr	nz,1f
	pop	hl
	jp	PrintErrHL
1:
ENDIF
	call	FromVirtual	;HL = offset, A = bank (0...27 or 0..1)
		;A=physical RAM bank counter (36...63 or 2,3)
IF	?512K
	add	32+4
	out	(79H),a		;select physical RAM bank number A in logical bank 1 (4000-8000)
	sub	32+4		;A=current bank nr. (0,1,...27)
	set	6,h		;adjust offset to 4000H+offset
ELSE
	inc	a		;A=1 or 2
	out	(1FH),a
	dec	a		;A=0 or 1
ENDIF
IF	CHECK_POINTER
	ld	a,l
	add	a,OFF_STS
	ld	l,a
	ld	a,(hl)
	cp	0FFH
	jr	z,2f
	pop	hl
IF	?Z80ALL
	ld	a,0
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	jp	PrintErrHL
2:
	ld	a,l
	sub	OFF_STS
	ld	l,a
ENDIF
	ex	de,hl		;DE=Buf
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
;	A=current bank nr. (0,1,...27)
;	Local variables : DE = Element, 
;			C=CrtSize, 
;			IY=Lists[crt.bank],
;	Affected regs: A,BC,DE,HL,IY
;	IX not affected
;
				;compute IY=Lists+(crt.bank)*(LISTS_NR*2)
				;A=current bank nr. (0,1,...27)
	ld	de,LISTS_NR*2	;DE=LISTS_NR*2
	ld	iy,Lists
	ld	b,5		;how many times to shift A
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
IF	?Z80ALL
	xor	a
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	GetString
;	Get string (destination is in Lower RAM)
;	HL = source virtual pointer, DE = dest
;	
_GetString:
	call	AdjustAddr
2:				;HL=source, DE=dest
	ld	a,(hl)
	ld	(de),a
	inc	hl
	inc	de
	or	a		;if end-of-string
	jr	nz,2b
IF	?Z80ALL
				;A=0
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	PutString
;	Put string (source is in Lower RAM)
;	HL = dest virtual pointer, DE = source
;	
_PutString:
	call	AdjustAddr
2:				;HL=dest, DE=source
	ld	a,(de)
	ld	(hl),a
	inc	de
	inc	hl
	or	a		;if end-of-string
	jr	nz,2b
IF	?Z80ALL
				;A=0
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	StringLen
;	Get string length
;	HL = string virtual pointer
;	return HL
;
_StringLen:
	call	AdjustAddr
	ld	b,0FFH
2:	ld	a,(hl)
	inc	hl
	inc	b
	or	a
	jr	nz,2b
	ld	h,a
	ld	l,b
IF	?Z80ALL
				;A=0
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	PutByte
;	HL = dest virtual pointer, C = offset, A = byte
;	dest is in Upper RAM
;
_PutByte:
	ld	e,a
	call	AdjustAddr
	ld	b,0		;BC=offset
	add	hl,bc		;HL=dest+offset
	ld	(hl),e
IF	?Z80ALL
	xor	a
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	GetByte
;	HL = dest virtual pointer, C = offset
;	returns A
;	source is in Upper RAM
;
_GetByte:
	call	AdjustAddr
	ld	b,0		;BC=offset
	add	hl,bc		;HL=dest+offset
	ld	c,(hl)
IF	?Z80ALL
	xor	a
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ld	a,c
	ret
;
;	PutWord
;	HL = dest virtual pointer, C = offset, DE = word
;
;	dest is in Upper RAM
;
_PutWord:
_PutWordNoCheck:
	call	AdjustAddr
	ld	b,0		;BC=offset
	add	hl,bc		;HL=dest+offset
	ld	(hl),e
	inc	hl
	ld	(hl),d
IF	?Z80ALL
	xor	a
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	GetWord
;	HL = dest virtual pointer, C = offset;
;	returns BC
;	source is in Upper RAM
;
_GetWord:
_GetWordNoCheck:
	call	AdjustAddr
	ld	b,0		;BC=offset
	add	hl,bc		;HL=dest+offset
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
IF	?Z80ALL
	xor	a
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	ReadMem
;	HL = source virtual pointer, DE = dest, C = size
;	source is in Upper RAM
;	destination is in Lower RAM
;
_ReadMem:
	call	AdjustAddr
	ld	b,c		;B= count
1:	ld	a,(hl)
	ld	(de),a
	inc	hl
	inc	de
	djnz	1b
IF	?Z80ALL
	xor	a
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	WriteMem
;	HL = dest virtual pointer, DE = source, C = size
;	source is in Lower RAM
;	destination is in Upper RAM
;
_WriteMem:
	call	AdjustAddr
	ld	b,c		;B= count
1:	ld	a,(de)
	ld	(hl),a
	inc	hl
	inc	de
	djnz	1b
IF	?Z80ALL
	xor	a
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	FillZero
;	HL = dest virtual pointer, C = count
;
_FillZero:
	call	AdjustAddr
	ld	b,c		;B= count
	xor	a
1:	ld	(hl),a
	inc	hl
	djnz	1b
IF	?Z80ALL
	xor	a
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ret
;
;	IsValid (is in extended memory?)
;	HL=virtual pointer
;	returns A=1: OK, 0: Not in extended memory
;
_IsValid:
	bit	7,h
	jr	nz,1f
	xor	a
	ret
1:
	call	FromVirtual
				;A = virtual bank (bbbbb = 0...27)
				;HL = offset (00aaaaaa aaaa0000)
IF	?512K
	add	a,32+4
	out	(79H),a		;select physical RAM bank number A in logical bank 1 (4000H-8000H)
	set	6,h		;adjust offset to 4000H+offset
ELSE
	inc	a
	out	(1FH),a
ENDIF
	ld	a,l
	add	a,OFF_STS
	ld	l,a
	ld	a,(hl)
	cp	0FFH
IF	?Z80ALL
	ld	a,0
	out	(1FH),a		;bank 0 back to 0000-8000
ELSE
	ld	a,32+1
	out	(79H),a		;select physical RAM bank number 33 in logical bank 1 (4000-8000)
ENDIF
	ld	a,1
	ret	z
	dec	a
	ret
;
ENDIF
;--------------------------------------------------------------------------------------?512K .or. ?Z80ALL
