Here you will find an enhanced COWGOL compiler, to be used on Z80 computers provided with 128/512 KB RAM, able to compile larger COWGOL source files, compared with the original version of the compiler.

Only the Cowfe executable was modified.

The resulting COWGOL toolset can be used on any available 128KB RAM / 512KB RAM Z80 hardware system configuration:

-RC2014 provided with SC108, SC114, SC118, SC150, SC152 or the Phillip Stevens memory module, or the 512KB RAM + 512KB ROM module, or
-RCBUS-based systems provided with SC707, SC714, or
-Z80ALL (which has 4 x 32KB RAM) or
-Simple80 (2 x 64KB RAM) or
-ROMWBW on 512KB RAM Z80 systems (256 KB RAM available for Cowgol)

For RC2014 or RCBUS 128KB RAM systems, the CP/M must be setup using one of the files from the folder PutSys ( https://github.com/Laci1953/RC2014-CPM/tree/main/PutSys )
This is necessary because of the "shadow code", that must be stored to high RAM address space.

The results are spectacular.

Large COWGOL source files can now be compiled, without any problem.

The "error_messages.txt" file contains an index of the error messages issued by the compiler (the compiler will only indicate the index# of the error...).
