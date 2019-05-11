`timescale 1ns/1ns

module IR(input[7:0] inp, input IRWrite, clk, rst, output reg[7:0] out);
    always @(posedge rst, posedge clk) begin
        if (rst)
            out <= 8'b0;
        else if (IRWrite)
            out <= inp;
        else
            out <= out;
    end
endmodule