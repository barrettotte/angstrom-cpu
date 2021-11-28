/* Arithmetic Logic Unit - 8 ops */

module alu(
  input [7:0] a_imm_i,
  input [7:0] a_mem_i,
  input [7:0] b_i,
  input [2:0] func_i,
  output reg [7:0] result_o,
  output reg fz_o,
  output reg fc_o
);

  reg [7:0] a;
  reg is_imm;

  always @(*) begin
    is_imm = ~(func_i[0] | func_i[1] | func_i[2]);  // ADI = 000
    a = (is_imm == 1'b1) ? a_imm_i : a_mem_i;
    fc_o = 1'b0;

    case(func_i)
      3'b000:  {fc_o, result_o} = a + b_i;  // ADI
      3'b001:  {fc_o, result_o} = a + b_i;  // ADD
      3'b010:  {fc_o, result_o} = a - b_i;  // SUB
      3'b011:  result_o = a & b_i;          // AND
      3'b100:  result_o = a | b_i;          // ORR
      3'b101:  result_o = a ^ b_i;          // XOR
      3'b110:  result_o = a << 1;           // LSL
      3'b111:  result_o = a >> 1;           // LSR
    endcase

    fz_o = (result_o == 8'b0) ? 1'b1 : 1'b0;
  end

endmodule
