/* CPU - top level module */

`include "alu.v"
`include "branch.v"
`include "ctrlunit.v"
`include "pc.v"
`include "ram.v"
`include "reg8.v"
`include "rom.v"

module cpu(
  input clk_i,
  input [7:0]  aib_i,         // ACC input bus
  output reg [11:0] pc_o,
  output reg [15:0] ins_o,
  output reg [7:0]  aob_o,    // ACC output bus
  output reg [1:0]  flags_o,  // [C,Z]
  output reg [6:0]  ctrl_o    // [OUT, INP, MW, MR, JMP, IMM, ALU]
);

  wire [11:0] curr_pc;
  wire [15:0] curr_ins;
  wire [7:0] bus_aib, bus_aob;
  wire [7:0] bus_out, bus_inp, bus_imm, bus_mem, bus_alu;

  wire [2:0] func_alu, func_other;

  wire flag_z, flag_c, pc_load;
  wire ctrl_imm, ctrl_jmp, ctrl_mr, ctrl_mw, ctrl_inp, ctrl_out, ctrl_alu;

  // buffers
  wire [7:0] buf_inp_to_aib; // INP
  wire [7:0] buf_imm_to_aib; // LDI
  wire [7:0] buf_alu_to_aib; // ALU opcodes
  wire [7:0] buf_aob_to_out; // OUT

  // bufif inp_to_aib(bus_aib, bus_inp, ctrl_inp);  // INP
  // bufif1 imm_to_aib(bus_aib, bus_imm, ctrl_imm);  // LDI
  // bufif1 alu_to_aib(bus_aib, bus_alu, ctrl_alu);  // ALU opcodes
  // bufif1 aob_to_out(bus_out, bus_aob, ctrl_out);  // OUT

  // registers

  pc reg_pc(.clk_i(clk_i), .rst_i(1'b0), .jmp_en_i(pc_load), 
    .jmp_addr_i(curr_ins[11:0]), .addr_o(curr_pc));

  reg8 reg_acc(.clk_i(clk_i), .wen_i(1'b1),     .d_i(bus_aib), .q_o(bus_aob));
  reg8 reg_inp(.clk_i(clk_i), .wen_i(ctrl_inp), .d_i(bus_inp), .q_o(bus_aib));
  reg8 reg_out(.clk_i(clk_i), .wen_i(ctrl_out), .d_i(bus_aob), .q_o(bus_out));

  // top level modules

  rom rom(.addr_i(curr_pc), .data_o(curr_ins));

  ctrlunit ctrlunit(.op_i(curr_ins[15:12]), .imm_o(ctrl_imm), .jmp_o(ctrl_jmp), .mr_o(ctrl_mr), 
    .mw_o(ctrl_mw), .inp_o(ctrl_inp), .out_o(ctrl_out), .alu_o(ctrl_alu));

  branch branch(.op_i(curr_ins[15:12]), .flag_z_i(flag_z), .flag_c_i(flag_c), 
    .ctrl_jmp_i(ctrl_jmp), .branch_o(pc_load));

  ram ram(.clk_i(clk_i), .ren_i(ctrl_mr), .wen_i(ctrl_mw), 
    .din_i(bus_alu), .addr_i(curr_ins[11:0]), .dout_o(bus_mem));

  alu alu(.a_imm_i(curr_ins[7:0]), .a_mem_i(bus_mem), .b_i(bus_aob), .func_i(curr_ins[14:12]), 
    .result_o(bus_alu), .fz_o(flag_z), .fc_o(flag_c));

  // outputs
  assign pc_o = curr_pc;
  assign ins_o = curr_ins;
  assign aob_o = bus_aob;
  assign flags_o = {flag_c, flag_z};
  assign ctrl_o = {ctrl_imm, ctrl_jmp, ctrl_mr, ctrl_mw, ctrl_inp, ctrl_out, ctrl_alu};

endmodule
