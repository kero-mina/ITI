module cache_mem 
#(parameter Cmem_width=128 , parameter Cmem_depth=32)
(
  input    wire   [4:0]              block_indx,
  input    wire   [1:0]              word_offset,
  input    wire                      clk,rst,fill_from_Dmem,fill_from_DataIn,read,stall,
  input    wire   [31:0]             data_in,   
  input    wire   [2:0]              tag_in,
  input    wire   [Cmem_width-1:0]   data_mem,
  output   wire                      valid_out,
  output   wire   [2:0]              tag_out,
  output   reg    [31:0]             DataOut
);

reg  [Cmem_width-1:0]  cache         [Cmem_depth-1:0];
reg  [24:0]            tag_array     [Cmem_depth-1:0];
reg                    valid_array   [Cmem_depth-1:0];
integer  i;

reg [4:0] block_indx_reg;
reg [1:0] word_offset_reg;
reg [31:0] data_in_reg;

/*
always@(posedge clk)
  begin
    block_indx_reg  <= block_indx;
	word_offset_reg <= word_offset;
  end
*/

always@(posedge clk)
  begin
    if((block_indx == 5'bxxxxx) || stall) begin
      block_indx_reg  <= block_indx_reg;
	  word_offset_reg <= word_offset_reg;
	  data_in_reg   <= data_in_reg;
	end
	else begin
      block_indx_reg  <= block_indx;
	  word_offset_reg <= word_offset;
      data_in_reg   <= data_in;		  
	end
  end


always @(negedge clk or negedge rst) 
  begin
    if(!rst) begin
	  for(i=0;i<Cmem_depth;i=i+1) begin
        valid_array[i] <= 0;
		tag_array[i] <= 0;
      end	  
    end
    else if	(fill_from_Dmem) begin
	  cache[block_indx_reg]       <= data_mem;
	  tag_array[block_indx_reg]   <= tag_in;
	  valid_array[block_indx_reg] <= 1'b1;
    end
	
	else if(fill_from_DataIn) begin
	  case(word_offset)
	    2'b00: cache[block_indx][31:0]     <= data_in_reg; 
	    2'b01: cache[block_indx][63:32]    <= data_in_reg;
		2'b10: cache[block_indx][95:64]    <= data_in_reg;
		2'b11: cache[block_indx][127:96]   <= data_in_reg;
	  endcase
	  tag_array[block_indx]   <= tag_in;
	  valid_array[block_indx] <= 1'b1;
	end
  end

assign tag_out   = tag_array[block_indx];
assign valid_out = valid_array[block_indx];
always @(*) 
  begin
    if(read) begin
      case(word_offset)
	    2'b00: DataOut = cache[block_indx][31:0];
	    2'b01: DataOut = cache[block_indx][63:32];
        2'b10: DataOut = cache[block_indx][95:64];
        2'b11: DataOut = cache[block_indx][127:96];
	  endcase
	end
	else 
	  DataOut = 'b0;
  end  
endmodule  

