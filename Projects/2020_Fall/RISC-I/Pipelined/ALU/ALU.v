//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//

module ALU (
  input [3:0] i_ALUctrl,
  input [31:0] i_A,
  input [31:0] i_B,
  output reg [31:0] o_Y,
  output o_Zero
  );

  assign o_Zero = (o_Y==32'b0); //o_Zero is true if o_Y is 0

  always @ ( * ) begin
    case (i_ALUctrl)
      4'b0000 : o_Y = i_A & i_B; // AND
      4'b0001 : o_Y = i_A | i_B; // OR
      4'b0010 : o_Y = i_A + i_B; // ADD
      4'b0110 : o_Y = i_A - i_B; // SUB
      4'b0111 : o_Y = ($signed(i_A) < $signed(i_B)) ? 32'b1 : 32'b0; // SLT
      4'b1000 : o_Y = (i_A < i_B) ? 32'b1 : 32'b0; // SLTU
      4'b1001 : o_Y = i_A << i_B[10:6]; // SLL
      4'b1010 : o_Y = $signed(i_A) >>> i_B[10:6]; // SRA $d = $t << h(shamt)
      4'b1011 : o_Y = i_A >> i_B[10:6]; // SRL
      4'b1101 : o_Y = i_A ^ i_B; // XOR
      default: o_Y = 32'b0;
    endcase
  end
endmodule //ALU
