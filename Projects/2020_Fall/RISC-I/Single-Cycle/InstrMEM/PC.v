//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "parameters.v"
module PC (
  input i_CLK,
  input i_START,
  input [`WORD_LEN-1:0] i_PC,
  output reg [`WORD_LEN-1:0] o_PC
  );

  reg r_instr_write_pflag, r_instr_write_nflag;
  always @ ( * ) begin
    if(i_PC == (`InstrMEM_SIZE-1)*4) r_instr_write_nflag <= 1'b1;
    else r_instr_write_nflag = r_instr_write_pflag;
  end

  always @ ( posedge i_CLK or negedge i_START ) begin
    if(!i_START) begin
      o_PC <= 0;
      r_instr_write_pflag <= 1'b0;
    end else begin
      r_instr_write_pflag <= r_instr_write_nflag;
      o_PC <= (r_instr_write_pflag) ? (`InstrMEM_SIZE-1)*4 : i_PC;
    end
  end
endmodule // PC
