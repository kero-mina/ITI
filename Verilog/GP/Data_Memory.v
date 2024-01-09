module Data_Memory
#(parameter Dmem_width=128 , parameter Dmem_depth=256)
(
input    wire  unsigned  [9:0]           word_address,
input    wire    [31:0]                  data_in,
input    wire                            clk,WE,stall,rst,MemRead,
output   wire    [Dmem_width-1:0]        RD,   
output   reg                             ready
);

reg  [Dmem_width-1:0]  Dmem   [Dmem_depth-1:0];
integer i;
reg [2:0] count = 3'b0;

wire  [7:0]  block_indx_dm;
wire  [1:0]  word_offset_dm;

//try

reg [9:0]  word_addr_reg;
reg [31:0] data_in_reg;

always@(posedge clk)
  begin
    if((word_address == 10'bxxxxxxxxxx) || stall) begin
      word_addr_reg <= word_addr_reg;
	  data_in_reg   <= data_in_reg;
	end
	else begin
      word_addr_reg <= word_address;
	  data_in_reg   <= data_in;	
	end
	
  end

assign block_indx_dm  = word_address[9:2];
assign word_offset_dm = word_address[1:0];

always @(negedge clk or negedge rst)
  begin
  if (!rst)
    begin
	  ready <= 1'b0;
	end
    else if(WE)
      begin
        case(word_offset_dm)
	    2'b00: Dmem[block_indx_dm][31:0]     <= data_in_reg; 
	    2'b01: Dmem[block_indx_dm][63:32]    <= data_in_reg;
		2'b10: Dmem[block_indx_dm][95:64]    <= data_in_reg;
		2'b11: Dmem[block_indx_dm][127:96]   <= data_in_reg;
		//Dmem[word_address] <= data_in;
		endcase
      end
  end	   

assign RD = (MemRead) ? Dmem[block_indx_dm]: RD ;

//Counter
always@(negedge clk)
  begin
    if(stall) begin
	  count <= count +1'b1;
	  if (count == 3'b11) begin
	    count <= 3'b0; ready <= 1'b1;
	  end
	end
	else begin
	  ready <= 1'b0;
	end
  end
endmodule




