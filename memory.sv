`timescale 1ns/1ns

module mem(input[4:0] address, input[7:0] writeData, input memRead, memWrite, clk, rst, output reg[7:0] out);
    reg[7:0] mem [0:31];


    assign out = mem[address];
    always @(posedge clk, posedge rst) begin
        if (rst) begin
          integer i;
          for (i = 0 ; i < 32 ; i++) begin
            mem[i] = 0;
          end
        end
        else begin
            if (memWrite)
                mem[address] = writeData;
        end
    end
    initial begin
      #200;
    mem[0] = 8'b10011001;
    mem[1] = 8'b10011010;
    mem[2] = 8'b10011011;
    mem[3] = 8'b10011100;
    mem[4] = 8'b10011101;
    mem[5] = 8'b00000000;
    mem[6] = 8'b00000000;
    mem[7] = 8'b00000000;
    mem[8] = 8'b00000000;
    mem[9] = 8'b10111110;

    mem[25] = 8'b00001001; // 9
    mem[26] = 8'b00000111; // 7
    mem[27] = 8'b00000101; // 6
    mem[28] = 8'b00000011; // 3
    mem[29] = 8'b00000001; // 1
  end
endmodule
