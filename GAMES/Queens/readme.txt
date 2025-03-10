The eight queens puzzle is the problem of placing eight chess queens on an 8×8 chessboard so that no two queens threaten each other; 
thus, a solution requires that no two queens share the same row, column, or diagonal. 
There are 92 solutions.

This is a good example of a reentrant C routine called from cowgol.

To compile, use:
>cowgol -o -x -llibc misc.coo queens.cow q.c

Run sample:

D>queens

 Solution 1

* _ _ _ _ _ _ _
_ _ _ _ * _ _ _
_ _ _ _ _ _ _ *
_ _ _ _ _ * _ _
_ _ * _ _ _ _ _
_ _ _ _ _ _ * _
_ * _ _ _ _ _ _
_ _ _ * _ _ _ _

 Solution 2

* _ _ _ _ _ _ _
_ _ _ _ _ * _ _
_ _ _ _ _ _ _ *
_ _ * _ _ _ _ _
_ _ _ _ _ _ * _
_ _ _ * _ _ _ _
_ * _ _ _ _ _ _
_ _ _ _ * _ _ _

...

 Solution 92

_ _ _ _ _ _ _ *
_ _ _ * _ _ _ _
* _ _ _ _ _ _ _
_ _ * _ _ _ _ _
_ _ _ _ _ * _ _
_ * _ _ _ _ _ _
_ _ _ _ _ _ * _
_ _ _ _ * _ _ _

D>
