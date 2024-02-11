# Cowgol_on_CP_M
Cowgol, C & assembler development environment hosted on Z80 computers running CP/M
-------------------------------------------------------------------
(updated on February 11, 2024)

Cowgol is a programming language for very small systems, including Z80 computers ( see https://github.com/davidgiven/cowgol ).

You will find here a complete Cowgol development environment, hosted on CP/M, for Z80 computers.

To compile Cowgol source files (and, optionally, C and assembler files), or to build an executable starting from Cowgol source files (and, optionally, C & assembler files), the following command is used:

COWGOL [-C] [-Mmapfile] [-Lfile] source1.cow [ source2.cow | source.c | source.as ] ...

More than one source file may be specified (with extensions: .cow = cowgol source file, .c = C source file, .as = assembler source file)

The first file must be a Cowgol source file (it contains the "main").

C and assembler routines may be called from the cowgol source files.

If you want just to compile/assemble the files, the option -C must be used. 

If the option -C is not specified, the files will be first compiled/assembled, then linked into a CP/M executable (named after the first file in the list).

The option -M builds a memory map for the executable.

The option -Lfile adds the file "libfile.lib" to the link list.

HiTech's LINK is used to link the object files.

The following executables are needed:
 - $EXEC.COM , the "batch processor" from the HiTech's C compiler
 - COWGOL.COM , the component that launches all other executables (a modified variant of the HiTech's C.COM)
 - COWFE.COM , part of the Cowgol compiler (a modified variant of the original COWFE written by David Given)
 - COWBE.COM , part of the Cowgol compiler (a modified variant of the original COWBE written by David Given)
 - COWLINK.COM , part of the Cowgol compiler (a modified variant of the original COWLINK written by David Given)
 - COWFIX.COM , interface to Z80AS (transforms the COWLINK's output to a syntax accepted by Z80AS)
 - Z80AS.COM , the assembler ( see https://github.com/Laci1953/Z80AS )
 - LINK.COM , the HiTech's linker
 - CPP.COM , the HiTech's C pre-processor
 - P1.COM , the HiTech's C compiler pass 1
 - CGEN.COM , the HiTech's C compiler pass 2
 - OPTIM.COM , the HiTech's C compiler optimizer

Also, the library file "cowgol.coo" must be present.

The EXE folder contains the executables.

See "Dynamic_allocation_in_Cowgol.txt" for details related to the use of dynamic allocation functions from Cowgol.

The INCLUDE folder contains the include files and the library file cowgol.coo

The Examples folder contains examples of compilation sessions.

# COWGOL for Z80 computers provided with 128/512 KB RAM
-------------------------------------------------------

The original version of the compiler fails to compile large cowgol source files.

That is caused by the small amount of RAM memory available to the compiler to store the data structures involved in the compilation.

For sources larger than a few hundred lines, the first step of the compiler issuess a fatal error message: "Out of memory".

I solved the problem, at least for the Z80-based computers provided with 128/512 KB RAM, including computers running CP/M under ROMWBW.

I modified the first step of the compiler (COWFE.COM), enabling-it to store part of the data on the "extended" RAM space, beyond the "main" 64KB.

The new compiler is in the 128_512_KB folder.

In the Examples folder, Startrek.cow must be compiled on a Z80 computer provided with 128/512 KB RAM.

# New version for 64KB RAM Z80 computers
----------------------------------------

The modified components (cowfe & cowbe) are now 20% faster.

See 'New version' folder.




