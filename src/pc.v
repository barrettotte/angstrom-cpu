/* 12-bit program counter */

module pc(
  input clk,
  input rst,
  input jmpEn,
  input [11:0] jmpAddr,
  output reg [11:0] currAddr
);

  always @(posedge clk) begin
    if (reset)       currAddr <= 12'b0;
    else if (jmpEn)  currAddr <= jmpAddr;
    else             currAddr <= currAddr + 1;
  end

endmodule
