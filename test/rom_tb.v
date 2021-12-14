`include "src/rom.v"

module rom_tb;
  
  reg [11:0] addr = 12'b0;
  wire [15:0] data = 15'b0;

  integer test_idx = 0;

  rom UUT(.addr_i(addr), .data_o(data));

  initial begin
    $dumpfile("bin/rom.vcd");
    $dumpvars(0, rom_tb);

    for (test_idx = 0; test_idx < 16; test_idx++) begin
      #25;
      addr++;
    end

    $finish;
    $display("Testbench completed");
  end

endmodule
