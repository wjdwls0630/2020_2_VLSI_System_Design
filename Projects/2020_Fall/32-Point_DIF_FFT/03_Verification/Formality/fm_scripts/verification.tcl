echo "***********************************************************************"
echo "                                                                       "
echo "                           $TOP_MODULE                                 "
echo "                                                                       "
echo "***********************************************************************"

# when you use black-box,
# exec $env(SEC_FM)/utils/udc2bb <udc file address> -f udc_filename.v
# read_verilog -technology_library -container <ref/impl> udc_filename.v

# Create a container for the reference design(RTL)
# Read the reference design and set_top(link) it
create_container ref
read_verilog -container ref $FM_IN_VERILOG_REF_FILE

# link command is obsolete, using set_top instead
#link ref:/WORK/$design

set_top ref:/WORK/$TOP_MODULE
set_reference_design ref:/WORK/$TOP_MODULE

# Create a container for the implementation design(Gate-Level)
# Read the implementation design and set_top(link) it
create_container impl

read_verilog -container impl -netlist $FM_IN_VERILOG_IMPL_FILE

#link impl:/WORK/$design
set_top impl:/WORK/$TOP_MODULE

set_implementation_design impl:/WORK/$TOP_MODULE

set_compare_rule impl:/WORK/$TOP_MODULE                          \
                 -from {\(.*\)_reg\([0-9]*\)_\([0-9][0-9]*\)A} \
                 -to   {\1_reg\2[\3]}
# set_compare_point commands for mapping the comparable design objects changes
# their instance name or flattened hierarchy path name

set svf_retiming $RETIME
set verification_clock_gate_hold_mode $CLOCK_GATING
# If this variable is set to true, Formality will issue 
# the set_Dont_verify -directly_undriven_output 
set verfication_verify_directly_undriven_output true
#set verification_set_undriven_signals 0 
set verfication_match_undriven_signals false

# undriven points RTL - 1'b0 Netlist - 1'bz

set_dont_verify { ref:/WORK/FFT_PAD/o_DATA_IMAG[12] \
		  ref:/WORK/FFT_PAD/o_DATA_IMAG[13] \
		  ref:/WORK/FFT_PAD/o_DATA_IMAG[14] \
		  ref:/WORK/FFT_PAD/o_DATA_IMAG[15] }

set_dont_verify { ref:/WORK/FFT_PAD/pad*/CLTCH*/IN}


echo "***********************************************************************"
echo "                                                                       "
echo "                           verify  $TOP_MODULE                         "
echo "                                                                       "
echo "***********************************************************************"

sh rm -rf $REPORTS_DIR
sh mkdir $REPORTS_DIR
# verification
# Since we have already linked the design pairs,
# use -nolink option when performing verification
# However, for now, -nolink is obsolete, it is default
if {[verify] != 1} {
   diagnose
   report_failing_points
   source "./fm_scripts/common_report_fail.tcl"
} else {
   source "./fm_scripts/common_report_pass.tcl"
}
source "./fm_scripts/common_report_default.tcl"
