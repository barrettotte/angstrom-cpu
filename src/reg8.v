/* 8-bit register */

module reg8(
  input clk,
  input we,
  input [7:0] d,
  output reg [7:0] q
);

  always @(posedge clk) begin
    if (we) begin
      q <= d;
    end
  end

endmodule
