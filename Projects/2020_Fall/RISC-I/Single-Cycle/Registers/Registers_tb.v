//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`timescale 1ns / 1ps
`include "Registers.v"
module Registers_tb ();

reg clk, write;
reg [4:0] read_addr1, read_addr2, write_addr;
reg [31:0] write_data;
wire [31:0] read_data1, read_data2;

always #5 clk = ~clk;
initial begin
  clk = 1;
  write = 0;
  read_addr1 = 0;
  read_addr2 = 0;
  write_addr = 0;
  write_data = 0;

  #10; // wait

  // Add stimulus here
  @(posedge clk) read_addr1 <= 5'd1;
  @(posedge clk) read_addr2 <= 5'd2;
  @(posedge clk) begin
    read_addr1 <= 5'd3;
    read_addr2 <= 5'd4;
  end
  @(negedge clk) begin
    read_addr1 <= 5'd5;
    read_addr2 <= 5'd6;
  end
  @(negedge clk) begin
    write <= 1;
    read_addr1 <= 5'd5;
    write_addr <= 5'd1;
    write_data <= 32'd3;
  end
  @(posedge clk) read_addr1 <= 5'd7;
  @(posedge clk) write <= 0;
  @(posedge clk) read_addr1 <= 5'd1;
  @(posedge clk) begin
    write <= 1;
    write_addr <= 5'd0;
    write_data <= 32'd3;
  end
  @(posedge clk) begin
    write <= 0;
    read_addr1 <= 5'd0;
  end
  #100 $finish;
end

Registers Registers (
  .i_CLK(clk),
  .i_RegWrite(write),
  .i_Read_Reg_Addr1(read_addr1),
  .i_Read_Reg_Addr2(read_addr2),
  .i_Write_Reg_Addr(write_addr),
  .i_Write_Reg_Data(write_data),
  .o_Read_Reg_Data1(read_data1),
  .o_Read_Reg_Data2(read_data2)
  );

endmodule //Registers_tb
