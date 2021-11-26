/* RAM 4096x4 - 12-bit addressing, 4-bit word */

`define RAM_SIZE 2 ** 12

module ram(
  input clk,
  input read,
  input write,
  input [3:0] in,
  input [11:0] addr,
  output [3:0] out
);

  reg[3:0] memory [(RAM_SIZE-1):0]

  // clear RAM on start
  initial begin
    for (i = 0; i < (RAM_SIZE-1); i++) begin
      memory[i] <= 4'b0;
    end
  end

  always @(posedge clk) begin
    if (write) begin
      memory[addr] = in;
    end
  end

  assign out = (read) ? memory[addr] : 16'b0;

endmodule
