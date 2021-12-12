`include "src/cpu.v"

module cpu_tb;

  reg clk = 1'b0;
  reg [7:0] aib = 8'b0;

  wire [11:0] pc = 12'b0;
  wire [15:0] ins = 16'b0;
  wire [7:0] aob = 8'b0;
  wire [1:0] flags = 2'b0;
  wire [6:0] ctrl = 7'b0;

  integer test_idx = 0;

  branch UUT(
    .clk_i(clk), .aib_i(aib), .pc_o(pc), .ins_o(ins),
    .aob_o(aob), .flags_o(flags), .ctrl_o(ctrl)
  );

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("bin/cpu.vcd");
    $dumpvars(0, branch_tb);

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
