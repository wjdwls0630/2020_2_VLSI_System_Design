#******************************************************************************
#**                          user design settings                           **
#******************************************************************************
echo "***********************************************************************"
echo "                                                                       "
echo "                      user_design_setup.tcl                            "
echo "                                                                       "
echo "***********************************************************************"

#******************************************************************************
#**                         General ICC Varialbes                            **
#******************************************************************************


set TOP_MODULE                     "FFT_PAD"    ;# set design top module name
set POWER_OPT                      true              ;# set to true when enabling Power Optimization during compile.
set DC_NUM_CPUS                   "1"                ;# used during placement & routing
set INOUT_OPT                      true               ;# set to true when optimizing i2r and r2o paths

set INTER_CLK_GROUPS               "clk"    ;   # Define clocks. "clkA clkB"

set CLOCK_MAX_TRAN                 "0.7"              ;# clock path max transtion time.

#######################################################
## Input Files
#######################################################


set DC_IN_VERILOG_RTL_FILE       "../01_RTL_Design/src/FFT_PAD.v"


set HOLD_FIX                       true		      ;# If you want to fix hold violation then set true.

####### Define SDC Files
## If you have only FUNC1_SDC, Write the sdc file in FUNC1_SDC field.
## If you have only FUNC2_SDC, Write the sdc file in FUNC2_SDC field.

set FUNC1_SDC          ""
set FUNC2_SDC          ""

####### Define Default Operating Conditions
##
## You have to write the default operation condition name and library name of standard cell.
## If some instances of your design have other operation condition (PVT) such as IO,
## You have to define the operation condition name and library name in user_opcond.tcl.
##
# Set operating conditions
# Samsung 65nm
# Dual Vth (Sign-off Corner, no need Multi-VDD)
# Logic Synthesis & Pre-STA (1st Sign-off)
# RVT: SS 1.08V 125c - WIRE Zero Wire Load Model
# HVT: SS 1.08V 125c - WIRE Zero Wire Load Model

#########################   DO NOT CHANGE BELOW THIS LINE   ##############################
##########################################################################################

set REPORTS_DIR                 "./reports"

## Avoiding too many messages
set_message_info -id PSYN-040   -limit 5
set_message_info -id PSYN-087   -limit 5
set_message_info -id LINT-8     -limit 5
set_message_info -id RT-104     -limit 5
set_message_info -id RT-065     -limit 5
set_message_info -id TIM-128    -limit 5
set_message_info -id TIM-141    -limit 5
set_message_info -id PSYN-267   -limit 5
set_message_info -id RT-104     -limit 5
set_message_info -id PSYN-024   -limit 5
set_message_info -id PSYN-058   -limit 5
set_message_info -id PSYN-025   -limit 5
set_message_info -id PSYN-039   -limit 5
set_message_info -id PSYN-523   -limit 5
set_message_info -id PSYN-900   -limit 1
set_message_info -id CTS-102    -limit 1
set_message_info -id OPT-112    -limit 1
set_message_info -id OPT-1206   -limit 1
set_message_info -id OPT-1215   -limit 1
