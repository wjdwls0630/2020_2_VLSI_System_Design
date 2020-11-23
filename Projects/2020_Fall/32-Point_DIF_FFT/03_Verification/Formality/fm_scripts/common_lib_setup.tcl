#******************************************************************************
#**                          common library settings                         **
#******************************************************************************
echo "***********************************************************************"
echo "                                                                       "
echo "                       common_lib_setup.tcl                            "
echo "                                                                       "
echo "***********************************************************************"
#******************************************************************************
#                       set basic parameter                                  **
#******************************************************************************
set designer "Man"
set company "KHU Room327"
# Define path directories for file locations

set SVF_DIR "../../02_RTL_Synthesis/svf"

#******************************************************************************
#**                         Set Library Parameter                            **
#******************************************************************************
set LIB_DIR /Tools/Library/samsung65_2016/CB_1502
set PRIMITIVE_LIB_DIR ${LIB_DIR}/PRIMITIVE
set IO_LIB_DIR ${LIB_DIR}/IO

#******************************************************************************
#**                Set 'search_path'                                         **
#******************************************************************************
set search_path ". $synopsys_root/libraries/syn \
		   $PRIMITIVE_LIB_DIR/sec100226_0026_SS65LP_PMK_RVT_PMK_FE_Common_N/synopsys  \
		   $PRIMITIVE_LIB_DIR/sec100226_0028_SS65LP_PMK_HVT_PMK_FE_Common_N/synopsys  \
                   $PRIMITIVE_LIB_DIR/sec100226_0042_SS65LP_Normal_RVT_Normal_FE_Common_N/synopsys \
                   $PRIMITIVE_LIB_DIR/sec100226_0043_SS65LP_Normal_HVT_Normal_FE_Common_N/synopsys \
                   $IO_LIB_DIR/synopsys"

#******************************************************************************
#**                Set libraries                                             **
#******************************************************************************

# PMK (Power Management Kit)

# RVT
# SS (Worst)
set PMK_RVT_SS scmetropmk_cmos10lp_rvt_ss_1p08v_125c_sadhm

# HVT
# SS (Worst)
set PMK_HVT_SS scmetropmk_cmos10lp_hvt_ss_1p08v_125c_sadhm

# Normal

# RVT
# SS (Worst)
set NOM_RVT_SS scmetro_cmos10lp_rvt_ss_1p08v_125c_sadhm

# HVT
# SS (Worst)
set NOM_HVT_SS scmetro_cmos10lp_hvt_ss_1p08v_125c_sadhm

# IO

# SS (Worst)
set IO_SS ss65lp3p3v_wst_108_300_p125

set target_library [concat \
        $PMK_RVT_SS.db \
        $PMK_HVT_SS.db \
        $NOM_RVT_SS.db \
        $NOM_HVT_SS.db \
        $IO_SS.db
]

read_db -technology_library $PRIMITIVE_LIB_DIR/sec100226_0026_SS65LP_PMK_RVT_PMK_FE_Common_N/synopsys/$PMK_RVT_SS.db
read_db -technology_library $PRIMITIVE_LIB_DIR/sec100226_0042_SS65LP_Normal_RVT_Normal_FE_Common_N/synopsys/$NOM_RVT_SS.db
read_db -technology_library $PRIMITIVE_LIB_DIR/sec100226_0028_SS65LP_PMK_HVT_PMK_FE_Common_N/synopsys/$PMK_HVT_SS.db
read_db -technology_library $PRIMITIVE_LIB_DIR/sec100226_0043_SS65LP_Normal_HVT_Normal_FE_Common_N/synopsys/$NOM_HVT_SS.db
read_db -technology_library $IO_LIB_DIR/synopsys/$IO_SS.db

set_host_options -max_cores $FM_NUM_CPUS
