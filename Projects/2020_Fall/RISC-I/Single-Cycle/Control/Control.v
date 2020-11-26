//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "parameters.v"
module Control (
  input [`OP_CODE_LEN-1:0] i_OP,
  output reg o_RegDst,
  output reg o_RegWrite,
  output reg o_Jump,
  output reg o_Branch,
  output reg o_NotEqualBranch,
  output reg o_MemRead,
  output reg o_MemWrite,
  output reg o_MemtoReg,
  output reg [1:0] o_ALUop,
  output reg o_ALUSrc
  );

  always @ ( * ) begin
    case (i_OP)
      `OP_Rtype: // R-type
      begin
        o_RegDst = 1'b1;
        o_RegWrite = 1'b1;
        o_Jump = 1'b0;
        o_Branch = 1'b0;
        o_NotEqualBranch = 1'b0;
        o_MemRead = 1'b0;
        o_MemWrite = 1'b0;
        o_MemtoReg = 1'b0;
        o_ALUop = 2'b10;
        o_ALUSrc = 1'b0;
      end
      `OP_J: // J
      begin
        o_RegDst = 1'bx; // don't care - TODO: see what the circuits are synthesized.
        o_RegWrite = 1'b0;
        o_Jump = 1'b1;
        o_Branch = 1'b0;
        o_NotEqualBranch = 1'b0;
        o_MemRead = 1'b0;
        o_MemWrite = 1'b0;
        o_MemtoReg = 1'bx; // don't care - TODO: see what the circuits are synthesized.
        o_ALUop = 2'b11;
        o_ALUSrc = 1'b0;
      end
      `OP_BEQ: // BEQ
      begin
        o_RegDst = 1'bx; // don't care - TODO: see what the circuits are synthesized.
        o_RegWrite = 1'b0;
        o_Jump = 1'b0;
        o_Branch = 1'b1;
        o_NotEqualBranch = 1'b0;
        o_MemRead = 1'b0;
        o_MemWrite = 1'b0;
        o_MemtoReg = 1'bx; // don't care - TODO: see what the circuits are synthesized.
        o_ALUop = 2'b01;
        o_ALUSrc = 1'b0;
      end
      `OP_BNE: // BNE
      begin
        o_RegDst = 1'bx; // don't care - TODO: see what the circuits are synthesized.
        o_RegWrite = 1'b0;
        o_Jump = 1'b0;
        o_Branch = 1'b0;
        o_NotEqualBranch = 1'b1;
        o_MemRead = 1'b0;
        o_MemWrite = 1'b0;
        o_MemtoReg = 1'bx; // don't care - TODO: see what the circuits are synthesized.
        o_ALUop = 2'b01;
        o_ALUSrc = 1'b0;
      end
      `OP_ADDI: // ADDI
      begin
        o_RegDst = 1'b0;
        o_RegWrite = 1'b1;
        o_Jump = 1'b0;
        o_Branch = 1'b0;
        o_NotEqualBranch = 1'b0;
        o_MemRead = 1'b0;
        o_MemWrite = 1'b0;
        o_MemtoReg = 1'b0;
        o_ALUop = 2'b11;
        o_ALUSrc = 1'b1;
      end
      6'b100011: // LW
      begin
        o_RegDst = 1'b0;
        o_RegWrite = 1'b1;
        o_Jump = 1'b0;
        o_Branch = 1'b0;
        o_NotEqualBranch = 1'b0;
        o_MemRead = 1'b1;
        o_MemWrite = 1'b0;
        o_MemtoReg = 1'b1;
        o_ALUop = 2'b00;
        o_ALUSrc = 1'b1;
      end
      6'b101011: // SW
      begin
        o_RegDst = 1'bx;  // don't care - TODO: see what the circuits are synthesized.
        o_RegWrite = 1'b0;
        o_Jump = 1'b0;
        o_Branch = 1'b0;
        o_NotEqualBranch = 1'b0;
        o_MemRead = 1'b0;
        o_MemWrite = 1'b1;
        o_MemtoReg = 1'bx; // don't care - TODO: see what the circuits are synthesized.
        o_ALUop = 2'b00;
        o_ALUSrc = 1'b1;
      end
    endcase
  end

endmodule // Control
