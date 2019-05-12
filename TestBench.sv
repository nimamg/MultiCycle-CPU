`timescale 1ns/1ns

module TB();
  reg rst, clk = 0;
  CPU processor (clk, rst);
  always #10 clk = ~clk;
  initial begin
    #100;
    rst = 1;
    #100;
    rst = 0;
    #20000;
    $stop;
  end
endmodule
