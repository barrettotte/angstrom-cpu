/* CPU - top level module */

`include "alu.v"
`include "ctrlunit.v"
`include "reg8.v"

module cpu(
  input clk,

  output reg [11:0] out_PC,
  output reg [7:0]  out_aci,
  output reg [7:0]  out_aco,
  output reg [1:0]  out_flags,  // [C,Z]
  output reg [6:0]  out_ctrl
);

  wire [11:0] curr_PC;
  wire [7:0] bus_ACC_INP, bus_ACC_OUT;
  wire flag_Z, flag_C;
  wire ctrl_IMM, ctrl_JMP, ctrl_MR, ctrl_MW, ctrl_INP, ctrl_OUT, ctrl_ALU;

  wire [15:0] ins;
  wire [3:0] ins_op;
  wire [12:0] ins_args;

  wire [7:0] bus_INP, bus_OUT;
  wire [7:0] bus_ALU_A;

  buf buf_INP(bus_INP, ctrl_INP), buf_OUT(bus_OUT, ctrl_OUT);

  buf ops_ALU(ins_op[2:0], ins_op[3]), ops_OTH(ins_op[2:0], ~ins_op[3]);

  // registers
  reg8 reg_ACC(.clk(clk), .writeEn(1'b1), .dIn(bus_ACC_INP), .dOut(bus_ACC_OUT));
  reg8 reg_INP(.clk(clk), .writeEn(ctrl_INP), .dIn(bus_ACC_INP), .dOut(bus_INP));
  reg8 reg_OUT(.clk(clk), .writeEn(ctrl_OUT), .dIn(bus_ACC_OUT), .dOut(bus_OUT));
  pc   reg_PC(.clk(clk), .rst(1'b0), .jmpEn(ctrl_JMP), .jmpAddr(12'b0), .currAddr(curr_PC));  // TODO: jmpAddr

  // memory
  rom rom(.addr(curr_PC), .out(ins));
  ram ram(.clk(clk), .write(ctrl_MW), .read(ctrl_MR), .in(4'b0), .addr(12'b0), .out(4'b0));  // TODO: dIn ; addr ; dOut

  // modules
  alu alu(.a(bus_ALU_A), .b(bus_ACC_OUT), .func(ins_op[2:0]), .res(bus_ACC_INP), .fz(flag_Z), .fc(flag_C));
  
  ctrlunit ctrlunit(.opcode(ins_op[3:0]), .ctrl_IMM(ctrl_IMM), .ctrl_JMP(ctrl_JMP), .ctrl_MR(ctrl_MR), 
    .ctrl_MW(ctrl_MW), .ctrl_INP(ctrl_INP), .ctrl_OUT(ctrl_OUT), .ctrl_ALU(ctrl_ALU));


  // TODO: branching check
  // TODO: ALU ops with buffers
  // TODO: 


  // outputs
  assign out_pc <= curr_PC;
  assign out_aci <= bus_ACC_INP;
  assign out_aco <= bus_ACC_OUT;
  assign out_flags <= {flag_C, flag_Z};
  assign out_ctrl <= {ctrl_IMM, ctrl_JMP, ctrl_MR, ctrl_MW, ctrl_INP, ctrl_OUT, ctrl_ALU};

endmodule
