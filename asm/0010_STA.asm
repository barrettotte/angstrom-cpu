; store accumulator low nibble to memory

LDI #9     ;  00010000 00001001    0x1009
STA #0x21  ;  00100000 00010101    0x2015
ADI #2     ;  10000000 00000010    0x8002
STA #0x00  ;  00100000 00000000    0x2000
