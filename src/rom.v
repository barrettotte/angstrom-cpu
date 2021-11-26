/* Program ROM 4096x16 - 12-bit addresses, 16-bit instruction */

`define ROM_SIZE 2**12

module rom(
  input [11:0] addr,
  output [15:0] out
);

  reg [15:0] memory [15:0];

  initial begin
    $display("Loading ROM...");
    $readmemb("../rom/vtest1.mem.txt", memory);
  end

  always @(addr) begin
    o <= memory[addr];
  end

endmodule
