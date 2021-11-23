/* Control Unit */

module ctrlunit(
  input [3:0] opcode,
  output reg ctrl_IMM,
  output reg ctrl_JMP,
  output reg ctrl_MR,
  output reg ctrl_MW,
  output reg ctrl_INP,
  output reg ctrl_OUT,
  output reg ctrl_ALU
);

  always @(*) begin

    ctrl_IMM = 1'b0;
    ctrl_JMP = 1'b0;
    ctrl_MR  = 1'b0;
    ctrl_MW  = 1'b0;
    ctrl_INP = 1'b0;
    ctrl_OUT = 1'b0;
    ctrl_ALU = 1'b0;

    case (opcode)
      4'b0000:  ctrl_MR  = 1'b1;  // LDA
      4'b0001:  ctrl_IMM = 1'b1;  // LDI
      4'b0010:  ctrl_MW  = 1'b1;  // STA
      4'b0011:  ctrl_INP = 1'b1;  // INP
      4'b0100:  ctrl_OUT = 1'b1;  // OUT
      4'b0101:  ctrl_JMP = 1'b1;  // BRC
      4'b0110:  ctrl_JMP = 1'b1;  // BRZ
      4'b0111:  ctrl_JMP = 1'b1;  // JMP
      4'b1000:  ctrl_ALU = 1'b1;  // ADI
      4'b1001:  ctrl_ALU = 1'b1;  // ADD
      4'b1010:  ctrl_ALU = 1'b1;  // SUB
      4'b1011:  ctrl_ALU = 1'b1;  // AND
      4'b1100:  ctrl_ALU = 1'b1;  // ORR
      4'b1101:  ctrl_ALU = 1'b1;  // XOR
      4'b1110:  ctrl_ALU = 1'b1;  // LSL
      4'b1111:  ctrl_ALU = 1'b1;  // LSR
    endcase
  end

endmodule
