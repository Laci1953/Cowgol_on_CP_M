# Cowgol_on_CP_M
Cowgol development environment hosted on Z80 computers running CP/M
-------------------------------------------------------------------

Cowgol is a programming language for very small systems, including Z80 computers ( see https://github.com/davidgiven/cowgol ).

Here you will find a complete Cowgol development environment, hosted on CP/M, for Z80 computers.

To compile a Cowgol source file or to build an executable starting from a Cowgol source file, the following command is used:

COWGOL [-c] [-m] source ([source]...)

More than one source file may be specified (with extensions: .cow = cowgol source file, .as = assembler source file)

If you want just to compile/assemble the files, the option -c must be used.

If the option -c is not specified, the files will be first compiled/assembled, then linked into a CP/M executable (named after the first file).

The option -m builds a memory map for the executable.

HiTech's LINK is used to link the object files.

The following executables are needed:
 - $EXEC.COM , the "batch processor" from the HiTech's C compiler
 - COWGOL.COM , the component that launches all other executables
 - COWFE.COM , part of the Cowgol compiler
 - COFBE.COM , part of the Cowgol compiler
 - COWLINK.COM , part of the Cowgol compiler
 - COWFIX.COM , interface to Z80AS
 - Z80AS.COM , the assembler ( see https://github.com/Laci1953/Z80AS )
 - LNK.COM , the HiTech's linker

The EXE folder contains the executables.

The Examples folder contains examples of compilation sessions.


