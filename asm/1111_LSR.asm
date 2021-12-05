; logical shift right memory into accumulator; 0b10 >> 1 = 0b01

LDI #2     ;  00010000 00000010    0x1002
STA #0x01  ;  00100000 00000001    0x2001
LDI #3     ;  00010000 00000011    0x1003
LSR #0x01  ;  11110000 00000001    0xF001
