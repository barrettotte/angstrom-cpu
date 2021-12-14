# angstrom-cpu

A 4-bit accumulator-based CPU designed to do the bare minimum and nothing more. 

## Architecture

This started out sounding like a good/fun idea, but I kind of failed on
execution...I should have really just made a simplified 8-bit CPU. 

### Summary

- 4-bit, accumulator-based, harvard architecture
- 16-bit instruction; 12-bit addressing; 65536 byte ROM (16x4096)
- 4-bit word size; 12-bit addressing; 16384 byte RAM (4x4096)
- One general purpose 8-bit register, the accumulator

### Instruction Set

| Opcode   | Mnemonic | Description | Example |
| -------- | -------- | ----------- | ------- |
| 0000 (0) | `LDA`    | Load accumulator low nibble with memory | [example](asm/0000_LDA.asm) | 
| 0001 (1) | `LDI`    | Load immediate into accumulator         | [example](asm/0001_LDI.asm) | 
| 0010 (2) | `STA`    | Store accumulator low nibble to memory  | [example](asm/0010_STA.asm) | 
| 0011 (3) | `INP`    | Load input into accumulator             | [example](asm/0011_INP.asm) | 
| 0100 (4) | `OUT`    | Load accumulator into output            | [example](asm/0100_OUT.asm) | 
| 0101 (5) | `BRC`    | Branch on carry flag set                | [example](asm/0101_BRC.asm) | 
| 0110 (6) | `BRZ`    | Branch on zero flag set                 | [example](asm/0110_BRZ.asm) | 
| 0111 (7) | `JMP`    | Unconditional jump to address           | [example](asm/0111_JMP.asm) | 
| 1000 (8) | `ADI`    | Add immediate to accumulator            | [example](asm/1000_ADI.asm) | 
| 1001 (9) | `ADD`    | Add memory to accumulator               | [example](asm/1001_ADD.asm) | 
| 1010 (A) | `SUB`    | Subtract memory to accumulator          | [example](asm/1010_SUB.asm) | 
| 1011 (B) | `AND`    | Logical AND accumulator with memory     | [example](asm/1011_AND.asm) | 
| 1100 (C) | `ORR`    | Logical OR accumulator with memory      | [example](asm/1100_ORR.asm) | 
| 1101 (D) | `XOR`    | Logical XOR accumulator with memory     | [example](asm/1101_XOR.asm) | 
| 1110 (E) | `LSL`    | Logical shift left accumulator          | [example](asm/1110_LSL.asm) | 
| 1111 (F) | `LSR`    | Logical shift right accumulator         | [example](asm/1111_LSR.asm) | 

### Registers

| Register | Size   | Description     |
| -------- | ------ | ---------       |
| PC       | 12-bit | program counter |
| AC       | 8-bit  | accumulator     |
| FL       | 2-bit  | flags register  |

### Status Flags

| Mask | Flag  | Description |
| ---- | ----- | ----------- |
| 01   | `Z`   | Zero  |
| 10   | `C`   | Carry |

### Control Signals

| Signal     | Name |
| ---------- | ---- |
| `CTRL_ALU` | Enable ALU output |
| `CTRL_MW`  | Memory write |
| `CTRL_MR`  | Memory read  |
| `CTRL_JMP` | jump |
| `CTRL_INP` | Enable input |
| `CTRL_OUT` | Enable output |

## Verilog Testbenches

example: `make target MOD=alu`

CPU with [test ROM](test/test_rom.txt): `make target MOD=cpu`

This makefile compiles the target module with `iverilog`, 
simulates it with `vvp`, and opens the waveform in `gtkwave`.

## Assembler

TODO: I hope to make a really simple assembler for this at some point in the future.

## References

- [6502 Assembly](https://en.wikibooks.org/wiki/6502_Assembly)
- [Intel 4004 Instruction set](http://e4004.szyc.org/iset.html)
- [Digital (circuit simulator)](https://github.com/hneemann/Digital)
