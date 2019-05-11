`timescale 1ns/1ns

module ALUReg(input[7:0] inp, clk, rst, output[7:0] out);
    always @(posedge rst, posedge clk) begin
        if (clk)
            out <= 8'b0;
        else 
            out <= inp;
    end
endmodule