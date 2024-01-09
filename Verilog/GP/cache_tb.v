`timescale 1ns/1ps
module cache_tb ();

 reg             MemRead,MemWrite,clk,rst;
 reg    [9:0]    WordAddress;
 reg    [31:0]   DataIn;
 wire   [31:0]   DataOut;
 
always #10 clk = ~clk;

 initial begin
   clk = 1'b0;
   MemRead      = 1'b0;
   MemWrite     = 1'b0;
   rst          = 1'b0;
   WordAddress  = 'b0;
   DataIn       = 'b0;
   
   #1
   rst = 1'b1;
   
   // Scenario : Write Miss
   #8 
   rst = 1'b0;
   MemWrite = 1'b1;
   WordAddress = 10'b0000000001;
   DataIn = 32'hffffaaaa;
   
   //Scenario : Read Miss
   #71
   MemRead  = 1'b1;
   MemWrite = 1'b0;
   WordAddress = 10'b0000000001;
   #60
   MemRead  = 1'b0;
   
   //Scenario: Read Hit
   #100
   
   MemRead = 1'b1;
   WordAddress = 10'b0000000000;
   
   //Scenario: Write Hit
   #20
   MemRead = 1'b0;
   MemWrite = 1'b1;
   WordAddress = 10'b0000000001;
   DataIn = 32'hccccbbbb;
   #200
   $stop; 
 end

 Data_Mem_Top DMT (
   .MemRead(MemRead),
   .MemWrite(MemWrite),
   .clk(clk),
   .rst(rst),
   .WordAddress(WordAddress),
   .DataIn(DataIn),
   .DataOut(DataOut)
 ); 
endmodule