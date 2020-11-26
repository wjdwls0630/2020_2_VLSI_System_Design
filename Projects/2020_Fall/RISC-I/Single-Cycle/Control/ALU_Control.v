//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "parameters.v"
module ALU_Control (
  input [5:0] i_funct,
  input [1:0] i_ALUop,
  output reg [3:0] o_ALU_Ctrl
  );

  always @ ( * ) begin
    case (i_ALUop)
      2'b00: o_ALU_Ctrl = `ALU_ADD; // LW, SW - add
      2'b01: o_ALU_Ctrl = `ALU_SUB; // BEQ, BNE - sub
      2'b10: // R-Type
      begin
        case (i_funct)
          6'b000000: o_ALU_Ctrl = `ALU_SLL; // SLL
          6'b000010: o_ALU_Ctrl = `ALU_SRL; // SRL
          6'b000011: o_ALU_Ctrl = `ALU_SRA; // SRA
          6'b011000: o_ALU_Ctrl = `ALU_MUL; // MUL
          6'b100000: o_ALU_Ctrl = `ALU_ADD; // ADD
          6'b100010: o_ALU_Ctrl = `ALU_SUB; // SUB
          6'b100100: o_ALU_Ctrl = `ALU_AND; // AND
          6'b100101: o_ALU_Ctrl = `ALU_OR; // OR
          6'b101010: o_ALU_Ctrl = `ALU_SLT; // SLT
          6'b101011: o_ALU_Ctrl = `ALU_SLTU; // SLTU
          6'b100110: o_ALU_Ctrl = `ALU_XOR; // XOR
          default: o_ALU_Ctrl = `ALU_AND; // J, JAL  - not use ALU
        endcase
      end
      2'b11: o_ALU_Ctrl = `ALU_ADD; // ADDI
      default: o_ALU_Ctrl = `ALU_ADD; // NOOP, J, JAL  - not use ALU;
    endcase
  end
endmodule // ALU_Control
