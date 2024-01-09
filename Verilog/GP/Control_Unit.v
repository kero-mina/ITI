module Control_Unit (

input    wire   [6:0]    op,
input    wire   [2:0]    func3,
input    wire            zero,func7_5,
output   wire            MemWrite,ALUSrc,RegWrite,PC_Sel,Jump,Branch,MemRead,
output   wire   [1:0]    ImmSrc,ResultSrc,
output   wire   [2:0]    ALUControl,
output   reg             PCSrc
);

wire [1:0] ALU_Op;
wire BrSel;

always @(*)
  begin
    if(BrSel)
	   PCSrc = Jump | (Branch & !zero); //bne
	else
	   PCSrc = Jump | (Branch & zero);	//beq   
  end


Main_Decoder Mdec(
.op(op),
.MemWrite(MemWrite),
.MemRead(MemRead),
.ALUSrc(ALUSrc),
.RegWrite(RegWrite),
.PC_Sel(PC_Sel),
.Jump(Jump),
.Branch(Branch),
.ALU_Op(ALU_Op),
.ImmSrc(ImmSrc),
.ResultSrc(ResultSrc)
);

ALU_Decoder AD(
.Op_5(op[5]),
.funct7_5(func7_5),
.ALU_Op(ALU_Op),
.func3(func3),
.BrSel(BrSel),
.ALUControl(ALUControl)
);

endmodule

