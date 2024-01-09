module PC_Module (

input    wire   [31:0]   PCNext,
input    wire            clk,rst,stall,
output   reg    [31:0]   PC

);

always @(posedge clk or negedge rst)
  begin
    if(!rst) begin
        PC <= 32'b0;
    end
	else if(stall)
	    PC <= PC;
    else begin
        PC <= PCNext;
    end
  end
endmodule
