//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "parameters.v"
module Sign_Extend (
  input [`WORD_LEN/2-1:0] i_A,
  output [`WORD_LEN-1:0] o_Y
  );

  assign o_Y = {{`WORD_LEN/2{i_A[`WORD_LEN/2-1]}},i_A};

endmodule // Sign_Extend
