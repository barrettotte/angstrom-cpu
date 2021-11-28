# angstrom-cpu

A 4-bit accumulator-based CPU designed to do the bare minimum and nothing more. 

I wanted to have a barebones architecture that I could physically build in
a weekend and COULD also implement in games such as Satisfactory, Minecraft, Rust, etc.

## Architecture

TODO: move notes to here

TODO: simple block diagram of high level modules

See [docs/architecture.md](docs/architecture.md)

## Run Testbench

`make target MOD=alu`

This makefile compiles the target module with `iverilog`, 
simulates it with `vvp`, and opens the waveform in `gtkwave`.

## References

- [6502 Assembly](https://en.wikibooks.org/wiki/6502_Assembly)
- [Intel 4004 Instruction set](http://e4004.szyc.org/iset.html)
- [Digital](https://github.com/hneemann/Digital)
