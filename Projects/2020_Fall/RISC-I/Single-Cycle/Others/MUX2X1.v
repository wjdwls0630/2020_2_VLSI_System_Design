module MUX2X1 #(parameter DATA_WIDTH=32) (
  input [DATA_WIDTH-1:0] i_IN0,
  input [DATA_WIDTH-1:0] i_IN1,
  input i_S,
  output [DATA_WIDTH-1:0] o_OUT
  );
  assign o_OUT = (i_S) ? i_IN1 : i_IN0;

endmodule // MUX2X1
