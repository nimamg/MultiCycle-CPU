`timescale 1ns/1ns

module pcReg(input[4:0] in, input write, clk, rst, output reg[4:0] out);
    always @(posedge clk, posedge rst) begin
        if (rst)
            out <= 0;
        else if (write)
            out <= in;
        else 
            out <= out + 1;
    end
endmodule