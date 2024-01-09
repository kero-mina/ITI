module sipo_tb();

localparam T = 10;
localparam T2 = 2*T;

reg clk,rst,load;
reg data_in;

wire [3:0] data_out;

sipo dut(load,clk,rst,data_in,data_out);

initial clk = 0;
always #T clk = ~clk;

initial begin
$monitor("load = %0b,clk = %0b, rst = %0b,data_in = %0b, data_out = %0h",
load,clk,rst,data_in,data_out);
end

initial begin
rst = 0;

#T2
rst = 1;
load = 1;
data_in = 1;

#T2
load = 0;

#T2
load = 1;
data_in = 0;

#T2
load = 0;

end

endmodule
