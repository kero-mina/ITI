module top #(parameter DSIZE = 8,
 parameter ASIZE = 4)
(input wclk,rclk,wrst,rrst,rinc,winc,output [7:0]rdata,output wfull,rempty, input [7:0] wdata);

wire [7:0] rdata1;

fifo #(DSIZE, ASIZE)  f1(rdata,wfull,rempty,rdata1,winc,wclk,wrst,rinc,rclk,rrst);

cdc_Q9 cdc(wclk,wrst,wdata,rdata1);

endmodule
