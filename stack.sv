`timescale 1ns/1ns

module stack(input[7:0] din, input push, pop, tos, clk, rst, output reg[7:0] dout);
    reg[7:0] mem [31:0];
    reg[4:0] top;
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            top <= 0;
            integer i;
            for (i = 0 ; i < 32 ; i++) begin
              mem[i] = 0;
            end
          end
        else begin
            if (push) begin
                top <= top + 1;
                mem[top] <= din;
            end
            if (pop) begin
                dout <= mem[top];
                top <= top - 1;
            end
            if (tos) begin
                dout <= mem[top];
            end
        end
    end
endmodule
