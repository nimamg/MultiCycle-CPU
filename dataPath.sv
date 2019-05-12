`timescale 1ns/1ns

module dataPath(input [1:0] ALUOP, input pcWriteUnCond, pcWriteCond, IorD, memRead, memWrite, IRWrite, MtoS, push, pop, tos, ldA, ldB, srcA, srcB, pcSrc, clk, rst, output[2:0] opc);
    wire pcWrite, zero;
    wire[4:0] pcIn, pcOut, address;
    wire[7:0] AOut, BOut, memOut, MDROut, stackOut, din, ALURegOut, ALUA, ALUB, ALUOut, IROut;

    assign pcWrite = pcWriteUnCond || (pcWriteCond && zero);
    assign pcIn = pcSrc == 1'b0 ? ALUOut[4:0] : IROut[4:0];
    pcReg pcModule(pcIn, pcWrite, clk, rst, pcOut);

    assign address = IorD == 1'b0 ? pcOut : IROut[4:0];
    memory memoryModule(address, AOut, memRead, memWrite, clk, rst, memOut);

    IR IRModule(memOut, IRWrite, clk, rst, IROut);

    MDR MDRModule(memOut, clk, rst, MDROut);

    assign din = MtoS == 1'b0 ? ALURegOut : MDROut;
    stack stackModule(din, push, pop, tos, clk, rst, stackOut);

    AReg ARegModule(stackOut, ldA, clk, rst, AOut);

    BReg BRegModule(stackOut, ldB, clk, rst, BOut);

    ZReg ZRegModule(stackOut, clk, rst, zero);

    assign ALUA = srcA == 1'b0 ? AOut : {3'b0, pcOut};
    assign ALUB = srcB == 1'b0 ? BOut : 8'b00000001;
    ALU ALUModule(ALUA, ALUB, ALUOP, ALUOut);

    ALUReg ALURegModule(ALUOut, clk, rst, ALURegOut);

    assign opc = IROut[7:5];
endmodule
