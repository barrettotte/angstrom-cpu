`include "src/pc.v"

module pc_tb;

  reg clk = 1'b0;
  reg rst = 1'b0;
  reg jmp_en = 1'b0;
  reg [11:0] jmp_addr = 12'b0;

  wire [11:0] curr_addr;

  integer test_idx = 0;

  pc UUT(
    .clk_i(clk), .rst_i(rst), .jmp_en_i(jmp_en), .jmp_addr_i(jmp_addr),
    .addr_o(curr_addr)
  );

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("bin/pc.vcd");
    $dumpvars(0, pc_tb);

    // reset
    rst = 1'b1;
    #25; test_idx++;

    // inc
    rst = 1'b0;
    #25; test_idx++;

    // jump
    jmp_en = 1'b1;
    jmp_addr = 12'b000011110000;
    #25; test_idx++;  // addr + 1

    // reset
    jmp_en = 1'b0;
    rst = 1'b1;
    #25; test_idx++;

    // inc
    rst = 1'b0;
    #25; test_idx++;

    // reset
    rst = 1'b1;
    #25; test_idx++;

    $finish;
    $display("Testbench completed");
  end

endmodule
