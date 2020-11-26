//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
module Registers (
  input i_CLK,
  input i_RegWrite,
  input [4:0] i_Read_Reg_Addr1,
  input [4:0] i_Read_Reg_Addr2,
  input [4:0] i_Write_Reg_Addr,
  input [31:0] i_Write_Reg_Data,
  output reg [31:0] o_Read_Reg_Data1,
  output reg [31:0] o_Read_Reg_Data2
  );

  // reg0      $zero    - always stores the constant 0
  // reg1      $at      - used by assembler (pseudo-instructions)
  // reg2-3    $v0-1    - subroutine return value
  // reg4-7    $a0-3    - arguments: subroutine parameter value
  // reg8-15   $t0-7    - temp: can be used by subroutine without saving
  // reg16-23  $s0-7    - saved: must be saved and restored by subroutine
  // reg24-25  $t8-9    - temp
  // reg26-27  $k0-1    - kernel: interrupt/trap handler
  // reg28     $gp      - global pointer (static or extern variables)
  // reg29     $sp      - stack pointer
  // reg30     $fp      - frame pointer
  // reg31     $ra      - return address for subroutine
  //           Hi, Lo   - used in multiplication (not design in this processor)
  reg [31:0] r_Regs[0:31];
  initial begin
    $readmemh("Registers/RegData.mem", r_Regs);
  end

  // read - read data no matter clock
  always @ ( * ) begin
    if(!i_RegWrite) begin
      o_Read_Reg_Data1 = r_Regs[i_Read_Reg_Addr1];
      o_Read_Reg_Data2 = r_Regs[i_Read_Reg_Addr2];
    end
  end

  // write - write data when clock is positive edge
  always @ ( posedge i_CLK ) begin
    if(i_RegWrite) begin
      if (i_Write_Reg_Addr == 4'b0) r_Regs[i_Write_Reg_Addr] <= 32'b0; // always 0
      else r_Regs[i_Write_Reg_Addr] <= i_Write_Reg_Data;
    end 
  end

endmodule // Registers
