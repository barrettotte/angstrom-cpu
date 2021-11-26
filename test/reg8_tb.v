`include "src/reg8.v"

module reg8_tb;

  reg clk = 1'b0;
  reg wen = 1'b0;
  reg d = 7'b0;
  reg o = 7'b0;

  integer testIdx = 0;

  reg8 UUT(.clk(clk), .writeEn(wen), .dIn(d), .dOut(o));
  
  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("out/reg8.vcd");
    $dumpvars(0, reg8_tb);

    wen = 1'b1;
    d = 7'b11001100;
    #10; testIdx++;

    wen = 1'b0;
    d = 7'b11111111;
    #10; testIdx++;

    $finish;
    $display("Testbench completed");
  end

endmodule
