/* 8-bit register */

module reg8(
  input clk,
  input writeEn,
  input [7:0] dIn,
  output reg [7:0] dOut
);

  always @(posedge clk) begin
    if (writeEn) begin
      dOut <= dIn;
    end
  end

endmodule
