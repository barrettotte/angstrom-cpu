/* Program ROM 4096x16 - 12-bit addresses, 16-bit instruction */

module rom(
  input [11:0] addr_i,
  output [15:0] data_o
);

  reg [15:0] memory [4095:0];

  initial begin
    $display("Loading ROM...");
    $readmemb("../test/test_rom.txt", memory);
  end

  always @(addr_i) begin
    data_o <= memory[addr_i];
  end

endmodule
