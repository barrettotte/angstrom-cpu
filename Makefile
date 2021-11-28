COMPILE = iverilog
SIMULATE = vvp
VIEW = gtkwave

OUT = bin
SRC = src
TEST = test

MOD =

clean:
		-rm -f $(OUT)/*

target:
		@mkdir -p $(OUT)
		$(COMPILE) "$(TEST)/$(MOD)_tb.v" -I $(SRC) -o "$(OUT)/$(MOD).vvp"
		$(SIMULATE) "$(OUT)/$(MOD).vvp"
		$(VIEW) "$(OUT)/$(MOD).vcd"
