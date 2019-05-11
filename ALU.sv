`timescale 1ns/1ns

module ALU(input[7:0] A, B, input[1:0] ALUOP, output[7:0] out);
    assign out = ALUOP == 2'b00 ? A + B :
          ALUOP == 2'b01 ? A - B :
          ALUOP == 2'b10 ? A & B : 
          ALUOP == 2'b11 ? ~A : 
          out;
endmodule