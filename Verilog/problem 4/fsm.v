module fsm(input clk,rst,taken,output reg predict);

localparam s1= 2'b00;
localparam s2 = 2'b01;
localparam s3 = 2'b10;
localparam s4 = 2'b11;

reg [1:0] next_state,current_state;

always @(posedge clk, negedge rst)
begin
if(~rst)
current_state <= s1;
else
current_state <=next_state;
end

always @(current_state,taken)
begin
case (current_state)
s1: if(taken)
    next_state = s1;
    else
    next_state = s2;

s2: 
    if(taken)
    next_state = s1;
    else
    next_state = s3;

s3: if(taken)
    next_state = s4;
    else
    next_state = s3;

s4: 
    if(taken)
    next_state = s1;
    else
    next_state = s3;
endcase
end

always @(current_state)
begin
case(current_state)
s1: predict = 1'b1;
s2: predict = 1'b1;
s3: predict = 1'b0;
s4: predict = 1'b0;
endcase
end 

endmodule
