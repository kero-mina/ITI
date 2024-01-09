module memory_buffer #(parameter addrsize = 4)
(input clk,rst,w,r, input [15:0] data_in,input[addrsize - 1: 0] r_addr,w_addr,
 output reg [15:0] data_out,output reg full,empty);

localparam depth = 1 << addrsize;
reg [15:0] mem[0:depth-1];

always @(posedge clk, negedge rst)
begin
if(~rst)
begin
data_out <= 16'bz;
end
else if(w) 
mem[w_addr] <= data_in;
else if(r)
data_out <= mem[r_addr];
else 
data_out <= data_out;
end

always @(*)
begin
if(w_addr == 15 && r_addr != 15 && clk == 1)
full = 1;
else
full = 0;
if(r_addr == 15 && clk == 1)
empty = 1;
else
empty = 0;
end

endmodule
