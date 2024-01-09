module piso(input load,clk,rst, input [3:0] data_in, output reg data_out);

reg [3:0] data_reg;

always @(posedge clk, negedge rst)
begin
if(~rst)
data_reg <= 4'b0;
else begin
if(load)
{data_reg,data_out} <= {data_in,1'b0};
else
{data_reg,data_out} <= {1'b0,data_reg[3:0]};
end
end

endmodule
