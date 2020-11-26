//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
module Sign_Extend (
  input [15:0] i_A,
  output [31:0] o_Y
  );

  assign o_Y = {{16{i_A[15]}},i_A};

endmodule // Sign_Extend
