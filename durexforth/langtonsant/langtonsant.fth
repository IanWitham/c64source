require gfx
0 value dir
160 value x
100 value y

: left dir 1- 3 and to dir ;
: right dir 1+ 3 and to dir ;

: walk dir case
0 of x 1- to x endof
1 of y 1+ to y endof
2 of x 1+ to x endof
     y 1- to y endcase ;

: mainloop begin
\ walk forward one square
walk
\ if pixel is clear, turn left,
\ else turn right
x y peek 0= if left else right then
\ flip pixel
x y plot again ;

: start
hires 1 clrcol
1 erase \ sets plot to xor (set, unset)
mainloop ;
