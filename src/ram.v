/* RAM 4096x4 - 12-bit addressing, 4-bit word */

module ram(
  input clk_i,
  input ren_i,
  input wen_i,
  input [3:0] din_i,
  input [11:0] addr_i,
  output [3:0] dout_o
);

  reg [3:0] memory [4095:0];
  integer i;

  // clear RAM on start
  initial begin
    for (i = 0; i < 4095; i++) begin
      memory[i] <= 4'b0;
    end
  end

  always @(posedge clk_i) begin
    if (wen_i) begin
      memory[addr_i] = din_i;
    end
  end

  assign dout_o = (ren_i) ? memory[addr_i] : 16'b0;

endmodule
