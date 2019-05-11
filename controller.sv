`timescale 1ns/1ns

module controller (input clk, rst, input [2:0] opcode,  output reg IorD, srcA, srcB, lda, ldb,
                  output reg PCsrc, PCwrite, memRead, IRwrite, tos, pop, push, MtoS, PCwriteCond, memWrite, output reg [1:0] ALUop);
      parameter If = 0, getTop = 1, readFromMem = 2, pushFromMem = 3, popStage = 4, secOprndPop = 5, loadB = 6, jump = 7,
                loadA = 8, branch = 9, ALUfuncNot = 10, ALUfunc = 11, pushRes = 12, writeToMem = 13;
      reg[3:0] ps, ns;
      always @ (posedge rst, posedge clk) begin
        if (rst) ps <= If;
        else ps <= ns;
      end
      always @ (ps, opcode) begin
        case (ps)
          If: ns <= getTop;
          getTop: ns <= (opcode == 3'b100) ? readFromMem : 
                        (opcode == 3'b110) ? jump : 
                        (opcode == 3'b111) ? branch : 
                        popStage;
          readFromMem: ns <= pushFromMem;
          pushFromMem: ns <= If;
          jump: ns <= If;
          branch: ns <= If;
          popStage: ns <= loadA;
          loadA: ns <= (opcode == 3'b101) ? writeToMem : 
                       (opcode == 3'b011) ? ALUfuncNot : 
                       secOprndPop;
          writeToMem: ns <= If;
          ALUfuncNot: ns <= pushRes;
          secOprndPop: ns <= loadB;
          loadB: ns <= ALUfunc;
          ALUfunc: ns <= pushRes;
          pushRes: ns <= If;
        endcase
      end
      always @ (ps , opcode) begin
        {IorD, srcA, srcB, lda, ldb, PCsrc, PCwrite, memRead, IRwrite, tos, pop, push, MtoS, PCwriteCond, memWrite, ALUop} = 16'b0;
        case (ps)
          If: begin
            IorD = 0;
            srcA = 0;
            srcB = 0;
            ALUop = 0;
            PCsrc = 0;
            PCwrite = 1;
            memRead = 1;
            IRwrite = 1;
          end
          getTop: begin
            tos = 1;
          end
          readFromMem: begin
            IorD = 1;
            memRead = 1;
          end
          pushFromMem: begin
            MtoS = 1;
            push = 1;
          end
          popStage: begin
            pop = 1;
          end
          secOprndPop: begin
            pop = 1;
          end
          loadB: begin
            ldb = 1;
          end
          jump: begin
            PCsrc = 1;
            PCwrite = 1;
          end
          loadA: begin
            lda = 1;
          end
          branch: begin
            PCwriteCond = 1;
            PCsrc = 1;
          end
          ALUfuncNot: begin
            ALUop = 3;
          end
          ALUfunc: begin
            ALUop = opcode[1:0];
          end
          pushRes: begin
            push = 1;
          end
        endcase
      end
endmodule
