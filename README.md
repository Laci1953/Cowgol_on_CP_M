# Cowgol_on_CP_M
Cowgol, C & assembler development environment hosted on Z80 computers running CP/M
-------------------------------------------------------------------
(updated on March 12, 2024)

Cowgol is a programming language for very small systems, including Z80 computers ( see https://github.com/davidgiven/cowgol ).

A small Cowgol programming language manual is included.

You will find here a complete Cowgol development environment, hosted on CP/M, for Z80 computers.

To compile Cowgol source files (and, optionally, C and assembler files), or to build an executable starting from Cowgol source files (and, optionally, C & assembler files), the following command is used:

COWGOL [-C] [-Mmapfile] [-Lfile] [-O] source1.cow [ source2.cow | source.c | source.as ] ...

More than one source file may be specified (with extensions: .cow = cowgol source file, .c = C source file, .as = assembler source file)

The first file must be a Cowgol source file.

If more than one Cowgol source files are used, the first one will give the name of the executable being built, but the last one must contain the 'main' code.

C and assembler routines may be called from the cowgol source files.

If you want just to compile/assemble the files, the option -C must be used. 

If the option -C is not specified, the files will be first compiled/assembled, then linked into a CP/M executable (named after the first file in the list).

The option -Mmapfile builds a memory map for the executable.

The option -Lfile adds the file "libfile.lib" to the link list.

The option -O instructs COWFIX to perform various code optimizations in the file that will be assembled by Z80AS. 
This may help also in case of big Cowgol programs, by letting COWFIX to comment-out unused labels and allowing Z80AS to process very large source files.

HiTech's LINK is used to link the object files.

The following executables are needed:
 - $EXEC.COM , the "batch processor" from the HiTech's C compiler, who launches all the subsequent executables from the Cowgol toolchain
 - COWGOL.COM (a modified variant of the HiTech's C.COM), the component that interprets the command line and feeds into $EXEC run requests for the subsequent executables from the Cowgol toolchain
 - COWFE.COM , the "cowgol front end", who parses the source file, part of the Cowgol compiler 
 - COWBE.COM , the "cowgol back end", who builds the "cowgol object file", part of the Cowgol compiler 
 - COWLINK.COM , the "cowgol linker", who binds all the "cowgol object files" and outputs a Z80 assembler file, part of the Cowgol compiler
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

# COWGOL for Z80 computers provided with 128/512 KB RAM
-------------------------------------------------------

The original version of the compiler fails to compile large cowgol source files.

That is caused by the small amount of RAM memory available to the compiler to store the data structures involved in the compilation.

For sources larger than a few hundred lines, the first step of the compiler issuess a fatal error message: "Out of memory".

I solved the problem, at least for the Z80-based computers provided with 128/512 KB RAM, including computers running CP/M under ROMWBW.

I modified the first step of the compiler (COWFE.COM), enabling-it to store part of the data on the "extended" RAM space, beyond the "main" 64KB.

The new compiler components are in the 128_512_KB folder.

All the games from the GAMES folder need to be compiled using this enhanced version of the Cowgol compiler, on a 128/512 KB RAM Z80 computer.

# Optimized version of Cowgol compiler
--------------------------------------

Cowfe, Cowbe and Cowlink were optimized.

See folder "Optimized compiler"

For each ot these components, the source files, the executable (HEX) and the makefile are included.

# Examples of Cowgol programs
-----------------------------

You may find a lot of interesting Cowgol programs here: https://rosettacode.org/wiki/Category:Cowgol

Select one of the 164 programs, then select on the left panel the Cowgol language, and you will see the source code of the program.

