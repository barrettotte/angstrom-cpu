/* CPU - top level module */

`include "alu.v"
`include "ctrlunit.v"
`include "reg8.v"

module cpu(
  input clk
);

  wire ctrl_IMM, ctrl_JMP, ctrl_MR, ctrl_MW, ctrl_INP, ctrl_OUT, ctrl_ALU;
  wire flag_Z, flag_C;

  wire [15:0] ins;
  wire [3:0] ins_op;
  wire [12:0] ins_args;

  wire [7:0] bus_ACC_INP, bus_ACC_OUT;
  wire [7:0] bus_INP, bus_OUT;
  wire [7:0] bus_ALU_A, bus_ALU_B;

  always @(posedge clk) begin
    // TODO:
  end

  reg8 reg_ACC(.clk(clk), .writeEn(1'b1), .dIn(bus_ACC_INP), .dOut(bus_ACC_OUT));
  reg8 reg_INP(.clk(clk), .writeEn(ctrl_INP), .dIn(bus_ACC_INP), .dOut(bus_INP));
  reg8 reg_OUT(.clk(clk), .writeEn(ctrl_OUT), .dIn(bus_ACC_OUT), .dOut(bus_OUT));

  alu alu(.a(bus_ALU_A), .b(bus_ALU_B), .func(ins_op[2:0]), .result(bus_ACC_INP), .zero(flag_Z), .carry(flag_C));
  ctrlunit ctrlunit(.opcode(ins_op[3:0]), .ctrl_IMM(ctrl_IMM), .ctrl_JMP(ctrl_JMP), .ctrl_MR(ctrl_MR), 
    .ctrl_MW(ctrl_MW), .ctrl_INP(ctrl_INP), .ctrl_OUT(ctrl_OUT), .ctrl_ALU(ctrl_ALU));
  
  // TODO: unconditional jump; ins_op[2:0]
  // TODO: conditional jump
  // TODO: if true, PC jump

endmodule
