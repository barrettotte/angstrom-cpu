/* Arithmetic Logic Unit - 8 ops */

module alu(
  input [7:0] a,
  input [7:0] b,
  input [2:0] func,
  output reg [7:0] res,
  output reg fz,
  output reg fc
);

  always @(*) begin
    fc = 1'b0;

    case(func)
      3'b000:  {fc, res} = a + b;  // ADI
      3'b001:  {fc, res} = a + b;  // ADD
      3'b010:  {fc, res} = a - b;  // SUB
      3'b011:  res = a & b;           // AND
      3'b100:  res = a | b;           // ORR
      3'b101:  res = a ^ b;           // XOR
      3'b110:  res = a << 1;          // LSL
      3'b111:  res = a >> 1;          // LSR
    endcase

    fz = (res == 8'b0) ? 1'b1 : 1'b0;
  end

endmodule
