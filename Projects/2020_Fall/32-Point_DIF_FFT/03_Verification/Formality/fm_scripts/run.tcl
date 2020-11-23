echo "------------------------------------------------------------------------"
echo "--                                                                    --"
echo "--                                                                    --"
echo "--                        verification start                          --"
echo "--                                                                    --"
echo "--                                                                    --"
echo "------------------------------------------------------------------------"

# Remove all libraries and containers before starting new verification
remove_library   -all
remove_container -all

# source the common_setup & Common variables file
source -echo -v ./fm_scripts/user_scripts/user_design_setup.tcl
source -echo -v ./fm_scripts/common_lib_setup.tcl

# read automated setup file where the retiming guidance commands are written
set_svf $SVF_DIR/$TOP_MODULE.svf

source ./fm_scripts/verification.tcl

start_gui
#exit
