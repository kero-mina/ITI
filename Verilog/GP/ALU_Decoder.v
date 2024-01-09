module ALU_Decoder(

input    wire           Op_5,funct7_5,
input    wire   [1:0]   ALU_Op,
input    wire   [2:0]   func3,

output   reg            BrSel,
output   reg    [2:0]   ALUControl
);

always@(*)
  begin
    case(ALU_Op)
      2'b00: ALUControl=3'b000;
      2'b01: begin 
	    if(func3==000) begin 
		  ALUControl=3'b001;
		  BrSel=1'b0;
		end
		else begin
		  ALUControl=3'b001;
		  BrSel=1'b1;
		end
	         end
      2'b10: begin
        case(func3)
          3'b000: if ({Op_5,funct7_5}==2'b00 | {Op_5,funct7_5}==2'b01 | {Op_5,funct7_5}==2'b10)    
		            ALUControl=3'b000;
				  else if({Op_5,funct7_5}==2'b11)
				    ALUControl=3'b001;
				  else
				    ALUControl=3'b000;
          3'b010: ALUControl=3'b101;
          3'b110: ALUControl=3'b011;
          3'b111: ALUControl=3'b010;
          default: ALUControl=3'b000;		  
        endcase
	  end
	  default: ALUControl=3'b000;
    endcase
  end
endmodule