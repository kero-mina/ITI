/*
Description: The Register File contains the 32 32-bit MIPS registers. The register file has two read 
output ports (RD1 and RD2) and a single input write port (WD3). The register file is read 
asynchronously and written synchronously at the rising edge of the clock. The register file 
supports simultaneous read and writes. The register file has width = 32 bits and depth = 100
entries.

Author: Muhammad Aboseada
*/

module Regs_File #(parameter regF_width=32 , parameter regF_depth=32)

(
input   wire   [4:0]                   A1,A2,A3,
input   wire                           clk,WE3,rst,
input   wire   [regF_width-1:0]        WD3,
output  reg    [regF_width-1:0]        RD1,RD2

);

reg  [regF_width-1:0]  Reg_File   [regF_depth-1:0];

integer i;
always @(posedge clk or negedge rst)
  begin
    if(!rst)
      for(i=0;i<regF_depth;i=i+1)
        begin
          Reg_File[i]<='b0;
        end	  
	else if(WE3)
      begin
        Reg_File[A3]<=WD3;
      end
  end

always @(*)
  begin
    RD1=Reg_File[A1];
    RD2=Reg_File[A2];
  end

endmodule
