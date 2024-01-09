module mux_2_1 #(parameter In_Width=32 )
(
input   wire    [In_Width-1:0]   IN1,IN2,
input   wire                     sel,
output  reg     [In_Width-1:0]   out
);
always @(*)
  begin
    if(sel)
      begin
        out=IN2;
      end
    else
      begin
        out=IN1;
      end
  end
endmodule
