module fsm_tb();

localparam T = 10;
localparam T2 = 20;

reg clk,rst,taken;

wire predict;

fsm dut(clk,rst,taken,predict);

initial clk = 0;
always #T clk = ~clk;

initial begin
$monitor("clk=%0b, rst = %0b, taken = %0b, predict = %0b",clk,rst,taken,predict);
end

initial begin
rst = 0;

#T2
rst = 1;
taken = 1;

#T2
taken = 0;

#T2
taken = 1;

#T2
taken = 0;

#T2
taken = 1;

#T2
taken = 0;

#T2
taken = 1;

#T2
taken = 0;

end

endmodule
