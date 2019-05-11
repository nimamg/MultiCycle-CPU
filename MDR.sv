`timescale 1ns/1ns

module MDR(input[7:0] inp, input clk, rst, output reg[7:0] out);
    always @(posedge rst, posedge clk) begin
        if (rst)
            out <= 8'b0;
        else
            out <= inp;
    end
endmodule