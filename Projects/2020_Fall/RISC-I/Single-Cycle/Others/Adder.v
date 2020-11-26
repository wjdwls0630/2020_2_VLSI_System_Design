`include "parameters.v"
module Adder (
  input [`WORD_LEN-1:0] i_A,
  input [`WORD_LEN-1:0] i_B,
  output [`WORD_LEN-1:0] o_Y
  );

  assign o_Y = i_A + i_B;

endmodule // Adder
