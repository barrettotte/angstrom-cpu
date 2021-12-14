/* 8-bit register */

module reg8(
  input clk_i,
  input wen_i,
  input [7:0] d_i,
  output reg [7:0] q_o
);

  always @(posedge clk_i) begin
    if (wen_i) begin
      q_o <= d_i;
    end
  end

endmodule
