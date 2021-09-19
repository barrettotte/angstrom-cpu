# Architecture

## Summary

- 4-bit, accumulator-based, harvard architecture
- One general purpose 8-bit register, the accumulator
- TODO: instruction size
- Memory-mapped I/O

## Instruction Set

`IIIIXXXX XXXXXXXX` - 16 bit instruction

12-bit address = 0-256 nibbles = 0-128 bytes

16 pages = 2048 bytes

| Opcode | Mnemonic | Syntax | Description |
| ------ | -------- | ------ | ----------- |
| 0000   | `LDA`    |        | Load accumulator low nibble with memory |
| 0001   | `STA`    |        | Store accumulator low nibble to memory |
| 0010   | `   `    |        | |
| 0011   | `   `    |        | |
| 0100   | `PHA`    |        | Push accumulator onto stack |
| 0101   | `PPA`    |        | Pop stack into accumulator |
| 0110   | `PHP`    |        | Push status register onto stack |
| 0111   | `CMP`    |        | Compare accumulator with memory |
| 1000   | `JMP`    |        | Branch always |
| 1001   | `BRZ`    |        | Branch on zero flag set |
| 1010   | `ADD`    |        | Add memory to accumulator |
| 1011   | `   `    |        | |
| 1100   | `AND`    |        | Logical AND accumulator with memory |
| 1101   | `   `    |        | |
| 1110   | `   `    |        | |
| 1111   | `SWP`    |        | Swap low nibble and high nibble of accumulator |

## Memory Map

- 128-byte (256-nibble) memory pages
- three output devices, one input device

| Page | Address Range | Description |
| ---- | ------------- | ----------- |
| `0`  | `$000-$0FF`   | Internal + general purpose |
| `1`  | `$100-$1FF`   | Stack |
| `2`  | `$200-$2FF`   | General purpose |
| `3`  | `$300-$3FF`   | General purpose |
| `4`  | `$400-$4FF`   | General purpose |
| `5`  | `$500-$5FF`   | General purpose |
| `6`  | `$600-$6FF`   | General purpose |
| `7`  | `$700-$7FF`   | General purpose |
| `8`  | `$800-$8FF`   | General purpose |
| `9`  | `$900-$9FF`   | General purpose |
| `A`  | `$A00-$AFF`   | General purpose |
| `B`  | `$B00-$BFF`   | General purpose |
| `C`  | `$C00-$CFF`   | Input device 0 |
| `D`  | `$D00-$DFF`   | Output device 0 |
| `E`  | `$E00-$EFF`   | Output device 1 |
| `F`  | `$F00-$FFF`   | Output device 2 |

## Registers

All registers are 8-bit.

| Register | Size   | Description     |
| -------- | ------ | ---------       |
| PC       | 12-bit | program counter |
| AC       | 8-bit  | accumulator     |
| SP       | 8-bit  | stack pointer   |

## Status Flags

| Mask     | Flag  | Description |
| -------- | ----- | ----------- |
| 00000001 | `Z`   | Zero |
| 00000010 | `C`   | Carry |
| 00000100 | `V`   | Overflow |
| 00001000 | `H`   | Halt |
| 00010000 | `I1`  | Hardware interrupt 0 |
| 00100000 | `I2`  | Hardware interrupt 1 |
| 01000000 | `I3`  | Hardware interrupt 2 |
| 10000000 | `IS`  | Software interrupt |
