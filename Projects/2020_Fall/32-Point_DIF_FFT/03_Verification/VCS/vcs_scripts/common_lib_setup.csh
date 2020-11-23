#!/bin/csh
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
set designer="Man"
set company="KHU Room327"
# Define path directories for file locations

#******************************************************************************
#**                         Set Library Parameter                            **
#******************************************************************************
set LIB_DIR=/Tools/Library/samsung65_2016/CB_1502
set PRIMITIVE_LIB_DIR=${LIB_DIR}/PRIMITIVE
set V_MODEL_LIB=${PRIMITIVE_LIB_DIR}/PMK_verilog_model

#******************************************************************************
#**                Set models                                             **
#******************************************************************************

# PMK (Power Management Kit)

# RVT
# SS (Worst)
set PMK_RVT_SS=${V_MODEL_LIB}/cmos10lprvt_m_pmk_neg_be

# HVT
# SS (Worst)
set PMK_HVT_SS=${V_MODEL_LIB}/cmos10lphvt_m_pmk_neg_be

# Normal

# RVT
# SS (Worst)
set NOM_RVT_SS=${V_MODEL_LIB}/cmos10lprvt_m_neg_pwr_aware

# HVT
# SS (Worst)
set NOM_HVT_SS=${V_MODEL_LIB}/cmos10lphvt_m_neg_pwr_aware
