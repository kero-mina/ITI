`timescale 1ns/1ps
module testbench();
reg    clk,rst;
wire   MemWrite;
wire   [31:0]   WriteData;
wire   [31:0]    DataAdr;
Final_TOP dut(
.clk(clk),
.rst(rst),
.MemWrite(MemWrite),
.DataAdr(DataAdr),
.WriteData(WriteData)
);



initial begin
clk = 1'b0;
forever #10 clk = !clk;
end
initial begin
$dumpfile("risc.vcd");
$dumpvars();
rst=1'b1;
#2
rst=1'b0;
#5
rst=1'b1;
#250;
$stop;
end
always @(negedge clk)
  begin
    if(MemWrite) begin
      if(DataAdr === 100 & WriteData === 25) begin
        $display("Simulation succeeded");
        $stop;
      end 
	  else if (DataAdr !== 96) begin
        $display("Simulation failed");
        $stop;
      end
    end
  end
endmodule
