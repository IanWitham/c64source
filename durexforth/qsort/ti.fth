\ jiffyclock words by Whammo...
\ https://github.com/jkotlinski
\ /durexforth/discussions/445

: irqpeek $dc0e c@ ;
: irqpoke $dc0e c! ;
: irqoff irqpeek $fe and irqpoke ;
: irqon irqpeek 1 or irqpoke ;

: 0>ti 0 0 $a0 ! $a1 ! ;

: ti>d ( -- d )
irqoff $a0 c@ $a2 c@ $a1 c@
irqon 256 * or swap ;

: ti. (  -- )
ti>d 3600 um/mod swap 60 /mod
swap >r >r
60 /mod . . r> . r> . cr ;

: hmsj>d ( h m s j -- d )
>r >r >r 60 * r> + \ minutes
r> 60 * r> + >r
3600 um* r> m+ ;

: d>ti ( d -- )
 swap dup 100/ swap 255 and
irqoff $a2 c! $a1 c!
$a0 c! irqon ;

: hmsj>ti ( h m s j -- )
hmsj>d d>ti ;
