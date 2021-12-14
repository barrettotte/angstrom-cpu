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
  input [7:0] reg_inp_i,  // INP
  output reg [7:0] reg_out_o  // OUT
);

  wire [11:0] curr_pc;
  wire [15:0] curr_ins;
  wire [7:0] bus_aob, bus_imm, bus_alu, bus_inp, bus_out;
  reg [7:0] bus_aib;
  wire [3:0] bus_mem;
  wire [2:0] func_alu, func_other;

  wire flag_z, flag_c, pc_load;
  wire ctrl_imm, ctrl_jmp, ctrl_mr, ctrl_mw, ctrl_inp, ctrl_out, ctrl_alu;

  // registers
  pc reg_pc(.clk_i(clk_i), .rst_i(1'b0), .jmp_en_i(pc_load), 
    .jmp_addr_i(curr_ins[11:0]), .addr_o(curr_pc));

  reg8 reg_acc(.clk_i(clk_i), .wen_i(1'b1),     .d_i(bus_aib), .q_o(bus_aob));
  reg8 reg_inp(.clk_i(clk_i), .wen_i(ctrl_inp), .d_i(reg_inp_i), .q_o(bus_inp));
  reg8 reg_out(.clk_i(clk_i), .wen_i(ctrl_out), .d_i(bus_aob), .q_o(bus_out));

  // top level modules
  rom rom(.addr_i(curr_pc), .data_o(curr_ins));

  ctrlunit ctrlunit(.op_i(curr_ins[15:12]), .imm_o(ctrl_imm), .jmp_o(ctrl_jmp), .mr_o(ctrl_mr), 
    .mw_o(ctrl_mw), .inp_o(ctrl_inp), .out_o(ctrl_out), .alu_o(ctrl_alu));

  branch branch(.op_i(curr_ins[15:12]), .flag_z_i(flag_z), .flag_c_i(flag_c), 
    .ctrl_jmp_i(ctrl_jmp), .branch_o(pc_load));

  ram ram(.clk_i(clk_i), .ren_i(ctrl_mr), .wen_i(ctrl_mw), 
    .din_i(bus_alu[3:0]), .addr_i(curr_ins[11:0]), .dout_o(bus_mem));

  alu alu(.a_imm_i(curr_ins[7:0]), .a_mem_i(bus_mem), .b_i(bus_aob), .func_i(curr_ins[14:12]), 
    .result_o(bus_alu), .fz_o(flag_z), .fc_o(flag_c));

  // assign to bus
  always @(*) begin
    
    // ACC input bus
    if (ctrl_inp)
      bus_aib <= bus_inp;  // INP
    else if (ctrl_imm)
      bus_aib <= bus_imm;  // IMM
    else if (ctrl_alu)
      bus_aib <= bus_alu;  // ALU opcodes
    else
      bus_aib <= 8'bz;

    reg_out_o <= (ctrl_out) ? bus_aob : 8'bz;  // ACC output bus
  end

endmodule
