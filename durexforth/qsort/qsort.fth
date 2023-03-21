\ ported from forth example on
\ Rosetta Code
require ti
require qsortdata

: mid ( l r -- mid ) over - 2/ -1
and + ;

: exch ( addr1 addr2 -- ) dup c@ >r
over c@ swap c! r> swap c! ;

: partition ( l r -- l r r2 l2 )
  \ ." l r " .s cr abort
  2dup mid c@ >r ( r: pivot )
  2dup begin
    swap begin dup c@ r@ < while
    1+ repeat
    swap begin r@ over c@ < while
    1- repeat
    2dup > invert
    if 2dup exch >r 1+ r>
    1- then
  2dup > until  r> drop ;

: qsort ( l r -- )
  \ ." l r " .s cr
  partition
  \ ." l r r2 l2 " .s cr abort
  swap rot
  \ 2over 2over - + < if 2swap then
  2dup < if recurse else 2drop then
  2dup < if recurse else 2drop then ;

: sort ( array len -- )
  dup 2 < if 2drop exit then
  1-  over + qsort ;

: start
page
10 0 do 17 emit loop
qsortdata $0400 $100 move
." start..." cr
0>ti
$0400 $100 sort
ti. cr
." done!" cr ;
