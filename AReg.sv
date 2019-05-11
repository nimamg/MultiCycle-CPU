`timescale 1ns/1ns

module ALUReg(input[7:0] inp, input ldA, clk, rst, output[7:0] out);
    always @(posedge rst, posedge clk) begin
        if (rst)
            out <= 8'b0;
        else if (ldA)
            out <= inp;
        else
            out <= out;
    end
endmodule