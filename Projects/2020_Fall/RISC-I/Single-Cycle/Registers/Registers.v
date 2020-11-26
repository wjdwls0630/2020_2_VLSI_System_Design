//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "parameters.v"
module Registers (
  input i_CLK,
  input i_RSTN,
  input i_RegWrite,
  input [$clog2(`Register_SIZE)-1:0] i_Read_Reg_Addr1,
  input [$clog2(`Register_SIZE)-1:0] i_Read_Reg_Addr2,
  input [$clog2(`Register_SIZE)-1:0] i_Write_Reg_Addr,
  input [`WORD_LEN-1:0] i_Write_Reg_Data,
  output [`WORD_LEN-1:0] o_Read_Reg_Data1,
  output [`WORD_LEN-1:0] o_Read_Reg_Data2,

  // Test
  input [$clog2(`Register_SIZE)-1:0] i_Test_Reg_Addr,
  output [`WORD_LEN-1:0] o_Test_Reg_Data
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
  reg [`WORD_LEN-1:0] r_Regs[0:`Register_SIZE-1];

  // read - read data no matter clock
  assign o_Read_Reg_Data1 = r_Regs[i_Read_Reg_Addr1];
  assign o_Read_Reg_Data2 = r_Regs[i_Read_Reg_Addr2];
  assign o_Test_Reg_Data = r_Regs[i_Test_Reg_Addr];
  // write - write data when clock is negative edge - For quick Write Back and Immediate Assign
  integer i;
  always @ ( negedge i_CLK or negedge i_RSTN ) begin
    if(!i_RSTN) begin
      for(i=0;i<`Register_SIZE-1;i=i+1) r_Regs[i] <= 0;
    end else begin
      if(i_RegWrite) begin
        if (i_Write_Reg_Addr == 0) r_Regs[i_Write_Reg_Addr] <= 0; // always 0
        else r_Regs[i_Write_Reg_Addr] <= i_Write_Reg_Data;
      end
    end
  end
endmodule // Registers
