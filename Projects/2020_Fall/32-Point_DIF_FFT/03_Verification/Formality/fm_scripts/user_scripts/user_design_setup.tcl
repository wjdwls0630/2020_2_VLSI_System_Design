#******************************************************************************
#**                          user design settings                           **
#******************************************************************************
echo "***********************************************************************"
echo "                                                                       "
echo "                      user_design_setup.tcl                            "
echo "                                                                       "
echo "***********************************************************************"

#******************************************************************************
#**                         General FM Varialbes                            **
#******************************************************************************


set TOP_MODULE                     "FFT_PAD"    ;# set design top module name
set FM_NUM_CPUS                   "1"                ;
set RETIME                         true
set CLOCK_GATING                   NONE              ;


#######################################################
## Input Files
#######################################################


set FM_IN_VERILOG_REF_FILE       "../../01_RTL_Design/src/FFT_PAD.v"
set FM_IN_VERILOG_IMPL_FILE      "../../02_RTL_Synthesis/outputs/FFT_PAD.vg"

# HVT: SS 1.08V 125c - WIRE Zero Wire Load Model

#########################   DO NOT CHANGE BELOW THIS LINE   ##############################
##########################################################################################

set REPORTS_DIR                 "./reports"

## Avoiding too many messages
