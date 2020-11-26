//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "parameters.v"
module DataMEM (
  input i_CLK,
  input i_RSTN,
  input i_MemWrite,
  input i_MemRead,
  input [$clog2(`DataMEM_SIZE)-1:0] i_Address, // 10bit address 1024 entries
  input [`WORD_LEN-1:0] i_Write_Data,
  output [`WORD_LEN-1:0] o_Read_Data,

  // Test
  input [$clog2(`DataMEM_SIZE)-1:0] i_Test_Mem_Addr,
  output [`WORD_LEN-1:0] o_Test_Mem_Data
  );

  reg [`WORD_LEN-1:0] r_MEM [0:`DataMEM_SIZE-1];

  // read - read data no matter clock
  assign o_Read_Data =  (i_MemRead) ? r_MEM[i_Address] : 0;
  assign o_Test_Mem_Data = o_Test_Mem_Data[i_Test_Mem_Addr];

  // write - write data when clock is positive edge
  integer i;
  always @ ( posedge i_CLK or negedge i_RSTN) begin
    if (!i_RSTN) begin
      for(i=0;i<`DataMEM_SIZE;i=i+1) r_MEM[i] = 0;
    end else begin
      if(i_MemWrite == 1'b1) r_MEM[i_Address] <= i_Write_Data;
    end
  end
endmodule // DataMEM
