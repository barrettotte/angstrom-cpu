; logical shift left memory into accumulator; 0b01 << 1 = 0b10

LDI #1     ;  00010000 00000001    0x1001
STA #0x01  ;  00100000 00000001    0x2001
LDI #3     ;  00010000 00000011    0x1003
LSL #0x01  ;  11100000 00000001    0xE001
