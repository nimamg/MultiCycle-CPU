`timescale 1ns/1ns

module memory(input[4:0] address, input[7:0] writeData, input memRead, memWrite, clk, rst, output reg[7:0] out);
    reg[7:0] mem [31:0];
    always @(posedge clk, posedge rst) begin
        if (rst)
            out <= 8'b0;
        else begin
            if (memRead)
                out <= mem[address];
            else if (memWrite)
                mem[address] <= writeData;    
        end
    end
endmodule