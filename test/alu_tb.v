`include "src/alu.v"

module alu_tb;

  reg [7:0] a_imm = 8'b00000000;
  reg [7:0] a_mem = 8'b00000000;
  reg [7:0] b = 8'b00000000;  // ACC
  reg [2:0] func = 3'b000;

  wire fz, fc;
  wire [7:0] result;

  integer test_idx = 0;

  alu UUT(
    .a_imm_i(a_imm), .a_mem_i(a_mem), .b_i(b), .func_i(func), 
    .result_o(result), .fz_o(fz), .fc_o(fc)
  );

  initial begin
    $dumpfile("bin/alu.vcd");
    $dumpvars(0, alu_tb);

    // ADI
    func = 3'b000;
    a_imm = 8'b00000001;
    a_mem = 8'b00000000;
    b = 8'b00000000;
    #25; test_idx++;

    // ADD
    func = 3'b001;
    a_imm = 8'b00000000;
    a_mem = 8'b00001100;
    b = 8'b00000000;
    #25; test_idx++;

    // SUB
    func = 3'b010;
    a_imm = 8'b00000000;
    a_mem = 8'b00000001;
    b = 8'b00000001;
    #25; test_idx++;

    // AND
    func = 3'b011;
    a_imm = 8'b00000000;
    a_mem = 8'b00001111;
    b = 8'b11111111;
    #25; test_idx++;

    // ORR
    func = 3'b100;
    a_imm = 8'b00000000;
    a_mem = 8'b11001100;
    b = 8'b00110011;
    #25; test_idx++;

    // XOR
    func = 3'b101;
    a_imm = 8'b00000000;
    a_mem = 8'b11110000;
    b = 8'b01010101;
    #25; test_idx++;

    // LSL
    func = 3'b110;
    a_imm = 8'b00000000;
    a_mem = 8'b00001100;
    b = 8'b00000000;
    #25; test_idx++;

    // LSR
    func = 3'b111;
    a_imm = 8'b00000000;
    a_mem = 8'b00001100;
    b = 8'b00000000;
    #25; test_idx++;

    $finish;
    $display("Testbench completed");
  end

endmodule
