module Adder (
  input [31:0] i_A,
  input [31:0] i_B,
  output [31:0] o_Y
  );

  assign o_Y = i_A + i_B;

endmodule // Adder
