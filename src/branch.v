/* Logic for determining if a branch should occur */

module branch(
  input [3:0] op_i,
  input flag_z_i,
  input flag_c_i,
  input ctrl_jmp_i,
  output reg branch_o
);

  reg brc, brz, jmp;

  always @(*) begin
    brc = flag_c_i & op_i[0];             // BRC = 0101
    brz = flag_z_i & (~op_i[0]);          // BRZ = 0110
    jmp = (op_i[0] & op_i[1] & op_i[2]);  // JMP = 0111

    branch_o <= (brc | brz | jmp) & ctrl_jmp_i;
  end

endmodule
