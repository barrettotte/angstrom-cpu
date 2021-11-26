`include "src/ram.v"

module ram_tb;
  
  reg clk = 1'b0;
  reg write = 1'b0;
  reg read = 1'b0;
  reg [3:0] in = 4'b0;
  reg [11:0] addr = 12'b0;

  wire [3:0] out;

  integer testIdx = 0;

  ram UUT(.clk(clk), .write(write), .read(read), .in(in), .addr(addr), .out(out));

  always begin
    clk = ~clk; #5;
  end

  initial begin
    $dumpfile("out/ram.vcd");
    $dumpvars(0, ram_tb);

    write = 1'b1;
    in = 4'b0011;
    #10; testIdx++;

    write = 1'b0;
    in = 4'b0001;
    addr++;
    #10; testIdx++;

    write = 1'b1;
    #10; testIdx++;

    write = 1'b0;
    #10; testIdx++;

    addr--;
    #10; testIdx++;

    $finish;
    $display("Testbench completed");
  end

endmodule
