//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "parameters.v"
module ALU (
  input [3:0] i_ALU_Ctrl,
  input [`WORD_LEN-1:0] i_A,
  input [`WORD_LEN-1:0] i_B,
  output reg [`WORD_LEN-1:0] o_Y,
  output o_Zero
  );

  assign o_Zero = (o_Y==0); //o_Zero is true if o_Y is 0

  always @ ( * ) begin
    case (i_ALU_Ctrl)
      `ALU_AND  : o_Y = i_A & i_B; // AND
      `ALU_OR   : o_Y = i_A | i_B; // OR
      `ALU_ADD  : o_Y = i_A + i_B; // ADD
      `ALU_MUL  : o_Y = i_A * i_B; // MUL
      `ALU_SUB  : o_Y = i_A - i_B; // SUB
      `ALU_SLT  : o_Y = ($signed(i_A) < $signed(i_B)) ? 32'b1 : 32'b0; // SLT
      `ALU_SLTU : o_Y = (i_A < i_B) ? 32'b1 : 32'b0; // SLTU
      `ALU_SLL  : o_Y = i_A << i_B[10:6]; // SLL
      `ALU_SRA  : o_Y = $signed(i_A) >>> i_B[10:6]; // SRA $d = $t << h(shamt)
      `ALU_SRL  : o_Y = i_A >> i_B[10:6]; // SRL
      `ALU_XOR  : o_Y = i_A ^ i_B; // XOR
      default:   o_Y = i_A;
    endcase
  end
endmodule //ALU
