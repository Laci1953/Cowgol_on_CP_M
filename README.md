# Cowgol, C & assembler development environment hosted on Z80 computers running CP/M
-------------------------------------------------------------------

You will find here a complete Cowgol development environment, hosted on CP/M, for Z80 computers.

Cowgol is a programming language for very small systems, including Z80 computers, invented by David Given ( see https://github.com/davidgiven/cowgol ).
He is also the author of the Cowgol compiler.

To popularize this programming language among the retro computing community, for owners of Z80 computers running CP/M 2.2, I decided to build this development environment.

Thus, those willing to develop, on CP/M, programs written in Cowgol, will have a simple-to-use, command-line facility that allows the compilation of Cowgol sources and the construction of the final executable.

This development environment also allows combining Cowgol, C and Z80 assembler source files.
The EXAMPLES folder contains several cases of calling Z80 assembler routines from Cowgol and calling C routines from Cowgol.
Compatibility between these languages ​​is ensured by using a common object code format.

A small Cowgol programming language manual is included.

Also, a small User manual for this development environment is included.

# How to use-it
---------------

To compile or to build an executable, on CP/M, starting from Cowgol source files (and, optionally, C & assembler files), the following command must be used:

COWGOL [-B] [-C] [-Mfile] [-Lfile] [-Tfile] [-O] [-S] [-X] file1.ext ... [ filen.ext ]

where file1.ext ... filen.ext are the source files.

Example: 

COWGOL test.cow

will first compile the Cowgol source file named 'test.cow' then will execute all the necessary steps (assembly, link) to build the final executable 'test.com'.

More than one source file may be specified (with name extensions: .cow = cowgol source file, .c = C source file, .as = assembler source file)

The files with name extension .cow (Cowgol source files) will be compiled using the Cowgol compiler, 
the files with name extension .c (C source files) will be compiled using the HiTech C compiler 
and the files with name extension .as (Z80 assembler source files) will be assembled using the Z80AS assembler.

If the option -C is specified, the files will be only compiled/assembled.

If the option -C is not specified, the files will be first compiled/assembled, then linked into a CP/M executable (named after the first cowgol file in the list).

The option -Mfile builds the "file.map" memory map file for the executable.

The option -Lfile adds the file "file.lib" to the list of files used as input by the LINK linker.

The option -O instructs COWFIX to perform various code optimizations in the file that will be assembled by Z80AS. 
This may help also in case of big Cowgol programs, by letting COWFIX to comment-out unused labels and allowing Z80AS to process very large source files.

The option -Tfile is used to build, when linking the final executable, a table of symbols with the fixed name "file.sym" to be used when debugging the app.

The option -S is used to instruct Cowlink to type a map of the Cowgol subroutines and variables used in these subroutines, with their exact addresses.
This is also very valuable when debugging the app.

The option -X is used to reserve a larger stack (1KB) for the executable (the usual stack size is 128 bytes). 
This might be important if reentrant C code is mixed into the project.

The option -B addresses the case when the compiler runs on a computer provided with only 64KB RAM. This option allows the processing of larger cowgol source files.
What to do when our computer is provided with only 64KB RAM and after a first try we will notice that the compiler fails to compile a medium sized 
Cowgol source file (~ 20KB, ~1000 lines) ?
We should try in this case to use the -B option, instructing the compiler to use custom Cowfe components that will be perhaps able to process this file
(see as an example the game “bowling” in the GAMES folder, which needs -B when compiling-it, otherwise it will fail, reporting ‘Out of memory’).

Also, C or AS object files (with extension .obj) and Cowgol object files (with extension .coo) may be specified.
They will be linked by the HiTech linker into the final executable, along with the Cowgol object file.

The first source file must be a Cowgol source file.

If more Cowgol source files are used, the first one will give the name of the executable being built, but the last one must contain the 'main' routine.

C and assembler routines may be called from the cowgol source files (see the folder EXAMPLES).

HiTech's LINK is used to link the object files and build the final executable.

The following executables are needed: (they belong to the HiTech C toolset and the Cowgol compiler)
 - $EXEC.COM , the "batch processor" from the HiTech's C compiler, who launches all the subsequent executables from the Cowgol toolchain
 - COWGOL.COM (a modified variant of the HiTech's C.COM), the component that interprets the command line and feeds into $EXEC run requests for the subsequent executables from the Cowgol toolchain
 - COWFE.COM , the "cowgol front end", who parses the source file, part of the Cowgol compiler
 - COWFE1.COM and COWFE2.COM, needed only when the option -B is used (COWFE1 contains the “lexer” part and COWFE2 contains the “parser” part of COWFE; they use a temporary file to pass data from the “lexer” to the “parser”, but are able to process larger files compared with the original COWFE)
 - COWBE.COM , the "cowgol back end", who builds the "cowgol object file", part of the Cowgol compiler
 - COWLINK.COM , the "cowgol linker", who binds all the "cowgol object files" and outputs a Z80 assembler file, part of the Cowgol compiler
 - COWFIX.COM , interface to Z80AS , who performs code optimizations
 - Z80AS.COM ( see https://github.com/Laci1953/Z80AS ), the assembler, who assembles the output of Cowfix and any assembler file included in the command line, producing HiTech compatible object files
 - LINK.COM , the HiTech's linker, who builds the final executable, using as input the object files and, if requested, the library file and producing the final executable
 - CPP.COM , the HiTech's C pre-processor (needed only when C source files will be compiled), modified to accept // - style comments
 - P1.COM , the HiTech's C compiler pass 1 (needed only when C source files will be compiled)
 - CGEN.COM , the HiTech's C compiler pass 2 (needed only when C source files will be compiled)
 - OPTIM.COM , the HiTech's C compiler optimizer (needed only when C source files will be compiled)
 - LIBR.COM , the HiTech's librarian (needed only to build and manage .lib libraries)

Also, the library file "cowgol.coo" and the include files .coh specified in the Cowgol source fileds must be present on the current disk.

The sequence of execution of all these components is:

-Cowgol source files >> COWFE >> COWBE >> COWLINK >> COWFIX >> Z80AS >> .OBJ files

-C source files >> CPP >> P1 >> CGEN >> OPTIM >> Z80AS >> .OBJ files

-Z80 assembler source files >> Z80AS >> .OBJ files

then .OBJ object files & .LIB library files >> LINK >> .COM file

# Debugging executables built with this development environment

It is possible to debug executables built from Cowgol (and, possible, C & assembler) source files.

For this purpose, you must use the -S option, which allows Cowlink to list a map of the Cowgol subroutines and variables used in these subroutines, with their exact addresses.
This will allow you to locate the exact addresses where the Cowgol variables are stored.
See below the VARIABLES MAP chapter.

# COWGOL for Z80 computers provided with 128/512 KB RAM
-------------------------------------------------------

The Cowgol compiler fails to compile very large cowgol source files.

That is caused by the small amount of RAM memory available to the compiler to store the data structures involved in the compilation.

For sources larger than a few hundred lines, the first step of the compiler issuess a fatal error message: "Out of memory".

I solved the problem, at least for the Z80-based computers provided with 128/512 KB RAM, including computers running CP/M under ROMWBW (version >= 3.5.0).

I modified the first step of the compiler (COWFE.COM), enabling-it to store part of the data on the "extended" RAM space, beyond the "main" 64KB.

The new compiler components are in the 128_512_KB folder.

The games from the GAMES folder need to be compiled using this enhanced version of the Cowgol compiler, on a 128/512 KB RAM Z80 computer (but there are versions of these games that can be compiled also on 64 KB RAM computers).

# COWGOL for Z80 computers provided with 64 KB RAM
-------------------------------------------------------

If your computer is provided with only 64 KB RAM, you can still be able to compile large enough Cowgol source files, using the -B option in the command line.
In this case, instead of running Cowfe as the first step of the compilation, the Cowfe1 (lexer) & Cowfe2 (parser) will be executed instead.

More exactly, the execution flowchart will be: 

cowgol source file --> cowfe1 --> COWFE.$$$ temporary file --> cowfe2 --> cowbe --> cowlink --> cowfix --> Z80AS --> LINK --> .COM

For Cowgol source files that can be compiled this way, see as examples the folder GAMES/Backgammon/Version for 64 KB RAM and GAMES/Startrek/Version for 64 KB RAM.

# Folders
---------

The EXE folder contains all the needed executables (as HEX files, ready to be LOAD-ed).
You may find there also the source files for the Cowgol command line processor (cowgol.c) and for the Cowfe, Cowfe1, Cowfe2, Cowbe and Cowlink.

The 128_512_KB folder contains executables provided for computers with 128KB or 512KB computers, including those running ROMWBW.
You may find there also the source files for the customised Cowfe.

The COWFIX folder contains the sources for Cowfix.

The INCLUDE folder contains cowgol include files (.coh) to be used when building cowgol-based applications.

The LIBRARIES folder contains cowgol user libraries (*.coo) to be used when building cowgol-based applications.
You may find there also the source files for these libraries.

The GAMES folder contains some computer games, rewritten in Cowgol.
There are several games: Adventure, Backgammon, Bowling, KnightsTour, Queens, Startrek, Tetris.

The EXAMPLES folder contains examples of Cowgol compilation sessions and details related on how to mix Cowgol, C and assembler.

The IMPROVED ALLOC contains an improved memory allocation package.
Compared with the original (malloc.coh) it offers a better use of the available memory (smaller fragmentation).

The TESTS contains the series of tests writtten by David Given to check the implementation of various features of the Cowgol language.

# Structure of the Cowgol applications
------------------------------------------

There are more than one way to configure a Cowgol project.

Variant 1: one source file contains all the needed statements, no 'include' used.

Variant 2: there are more than one cowgol source files, using the 'external' feature (see example nr.3 in the EXAMPLES folder)

Variant 3: the source file contains 'include .coh' statements, and these .coh files contain cowgol subroutines (see hexdump.cow in EXAMPLES folder)

Variant 4: the source file contains 'include .coh' statements, and these .coh files contain only declaration of cowgol subroutines (see startrek.cow in GAMES folder)

Variant 5: the source file contains 'include .coh' statements, and these .coh files contain 'jumps' to routines contained in the cowgol.lib library, used at the final LINK step (see bowling.cow in GAMES folder)

Of course, Cowgol and C and/or assembler files can be also mixed (see the EXAMPLES folder)

# Variables map (compile option -S)
---------------------------

Example of building a cowgol application variables map and using this map to debug the application.

We use the source file "hexdump.cow".

Here is the cowgol source code of the "print_hex_i8" subroutine, used in "hexdump.cow":

-------------------------------------
	sub print_hex_i8(value: uint8) is
	    var i: uint8 := 2;
	    loop
	        var digit := value >> 4;
 	       	if digit < 10 then
 	           digit := digit + '0';
        	else
            	   digit := digit + ('a' - 10);
        	end if;
        	print_char(digit);
        	value := value << 4;
        	i := i - 1;
        	if i == 0 then
            	  break;
        	end if;
    		end loop;
	end sub;
------------------------------------

Here is a fragment of the Cowgol command log , when building "hexdump.com" :

	(executed on a 512 KB RAM machine)

	(the -S option is used to build the cowgol variables map)
	(the -O option is used to optimize the assembler code produced by Cowlink...)
	(the -T option is used  to build the s.sym file containing the variables and their values)

------------------------------------
	D>cowgol -o -s -ts hexdump.cow
	COWGOL COMPILER (CP/M-80) V2.0
	Copyright (C) David Given
	0:COWFE     HEXDUMP.COW $CTMP1.$$$ -S
	COWFE: 19kB free main memory
	448kB free extended memory
  	> HEXDUMP.COW
    	> stdcow.coh
 	...
  	< HEXDUMP.COW
	done: 16kB free main memory
	425kB free extended memory
	0:COWBE $CTMP1.$$$ HEXDUMP.COO
	COWBE: 23kB free
	__main
	...
	Hexdump
	done: 16kB free
	ERA $CTMP1.$$$
	ERA $CTMP2.$$$
	0:COWLINK COWGOL.COO HEXDUMP.COO -o $CTMP1.$$$ -S
	COWLINK: 44kB free
	Adding input file: COWGOL.COO
	Adding input file: HEXDUMP.COO
	Analysing...
	Workspace sizes:
  	#0: 231 bytes

	Subroutines and Variables map


	Subroutine Hexdump variables list:

	k        @ ws+00d4H     (212)
	c        @ ws+00d3H     (211)
	j        @ ws+00d1H     (209)
	i        @ ws+00d0H     (208)
	buf      @ ws+00c0H     (192)

	...

	Subroutine print_hex_i8 variables list:

	digit    @ ws+00dbH     (219)
	i        @ ws+00daH     (218)
	value    @ ws+00d9H     (217)
	...

	Creating output file: $CTMP1.$$$
	Copying from input file: COWGOL.COO
	Copying from input file: HEXDUMP.COO
	done: 38kB free
	ERA HEXDUMP.COO
	0:COWFIX $CTMP1.$$$ $CTMP2.$$$ -O
	0:Z80AS -J -N -OHEXDUMP.OBJ $CTMP2.$$$
	Z80AS Macro-Assembler V4.8

	Errors: 0

	Jump optimizations done: 58
	Finished.
	0:LINK -Z -Ptext=100H,data,bss -C100H -DS.SYM -OHEXDUMP.COM HEXDUMP.OBJ
	ERA $SUBSYMS.$$$
	ERA $CTMP1.$$$
	ERA $CTMP2.$$$
	ERA $$EXEC.$$$

	D>
------------------------------------

Here is a relevant fragment of the assembler file generated by Cowlink:

------------------------------------
	        ; print_hex_i8 workspace at ws+217 length ws+3
	f45_print_hex_i8:
     		ld (ws+217), a
        	ld a,2
        	ld (ws+218), a
	c1c_002b:
        	ld a, (ws+217)
        	ld b,4
        	call f2__lsr1
        	ld (ws+219), a
        	cp 10
        	jp nc, c1c_0031
	....
------------------------------------

Here is a relevant part of the symbols map file generated by LINK:

------------------------------------
	D>type s.sym
	0782 _exit
	...
	0783 ws
	...
	01A0 f45_print_hex_i8
	...
	D>
------------------------------------
(notice the value of ws is 0783H, 
and 01A0 is the address of print_hex_i8 subroutine)


Therefore, at last, we can now calculate the exact addresses 
of the variables used in print_hex_i8:

digit    @ ws+00dbH     (219)	= 0783H + 00DBH = 085EH
i        @ ws+00daH     (218)	= 0783H + 00DAH = 085DH
value    @ ws+00d9H     (217)	= 0783H + 00D9H = 085CH

Let's now debug hexdump.com: (we list the print_hex_i8 routine)

------------------------------------
	D>zsid hexdump.com
	ZSID VERS 1.4
	NEXT  PC  END
	0800 0100 BFFF
	#L1A0
  	01A0  LD   (085C),A
  	01A3  LD   A,02
  	01A5  LD   (085D),A
  	01A8  LD   A,(085C)
  	01AB  LD   B,04
  	01AD  CALL 0107
  	01B0  LD   (085E),A
  	01B3  CP   0A
  	01B5  JR   NC,0A
  	01B7  LD   A,(085E)
  	01BA  ADD  A,30
------------------------------------

,and we now know that the first line:

  01A0  LD   (085C),A

 stores the parameter "value" (passed in register A) to the variable placed at the address 085CH.

This is valuable when debugging a Cowgol application.

In the case when the Cowgol compiler command line specifies multiple Cowgol source files, the variable map will contain data related to all the source files included.

------------------------------------

Variables map - Implementation details:

Cowfe, the Cowgol compiler's pass 1, when the option -S is used in the Cowgol command line, 
writes to a temporary file $SUBSYMS.$$$ (erased at the end of the compiling batch process)  
a list of the subroutines (and their variables) for each source file. Because Cowfe handles
each source file separately, if the Cowgol command line contains more than one Cowgol source file,
the temporary file is created when processing the first source file, then it is "oppened for append"
for the subsequent source files. The temporary file will be read by Cowlink to build the variables map, 
containing the exact addresses of the variables.

Here is a fragment of the dump of the $SUBSYMS.$$$ file:

------------------------------------
	D>dumpx $subsyms.$$$
	0000 : 5F 5F 6D 61 69 6E 00 4C 4F 4D 45 4D 00 00 00 5F : __main.LOMEM..._
	0010 : 5F 6D 61 69 6E 00 48 49 4D 45 4D 00 02 00 41 6C : _main.HIMEM...Al
	0020 : 69 67 6E 55 70 00 69 6E 00 00 00 41 6C 69 67 6E : ignUp.in...Align
	0030 : 55 70 00 6F 75 74 00 02 00 67 65 74 5F 63 68 61 : Up.out...get_cha
	0040 : 72 00 63 00 00 00 70 72 69 6E 74 5F 63 68 61 72 : r.c...print_char
	...


# The Cowgol executables
------------------------------

The COWFE, COWBE and COWLINK contained in the EXE folder are optimized versions of the originals.

Examples of code optimization:

1. Using conditional return

;	jp nz, c01_000c

;	ret

;c01_000c:

        ret z

means that the 3 statements "commented-out" were replaced by "ret z".

2. Using jp instead of call + ret

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

3. Optimizing jump-to-jump

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

4. Dropping useless store statements

        call f11_UIToA

;	ld (ws+1450), hl

;	ld (ws+1452), hl

means that the two "ld" instructions were "commented out", because the addresses ws+1450 and ws+1452 are never accessed for read.

5. Dropping useless load statements

        ...

        sbc hl,de

;	ld (ws+1414), hl

;end_f32_StrLen:

;	ld hl, (ws+1414)

        ret

means that the two "ld" were commented out, they are useless, because the routine just wants to return HL...

6. Dropping 'dead' labels

         ...

         jp nc, c01_00c3

;c01_00c2:

         ld de,4

         ...

means that "c01_00c2" was commented out, because it's a "dead" label (no jumps or calls are directed to this label)


The gain is significant:

- smaller size (e.g. Cowfe is 1KB and half smaller)

- 10 to 20% faster


# Examples of Cowgol programs
-----------------------------

You may find a lot of interesting Cowgol programs here: https://rosettacode.org/wiki/Category:Cowgol

Select one of the 164 programs, then select on the left panel the Cowgol language, and you will see the source code of the program.

# Compiling the compiler
------------------------

With few exceptions, all the files needed to build the Cowgol compiler's components are available and can be used to compile the compiler, on CP/M.

(one of the exceptions is the file parser.coh, from the Cowfe sources, which can be built, in the current version, only by using the LEMON tool on Unix machines).

See the file "Compiling the compiler.txt" for a log of compiling, on CP/M, the Cowfe & Cowbe sources (a customized Cowgol compiler was used for this purpose, on a 512 KB RAM CP/M computer).

# Why a Cowgol development environment was needed for Z80 CP/M?
---------------------------------------------------------------

Simply because no such development environment was available!

If you look at the original Cowgol site, you will notice that you are provided there only with the Cowgol compiler & linker source files.
You must download them on a computer running a UNIX-like operating system and build the compiler executables, after installing a lot of stuff:

(here is a fragment of David Given's advices)

"to build, you'll need a Unixish machine (I develop on Linux) with some dependencies.
chronic, Python 3 and Lua 5.1 (needed for the build)
the Pasmo Z80 assembler (needed to build part of the CP/M emulator)
the 64tass 6502 assembler (needed to build the 6502 code)
the libz80ex Z80 emulation library (needed for the CP/M emulator)
flex and bison and libbsd and libreadline (these are standard)
a C compiler and these GNU binutils packages:
i686-linux-gnu
arm-linux-gnueabihf
m68k-linux-gnu
m68k-atari-mint Packages are available from http://vincent.riviere.free.fr/soft/m68k-atari-mint
powerpc-linux-gnu
the nasm ix86 assembler
the qemu userspace emulator
the gpp preprocessor"

(good luck...)

After eventually succeding to build the executables, you get COWFE.COM, COWBE.COM and COWLINK.COM.

Of course, you can use them in separate steps, like:

	>cowfe myfile.cow tmp
	>cowbe tmp myfile.coo
	>cowlink cowgol.coo -o myfile.asm
	>
, but then you must use an assembler (by the way, one who accepts some exotic Z80 assembly statements - e.g. 'push h') and then build (how?) the final 'myfile.com'.

Instead, when using the present development environment, all that's needed to build myfile.com is to type:

	>cowgol myfile.cow

The full cowgol toolchain will be executed, followed by assembling the resulting assembler file and linking-it to the myfile.com executable.

I opted to use as support the HiTech's toolchain, because the HiTech source files were available and I had a good enough expertise in using the HiTech tools. 
Therefore, the output of COWLINK (after passing through a preliminary filter) is assembled by Z80AS (a substitute for ZAS, the original HiTech Z80 assembler), then the object file is processed by HiTech's LINK, to obtain as a final result the .COM file.

# UPDATES
------------------------------

(updated on March, 2025 - aligned to the last version found on the David Given's Cowgol site)

(updated on 19 May, 2025 - fixed a bug in COWFIX, occuring when more than one return value is used for a sub)

(updated on 13 Sept, 2025 - optimized COWFIX, added COWFIX statistics)

Sample of COWFIX statistics ( when compiling the Adventure game):

 	COWFIX v16 fixing syntax and optimizing code
 	PASS 1
 	PASS 2
	PASS 3
 	32 fixed PUSH statements
 	23 fixed POP statements
 	1032 fixed JR statements
 	581 fixed DWORD statements
 	103 fixed too long DB statements
 	862 not needed labels dropped
 	88 RET statements added
 	58 fixed JP to JP statements
 	15 fixed statement groups involving conditionals
 	28 dropped not needed LD statements
 	
 	13707 input source lines processed
 	DONE!

(updated on 19 October, 2025 - aligned to the current version of the David Given's Cowgol language site)

- the new 'nil' keyword is now supported
- Cowbe code generation optimizations
  
Updated files:

 /EXE : cowfe.hex, cowbe.hex, cowfix.hex
 
 /128_512_KB : cowfe128.hex, cowfe512.hex, cowfeall.hex, cowfewbw.hex

(updated on 5 November, 2025)

Added the option -B, allowing the compilation of larger Cowgol source files on 64 KB RAM computers.

Updated files:
  /EXE : cowgol.hex, cowfe1.hex, cowfe2.hex
  
  Cowgol language manual
  
  Cowgol compiler manual

  
