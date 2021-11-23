/* RAM - 12-bit addressing, 4-bit word */

`define RAM_SIZE 2 ** 12

module ram(
  input clk,
  input writeEn,
  input readEn,
  input [3:0] dIn,
  input [11:0] addr,
  output [3:0] dOut
);

  reg[3:0] memory [(RAM_SIZE-1):0]

  // clear RAM on start
  initial begin
    for (i = 0; i < (RAM_SIZE-1); i++) begin
      memory[i] <= 4'b0;
    end
  end

  always @(posedge clk) begin
    if (writeEn) begin
      memory[addr] = dIn;
    end
  end

  assign dOut = (readEn) ? memory[addr] : 16'b0;

endmodule
