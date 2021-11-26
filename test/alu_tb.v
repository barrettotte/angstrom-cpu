`include "src/alu.v"

module alu_tb;

  reg [7:0] a = 8'b00000000;  // IMM or Memory
  reg [7:0] b = 8'b00000000;  // ACC
  reg [2:0] func = 3'b000;

  wire fz, fc;
  wire [7:0] res;

  integer testIdx = 0;

  alu UUT(
    .a(a), .b(b), .fn(fn), .res(res), 
    .fz(fz), .fc(fc)
  );

  initial begin
    $dumpfile("out/alu.vcd");
    $dumpvars(0, alu_tb);

    // ADI
    func = 3'b000;
    a = 8'b00000001;
    b = 8'b00000000;
    #10; testIdx++;

    // ADD
    func = 3'b001;
    a = 8'b00001100;
    b = 8'b00000000;
    #10; testIdx++;

    // SUB
    func = 3'b010;
    a = 8'b00000001;
    b = 8'b00000001;
    #10; testIdx++;

    // AND
    func = 3'b011;
    a = 8'b00001111;
    b = 8'b11111111;
    #10; testIdx++;

    // ORR
    func = 3'b100;
    a = 8'b1100110011;
    b = 8'b0011001100;
    #10; testIdx++;

    // XOR
    func = 3'b101;
    a = 8'b11110000;
    b = 8'b01010101;
    #10; testIdx++;

    // LSL
    func = 3'b110;
    a = 8'b00001100;
    b = 8'b00000000;
    #10; testIdx++;

    // LSR
    func = 3'b111;
    a = 8'b00001100;
    b = 8'b00000000;
    #10; testIdx++;

    $finish;
    $display("Testbench completed");
  end

endmodule
