module sequential_alu(
  input wire clk,
  input wire rst,
  input wire [15:0] op1,
  input wire [15:0] op2,
  input wire [1:0] operation,
  output wire [15:0] result
);

  reg [15:0] accumulator;

  always @(posedge clk or posedge rst) begin
    if (rst)
      accumulator <= 0;
    else begin
      case (operation)
        2'b00: // Addition
          accumulator <= op1 + op2;
        2'b01: // Subtraction
          accumulator <= op1 - op2;
        2'b10: // XOR
          accumulator <= op1 ^ op2;
        2'b11: // Multiplication
          accumulator <= op1 * op2;
      endcase
    end
  end

  assign result = accumulator;

endmodule
