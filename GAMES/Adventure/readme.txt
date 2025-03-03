The Colossal Cave adventure game, ported to the Cowgol language.

The advent1.txt ... advent4.txt files must be present when running the game.

It must be compiled on a 128KB/512KB RAM Z80 machine.

The file vocab.txt contains all the accepted verbs and nouns.

To save a game say : save (or suspend)
To restore a saved game use the 'r' option: >advent r

Here is a run sample, including some hints:

c>advent


                Welcome to ADVENTURE!
                =====================
        -Original development by Willie Crowther.
        -Major features added by Don Woods.
        -Conversion to BDS  C by J. R. Jaeger
        -Unix standardization by Jerry D. Pohl.
        -OS/2 Conversion by Martin Heller
        -Conversion to TurboC 2.0 by Daimler

            Would you like instructions?

>y


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
>eat food
Thank you.  It was delicious!
>drink water
The bottle of water is now empty.
>take keys
ok.
>take lamp
ok.
>light lamp
Your lamp is now on.
>inventory
You are currently holding the following:
Set of keys.
Brass lantern
>go west
You are standing at the end of a road before a small brick
building.  Around you is a forest.  A small stream flows out
of the building and down a gully.
>
...
---------------------------

This is an early functional version of the game, probably there are still bugs to be fixed.

The main purpose of this experiment was to use the @extern attribute of subroutines, in order to have a large source file divided into several smaller source files, each using the @external mechanism.

It also validated the capability of the tools belonging to the Cowgol toochain.

As a detail ilustrating the size of this project: the Z80 assembler source file containing the game, built by the compiler, has ~13000 lines, its size is > 200 KB.
