#==================================================#
# Read RTL DB                                      #
#==================================================#
source ./synopsys_dc_sam013.setup.tcl
#/* read in the entire design */
read_verilog ./design/CPU.v
read_verilog ./design/pad_cpu.v

# analyze -format verilog <filelist>
# elaborate <design_name>

set top pad_cpu
current_design $top

link
uniquify

#set_fix_multiple_port_nets -all -buffer_constants 
## AREA ##
set_max_area 0

## CLOCK ##
create_clock -period 10.6 [get_ports CLK]
set_dont_touch_network [get_clocks CLK]

set_clock_uncertainty -setup 0.2 [get_clocks CLK]
set_clock_transition 0.1 [get_clocks CLK]

## INPUT DELAY ##
set_input_delay -max 4.24 -clock CLK [all_inputs]
# in considered input_pad constraint

remove_input_delay -clock CLK [all_inputs]
# remove clock input delay

## OUTPUT DELAY##
set_output_delay -max 4.24 -clock CLK [all_outputs]
# set output delay as 40% of clock period
# it considered output_pad constraint

## INPUT PORT TRANSITION ##
set_input_transition 0.8 [all_inputs]
#1.2ns
#set_driving_cell -lib_cell ivtd1_hd [all_inputs]
remove_driving_cell [get_ports CLK]

## MAX CAPACITANCE ##
set_max_capacitance 2.5 [all_designs]
# this command limits the amount of capacitance DC hang off.

## MAX TRANSITION and FANOUT ##
set_max_transition 1.3 [all_designs]
set_max_fanout 3 [all_designs]

# COMPILE #
compile -boundary -only_design_rule

#current_design $top

#check_design                                    >  ./log/check_design.log
#check_timing                                    >  ./log/mips.check_timing.log

#report_design                                   >  ./log/mips.report_design.log
#report_clock                                    >  ./log/mips.report_clock.log
#report_port                                     >  ./log/mips.report_port.log
#report_timing                                   >  ./log/mips.report_timing.log
#report_timing_requirements                      >  ./log/mips.report_timing_requirements
#report_constraint                               >  ./log/mips.report_constraint.log
#report_constraint -all_violators                >> ./log/mips.report_constraint.log


check_design                                    >  ./log/$top.check_design.log
check_timing                                    >  ./log/$top.check_timing.log

report_area					>  ./log/$top.report_area.log
report_design                                   >  ./log/$top.report_design.log
report_clock                                    >  ./log/$top.report_clock.log
report_port                                     >  ./log/$top.report_port.log
report_timing -delay max			 > ./log/$top.report_timing_max
report_timing -delay min                         > ./log/$top.report_timing_min
report_timing_requirements                      >  ./log/$top.report_timing_requirements
report_constraint                               >  ./log/$top.report_constraint.log
report_constraint -all_violators                >> ./log/$top.report_constraint.log
report_design_lib
report_lib std150e_typ_120_p025 		> ./log/lib_report.log
report_lib std150e_typ_120_p025_memory       > ./log/lib_report_mem.log
#check_timing


#change_names -rules verilog -hierarchy -verbose > ./log/change_names.v
#change_name -rule verilog -hier

write -f verilog $top -h -o ./db/$top.v
write_sdf -version 1.0      ./db/$top.sdf
write_sdc                   ./db/$top.sdc
write -f ddc $top -h -o     ./db/$top.ddc


