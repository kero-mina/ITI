module positive_edge_tb();

localparam T = 10;
localparam T2 = T*2;

reg clk,rst,level;

wire tick;

positive_edge_detector dut(clk,rst,level,tick);

initial clk = 0;
always #T clk = ~clk;

initial begin
$monitor("clk=%0b, rst=%0b, level=%0b, tick = %0b",clk,rst,level,tick);
end

initial begin
rst = 0;
level = 0;

#T2
rst = 1;
level = 1;

#T2
level = 0;

#T2
level = 1;

end

endmodule

