`timescale 1ns/1ns

module CPU (input clk, rst);
  wire [2:0] opc;
  wire [1:0] ALUop;
  wire IorD, srcA, srcB, lda, ldb, PCsrc, PCwrite, memRead, IRwrite, tos, pop, push, MtoS, PCwriteCond, memWrite;
  controller ctrl (clk, rst, opc, IorD, srcA, srcB, lda, ldb, PCsrc, PCwrite, memRead, IRwrite, tos, pop, push, MtoS, PCwriteCond, memWrite, ALUop);
  dataPath DP (ALUop, PCwrite, PCwriteCond, IorD, memRead, memWrite, IRWrite, MtoS, push, pop, tos, lda, ldb, srcA, srcB, PCsrc, clk, rst, opc);
endmodule
