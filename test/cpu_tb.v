`include "src/cpu.v"

module cpu_tb;

  reg clk = 1'b0;
  reg [7:0] reg_inp = 8'b0;

  wire [7:0] reg_out = 8'b0;

  integer test_idx = 0;

  cpu UUT(.clk_i(clk), .reg_inp_i(reg_inp), .reg_out_o(reg_out));

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("bin/cpu.vcd");
    $dumpvars(0, cpu_tb);

    #25; test_idx++;

    #25; test_idx++;

    #25; test_idx++;

    #25; test_idx++;

    #25; test_idx++;

    #25; test_idx++;

    #25; test_idx++;

    #25; test_idx++;

    $finish;
    $display("Testbench completed");
  end

endmodule
