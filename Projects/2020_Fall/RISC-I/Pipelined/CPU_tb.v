//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "CPU.v"
module CPU_tb();
  reg clk, rstn;
  reg [9:0] instrmem_write_addr;
  reg [31:0] instrmem_write_instr;
  reg instrmem_write_memwrite;
  wire [31:0] scan_instr;

  integer cycle;

  always #5 clk = ~clk;
  initial begin
    instrmem_write_addr = 10'b0;
    instrmem_write_instr = 32'b0;
    instrmem_write_memwrite = 1'b0;
    clk = 0;
    rstn = 0;
    #6 rstn = 1;
    #1 rstn = 0;
    #13 rstn = 1;

    cycle = 0;
    while(scan_instr != 32'b0) @(negedge clk) cycle = cycle + 1;
    $display("Total cycles: %0d cycles", cycle);
    $finish;
  end


  CPU CPU (
    .i_CLK(clk),
    .i_RSTN(rstn),
    .i_InstrMEM_Write_Addr(instrmem_write_addr),
    .i_InstrMEM_Write_Instr(instrmem_write_instr),
    .i_InstrMEM_MemWrite(instrmem_write_memwrite),
    .o_scan_instr(scan_instr)
    );
endmodule
