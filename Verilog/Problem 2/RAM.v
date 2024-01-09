module ram_block(input [15:0] address,input [7:0] data_in, input clk,we, output reg [7:0] data_out );

reg [7:0] ram_address;

function [7:0] addressconversion;
input [15:0] add;
if (add === 16'h80xx)
begin
for (add = 16'h8000; add <= 16'h800f; add = add + 1 )
addressconversion = add[7:0];
end
else 
addressconversion = 8'b0;
endfunction

reg [7:0] ram [255:0] ;

initial begin
ram_address = addressconversion(address);
end

always @(posedge clk)
begin
if(we)
ram[ram_address] <= data_in;
else
data_out <= ram[ram_address];
end

endmodule