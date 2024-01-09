module Main_Decoder(

input    wire  [6:0]    op,
output   reg            MemWrite,ALUSrc,RegWrite,PC_Sel,Jump,Branch,MemRead,
output   reg   [1:0]    ALU_Op,ImmSrc,ResultSrc

);

always @(*)
  begin
    MemRead = 1'b0;
	RegWrite=1'b0;
	ImmSrc=2'b00;
	ALUSrc=1'b0;
	MemWrite=1'b0;
	ResultSrc=1'b0;
	Branch=1'b0;
	ALU_Op=2'b00;
	Jump=1'b0;
    PC_Sel=1'b0;
	
    case(op)
	  //lw
      7'b0000011: begin
        MemRead = 1'b1;
		RegWrite=1'b1;
		ImmSrc=2'b00;
		ALUSrc=1'b1;
		MemWrite=1'b0;
		ResultSrc=01;
		Branch=1'b0;
		ALU_Op=2'b00;
		Jump=1'b0;
        PC_Sel=1'b0;
      end
      //sw
      7'b0100011: begin
        RegWrite=1'b0;
		ImmSrc=2'b01;
		ALUSrc=1'b1;
		MemWrite=1'b1;
		ResultSrc=00;
		Branch=1'b0;
		ALU_Op=2'b00;
		Jump=1'b0;
        PC_Sel=1'b0;
      end
      //R_Type
      7'b0110011: begin
        RegWrite=1'b1;
		ImmSrc=2'b00;
		ALUSrc=1'b0;
		MemWrite=1'b0;
		ResultSrc=00;
		Branch=1'b0;
		ALU_Op=2'b10;
		Jump=1'b0;
        PC_Sel=1'b0;
      end
      //beq and bne
      7'b1100011: begin
        RegWrite=1'b0;
		ImmSrc=2'b10;
		ALUSrc=1'b0;
		MemWrite=1'b0;
		ResultSrc=00;
		Branch=1'b1;
		ALU_Op=2'b01;
		Jump=1'b0;
        PC_Sel=1'b0;
      end
      //I_type ALU
      7'b0010011: begin
        RegWrite=1'b1;
		ImmSrc=2'b00;
		ALUSrc=1'b1;
		MemWrite=1'b0;
		ResultSrc=00;
		Branch=1'b0;
		ALU_Op=2'b10;
		Jump=1'b0;
        PC_Sel=1'b0;
      end
      //jal
      7'b1101111: begin
        RegWrite=1'b1;
		ImmSrc=2'b11;
		ALUSrc=1'b0;
		MemWrite=1'b0;
		ResultSrc=10;
		Branch=1'b0;
		ALU_Op=2'b00;
		Jump=1'b1;
        PC_Sel=1'b0;
      end
      //jalr
      7'b1100111: begin
        RegWrite=1'b1;
		ImmSrc=2'b00;
		ALUSrc=1'b0;
		MemWrite=1'b0;
		ResultSrc=10;
		Branch=1'b0;
		ALU_Op=2'b00;
		Jump=1'b1;
        PC_Sel=1'b1;
      end
endcase 
 
end

endmodule





