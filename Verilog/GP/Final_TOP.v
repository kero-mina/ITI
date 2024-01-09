/*

Description : This is the Top Module of the whole processor's desifgn , that includes :
.Data Path
.Control Unit
.Instruction_Memory 
.Data_Memory

Author: Muhammad Aboseada

*/

module 	Final_TOP (

input    wire            clk,rst,
output   wire            MemWrite,
output   wire   [9:0]    DataAdr,
output   wire   [31:0]   WriteData        

);

//Internal Signals

wire   [31:0]    PC,ReadData,Instr;//WriteData;
wire   stall;
//wire   [9:0]     DataAdr;
//wire             MemRead,MemWrite;

//Instantiation of the Control Unit and Data Path that are combined in the RISCV_Top module

RISCV_Top RT (

.Instr(Instr),
.clk(clk),
.stall(stall),
.ReadData(ReadData),
.PC(PC),
.MemWrite(MemWrite),
.MemRead(MemRead),
.ALUResult(DataAdr),
.WriteData(WriteData),
.rst(rst)

);

//Instantiation of the Data_Memory

Data_Mem_Top DMT (

.MemWrite(MemWrite),
.MemRead(MemRead),
.WordAddress(DataAdr),
.DataIn(WriteData),
.clk(clk),
.rst(rst),
.DataOut(ReadData),
.stall(stall)

);

//Instantiation of the Instruction_Memory

Instruction_Memory IM (

.PC(PC),
.Instr(Instr)

);

endmodule