module Shift_Left_2 (
  input [31:0] i_A,
  output [31:0] o_Y
  );

  assign o_Y = i_A << 2;

endmodule // Shift_Left_2
