//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
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
  input [9:0] i_InstrMEM_Write_Addr,
  input [31:0] i_InstrMEM_Write_Instr,
  input i_InstrMEM_MemWrite,
  output [31:0] o_scan_instr
  );

  // Fetch
  wire [31:0] w_nPC;
  wire [31:0] w_PC;
  PC PC (
    .i_CLK(i_CLK),
    .i_RSTN(i_RSTN),
    .i_PC(w_nPC),
    .o_PC(w_PC)
    );

  wire [31:0] w_instr;
  assign o_scan_instr = w_instr;
  InstrMEM InstrMEM (
    .i_CLK(i_CLK),
    .i_Read_Addr(w_PC[11:2]),
    .i_Write_Addr(i_InstrMEM_Write_Addr),
    .i_Write_Instr(i_InstrMEM_Write_Instr),
    .i_MemWrite(i_InstrMEM_MemWrite),
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
    .i_OP(w_instr[31:26]),
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
    .i_IN0(w_instr[20:16]),
    .i_IN1(w_instr[15:11]),
    .i_S(w_RegDst),
    .o_OUT(w_mux_reg_out)
    );

  wire [31:0] w_Reg_Data1;
  wire [31:0] w_Reg_Data2;
  wire [31:0] w_mux_DataMEM_out;
  Registers Registers (
    .i_CLK(i_CLK),
    .i_RegWrite(w_RegWrite),
    .i_Read_Reg_Addr1(w_instr[25:21]),
    .i_Read_Reg_Addr2(w_instr[20:16]),
    .i_Write_Reg_Addr(w_mux_reg_out),
    .i_Write_Reg_Data(w_mux_DataMEM_out),
    .o_Read_Reg_Data1(w_Reg_Data1),
    .o_Read_Reg_Data2(w_Reg_Data2)
    );

  wire [31:0] w_sign_extend_out;
  Sign_Extend Sign_Extend (
    .i_A(w_instr[15:0]),
    .o_Y(w_sign_extend_out)
    );

  // Execution
  wire [3:0] w_ALUctrl;
  ALU_Control ALU_Control (
    .i_funct(w_instr[5:0]),
    .i_ALUop(w_ALUop),
    .o_ALUctrl(w_ALUctrl)
    );

  wire [31:0] w_mux_alu_in;
  MUX2X1 #(.DATA_WIDTH(32)) MUX2X1_ALU  (
    .i_IN0(w_Reg_Data2),
    .i_IN1(w_sign_extend_out),
    .i_S(w_ALUSrc),
    .o_OUT(w_mux_alu_in)
    );

  wire [31:0] w_ALU_result;
  wire w_Zero;
  ALU ALU (
    .i_ALUctrl(w_ALUctrl),
    .i_A(w_Reg_Data1),
    .i_B(w_mux_alu_in),
    .o_Y(w_ALU_result),
    .o_Zero(w_Zero)
    );

  // Data Memory
  wire [31:0] w_data;
  DataMEM DataMEM (
    .i_CLK(i_CLK),
    .i_MemWrite(w_MemWrite),
    .i_MemRead(w_MemRead),
    .i_Address(w_ALU_result[9:0]), // 10bit address 1024 entries
    .i_Write_Data(w_Reg_Data2),
    .o_Read_Data(w_data)
    );

  // Write Back
  MUX2X1 #(.DATA_WIDTH(32)) MUX2X1_DataMEM  (
    .i_IN0(w_ALU_result),
    .i_IN1(w_Reg_Data2),
    .i_S(w_MemtoReg),
    .o_OUT(w_mux_DataMEM_out)
    );

  // Jump, Branch
  wire [31:0] w_pc_plus_4;
  Adder Adder_PC (
    .i_A(w_PC),
    .i_B(32'd4),
    .o_Y(w_pc_plus_4)
    );

  // Shift Left 2 for jump addr
  wire [31:0] w_jump_addr;
  assign w_jump_addr = {w_pc_plus_4[31:28], w_instr[25:0], 2'b00};

  wire [31:0] w_branch_offset;
  Shift_Left_2 Shift_Left_2_Branch (
    .i_A(w_sign_extend_out),
    .o_Y(w_branch_offset)
    );

  wire [31:0] w_branch_addr;
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

  wire [31:0] w_mux_branch_out;
  MUX2X1 #(.DATA_WIDTH(32)) MUX2X1_Branch  (
    .i_IN0(w_pc_plus_4),
    .i_IN1(w_branch_addr),
    .i_S(w_branch_taken),
    .o_OUT(w_mux_branch_out)
    );


  MUX2X1 #(.DATA_WIDTH(32)) MUX2X1_Jump  (
    .i_IN0(w_mux_branch_out),
    .i_IN1(w_jump_addr),
    .i_S(w_Jump),
    .o_OUT(w_nPC)
    );

endmodule //CPU
