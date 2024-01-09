module Data_Mem_Top (
 input    wire            MemRead,MemWrite,clk,rst,
 input    wire   [9:0]    WordAddress,
 input    wire   [31:0]   DataIn,
 output   wire   [31:0]   DataOut,
 output   wire            stall
);

wire           ready,fill_from_Dmem,fill_from_DataIn,valid_cache;
wire  [2:0]    tag_cache,tag_cntrl;
wire  [1:0]    word_offset;
wire  [4:0]    block_index;
wire           read,Dmem_Write;
wire  [127:0]  data_mem;

cache_controller ccntrl (
.clk(clk),
.rst(rst),
.MemRead(MemRead),
.MemWrite(MemWrite),
.valid_cache(valid_cache),
.ready(ready),
.word_address(WordAddress),
.tag_in(tag_cache),
.stall(stall),
.fill_from_Dmem(fill_from_Dmem),
.fill_from_DataIn(fill_from_DataIn),
.word_offset(word_offset),
.block_index(block_index),
.read(read),
.Dmem_Write(Dmem_Write),
.tag_out(tag_cntrl)
);

cache_mem cm (
.stall(stall),
.block_indx(block_index),
.word_offset(word_offset),
.clk(clk),
.rst(rst),
.fill_from_Dmem(fill_from_Dmem),
.fill_from_DataIn(fill_from_DataIn),
.read(read),
.data_in(DataIn),
.data_mem(data_mem),
.valid_out(valid_cache),
.tag_out(tag_cache),
.DataOut(DataOut),
.tag_in(tag_cntrl)
);

Data_Memory dm (
.word_address(WordAddress),
.data_in(DataIn),
.clk(clk),
.rst(rst),
.WE(Dmem_Write),
.stall(stall),
.RD(data_mem),
.ready(ready),
.MemRead(MemRead)
);

endmodule
