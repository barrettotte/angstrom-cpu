/* 8-bit register */

module reg8(
  input clk_i,
  input wen_i,
  input [7:0] d_i,
  output [7:0] q_o
);

  reg [7:0] o;

  always @(posedge clk_i) begin
    if (wen_i) begin
      o <= d_i;
    end
  end

  assign q_o = o;

endmodule
