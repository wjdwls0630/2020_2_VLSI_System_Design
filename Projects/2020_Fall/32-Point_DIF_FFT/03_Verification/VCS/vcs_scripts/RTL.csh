echo "------------------------------------------------------------------------"
echo "--                                                                    --"
echo "--                                                                    --"
echo "--                         RTL simulation start                        --"
echo "--                                                                    --"
echo "--                                                                    --"
echo "------------------------------------------------------------------------"

# source the common_setup & Common variables file
source ./vcs_scripts/user_scripts/user_design_setup.csh
source ./vcs_scripts/common_lib_setup.csh

# read automated setup file where the retiming guidance commands are written
vcs -full64 -notice +lint=all,noVCDE,noTFIPC,noIWU,noOUDPE \
  +v2k -debug_access+pp+f \
  +incdir+../../01_RTL_Design/src \
  -timescale=1ns/1ps \
  +define+RTL \
  $VCS_IN_VERILOG_RTL_FILE $VCS_IN_VERILOG_TB_FILE

./simv

source ./vcs_scripts/clean.csh
