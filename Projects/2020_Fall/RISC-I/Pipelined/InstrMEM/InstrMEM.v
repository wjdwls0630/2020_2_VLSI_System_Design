//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
module InstrMEM (
  input i_CLK,
  input [9:0] i_Read_Addr,
  input [9:0] i_Write_Addr,
  input [31:0] i_Write_Instr,
  input i_MemWrite,
  output reg [31:0] o_Instr
  );

  reg [31:0] r_MEM [0:1023];
  initial begin
    $readmemh("InstrMEM/InstrMEM.mem",r_MEM);
  end

  // read - read data no matter clock
  always @ ( * ) begin
    if(!i_MemWrite) o_Instr = r_MEM[i_Read_Addr];
  end

  // write - write data when clock is positive edge
  always @ ( posedge i_CLK ) begin
    if(i_MemWrite) r_MEM[i_Write_Addr] <= i_Write_Instr;
  end


endmodule //InstrMEM
