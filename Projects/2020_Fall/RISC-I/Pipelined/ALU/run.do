//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//

if [file exists "work"] {vdel -all}
vlib work

vlog +incdir+~/2020_2_VLSI_System_Design/Projects/2020_Fall/RISC-I/Single-Cycle/ALU \
 ALU_tb.v

vsim -novopt work.ALU_tb
add wave -position insertpoint sim:/ALU_tb/*
run -all
