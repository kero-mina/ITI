module ALU (

input     wire    [31:0]    srcA,srcB,
input     wire    [2:0]     ALUControl,
output    reg               zero,
output    reg     [31:0]    ALUResult

);

always @(*)
begin

// Explicit Default
ALUResult=32'b0;
zero=1'b0;

case(ALUControl)

3'b000: begin
    ALUResult=srcA + srcB;
    if(!ALUResult)
        zero=1'b1;
	else 
	    zero=1'b0;
end

3'b001: begin
    ALUResult=srcA - srcB;
    if(!ALUResult)
        zero=1'b1;
	else
	    zero=1'b0;
end

3'b010: begin
    ALUResult=srcA & srcB;
    if(!ALUResult)
        zero=1'b1;
	else 
	    zero=1'b0;
end

3'b011: begin
    ALUResult=srcA | srcB;
    if(!ALUResult)
        zero=1'b1;
	else 
	    zero=1'b0;
end

3'b101: begin
    if(srcA < srcB)
      begin
        ALUResult=32'b1;
        zero=1'b0;
      end
    else
      begin
        ALUResult=32'b0;
        zero=1'b1;
      end
end

default: begin
ALUResult=32'b0;
zero=0;
end
endcase
end
endmodule