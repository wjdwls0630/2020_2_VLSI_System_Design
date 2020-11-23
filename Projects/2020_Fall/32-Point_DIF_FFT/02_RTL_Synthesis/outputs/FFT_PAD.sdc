###################################################################

# Created by write_sdc on Sun Nov 22 20:02:00 2020

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -power mW -voltage V       \
-current mA
set_max_area 0
set_disable_timing [get_ports i_RSTN]
set_ideal_network [get_ports i_CLK]
set_ideal_network [get_ports i_RSTN]
create_clock [get_ports i_CLK]  -name clk  -period 5.4  -waveform {0 2.7}
set_clock_uncertainty -setup 0.162  [get_clocks clk]
set_clock_transition -max -rise 0.7 [get_clocks clk]
set_clock_transition -min -fall 0.7 [get_clocks clk]
set_clock_transition -max -fall 0.7 [get_clocks clk]
set_clock_transition -min -rise 0.7 [get_clocks clk]
group_path -name FEEDTHROUGH  -from [list [get_ports i_RSTN] [get_ports i_VALID] [get_ports                 \
{i_DATA_REAL[11]}] [get_ports {i_DATA_REAL[10]}] [get_ports {i_DATA_REAL[9]}]  \
[get_ports {i_DATA_REAL[8]}] [get_ports {i_DATA_REAL[7]}] [get_ports           \
{i_DATA_REAL[6]}] [get_ports {i_DATA_REAL[5]}] [get_ports {i_DATA_REAL[4]}]    \
[get_ports {i_DATA_REAL[3]}] [get_ports {i_DATA_REAL[2]}] [get_ports           \
{i_DATA_REAL[1]}] [get_ports {i_DATA_REAL[0]}] [get_ports {i_DATA_IMAG[11]}]   \
[get_ports {i_DATA_IMAG[10]}] [get_ports {i_DATA_IMAG[9]}] [get_ports          \
{i_DATA_IMAG[8]}] [get_ports {i_DATA_IMAG[7]}] [get_ports {i_DATA_IMAG[6]}]    \
[get_ports {i_DATA_IMAG[5]}] [get_ports {i_DATA_IMAG[4]}] [get_ports           \
{i_DATA_IMAG[3]}] [get_ports {i_DATA_IMAG[2]}] [get_ports {i_DATA_IMAG[1]}]    \
[get_ports {i_DATA_IMAG[0]}]]  -to [list [get_ports o_VALID] [get_ports {o_DATA_REAL[15]}] [get_ports        \
{o_DATA_REAL[14]}] [get_ports {o_DATA_REAL[13]}] [get_ports {o_DATA_REAL[12]}] \
[get_ports {o_DATA_REAL[11]}] [get_ports {o_DATA_REAL[10]}] [get_ports         \
{o_DATA_REAL[9]}] [get_ports {o_DATA_REAL[8]}] [get_ports {o_DATA_REAL[7]}]    \
[get_ports {o_DATA_REAL[6]}] [get_ports {o_DATA_REAL[5]}] [get_ports           \
{o_DATA_REAL[4]}] [get_ports {o_DATA_REAL[3]}] [get_ports {o_DATA_REAL[2]}]    \
[get_ports {o_DATA_REAL[1]}] [get_ports {o_DATA_REAL[0]}] [get_ports           \
{o_DATA_IMAG[15]}] [get_ports {o_DATA_IMAG[14]}] [get_ports {o_DATA_IMAG[13]}] \
[get_ports {o_DATA_IMAG[12]}] [get_ports {o_DATA_IMAG[11]}] [get_ports         \
{o_DATA_IMAG[10]}] [get_ports {o_DATA_IMAG[9]}] [get_ports {o_DATA_IMAG[8]}]   \
[get_ports {o_DATA_IMAG[7]}] [get_ports {o_DATA_IMAG[6]}] [get_ports           \
{o_DATA_IMAG[5]}] [get_ports {o_DATA_IMAG[4]}] [get_ports {o_DATA_IMAG[3]}]    \
[get_ports {o_DATA_IMAG[2]}] [get_ports {o_DATA_IMAG[1]}] [get_ports           \
{o_DATA_IMAG[0]}]]
group_path -name REGIN  -from [get_ports i_RSTN]
group_path -name REGIN  -from [list [get_ports i_VALID] [get_ports {i_DATA_REAL[11]}] [get_ports      \
{i_DATA_REAL[10]}] [get_ports {i_DATA_REAL[9]}] [get_ports {i_DATA_REAL[8]}]   \
[get_ports {i_DATA_REAL[7]}] [get_ports {i_DATA_REAL[6]}] [get_ports           \
{i_DATA_REAL[5]}] [get_ports {i_DATA_REAL[4]}] [get_ports {i_DATA_REAL[3]}]    \
[get_ports {i_DATA_REAL[2]}] [get_ports {i_DATA_REAL[1]}] [get_ports           \
{i_DATA_REAL[0]}] [get_ports {i_DATA_IMAG[11]}] [get_ports {i_DATA_IMAG[10]}]  \
[get_ports {i_DATA_IMAG[9]}] [get_ports {i_DATA_IMAG[8]}] [get_ports           \
{i_DATA_IMAG[7]}] [get_ports {i_DATA_IMAG[6]}] [get_ports {i_DATA_IMAG[5]}]    \
[get_ports {i_DATA_IMAG[4]}] [get_ports {i_DATA_IMAG[3]}] [get_ports           \
{i_DATA_IMAG[2]}] [get_ports {i_DATA_IMAG[1]}] [get_ports {i_DATA_IMAG[0]}]]
group_path -name REGOUT  -to [list [get_ports o_VALID] [get_ports {o_DATA_REAL[15]}] [get_ports        \
{o_DATA_REAL[14]}] [get_ports {o_DATA_REAL[13]}] [get_ports {o_DATA_REAL[12]}] \
[get_ports {o_DATA_REAL[11]}] [get_ports {o_DATA_REAL[10]}] [get_ports         \
{o_DATA_REAL[9]}] [get_ports {o_DATA_REAL[8]}] [get_ports {o_DATA_REAL[7]}]    \
[get_ports {o_DATA_REAL[6]}] [get_ports {o_DATA_REAL[5]}] [get_ports           \
{o_DATA_REAL[4]}] [get_ports {o_DATA_REAL[3]}] [get_ports {o_DATA_REAL[2]}]    \
[get_ports {o_DATA_REAL[1]}] [get_ports {o_DATA_REAL[0]}] [get_ports           \
{o_DATA_IMAG[15]}] [get_ports {o_DATA_IMAG[14]}] [get_ports {o_DATA_IMAG[13]}] \
[get_ports {o_DATA_IMAG[12]}] [get_ports {o_DATA_IMAG[11]}] [get_ports         \
{o_DATA_IMAG[10]}] [get_ports {o_DATA_IMAG[9]}] [get_ports {o_DATA_IMAG[8]}]   \
[get_ports {o_DATA_IMAG[7]}] [get_ports {o_DATA_IMAG[6]}] [get_ports           \
{o_DATA_IMAG[5]}] [get_ports {o_DATA_IMAG[4]}] [get_ports {o_DATA_IMAG[3]}]    \
[get_ports {o_DATA_IMAG[2]}] [get_ports {o_DATA_IMAG[1]}] [get_ports           \
{o_DATA_IMAG[0]}]]
set_false_path   -from [get_ports i_RSTN]
set_load 0  [get_nets i_CLK]
set_resistance 0  [get_nets i_CLK]
set_load 0  [get_nets i_RSTN]
set_resistance 0  [get_nets i_RSTN]
set_load 0  [get_nets i_VALID]
set_resistance 0  [get_nets i_VALID]
set_load 0  [get_nets {i_DATA_REAL[11]}]
set_resistance 0  [get_nets {i_DATA_REAL[11]}]
set_load 0  [get_nets {i_DATA_REAL[10]}]
set_resistance 0  [get_nets {i_DATA_REAL[10]}]
set_load 0  [get_nets {i_DATA_REAL[9]}]
set_resistance 0  [get_nets {i_DATA_REAL[9]}]
set_load 0  [get_nets {i_DATA_REAL[8]}]
set_resistance 0  [get_nets {i_DATA_REAL[8]}]
set_load 0  [get_nets {i_DATA_REAL[7]}]
set_resistance 0  [get_nets {i_DATA_REAL[7]}]
set_load 0  [get_nets {i_DATA_REAL[6]}]
set_resistance 0  [get_nets {i_DATA_REAL[6]}]
set_load 0  [get_nets {i_DATA_REAL[5]}]
set_resistance 0  [get_nets {i_DATA_REAL[5]}]
set_load 0  [get_nets {i_DATA_REAL[4]}]
set_resistance 0  [get_nets {i_DATA_REAL[4]}]
set_load 0  [get_nets {i_DATA_REAL[3]}]
set_resistance 0  [get_nets {i_DATA_REAL[3]}]
set_load 0  [get_nets {i_DATA_REAL[2]}]
set_resistance 0  [get_nets {i_DATA_REAL[2]}]
set_load 0  [get_nets {i_DATA_REAL[1]}]
set_resistance 0  [get_nets {i_DATA_REAL[1]}]
set_load 0  [get_nets {i_DATA_REAL[0]}]
set_resistance 0  [get_nets {i_DATA_REAL[0]}]
set_load 0  [get_nets {i_DATA_IMAG[11]}]
set_resistance 0  [get_nets {i_DATA_IMAG[11]}]
set_load 0  [get_nets {i_DATA_IMAG[10]}]
set_resistance 0  [get_nets {i_DATA_IMAG[10]}]
set_load 0  [get_nets {i_DATA_IMAG[9]}]
set_resistance 0  [get_nets {i_DATA_IMAG[9]}]
set_load 0  [get_nets {i_DATA_IMAG[8]}]
set_resistance 0  [get_nets {i_DATA_IMAG[8]}]
set_load 0  [get_nets {i_DATA_IMAG[7]}]
set_resistance 0  [get_nets {i_DATA_IMAG[7]}]
set_load 0  [get_nets {i_DATA_IMAG[6]}]
set_resistance 0  [get_nets {i_DATA_IMAG[6]}]
set_load 0  [get_nets {i_DATA_IMAG[5]}]
set_resistance 0  [get_nets {i_DATA_IMAG[5]}]
set_load 0  [get_nets {i_DATA_IMAG[4]}]
set_resistance 0  [get_nets {i_DATA_IMAG[4]}]
set_load 0  [get_nets {i_DATA_IMAG[3]}]
set_resistance 0  [get_nets {i_DATA_IMAG[3]}]
set_load 0  [get_nets {i_DATA_IMAG[2]}]
set_resistance 0  [get_nets {i_DATA_IMAG[2]}]
set_load 0  [get_nets {i_DATA_IMAG[1]}]
set_resistance 0  [get_nets {i_DATA_IMAG[1]}]
set_load 0  [get_nets {i_DATA_IMAG[0]}]
set_resistance 0  [get_nets {i_DATA_IMAG[0]}]
set_load 0  [get_nets o_VALID]
set_resistance 0  [get_nets o_VALID]
set_load 0  [get_nets {o_DATA_REAL[15]}]
set_resistance 0  [get_nets {o_DATA_REAL[15]}]
set_load 0  [get_nets {o_DATA_REAL[14]}]
set_resistance 0  [get_nets {o_DATA_REAL[14]}]
set_load 0  [get_nets {o_DATA_REAL[13]}]
set_resistance 0  [get_nets {o_DATA_REAL[13]}]
set_load 0  [get_nets {o_DATA_REAL[12]}]
set_resistance 0  [get_nets {o_DATA_REAL[12]}]
set_load 0  [get_nets {o_DATA_REAL[11]}]
set_resistance 0  [get_nets {o_DATA_REAL[11]}]
set_load 0  [get_nets {o_DATA_REAL[10]}]
set_resistance 0  [get_nets {o_DATA_REAL[10]}]
set_load 0  [get_nets {o_DATA_REAL[9]}]
set_resistance 0  [get_nets {o_DATA_REAL[9]}]
set_load 0  [get_nets {o_DATA_REAL[8]}]
set_resistance 0  [get_nets {o_DATA_REAL[8]}]
set_load 0  [get_nets {o_DATA_REAL[7]}]
set_resistance 0  [get_nets {o_DATA_REAL[7]}]
set_load 0  [get_nets {o_DATA_REAL[6]}]
set_resistance 0  [get_nets {o_DATA_REAL[6]}]
set_load 0  [get_nets {o_DATA_REAL[5]}]
set_resistance 0  [get_nets {o_DATA_REAL[5]}]
set_load 0  [get_nets {o_DATA_REAL[4]}]
set_resistance 0  [get_nets {o_DATA_REAL[4]}]
set_load 0  [get_nets {o_DATA_REAL[3]}]
set_resistance 0  [get_nets {o_DATA_REAL[3]}]
set_load 0  [get_nets {o_DATA_REAL[2]}]
set_resistance 0  [get_nets {o_DATA_REAL[2]}]
set_load 0  [get_nets {o_DATA_REAL[1]}]
set_resistance 0  [get_nets {o_DATA_REAL[1]}]
set_load 0  [get_nets {o_DATA_REAL[0]}]
set_resistance 0  [get_nets {o_DATA_REAL[0]}]
set_load 0  [get_nets {o_DATA_IMAG[11]}]
set_resistance 0  [get_nets {o_DATA_IMAG[11]}]
set_load 0  [get_nets {o_DATA_IMAG[10]}]
set_resistance 0  [get_nets {o_DATA_IMAG[10]}]
set_load 0  [get_nets {o_DATA_IMAG[9]}]
set_resistance 0  [get_nets {o_DATA_IMAG[9]}]
set_load 0  [get_nets {o_DATA_IMAG[8]}]
set_resistance 0  [get_nets {o_DATA_IMAG[8]}]
set_load 0  [get_nets {o_DATA_IMAG[7]}]
set_resistance 0  [get_nets {o_DATA_IMAG[7]}]
set_load 0  [get_nets {o_DATA_IMAG[6]}]
set_resistance 0  [get_nets {o_DATA_IMAG[6]}]
set_load 0  [get_nets {o_DATA_IMAG[5]}]
set_resistance 0  [get_nets {o_DATA_IMAG[5]}]
set_load 0  [get_nets {o_DATA_IMAG[4]}]
set_resistance 0  [get_nets {o_DATA_IMAG[4]}]
set_load 0  [get_nets {o_DATA_IMAG[3]}]
set_resistance 0  [get_nets {o_DATA_IMAG[3]}]
set_load 0  [get_nets {o_DATA_IMAG[2]}]
set_resistance 0  [get_nets {o_DATA_IMAG[2]}]
set_load 0  [get_nets {o_DATA_IMAG[1]}]
set_resistance 0  [get_nets {o_DATA_IMAG[1]}]
set_load 0  [get_nets {o_DATA_IMAG[0]}]
set_resistance 0  [get_nets {o_DATA_IMAG[0]}]
