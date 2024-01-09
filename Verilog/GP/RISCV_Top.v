module RISCV_Top (

input   wire   [31:0]     Instr,
input   wire              clk,rst,stall,
input   wire   [31:0]     ReadData,
output  wire   [31:0]     PC,ALUResult,WriteData,
output  wire              MemWrite,MemRead

);

wire             Branch,ALUSrc,RegWrite,Jump,zero,PCSrc,PC_Sel;
wire   [1:0]     ImmSrc,ResultSrc;
wire   [2:0]     ALUControl;

Data_Path DP (
.Instr(Instr),
.clk(clk),
.stall(stall),
.ReadData(ReadData),
.MemWrite(MemWrite),
.Branch(Branch),
.ALUSrc(ALUSrc),
.RegWrite(RegWrite),
.PC_Sel(PC_Sel),
.Jump(Jump),
.ImmSrc(ImmSrc),
.ResultSrc(ResultSrc),
.zero(zero),
.ALUControl(ALUControl),
.PC(PC),
.ALUResult(ALUResult),
.WriteData(WriteData),
.PCSrc(PCSrc),
.rst(rst)

);

Control_Unit CU (
.op(Instr[6:0]),
.func3(Instr[14:12]),
.func7_5(Instr[30]),
.MemWrite(MemWrite),
.MemRead(MemRead),
.ALUSrc(ALUSrc),
.RegWrite(RegWrite),
.PC_Sel(PC_Sel),
.Jump(Jump),
.Branch(Branch),
.PCSrc(PCSrc),
.ImmSrc(ImmSrc),
.ResultSrc(ResultSrc),
.ALUControl(ALUControl),
.zero(zero)
);

endmodule