# Architecture

## Summary

- 4-bit, accumulator-based, harvard architecture
- 16-bit instruction, 12-bit addresses
- 2048 byte ROM and 2048 byte RAM; 4-bit word size
- One general purpose 8-bit register, the accumulator

## Instruction Set

`IIIIXXXX XXXXXXXX` - 16 bit instruction

| Opcode | Mnemonic | Syntax | Description |
| ------ | -------- | ------ | ----------- |
| 0000   | `LDA`    |        | Load accumulator low nibble with memory |
| 0001   | `LDI`    |        | Load immediate into accumulator |
| 0010   | `STA`    |        | Store accumulator low nibble to memory |
| 0011   | `INP`    |        | Load input into accumulator |
| 0100   | `OUT`    |        | Load accumulator into output |
| 0101   | `BRC`    |        | Branch on carry flag set |
| 0110   | `BRZ`    |        | Branch on zero flag set |
| 0111   | `JMP`    |        | Unconditional jump to address |
| 1000   | `ADI`    |        | Add immediate to accumulator |
| 1001   | `ADD`    |        | Add memory to accumulator |
| 1010   | `SUB`    |        | Subtract memory to accumulator |
| 1011   | `AND`    |        | Logical AND accumulator with memory |
| 1100   | `ORR`    |        | Logical OR accumulator with memory |
| 1101   | `XOR`    |        | Logical XOR accumulator with memory |
| 1110   | `LSL`    |        | Logical shift left memory into accumulator |
| 1111   | `LSR`    |        | Logical shift right memory into accumulator |

### Examples

- `LDI #0` = `00010000 00000000` = `0x1000`
- `ADI #1` = `10000000 00000001` = `0x8001`

## Registers

| Register | Size   | Description     |
| -------- | ------ | ---------       |
| PC       | 12-bit | program counter |
| AC       | 8-bit  | accumulator     |
| FL       | 2-bit  | flags register  |

## Status Flags

| Mask | Flag  | Description |
| ---- | ----- | ----------- |
| 01 | `Z`   | Zero |
| 10 | `C`   | Carry |

## Control Signals

| Signal | Name |
| ------ | ---- |
| `CTRL_ALU` | Enable ALU output |
| `CTRL_MW` | Memory write |
| `CTRL_MR` | Memory read  |
| `CTRL_JMP` | jump |
| `CTRL_INP`  | Enable input |
| `CTRL_OUT` | Enable output |
