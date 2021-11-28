`include "src/reg8.v"

module reg8_tb;

  reg clk = 1'b0;
  reg wen = 1'b0;
  reg [7:0] d = 8'b0;

  wire [7:0] q = 8'b0;

  integer test_idx = 0;

  reg8 UUT(
    .clk_i(clk), .wen_i(wen), .d_i(d), 
    .q_o(q)
  );
  
  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("bin/reg8.vcd");
    $dumpvars(0, reg8_tb);

    // d should be saved to q
    wen = 1'b1;
    d = 8'b11001100;
    #25; test_idx++;

    // d should not be saved to q
    wen = 1'b0;
    d = 8'b11111111;
    #25; test_idx++;

    $finish;
    $display("Testbench completed");
  end

endmodule
