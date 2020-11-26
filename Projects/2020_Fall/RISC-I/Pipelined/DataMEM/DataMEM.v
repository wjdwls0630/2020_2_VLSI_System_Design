//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
module DataMEM (
  input i_CLK,
  input i_MemWrite,
  input i_MemRead,
  input [9:0] i_Address, // 10bit address 1024 entries
  input [31:0] i_Write_Data,
  output reg [31:0] o_Read_Data
  );

  reg [31:0] r_MEM [0:1023];
  initial begin
    $readmemh("DataMEM/DataMEM.mem",r_MEM);
  end

  // read - read data no matter clock
  always @ ( * ) begin
    if (i_MemWrite == 1'b0 && i_MemRead == 1'b1) begin
      o_Read_Data = r_MEM[i_Address];
    end
  end

  // write - write data when clock is positive edge
  always @ ( posedge i_CLK ) begin
    if(i_MemWrite == 1'b1 &&  i_MemRead == 1'b0) begin
      r_MEM[i_Address] <= i_Write_Data;
    end
  end

endmodule // DataMEM
