    1 rem if copying source into vice,
    2 rem remember to retype special
    3 rem characters on lines 400-460
    5 poke53281,1
   10 dimr(40)
   15 fori=1to40:r(i)=2^int(rnd(.)*4+1):next
   20 fori=1to40
   40 ifi=1thent=127:goto200
  100 l=r(i-1)
  110 ifl=1thent=4or8or64
  120 ifl=2thent=4or8or64or16
  130 ifl=4thent=35
  140 ifl=8thent=35
  150 ifl=16thent=1or2or32
  160 ifl=32thent=16or64or4or8
  170 ifl=64thent=4or8or16or64
  200 u=r(i)
  210 ifu=1thent=t and(32or64)
  220 ifu=2thent=t and(32or64)
  230 ifu=4thent=t and(16or64or32)
  240 ifu=8thent=t and(16or64or32)
  250 ifu=16thent=t and(1or4)
  260 ifu=32thent=t and10
  270 ifu=64thent=t and48 :rem16or32
  300 ift=48thent=16+((rnd(.)*2)and1)*16
  310 ift=5thent=1+((rnd(.)*2)and1)*3
  320 ift=96thent=32+((rnd(.)*2)and1)*32
  330 ift=80thent=16+((rnd(.)*2)and1)*48
  340 ift=10thent= 2+((rnd(.)*2)and1)* 6
  350 ift=112thent=2^int(rnd(.)*3+4)
  390 r(i)=t
  400 ift=1thenprint"{rvof}{gry2}{SHIFT-POUND}";:next
  410 ift=2thenprint"{rvof}{gry1}{SHIFT-POUND}";:next
  420 ift=4thenprint"{rvof}{gry2}{CBM-*}";:next
  430 ift=8thenprint"{rvof}{gry1}{CBM-*}";:next
  440 ift=16thenprint"{rvon}{gry2}{SHIFT-POUND}";:next
  450 ift=32thenprint"{rvon}{gry1}{CBM-*}";:next
  460 ift=64thenprint"{rvof} ";:next
  470 ifi=41thengoto20
  480 print:printl,u,i,t
