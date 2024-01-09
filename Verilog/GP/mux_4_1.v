module mux_4_1 #(parameter In_Width=32 )
(
input   wire    [In_Width-1:0]   IN1,IN2,IN3,
input   wire    [1:0]            ResultSrc,
output  reg     [In_Width-1:0]   Result
);
always @(*)
  begin
    case(ResultSrc)
	  2'b00: Result = IN1;
	  2'b01: Result = IN2;
	  2'b10: Result = IN3;
	  default: Result = 'b0;
	endcase
  end
endmodule
