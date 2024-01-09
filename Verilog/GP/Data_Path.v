module Data_Path (

input    wire   [31:0]     Instr,
input    wire              clk,rst,stall,
input    wire   [31:0]     ReadData,
input    wire              MemWrite,ALUSrc,RegWrite,PC_Sel,Jump,Branch,PCSrc,
input    wire   [1:0]      ImmSrc,ResultSrc,
input    wire   [2:0]      ALUControl,
output   wire   [31:0]     PC,ALUResult,WriteData,
output   wire              zero 

);


wire [31:0]   Result,ImmExt,PCPlus4,PCNext,srcA,srcB,PCTarget,PC_Add_R;


Regs_File rf(

.A1(Instr[19:15]),
.A2(Instr[24:20]),
.A3(Instr[11:7]),
.WD3(Result),
.clk(clk),
.WE3(RegWrite),
.RD1(srcA),
.RD2(WriteData),
.rst(rst)
);

Sign_Extend ext(

.Instr(Instr[31:7]),
.ImmSrc(ImmSrc),
.SignImm(ImmExt)

);

Adder A1(


.A(PC_Add_R),
.B(ImmExt),
.C(PCTarget)

);

Adder A2 (

.A(PC),
.B(32'b100),
.C(PCPlus4)

);

PC_Module PC1(

.PCNext(PCNext),
.PC(PC),
.clk(clk),
.rst(rst),
.stall(stall)

);

ALU ALU1 (

.srcA(srcA),
.srcB(srcB),
.ALUControl(ALUControl),
.ALUResult(ALUResult),
.zero(zero)

);

mux_2_1 M1 (

.IN1(WriteData),
.IN2(ImmExt),
.out(srcB),
.sel(ALUSrc)

);

mux_4_1	M2(

.IN1(ALUResult),
.IN2(ReadData),
.IN3(PCPlus4),
.ResultSrc(ResultSrc),
.Result(Result)

);

mux_2_1 M3 (

.IN1(PCPlus4),
.IN2(PCTarget),
.out(PCNext),
.sel(PCSrc)

);

mux_2_1 M4 (

.IN1(PC),
.IN2(srcA),
.out(PC_Add_R),
.sel(PC_Sel)

);

endmodule
