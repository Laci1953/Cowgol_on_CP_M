The Colossal Cave adventure game, ported to the Cowgol language.

It must be compiled on a 128KB/512KB RAM Z80 machine.

D>cowgol advent.cow advmain.cow xrnd.as
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
ADVENT.COW
0:COWFE     ADVENT.COW $CTMP1.$$$
COWFE: 21kB free main memory
63kB free extended memory
  > ADVENT.COW
done: 12kB free main memory
51kB free extended memory
0:COWBE $CTMP1.$$$ ADVENT.COO
COWBE: 22kB free
__main
exit
get_char
print_char
print
print_nl
get_line
itoa
ltoa
isdigit
atoi
atol
bug
strcpy
strcmp
strlen
strcat
rindex
MemSet
ArgvInit
ArgvNext
file_i_init
fill
fcb_i_gbpb
fcb_i_blockin
fcb_i_blockout
fcb_i_changeblock
fcb_a_to_error
FCBOpenIn
FCBOpenUp
FCBOpenOut
FCBClose
FCBSeek
FCBPos
FCBExt
fcb_i_nextchar
FCBGetChar
FCBPutChar
closefiles
opentxt
rdupto
rdskip
rspeak
pspeak
desclg
descsh
binary
vocab
tolower
outwords
pct
yes
analyze
dstroy
juggle
put
liq2
copytrv
done: 15kB free
ADVMAIN.COW
0:COWFE     ADVMAIN.COW $CTMP1.$$$
COWFE: 21kB free main memory
63kB free extended memory
  > ADVMAIN.COW
done: 0kB free main memory
36kB free extended memory
0:COWBE $CTMP1.$$$ ADVMAIN.COO
COWBE: 22kB free
__main
get_dbugflg
set_saveflg
getwords
gettrav
english
addobj
toting
here
dark
forced
at
carry
drop
move
dcheck
liq
liqloc
needobj
actspk
score
normend
death
dwarfend
vdrop
vfill
vtake
vopen
vsay
describe
von
voff
vwave
vkill
vpour
veat
vdrink
vfeed
vthrow
vfind
vread
vblast
vbreak
vwake
ivtake
ivopen
ivkill
iveat
ivdrink
ivquit
ivfill
ivfoo
ivread
inventory
scanint
initplay
descitem
trverb
trobj
badmove
spcmove
dotrav
goback
domove
dopirate
dwarves
stimer
doobj
itverb
turn
done: 13kB free
XRND.AS
0:Z80AS -J -OXRND.OBJ XRND.AS
Z80AS Macro-Assembler V4.8

Errors: 0
Finished.
ERA $CTMP1.$$$
ERA $CTMP2.$$$
0:COWLINK COWGOL.COO ADVENT.COO ADVMAIN.COO -o $CTMP1.$$$
COWLINK: 46kB free
Adding input file: COWGOL.COO
Adding input file: ADVENT.COO
Adding input file: ADVMAIN.COO
Analysing...
Workspace sizes:
  #0: 3109 bytes
  #1: 0 bytes
  #2: 0 bytes
  #3: 0 bytes
Creating output file: $CTMP1.$$$
Copying from input file: COWGOL.COO
Copying from input file: ADVENT.COO
Copying from input file: ADVMAIN.COO
done: 24kB free
ERA ADVENT.COO
ERA ADVMAIN.COO
0:COWFIX $CTMP1.$$$ $CTMP2.$$$
0:Z80AS -J -N -OADVENT.OBJ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0

Jump optimizations done: 918
Finished.
0:LINK -Z -Ptext=100H,data,bss -C100H -OADVENT.COM ADVENT.OBJ   XRND.OBJ
ERA $CTMP1.$$$
ERA $CTMP2.$$$
ERA $$EXEC.$$$

D>
D>advent


                Welcome to ADVENTURE!
                =====================
        -Original development by Willie Crowther.
        -Major features added by Don Woods.
        -Conversion to BDS  C by J. R. Jaeger
        -Unix standardization by Jerry D. Pohl.
        -OS/2 Conversion by Martin Heller
        -Conversion to TurboC 2.0 by Daimler

            Would you like instructions?

>yes


Somewhere nearby is Colossal Cave, where others have
found fortunes in treasure and gold, though it is rumored
that some who enter are never seen again.  Magic is said
to work in the cave.  I will be your eyes and hands.  Direct
me with commands of 1 or 2 words.  I should warn you that I
look at only the first five letters of each word, so you'll
have to enter "Northeast" as "ne" to distinguish it from
"North".  (Should you get stuck, type "help" for some
general hints).

You are inside a building, a well house for a large spring.
There are some keys on the ground here.
There is a shiny brass lamp nearby.
There is tasty food here.
There is a bottle of water here.
>help
I know of places, actions, and things.  Most of my vocabulary
describes places and is used to move you there.  To move, try
words like forest, building, downstream, enter, east, west,
north, south, up or down.  I know about a few special
objects, like a black rod hidden in the cave.  These objects
can be manipulated using some of the action words I know.
Usually you will need to give both the object and action
words (In either order), but sometimes I can infer the
object from the verb alone.  Some objects also imply verbs;
in particular, "inventory" implies "take inventory", which
causes me to give you a list of what you're carrying.  The
objects have side effects; for instance, the rod scares the
bird.  Usually people having trouble moving just need
to try a few more words.  Usually people trying unsuccessfully
to manipulate an object are attempting something beyond their
(or my!) capabilities and should try a completely different
tack.  To speed the game you can sometimes move long distances
with a single word.  For example, "building" usually gets you
to the building from anywhere above ground except when lost
in the forest.  Also, note that cave passages turn a lot, and
that leaving a room to the north does not guarantee entering
the next from the south.
Good luck!
>

---------------------------

This is an early functional version of the game, probably there are still bugs to be fixed.

The main purpose of this experiment was to use the @extern attribute of subroutines, in order to have a large source file divided into several smaller source files, each using the @external mechanism.

