Source files for the cowgol.lib

How the cowgol.lib was built:

>z80as -j basic
>z80as -j biosr
>z80as -j conio
>z80as -j string
>z80as -j fixfp
>libr r cowgol.lib basic.obj biosr.obj conio.obj string.obj fixfp.obj

You can add / modify this library, using the same syntax:

(adding / updating the 'file' object)
>libr r cowgol.lib file.obj
