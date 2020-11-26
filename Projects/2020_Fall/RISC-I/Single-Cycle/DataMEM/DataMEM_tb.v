//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`timescale 1ns / 1ps
`include "DataMEM.v"
module DataMEM_tb ();

  reg clk, write, read;
  reg [9:0] addr;
  reg [31:0] write_data;
  wire [31:0] read_data;

  always #5 clk = ~clk;

  initial begin
    clk=1;
    write = 0;
    read = 0;
    addr = 10'd0;
    write_data = 32'd0;

    #10;

    @(posedge clk) addr <= 10'd6;
    @(negedge clk) addr <= 10'd9;
    @(posedge clk) begin
      read <= 1;
      addr <= 10'd6;
    end
    @(negedge clk) addr <= 10'd9;
    @(posedge clk) read <= 0;
    @(posedge clk) begin
      write <= 1;
      addr <= 10'd6;
      write_data = 32'd1023;
    end
    @(posedge clk) begin
      write <= 0;
      write_data = 32'd23;
    end
    #10;
    @(posedge clk) begin
      read <= 1;
      addr <= 10'd6;
      write_data = 32'd9;
    end
    @(posedge clk) addr <= 10'd9;
    @(posedge clk) read <= 0;

    #100;
    $finish;
  end

  DataMEM DataMEM (
    .i_CLK(clk),
    .i_MemWrite(write),
    .i_MemRead(read),
    .i_Address(addr), // 10bit address 1024 entries
    .i_Write_Data(write_data),
    .o_Read_Data(read_data)
    );

endmodule // DataMEM_tb
