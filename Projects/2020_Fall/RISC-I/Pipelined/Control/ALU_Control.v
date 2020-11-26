//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
module ALU_Control (
  input [5:0] i_funct,
  input [1:0] i_ALUop,
  output reg [3:0] o_ALUctrl
  );

  always @ ( * ) begin
    case (i_ALUop)
      2'b00: o_ALUctrl = 4'b0010; // LW, SW - add
      2'b01: o_ALUctrl = 4'b0110; // BEQ, BNE - sub
      2'b10: // R-Type
      begin
        case (i_funct)
          6'b000000: o_ALUctrl = 4'b1001; // SLL
          6'b000010: o_ALUctrl = 4'b1011; // SRL
          6'b000011: o_ALUctrl = 4'b1010; // SRA
          6'b100000: o_ALUctrl = 4'b0010; // ADD
          6'b100010: o_ALUctrl = 4'b0110; // SUB
          6'b100100: o_ALUctrl = 4'b0000; // AND
          6'b100101: o_ALUctrl = 4'b0001; // OR
          6'b101010: o_ALUctrl = 4'b0111; // SLT
          6'b101011: o_ALUctrl = 4'b1000; // SLTU
          6'b100110: o_ALUctrl = 4'b1101; // XOR
          default: o_ALUctrl = 4'b0000; // J, JAL  - not use ALU
        endcase
      end
      default: o_ALUctrl = 4'b0000; // J, JAL  - not use ALU;
    endcase
  end
endmodule // ALU_Control
