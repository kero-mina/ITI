module cdc_Q9(input clk1,rst1,input [7:0] din1, output reg [7:0]do1);

always @(posedge clk1 or negedge rst1)
begin

if(~rst1)
begin
do1 <= 8'b0;
end

else
begin 
do1 <= din1;
end
end

endmodule
