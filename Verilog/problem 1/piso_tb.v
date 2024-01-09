module piso_tb();

localparam T = 10;
localparam T2 = 2*T;

reg clk,rst,load;
reg [3:0] data_in;

wire data_out;

piso dut(load,clk,rst,data_in,data_out);

initial clk = 0;
always #T clk = ~clk;

initial begin
$monitor("load = %0b,clk = %0b, rst = %0b,data_in = %0h, data_out = %0b",
load,clk,rst,data_in,data_out);
end

initial begin
rst = 0;

#T2
rst = 1;
load = 1;
data_in = 4'hf;

#T2
load = 0;

#T2
load = 1;
data_in = 4'h5;

#T2
load = 0;

end

endmodule 
