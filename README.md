# angstrom-cpu

A 4-bit accumulator-based CPU designed to do the bare minimum.

I wanted to have a barebones architecture that I could physically build in
a weekend and COULD also implement in games such as Satisfactory, Minecraft, Rust, etc.

## Architecture

### Instruction Set

512 bytes = 1024 memory cells

`IIII AAAAAAAA` - 16 bit instruction
`IIII RRRR` - 8 bit instruction

| Opcode | Mnemonic | Syntax | Description |
| ------ | -------- | ------ | ----------- |
| 0000   | `LDA`    |        | Load accumulator with memory |
| 0001   | `STA`    |        | Store accumulator with memory |
| 0010   | `   `    |        | |
| 0011   | `   `    |        | |
| 0100   | `   `    |        | |
| 0101   | `PHA`    |        | push accumulator to stack |
| 0110   | `PPA`    |        | pop from stack into accumulator |
| 0111   | `PHP`    |        | push status register to stack |
| 1000   | `JMP`    |        | Branch always |
| 1001   | `BRZ`    |        | Branch on zero flag set |
| 1010   | `INP`    |        | load input register with accumulator |
| 1011   | `OUT`    |        | load accumulator into output register |
| 1100   | `ADD`    |        | add memory to accumulator |
| 1101   | `   `    |        | |
| 1110   | `   `    |        | |
| 1111   | `NOR`    |        | logical NOR memory to accumulator |


### Registers

| Register | Description     |
| -------- | --------------- |
| ACC      | accumulator     |
| PC       | program counter |
| SP       | stack pointer   |


## Build

Build and test a Verilog module - `./build.sh mod`

## References

- [6502 Assembly](https://en.wikibooks.org/wiki/6502_Assembly)
