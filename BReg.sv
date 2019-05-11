`timescale 1ns/1ns

module ALUReg(input[7:0] inp, input ldB, clk, rst, output[7:0] out);
    always @(posedge rst, posedge clk) begin
        if (clk)
            out <= 8'b0;
        else if (ldB)
            out <= inp;
        else
            out <= out;
    end
endmodule