module memory_buffer_tb();

localparam T = 10;
localparam T2 = 2*T;
localparam T4 = 4*T;

reg clk,rst,w,r;

reg [15:0] data_in;

reg [3:0] r_addr,w_addr;

wire [15:0] data_out;

wire full,empty;

memory_buffer #(4) dut(clk,rst,w,r,data_in,r_addr,w_addr,data_out,full,empty);

initial clk = 0;
always #T clk = ~clk;

initial begin
$monitor("clk =%0b ,rst=%0b , w =%0b, r = %0b,data_in=%0h,r_addr = %0h, w_addr = %0h,data_out =%0h,full = %0b,empty = %0b"
,clk,rst,w,r,data_in,r_addr,w_addr,data_out,full,empty);
end

initial w_addr = 0;
always #T2 w_addr = w_addr + 1;

initial r_addr = 0;
always #T4 r_addr = r_addr + 1;

initial w = 0;
always #T2 w = ~w;

initial r = 0;
always #T4 r = ~r;

initial begin
rst = 0;
#T2
rst = 1;
data_in = 1;
#T2
data_in = 2;
#T2
data_in = 3; 
#T2
data_in = 4;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
#T2
data_in = $random;
end

endmodule 
