module tb_ram();

localparam T = 10;
localparam T2 = T*2;

reg clk;
reg we;
reg [15:0] address;
reg [7:0] data_in;
wire [7:0] data_out;

ram_block dut(address, data_in, clk, we, data_out);

initial clk = 0;
always #T clk = ~clk;

initial begin 
$monitor("address = %h, data_in = %h, clk = %h, we = %h, data_out = %h",address,data_in,clk,we,data_out);
end

initial begin
we = 1;
address = 16'h800f;
data_in = 8'h05;

#T2;
we = 0;
address = 16'h800f;

#T2;
we = 1;
address = 16'h8000;
data_in = 8'h0f;

#T2;
we = 0;
address = 16'h8000;

end

endmodule
