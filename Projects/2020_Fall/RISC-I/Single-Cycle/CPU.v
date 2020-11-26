//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "parameters.v"
`include "ALU/ALU.v"
`include "Control/ALU_Control.v"
`include "Control/Control.v"
`include "DataMEM/DataMEM.v"
`include "InstrMEM/InstrMEM.v"
`include "InstrMEM/PC.v"
`include "Others/Adder.v"
`include "Others/Branch_Control.v"
`include "Others/MUX2X1.v"
`include "Others/Shift_Left_2.v"
`include "Others/Sign_Extend.v"
`include "Registers/Registers.v"

module CPU (
  input i_CLK,
  input i_RSTN,

  input i_Reg_or_Data, // 0 - Data 1 - Reg
  input [$clog2(`Register_SIZE)-1:0] i_Test_Addr,
  output [`WORD_LEN-1:0] o_Test_Data,

  input [`WORD_LEN-1:0] i_Write_Instr
  );

  reg r_start;
  reg r_instr_write_flag;
  always @ ( posedge i_CLK or negedge i_RSTN ) begin
    if(!i_RSTN) begin
      r_start <= 1'b0;
      r_instr_write_flag <= 1'b0;
    end else begin
      if(r_instr_write_flag) begin
        if (i_Write_Instr[`WORD_LEN-1:`WORD_LEN-8] == 8'hFF) begin
          r_start <= 1'b1;
          r_instr_write_flag <= 1'b0;
        end else begin
          r_start <= r_start;
          r_instr_write_flag <= r_instr_write_flag;
        end
      end else begin
        if (i_Write_Instr[`WORD_LEN-1:`WORD_LEN-8] == 8'hFE) r_instr_write_flag <= 1'b1; // start reading
        else r_instr_write_flag <= r_instr_write_flag;
        r_start <= r_start;
      end
    end
  end

  wire [`WORD_LEN-1:0] w_Test_Reg_Data, w_Test_Mem_Data;
  assign o_Test_Data = (i_Reg_or_Data) ? w_Test_Reg_Data : w_Test_Mem_Data;

  // Fetch
  wire [`WORD_LEN-1:0] w_nPC;
  wire [`WORD_LEN-1:0] w_PC;
  PC PC (
    .i_CLK(i_CLK),
    .i_START(r_start),
    .i_PC(w_nPC),
    .o_PC(w_PC)
    );

  wire [`WORD_LEN-1:0] w_instr;
  InstrMEM InstrMEM (
    .i_CLK(i_CLK),
    .i_RSTN(i_RSTN),
    .i_Write_Instr(i_Write_Instr),
    .i_Addr(w_PC),
    .o_Instr(w_instr)
    );

  wire w_RegDst;
  wire w_RegWrite;
  wire w_Jump;
  wire w_Branch;
  wire w_NotEqualBranch;
  wire w_MemRead;
  wire w_MemWrite;
  wire w_MemtoReg;
  wire [1:0] w_ALUop;
  wire w_ALUSrc;
  Control Control (
    .i_OP(w_instr[`WORD_LEN-1:`WORD_LEN-6]),
    .o_RegDst(w_RegDst),
    .o_RegWrite(w_RegWrite),
    .o_Jump(w_Jump),
    .o_Branch(w_Branch),
    .o_NotEqualBranch(w_NotEqualBranch),
    .o_MemRead(w_MemRead),
    .o_MemWrite(w_MemWrite),
    .o_MemtoReg(w_MemtoReg),
    .o_ALUop(w_ALUop),
    .o_ALUSrc(w_ALUSrc)
    );

  // Decode
  wire [4:0] w_mux_reg_out;
  MUX2X1 #(.DATA_WIDTH(5)) MUX2X1_Reg (
    .i_IN0(w_instr[`WORD_LEN-12:`WORD_LEN-16]),
    .i_IN1(w_instr[`WORD_LEN-17:`WORD_LEN-21]),
    .i_S(w_RegDst),
    .o_OUT(w_mux_reg_out)
    );

  wire [31:0] w_Reg_Data1;
  wire [31:0] w_Reg_Data2;
  wire [31:0] w_mux_DataMEM_out;
  Registers Registers (
    .i_CLK(i_CLK),
    .i_RSTN(i_RSTN),
    .i_RegWrite(w_RegWrite),
    .i_Read_Reg_Addr1(w_instr[`WORD_LEN-7:`WORD_LEN-11]),
    .i_Read_Reg_Addr2(w_instr[`WORD_LEN-12:`WORD_LEN-16]),
    .i_Write_Reg_Addr(w_mux_reg_out),
    .i_Write_Reg_Data(w_mux_DataMEM_out),
    .o_Read_Reg_Data1(w_Reg_Data1),
    .o_Read_Reg_Data2(w_Reg_Data2),

    .i_Test_Reg_Addr(i_Test_Addr),
    .o_Test_Reg_Data(w_Test_Reg_Data)
    );

  wire [31:0] w_sign_extend_out;
  Sign_Extend Sign_Extend (
    .i_A(w_instr[`WORD_LEN-17:0]),
    .o_Y(w_sign_extend_out)
    );

  // Execution
  wire [3:0] w_ALU_ctrl;
  ALU_Control ALU_Control (
    .i_funct(w_instr[`WORD_LEN-27:0]),
    .i_ALUop(w_ALUop),
    .o_ALU_Ctrl(w_ALU_ctrl)
    );

  wire [`WORD_LEN-1:0] w_mux_alu_in;
  MUX2X1 #(.DATA_WIDTH(`WORD_LEN)) MUX2X1_ALU  (
    .i_IN0(w_Reg_Data2),
    .i_IN1(w_sign_extend_out),
    .i_S(w_ALUSrc),
    .o_OUT(w_mux_alu_in)
    );

  wire [`WORD_LEN-1:0] w_ALU_result;
  wire w_Zero;
  ALU ALU (
    .i_ALU_Ctrl(w_ALU_ctrl),
    .i_A(w_Reg_Data1),
    .i_B(w_mux_alu_in),
    .o_Y(w_ALU_result),
    .o_Zero(w_Zero)
    );

  // Data Memory
  wire [`WORD_LEN-1:0] w_data;
  DataMEM DataMEM (
    .i_CLK(i_CLK),
    .i_RSTN(i_RSTN),
    .i_MemWrite(w_MemWrite),
    .i_MemRead(w_MemRead),
    .i_Address(w_ALU_result[$clog2(`DataMEM_SIZE)-1:0]), // 10bit address 1024 entries
    .i_Write_Data(w_Reg_Data2),
    .o_Read_Data(w_data),
    .i_Test_Mem_Addr(i_Test_Addr),
    .o_Test_Mem_Data(w_Test_Mem_Data)
    );

  // Write Back
  MUX2X1 #(.DATA_WIDTH(`WORD_LEN)) MUX2X1_DataMEM  (
    .i_IN0(w_ALU_result),
    .i_IN1(w_Reg_Data2),
    .i_S(w_MemtoReg),
    .o_OUT(w_mux_DataMEM_out)
    );

  // Jump, Branch
  wire [`WORD_LEN-1:0] w_pc_plus_4;
  Adder Adder_PC (
    .i_A(w_PC),
    .i_B(4),
    .o_Y(w_pc_plus_4)
    );

  // Shift Left 2 for jump addr
  wire [`WORD_LEN-1:0] w_jump_addr;
  assign w_jump_addr = {w_pc_plus_4[`WORD_LEN-1:`WORD_LEN-4], w_instr[`WORD_LEN-7:0], 2'b00};

  wire [`WORD_LEN-1:0] w_branch_offset;
  Shift_Left_2 Shift_Left_2_Branch (
    .i_A(w_sign_extend_out),
    .o_Y(w_branch_offset)
    );

  wire [`WORD_LEN-1:0] w_branch_addr;
  Adder Adder_Branch (
    .i_A(w_pc_plus_4),
    .i_B(w_branch_offset),
    .o_Y(w_branch_addr)
    );

  wire w_branch_taken;
  Branch_Control Branch_Control (
    .i_Branch(w_Branch),
    .i_NotEqaulBranch(w_NotEqualBranch),
    .i_Zero(w_Zero),
    .o_Branch_Taken(w_branch_taken)
    );

  wire [`WORD_LEN-1:0] w_mux_branch_out;
  MUX2X1 #(.DATA_WIDTH(`WORD_LEN)) MUX2X1_Branch  (
    .i_IN0(w_pc_plus_4),
    .i_IN1(w_branch_addr),
    .i_S(w_branch_taken),
    .o_OUT(w_mux_branch_out)
    );


  MUX2X1 #(.DATA_WIDTH(`WORD_LEN)) MUX2X1_Jump  (
    .i_IN0(w_mux_branch_out),
    .i_IN1(w_jump_addr),
    .i_S(w_Jump),
    .o_OUT(w_nPC)
    );

endmodule //CPU
