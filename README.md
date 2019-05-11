# MultiCycle-CPU
A multi cycle CPU based on MIPS architecture

The CPU is able to use a 32 byte memory for instructions and data, and a 32 byte stack for data instead of a register file.
The instructions are 8-bit ones. The 3 most significant bits are the opcode of the instruction and the remaining 5 bit are the address for
the memory cell to be used during the instruction.
This CPU is able to do arithmetic calculations (add, bit-wise and, not, sub), push and pop from the stack, and jump to another instruction
for which the address is provided (both unconditional and conditional jumps are supported.)
The arithmetic calculations are done by popping sufficient operands from the stack, calculating using the ALU, and pushing the result no 
the stack;
The push operation reads a data word from the memory cell for which the address is provided and pushes it on the stack, while the pop
operation pops a data word from the stack and writes it to the memory.
The instruction set is available in jpg format in the repository.
