`timescale 1ns/1ns

module ZReg(input[7:0] inp, input clk, rst, output reg out);
    assign out = (inp == 8'b0) ? 1'b1 : 1'b0;
endmodule
