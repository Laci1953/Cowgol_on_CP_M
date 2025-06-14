Binary editor for VT100 compatible terminals, can handle files with size up to 0B000H (44 KB).

This is good enough to be able to edit almost all CP/M executables.

To build-it, use the following command:

>cowgol -o misc.coo string.coo seqfile.coo be.cow

The following files must be present : 

misc.coh, misc.coo, string.coh, string.coo, seqfile.coh, seqfile.coo, cowgol.coo (see INCLUDE & LIBRARIES folders)

Please use the latest versions of all the Cowgol compiler tool-chain components: cowgol, cowfe, cowbe, cowlink, cowfix

The original C file can be found here: https://github.com/lindehaven/CP-M/tree/master/be

WARNING

The original C version was designed for CP/M 3 and can handle files with size up to 32KB.
