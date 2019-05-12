`timescale 1ns/1ns

module memory(input[4:0] address, input[7:0] writeData, input memRead, memWrite, clk, rst, output reg[7:0] out);
    reg[7:0] mem [0:31];

    initial begin
		// memory[0] = 8'b10011001;
		// memory[1] = 8'b10011010;
		// memory[2] = 8'b10011011;
		// memory[3] = 8'b10011100;
		// memory[4] = 8'b10011101;
		// memory[5] = 8'b00000000;
		// memory[6] = 8'b00000000;
		// memory[7] = 8'b00000000;
		// memory[8] = 8'b00000000;
		// memory[9] = 8'b10111110;

		// memory[25] = 8'b00001001;
		// memory[26] = 8'b00000111;
		// memory[27] = 8'b00000101;
		// memory[28] = 8'b00000011;
		// memory[29] = 8'b00000001;

		mem[0] = 8'b10011101;	// push 8 in St
		mem[1] = 8'b10011101;	// push 8 in St
		mem[2] = 8'b00000000;	// add 8 + 8 and stoers 16 in St
		mem[3] = 8'b11000111;	// jump to instruction 7
		mem[7] = 8'b11101100;	// does not jumpz to 12
		mem[8] = 8'b10011110;	// push 16 on St
		mem[9] = 8'b00100000;	// sub 16 - 16 and store 0 on St
		mem[10] = 8'b11101111;	// jumpz 15
		mem[15] = 8'b10011100;	// push 10101010 on St
		mem[16] = 8'b10011011;	// push 01100110 on St
		mem[17] = 8'b01000000;	// and 10101010 & 01100110 and store 01000100 on St
		mem[18] = 8'b01100000;	// not 01000100 and store 10111011 on St
		mem[19] = 8'b10111111;	// pop 10111011 from st and store it on mem[31]
		mem[20] = 8'b10111110;	// pop 0 from st and store it on mem[30]

		mem[27] = 8'b01100110;
		mem[28] = 8'b10101010;
		mem[29] = 8'b00001000;
		mem[30] = 8'b00010000;

	end

    always @(posedge clk, posedge rst) begin
        // if (rst) begin
        //
        // end
        // else begin
            if (memRead)
                out = mem[address];
            else if (memWrite)
                mem[address] = writeData;
        end
    // end
endmodule
