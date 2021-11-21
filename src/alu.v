/* Arithmetic Logic Unit - 8 ops */

module alu(
  input [7:0] a,
  input [7:0] b,
  input [2:0] func,
  output reg [7:0] result,
  output reg zero,
  output reg carry
);

  always @(*) begin
    carry = 1'b0;

    case(func)
      3'b000:  {carry, result} = a + b;  // ADI
      3'b001:  {carry, result} = a + b;  // ADD
      3'b010:  {carry, result} = a - b;  // SUB
      3'b011:  result = a & b;           // AND
      3'b100:  result = a | b;           // ORR
      3'b101:  result = a ^ b;           // XOR
      3'b110:  result = a << 1;          // LSL
      3'b111:  result = a >> 1;          // LSR
    endcase

    zero = (result == 8'b0) ? 1'b1 : 1'b0;
  end

endmodule
