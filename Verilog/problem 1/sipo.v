module sipo(input load,clk,rst,data_in, output reg [3:0] data_out);

reg [3:0] data_reg;

always @(posedge clk, negedge rst) 
begin
if(~rst)
begin
data_reg <= 4'b0;
data_out <= 4'b0;
end

else begin
if(load)
data_reg <= {data_in,data_reg[3:1]};
else
data_out <= data_reg;
end
end

endmodule
