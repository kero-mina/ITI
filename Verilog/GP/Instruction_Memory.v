
/*
Description: The Instruction_Memory reads out the Instruction found at address PC
Author: Muhammad Aboseada
*/

module Instruction_Memory
#(parameter Imem_width=32 , parameter Imem_depth=64)
(
input    wire    [31:0]   PC, // This width is becaue the memoy size is 1kb, and each word is 4 bytes, so we have 256 words , and need only 8-bits to choose from them.

output   reg     [31:0]   Instr   
);

//Internal Variables
reg [Imem_width-1:0] Instr_Mem [Imem_depth-1:0];

always @(*)
  begin
    Instr = Instr_Mem[PC[31:2]];
  end

//Loading the Instruction Memory with a test file that contains some instructions.

initial 
  begin
    $readmemh("riscvtest.txt",Instr_Mem);
  end
endmodule