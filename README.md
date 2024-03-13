# Cowgol_on_CP_M
Cowgol, C & assembler development environment hosted on Z80 computers running CP/M
-------------------------------------------------------------------
(updated on March 13, 2024)

Cowgol is a programming language for very small systems, including Z80 computers ( see https://github.com/davidgiven/cowgol ).

A small Cowgol programming language manual is included.

You will find here a complete Cowgol development environment, hosted on CP/M, for Z80 computers.

To compile Cowgol source files (and, optionally, C and assembler files), or to build an executable starting from Cowgol source files (and, optionally, C & assembler files), the following command is used:

     >COWGOL [-C] [-Mmapfile] [-Lfile] [-O] source1.cow [ source2.cow | source.c | source.as ] ...

More than one source file may be specified (with extensions: .cow = cowgol source file, .c = C source file, .as = assembler source file)

The first file must be a Cowgol source file.

If more than one Cowgol source files are used, the first one will give the name of the executable being built, but the last one must contain the 'main' code.

C and assembler routines may be called from the cowgol source files.

If you want just to compile/assemble the files, the option -C must be used. 

If the option -C is not specified, the files will be first compiled/assembled, then linked into a CP/M executable (named after the first file in the list).

The option -Mmapfile builds a memory map for the executable.

The option -Lfile adds the file "libfile.lib" to the list of files used as input by the LINK linker.

The option -O instructs COWFIX to perform various code optimizations in the file that will be assembled by Z80AS. 
This may help also in case of big Cowgol programs, by letting COWFIX to comment-out unused labels and allowing Z80AS to process very large source files.

HiTech's LINK is used to link the object files and build the final executable.

The following executables are needed:
 - $EXEC.COM , the "batch processor" from the HiTech's C compiler, who launches all the subsequent executables from the Cowgol toolchain
 - COWGOL.COM (a modified variant of the HiTech's C.COM), the component that interprets the command line and feeds into $EXEC run requests for the subsequent executables from the Cowgol toolchain
 - COWFE.COM , the "cowgol front end", who parses the source file, part of the Cowgol compiler, optimized 
 - COWBE.COM , the "cowgol back end", who builds the "cowgol object file", part of the Cowgol compiler, optimized
 - COWLINK.COM , the "cowgol linker", who binds all the "cowgol object files" and outputs a Z80 assembler file, part of the Cowgol compiler, optimized
 - COWFIX.COM , interface to Z80AS , who transforms the Cowlink output to a syntax accepted by Z80AS and performs code optimizations
 - Z80AS.COM ( see https://github.com/Laci1953/Z80AS ), the assembler, who assembles the output of Cowfix and any assembler file included in the command line, producing HiTech compatible object files
 - LINK.COM , the HiTech's linker, who builds the final executable, using as input the object files and, if requested, the library file and producing the final executable
 - CPP.COM , the HiTech's C pre-processor (needed only when C source files will be compiled)
 - P1.COM , the HiTech's C compiler pass 1 (needed only when C source files will be compiled)
 - CGEN.COM , the HiTech's C compiler pass 2 (needed only when C source files will be compiled)
 - OPTIM.COM , the HiTech's C compiler optimizer (needed only when C source files will be compiled)

Also, the library file "cowgol.coo" must be present.

The EXE folder contains the executables (as HEX files, ready to be LOAD-ed) and the source files for the Cowgol command line processor (cowgol.c) and for Cowfix(cowfix.c and fix.as).

The INCLUDE folder contains the include files and the library file cowgol.coo

The GAMES folder contains some old computer games, rewritten in Cowgol.

The EXAMPLES folder contains examples of compilation sessions.

# Optimized Cowgol executables
------------------------------

The COWFE, COWBE and COWLINK contained in the EXE folder are optimized versions of the originals.

You may find in the "Optimized compiler" folder the modified assembler source files of these executables.

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

This optimized version of Cowgol compiler runs on all 64KB RAM Z80 computers.

# COWGOL for Z80 computers provided with 128/512 KB RAM
-------------------------------------------------------

The Cowgol compiler fails to compile large cowgol source files.

That is caused by the small amount of RAM memory available to the compiler to store the data structures involved in the compilation.

For sources larger than a few hundred lines, the first step of the compiler issuess a fatal error message: "Out of memory".

I solved the problem, at least for the Z80-based computers provided with 128/512 KB RAM, including computers running CP/M under ROMWBW.

I modified the first step of the compiler (COWFE.COM), enabling-it to store part of the data on the "extended" RAM space, beyond the "main" 64KB.

The new compiler components are in the 128_512_KB folder.

All the games from the GAMES folder need to be compiled using this enhanced version of the Cowgol compiler, on a 128/512 KB RAM Z80 computer.

# Examples of Cowgol programs
-----------------------------

You may find a lot of interesting Cowgol programs here: https://rosettacode.org/wiki/Category:Cowgol

Select one of the 164 programs, then select on the left panel the Cowgol language, and you will see the source code of the program.

