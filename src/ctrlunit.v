/* Control Unit */

module ctrlunit(
  input [3:0] op_i,
  output reg imm_o,
  output reg jmp_o,
  output reg mr_o,
  output reg mw_o,
  output reg inp_o,
  output reg out_o,
  output reg alu_o
);

  always @(*) begin

    imm_o = 1'b0;
    jmp_o = 1'b0;
    mr_o  = 1'b0;
    mw_o  = 1'b0;
    inp_o = 1'b0;
    out_o = 1'b0;
    alu_o = 1'b0;

    case (op_i)
      4'b0000:  mr_o  = 1'b1;  // LDA
      4'b0001:  imm_o = 1'b1;  // LDI
      4'b0010:  mw_o  = 1'b1;  // STA
      4'b0011:  inp_o = 1'b1;  // INP
      4'b0100:  out_o = 1'b1;  // OUT
      4'b0101:  jmp_o = 1'b1;  // BRC
      4'b0110:  jmp_o = 1'b1;  // BRZ
      4'b0111:  jmp_o = 1'b1;  // JMP
      4'b1000:  alu_o = 1'b1;  // ADI
      4'b1001:  alu_o = 1'b1;  // ADD
      4'b1010:  alu_o = 1'b1;  // SUB
      4'b1011:  alu_o = 1'b1;  // AND
      4'b1100:  alu_o = 1'b1;  // ORR
      4'b1101:  alu_o = 1'b1;  // XOR
      4'b1110:  alu_o = 1'b1;  // LSL
      4'b1111:  alu_o = 1'b1;  // LSR
    endcase
  end

endmodule
