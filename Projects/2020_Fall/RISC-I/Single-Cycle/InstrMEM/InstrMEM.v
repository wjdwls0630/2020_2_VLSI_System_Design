//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "parameters.v"
module InstrMEM (
  input i_CLK,
  input i_RSTN,
  input [`WORD_LEN-1:0] i_Write_Instr,
  input [`WORD_LEN-1:0] i_Addr,
  output [`WORD_LEN-1:0] o_Instr
  );

  reg [`WORD_LEN-1:0] r_MEM [0:`InstrMEM_SIZE-1];
  reg r_instr_write_pflag, r_instr_write_nflag;
  reg [$clog2(`InstrMEM_SIZE)-1:0]r_instr_write_addr;

  assign o_Instr = r_MEM[i_Addr>>2];

  always @ ( * ) begin
    if (i_Write_Instr[`WORD_LEN-1:`WORD_LEN-8] == 8'hFE) r_instr_write_nflag = 1'b1;
    else if (i_Write_Instr[`WORD_LEN-1:`WORD_LEN-8] == 8'hFF) r_instr_write_nflag = 1'b0;
    else r_instr_write_nflag = r_instr_write_pflag;
  end

  integer i;
  always @ ( posedge i_CLK or negedge i_RSTN ) begin
    if(!i_RSTN) begin
      for(i=0;i<`InstrMEM_SIZE;i=i+1) r_MEM[i] <= 0;
      r_instr_write_pflag <= 1'b0;
      r_instr_write_addr <= 0;
    end else begin
      r_instr_write_pflag <= r_instr_write_nflag;
      if (r_instr_write_pflag) begin
        if(i_Write_Instr[`WORD_LEN-1:`WORD_LEN-8] != 8'hFF) r_MEM[r_instr_write_addr] <= i_Write_Instr;
        r_instr_write_addr <= r_instr_write_addr + 1;
      end
    end
  end
endmodule //InstrMEM
