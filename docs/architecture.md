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
| 0000   | `NOP`    |        | No operation |
| 0001   | `LDA`    |        | Load accumulator low nibble with memory |
| 0010   | `STA`    |        | Store accumulator low nibble to memory |
| 0011   | `LDI`    |        | Load immediate into accumulator |
| 0100   | `INP`    |        | Load input into accumulator |
| 0101   | `OUT`    |        | Load accumulator into output |
| 0110   | `BRZ`    |        | Branch on zero flag set |
| 0111   | `JMP`    |        | Jump to address |
| 1000   | `ADD`    |        | Add memory to accumulator |
| 1001   | `ADI`    |        | Add immediate to accumulator |
| 1010   | `SUB`    |        | Subtract memory to accumulator |
| 1011   | `AND`    |        | Logical AND accumulator with memory |
| 1100   | `ORR`    |        | Logical OR accumulator with memory |
| 1101   | `XOR`    |        | Logical XOR accumulator with memory |
| 1110   | `SWP`    |        | Swap low nibble and high nibble of accumulator |
| 1111   | `HLT`    |        | Halt processor |

## Registers

All registers are 8-bit.

| Register | Size   | Description     |
| -------- | ------ | ---------       |
| PC       | 12-bit | program counter |
| AC       | 8-bit  | accumulator     |
| FL       | 4-bit  | flags register  |

## Status Flags

| Mask     | Flag  | Description |
| -------- | ----- | ----------- |
| 00000001 | `Z`   | Zero |
| 00000010 | `C`   | Carry |
| 00000100 | `V`   | Overflow |
| 00001000 | `H`   | Halt |
