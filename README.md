# angstrom-cpu

A really simple 4-bit CPU designed to do the bare minimum.

I wanted to have a barebones architecture that I could physically build in
a weekend and COULD also implement in games such as Satisfactory, Minecraft, Rust, etc.

## Architecture

### Instruction Set

`IIII XXXX` - 8-bit instruction

| Opcode | Mnemonic | Description |
| ------ | -------- | ----------- |
| 0000 | `STA`  | Store accumulator into memory |
| 0001 | `LDA`  | Load memory into accumulator |
| 0010 | `LDI`  | Load immediate into accumulator |
| 0011 | `INP`  | Load input into accumulator |
| 0100 | `OUT`  | Load output into accumulator |
| 0101 | `JNZ`  | Jump if non-zero |
| 0110 | `JNC`  | Jump if no carry |
| 0111 | `JMP`  | Jump unconditionally |
| 1000 | `   `  |  |
| 1001 | `   `  |  |
| 1010 | `   `  |  |
| 1011 | `   `  |  |
| 1100 | `ADD`  | Add to accumulator |
| 1101 | `NAND`  | NAND |
| 1110 | `CMP`  | Compare register |
| 1111 | `   `  |  |

### Registers

| Register | Description     |
| -------- | --------------- |
| ACC      | Accumulator     |
| PC       | Program counter |
| INP      | Input port      |
| OUT      | Output port     |

## Build

Build and test a Verilog module - `./build.sh mod`

## References

- xxx
