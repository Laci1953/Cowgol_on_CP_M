Here you will find the source code of the optimized version of the Cowgol compiler.

Cowfe, Cowbe and Cowlink were optimized.

For each ot these components, the source files and the makefile are included.

In the source files, you will notice a lot of comments (lines containing ";" )
These are inserted by Cowfix to show what changes he made to the original source file.

Examples:

1.
;	jp nz, c01_000c
;	ret
;c01_000c:
	ret z

means that the 3 statements "commented-out" were replaced by "ret z".

2.
	; print_nl workspace at ws+1432 length ws+0
f10_print_nl:
	ld a,10
	jp   f7_print_char ;	call f7_print_char
;end_f10_print_nl:
;	ret

means that the lines 

	call f7_print_char
	ret

were substituted by the line "jp   f7_print_char"

3.
	jp nz, c01_0014 ; c01_001f
...
c01_001f:
	jp c01_0014

means that the jump-to-jump c01_001f --> c01_0014

	jp nz, c01_001f
...
c01_001f:
	jp c01_0014

was solved by inserting the correct final jump address " jp nz, c01_0014"

4.
	call f11_UIToA
;	ld (ws+1450), hl
;	ld (ws+1452), hl

means that the two "ld" instructions were "commented out", because the addresses ws+1450 and ws+1452 are never accessed for read.

5.
  ...
	sbc hl,de
;	ld (ws+1414), hl
;end_f32_StrLen:
;	ld hl, (ws+1414)
	ret

means that the two "ld" were commented out, they are useless, because the routine just wants to return HL...

6.
  ...
	jp nc, c01_00c3
;c01_00c2:
	ld de,4
  ...

means that "c01_00c2" was commented out, because it's a "dead" label (no jumps or calls are directed to this label)

The gain is significant:
- smaller size (e.g. Cowfe is 1KB and half smaller)
- 10 to 20% faster

This optimized version runs on all 64KB RAM Z80 computers.

However, to compile large Cowgol sources, you will need to use the Cowgol compiler from the 128_512_KB folder, on a Z80 computer provided with more RAM (128/512 KB).
