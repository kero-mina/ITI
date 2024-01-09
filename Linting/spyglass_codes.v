module Q2_b(output reg c, input a,b,clk,rst);

always@(posedge clk,negedge rst)
begin
if(~rst)
c <= 0;
else if(a > b)
c <= a;
end

endmodule

module Q2_c(input a,b,clk,rst, output reg c,d);

always@(posedge clk,negedge rst)
begin
if(~rst)
begin
c <= 0;
d <= 0;
end

else if (a > b)
begin
c <= a;
d <= b;
end

else
c <= c;

end

endmodule

module Q2_a(output reg a, input b,clk,rst);

always@(posedge clk,negedge rst)

begin
if(~rst)
a <= 0;
else
a <= a & b;
end

// assign a = a & b;

endmodule