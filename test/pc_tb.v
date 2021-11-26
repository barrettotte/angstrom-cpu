`include "src/pc.v"

module pc_tb;

  reg clk = 1'b0;
  reg rst = 1'b0;
  reg jmpEn = 1'b0;
  reg jmpAddr = 12'b0;

  wire [11:0] currAddr;

  integer testIdx = 0;

  pc UUT(
    .clk(clk), .rst(rst),
    .jmpEn(jmpEn), .jmpAddr(jmpAddr),
    .currAddr(currAddr)
  );

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("out/pc.vcd");
    $dumpvars(0, pc_tb);

    // reset
    rst = 1'b1;
    #10; testIdx++;

    // inc
    rst = 1'b0;
    #25; testIdx++;  // 5 increments

    // jump
    jmpEn = 1'b1;
    jmpAddr = 12'b000011110000;
    #10; testIdx++;  // addr + 1

    // reset
    jmpEn = 1'b0;
    rst = 1'b1;
    #10; testIdx++;

    // inc
    rst = 1'b0;
    #25; testIdx++;  // 5 increments

    // reset
    rst = 1'b1;
    #10; testIdx++;

    $finish;
    $display("Testbench completed");
  end

endmodule
