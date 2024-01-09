module neg_edge_detector (
    input clk, rst,
    input level,
    output reg tick
);

    localparam [1:0] high  = 2'b00,
                     edg  = 2'b01,
                     low = 2'b10;
 
    reg [1:0] state, next_state;

    always @(posedge clk, negedge rst)
        begin
            if (~rst)
                state <= high;
            else
                state <= next_state;
        end

    always @(*)
        begin
            next_state = state; 
            tick = 1'b0;
            case (state)
                high:
                    begin
                        if (~level)
                            next_state = edg;
                        else
                            next_state = high;
                    end
                edg:
                    begin
                        tick = 1'b1;
                        if (~level)
                            next_state = low;
                        else
                            next_state = high;
                    end
                low:
                    begin
                        if (~level)
                            next_state = low;
                        else
                            next_state = high;                            
                    end
                default:
                    next_state = high;
            endcase
        end 
endmodule