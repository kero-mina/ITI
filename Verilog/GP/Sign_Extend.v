
module Sign_Extend (

input   wire   [31:7]    Instr,
input   wire   [1:0]     ImmSrc,
output  reg    [31:0]    SignImm

);

always @(*)
  begin
    case(ImmSrc)
	  2'b00: SignImm = {{20{Instr[31]}}, Instr[31:20]};
	  2'b01: SignImm = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]};
	  2'b10: SignImm = {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8],1'b0};
	  2'b11: SignImm = {{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0};
	  default: SignImm = 32'bx;
	endcase
  end
endmodule

