`timescale 1ns/1ns

module ZReg(input[7:0] inp, input clk, rst, output reg out);
    always @(posedge rst, posedge clk) begin
        if (rst)
            out <= 0;
        else if (inp == 8'b0)
            out <= 1;
        else if (inp != 8'b0)
            out <= 0;
    end
endmodule