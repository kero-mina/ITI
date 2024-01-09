module cache_controller(
  input    wire               clk,rst,MemRead,MemWrite,ready,valid_cache,
  input    wire    [9:0]      word_address,
  input    wire    [2:0]      tag_in,
  output   reg                stall,fill_from_Dmem,fill_from_DataIn,Dmem_Write,
  output   wire    [1:0]      word_offset,
  output   wire    [4:0]      block_index,
  output   reg                read,
  output   wire    [2:0]      tag_out
);

reg  [1:0]  current_state,next_state;
reg         hit;

assign  block_index = word_address[6:2];
assign  word_offset = word_address[1:0];
assign  tag_out = word_address[9:7];

localparam  idle     =  2'b00,
            reading  =  2'b01,
			writing  =  2'b10;

always@(negedge clk or negedge rst)
  begin
    if(!rst)
	  begin
	    current_state <= idle; next_state = idle;
	  end
	else
	  begin
	    current_state <= next_state;
	  end
  end
/*
reg MemReadReg;

always@(posedge clk)
  begin
    MemReadReg <= MemRead;
  end
*/

// Next_State Logic
always@(*) 
  begin
    case(current_state)
	  idle: begin
	    if(MemRead) begin
		  if(hit) begin
		    next_state = idle;
		  end
		  else begin
		    next_state = reading;
		  end
		end
		else if(MemWrite) begin
		  next_state = writing;
		end
		else 
		  next_state = next_state;
	  end
    
      reading: begin
	    if(ready) begin
		  next_state = idle;
		end
		else begin
		  next_state = reading;
		end
      end
      
      writing: begin
	    if(ready) begin
          next_state = idle;
        end
        else begin
          next_state = writing;
        end		
      end	  
    endcase
  end
  
// Output Logic
always@(*)
  begin
    read = 1'b0; stall = 1'b0; fill_from_Dmem = 1'b0; fill_from_DataIn = 1'b0; Dmem_Write = 1'b0;
    case(current_state)
	  idle: begin
	    if(MemRead) begin // May need to insert an else .. 
		  if(hit) begin
		    read = 1'b1; stall = 1'b0; 
		  end
		  else begin
		    read = 1'b0; stall = 1'b1;  // We may need to set stall to 0 here // To be confirmed  
		  end
	    end
		else if(MemWrite) begin
		  stall = 1'b1;
		end
      end
	  
	  reading: begin
	    if(ready) begin
		  read = 1'b1; stall = 1'b0; fill_from_Dmem = 1'b1; 
		end
		else begin
		  read = 1'b0; stall = 1'b1; fill_from_Dmem = 1'b1;
		end	  
	  end
	  
	  writing: begin
	    if(hit) begin
		  fill_from_DataIn = 1'b1; Dmem_Write = 1'b1;
		  if(ready) 
		    stall = 1'b0;
		  else
		    stall = 1'b1;
		end
		else begin
		  fill_from_DataIn = 1'b0; Dmem_Write = 1'b1;
		  if(ready) 
		    stall = 1'b0;
		  else
		    stall = 1'b1;
		end
	    
	  end
    endcase
  end
  
always@(*)
  begin
    if(valid_cache) begin	
	  if(tag_in == word_address[9:7])
	    hit = 1'b1;
	end
	else 
	  hit = 1'b0;  
  end
endmodule