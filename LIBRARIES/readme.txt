You may find here some Cowgol libraries, handling CP/M sequential file functions, console I/O, strings and other.

The default system library cowgol.coo contains 1-byte, 2-byte and 4-byte arithmetic routines, needed to implement some common cowgol operators, such as * / ; it is by default included in the COWLINK command as the first file.

Each other library comes with: an include file (.coh) and a cowgol object file (.coo)

When using the libraries, specify the necessary include files in your source code ( e.g include "string.coh"; ) 
, then include the cowgol object files of the desired libraries in the list of the files used at the Cowgol compile command :

(e.g.)
 >cowgol -o misc.coo string.coo test.cow  

This approach (having the libraries already compiled) has the advantage to minimize the compile time for the cowgol program which uses these libraries.

Here is the complete list of the subroutines contained in these libraries:

MISC:
----

@decl sub exit() @extern("exit");

@decl sub get_char(): (c: uint8) @extern("get_char");
@decl sub print_char(c: uint8) @extern("print_char");
@decl sub print(ptr: [uint8]) @extern("print");
@decl sub print_nl() @extern("print_nl");

@decl sub print_hex_i8(char: uint8) @extern("print_hex_i8");
@decl sub print_hex_i16(word: uint16) @extern("print_hex_i16");
@decl sub print_hex_i32(dword: uint32) @extern("print_hex_i32");

@decl sub print_i8(v: int8) @extern("print_i8");
@decl sub print_i16(v: int16) @extern("print_i16");

@decl sub isdigit(ch: uint8): (ret: uint8) @extern("isdigit");

@decl sub itoa(i: int16): (pbuf: [uint8]) @extern("itoa");
@decl sub atoi(p: [uint8]): (ret: int16) @extern("atoi");

@decl sub atofixed(p: [uint8]): (ret: uint16) @extern("atofixed");

# fdigits: number of digits in fractional part
@decl sub fixedtoa(f: uint16, fdigits: uint8): (ret: [uint8]) @extern("fixedtoa");

@decl sub memcpy(dest: [uint8], src: [uint8], size: uint16): (ret: [uint8]) @extern("memcpy");
@decl sub memset(dest: [uint8], char: uint8, size: uint16): (ret: [uint8]) @extern("memset");

SEQFILE:
--------

@decl sub FCBOpenIn(fcb: [FCB], filename: [uint8], filetype: uint8): (errno: uint8) @extern("FCBOpenIn");
@decl sub FCBOpenOut(fcb: [FCB], filename: [uint8], filetype: uint8): (errno: uint8) @extern("FCBOpenOut");
@decl sub FCBOpenInOut(fcb: [FCB], filename: [uint8], filetype: uint8): (errno: uint8) @extern("FCBOpenInOut");

#only for binary files
@decl sub FCBOpenForAppend(fcb: [FCB], filename: [uint8]): (errno: uint8) @extern("FCBOpenForAppend");

@decl sub FCBGetChar(fcb: [FCB]): (c: uint8, errno: uint8) @extern("FCBGetChar");
@decl sub FCBPutChar(fcb: [FCB], c: uint8): (errno: uint8) @extern("FCBPutChar");

@decl sub FCBClose(fcb: [FCB]): (errno: uint8) @extern("FCBClose");

# only for files open for READ
@decl sub FCBRewind(fcb: [FCB]): (errno: uint8) @extern("FCBRewind");


STRING:
-------

@decl sub strlen(str: [uint8]): (len: uint16) @extern("strlen");
@decl sub strcpy(dest: [uint8], src: [uint8]): (ret: [uint8]) @extern("strcpy");
@decl sub strcat(dest: [uint8], src: [uint8]): (ret: [uint8]) @extern("strcat");
@decl sub strcmp(str1: [uint8], str2: [uint8]): (ret: int8) @extern("strcmp");
@decl sub strcasecmp(str1: [uint8], str2: [uint8]): (ret: int8) @extern("strcasecmp");
@decl sub strstr(str: [uint8], tosearch: [uint8]): (ret: [uint8]) @extern("strstr");
@decl sub strchr(str: [uint8], tosearch: uint8): (ret: [uint8]) @extern("strchr");
@decl sub tolower(char: uint8): (ret: uint8) @extern("tolower");

RANFILE (Random access files)
------------
@decl sub FCBOpenIn(fcb: [FCB], filename: [uint8]): (errno: uint8) @extern("FCBOpenIn");
@decl sub FCBOpenUp(fcb: [FCB], filename: [uint8]): (errno: uint8) @extern("FCBOpenUp");
@decl sub FCBOpenOut(fcb: [FCB], filename: [uint8]): (errno: uint8) @extern("FCBOpenOut");
@decl sub FCBClose(fcb: [FCB]): (errno: uint8) @extern("FCBClose");
@decl sub FCBSeek(fcb: [FCB], pos: uint32) @extern("FCBSeek");
@decl sub FCBPos(fcb: [FCB]): (pos: uint32) @extern("FCBPos");
@decl sub FCBExt(fcb: [FCB]): (len: uint32) @extern("FCBExt");
@decl sub FCBGetChar(fcb: [FCB]): (c: uint8) @extern("FCBGetChar");
@decl sub FCBPutChar(fcb: [FCB], c: uint8) @extern("FCBPutChar");

The source files of the libraries are published here too.

You will notice that a lot of them are implemented in Z80 assembly language, for efficiency.

Of course, the "original" cowgol include files (e.g. file.coh), can also be used without any restrictions...

----------------------------------

Also, the 'cowgol.lib' can be found here.

It contains code for the following routines, using the corresponding .coh include files:

(libbios.coh)
sub BiosSetup()
sub ConOut(ch: uint8)
sub ConIn(): (ret: uint8)
sub CosSts(): (ret: uint8)
sub putstr(s: [uint8])

(libbasic.coh)
sub Exit()
sub MemSet(buf: [uint8], ch: uint8, len: uint16)
sub MemCopy(src: [uint8], len: uint16, dest: [uint8])

(libconio.coh)
sub get_char(): (ch: uint8)
sub get_str(buf: [uint8])
sub print_char(ch: uint8)
sub print(buf: [uint8])
sub print_nl()
sub print_i8(n: int8)
sub print_i16(n: int16)
sub print_hex_i8(n: int8)
sub print_hex_i16(n: int16)

(libstr.coh)
sub IsDigit(ch: uint8): (ret: uint8)
sub ToLower(c: uint8): (cc: uint8)
sub CopyString(src: [uint8], dest: [uint8])
sub StrCmp(s1: [uint8], s2: [uint8]): (res: int8)
sub StrICmp(s1: [uint8], s2: [uint8]): (res: int8)
sub StrLen(s: [uint8]): (size: uint16)

(libfp.coh)
sub positive(fp: int16): (ret: int16)
sub neg(fp: int16): (ret: int16)
sub fpmul(fp1: int16, fp2: int16): (ret: int16)
sub fpdiv(fp1: int16, fp2: int16): (ret: int16)
sub fpsqrt(fp: int16): (ret: int16)
sub fpsin(fp: int16): (ret: int16)
sub fpcos(fp: int16): (ret: int16)
sub fparctan(fp: int16): (ret: int16)
sub xdivytofp(x: int16, y: int16): (ret: int16)

This cowgol.lib will be used at LINK time when the option '-lcowgol' is used in the command line.

See details in the folder for the game BOWLING.
