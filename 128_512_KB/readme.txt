Here you will find an enhanced COWGOL compiler, to be used on Z80 computers provided with 128/512 KB RAM, including RomWBW,
able to compile larger COWGOL source files, compared with the original version of the compiler.

Only the Cowfe executable was modified.

The resulting COWGOL toolset can be used on any available 128KB RAM / 512KB RAM Z80 hardware system configuration:

cowfe128 -RC2014 provided with SC108, SC114, SC118, SC150, SC152 or the Phillip Stevens memory module,
cowfe512 -RC2014 provided with the 512KB RAM + 512KB ROM module
cowfeall -Z80ALL (which has 4 x 32KB RAM) or
cowfes80 -Simple80 (2 x 64KB RAM) or
cowfewbw -ROMWBW on 512KB RAM Z80 systems (version >= 3.5.0)

For RC2014 or RCBUS 128KB RAM systems, the CP/M must be setup using one of the files from the folder PutSys
( https://github.com/Laci1953/RC2014-CPM/tree/main/PutSys )
This is necessary because of the "shadow code", that must be stored to high RAM address space.

The results are spectacular.

Large COWGOL source files can now be compiled, without any problem.

The "error_messages.txt" file contains an index of the error messages issued by the compiler 
(the compiler will only indicate the index# of the error...).
