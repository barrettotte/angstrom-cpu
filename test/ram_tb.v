`include "src/ram.v"

module ram_tb;
  
  reg clk = 1'b0;
  reg wen = 1'b0;
  reg ren = 1'b0;
  reg [3:0] din = 4'b0;
  reg [11:0] addr = 12'b0;

  wire [3:0] dout;

  integer test_idx = 0;

  ram UUT(
    .clk_i(clk), .wen_i(wen), .ren_i(ren), .din_i(din), .addr_i(addr), 
    .dout_o(dout)
  );

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("bin/ram.vcd");
    $dumpvars(0, ram_tb);

    wen = 1'b1;
    din = 4'b0011;
    #25; test_idx++;

    wen = 1'b0;
    din = 4'b0101;
    addr++;
    #25; test_idx++;

    wen = 1'b1;
    #25; test_idx++;

    wen = 1'b0;
    ren = 1'b1;
    #25; test_idx++;

    ren = 1'b0;
    addr--;
    #25; test_idx++;

    ren = 1'b1;
    #25; test_idx++;

    $finish;
    $display("Testbench completed");
  end

endmodule
