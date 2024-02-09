The Startrek game, rewritten in the Cowgol language

It can be compiled only on Z80 machines provided with 128/512 KB RAM

The st.* files are needed at run time.

E>cowgol startrek.cow xrnd.as
COWGOL COMPILER (CP/M-80) V2.0
Copyright (C) David Given
STARTREK.COW
0:COWFE     STARTREK.COW $CTMP1.$$$
COWFE: 21kB free main memory
63kB free extended memory
  > STARTREK.COW
done: 4kB free main memory
40kB free extended memory
0:COWBE $CTMP1.$$$ STARTREK.COO
COWBE: 22kB free
__main
Exit
get_char
print_char
print
print_nl
itoa
isdigit
atoi
StrCpy
StrCmp
StrLen
StrCat
MemSet
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
fgets
showfile
get_c
get_map
put_map
get_quad
put_quad
TO_FIXED
FROM_FIXED
TO_FIXED00
FROM_FIXED00
get_rand
rand8
input
yesno
input_f00
input_int
print100
get_dev_name
quadrant_name
isqrt
abs16
abs32
square00
distance_to
cint100
find_space
fs_empty_pl_k
fs_empty_pl_b
fs_empty_pl
inoperable
wipe_klingon
repair_damage
klingons_shoot
klingons_move
intro
initialize
place_ship
new_quadrant
damage_control
shield_control
man_energy
get_status
s_range_scan
complete_man
course_control
put1bcd
putbcd
l_range_scan
no_klingon
phaser_control
torpedo_hit
photon_tor
galactic_rec
status_report
estimate2
estimate1
compute_vector
torpedo_data
nav_data
dirdist_calc
galaxy_map
lib_computer
new_game
end_of_game
resign
end_of_time
ship_destroyed
won_game
done: 11kB free
XRND.AS
0:Z80AS -J -OXRND.OBJ XRND.AS
Z80AS Macro-Assembler V4.8

Errors: 0
Finished.
ERA $CTMP1.$$$
ERA $CTMP2.$$$
0:COWLINK COWGOL.COO STARTREK.COO -o $CTMP1.$$$
COWLINK: 46kB free
Adding input file: COWGOL.COO
Adding input file: STARTREK.COO
Analysing...
Workspace sizes:
  #0: 845 bytes
  #1: 0 bytes
  #2: 0 bytes
  #3: 0 bytes
Creating output file: $CTMP1.$$$
Copying from input file: COWGOL.COO
Copying from input file: STARTREK.COO
done: 32kB free
ERA STARTREK.COO
0:COWFIX $CTMP1.$$$ $CTMP2.$$$
0:Z80AS -J -N -OSTARTREK.OBJ $CTMP2.$$$
Z80AS Macro-Assembler V4.8

Errors: 0

Jump optimizations done: 308
Finished.
0:LINK -Z -Ptext=100H,data,bss -C100H -OSTARTREK.COM STARTREK.OBJ   XRND.OBJ
ERA $CTMP1.$$$
ERA $CTMP2.$$$
ERA $$EXEC.$$$

E>startrek

 *************************************
 *                                   *
 *                                   *
 *      * * Super Star Trek * *      *
 *                                   *
 *                                   *
 *************************************



Do you need instructions (y/Y=YES):






                         ------*------
         -------------   `---  ------'
         `-------- --'      / /
                  \\\\-------  --
                  '-----------'

       The USS Enterprise --- NCC - 1701

Your orders are as follows:
 Destroy the 17 Klingon warships which have invaded
 the galaxy before they can attack Federation Headquarters
 on stardate 2630. This gives you 30 days.
 You have 2 starbase(s) in the galaxy for resupplying your ship.

Hit any key to accept command.
Your mission begins with your starship located

in the Deneb I quadrant...

  -1--2--3--4--5--6--7--8-
1  *              *        1    Stardate            2600
2     *           *        2    Condition           yellow
3                       *  3    Quadrant            2, 5
4                          4    Sector              7, 1
5                 *        5    Photon Torpedoes    10
6        *                 6    Total Energy        3000
7 <*>                      7    Shields             0
8                          8    Klingons Remaining  17
  -1--2--3--4--5--6--7--8-

Command?

