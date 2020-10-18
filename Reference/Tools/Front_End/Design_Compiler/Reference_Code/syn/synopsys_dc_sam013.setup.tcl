echo "                                              "
echo "                                              "
echo "----------------------------------------------"
echo "--                                          --"
echo "--                                          --"
echo "--              compile start               --"
echo "--                                          --"
echo "--                                          --"
echo "----------------------------------------------"
#******************************************************************************
#**                Synopsys environment file for STD130 library             **
#******************************************************************************
remove_design -all

setenv SEC_SYNOPSYS /home/lee/VLSI_project/lee/samsung013/sec050915_0050_STD150E_regular_DK_Synopsys_N/sec150e_synopsys
setenv SEC_SYNOPSYS_AUX /home/lee/VLSI_project/lee/samsung013/sec050915_0050_STD150E_regular_DK_Synopsys_N/sec150e_synopsys/aux

#******************************************************************************
#**                Set New Variable for 'search_path'                        **
#******************************************************************************
set dk_home [getenv SEC_SYNOPSYS]
set dk_home_aux [getenv SEC_SYNOPSYS_AUX]

#******************************************************************************
#**                Set 'search_path'                                         **
#******************************************************************************
set search_path [list . [format "%s%s"  $synopsys_root /libraries/syn] \
    [format "%s%s"  $dk_home /syn/STD150E] $dk_home_aux ]

define_design_lib work -path .


#******************************************************************************
#**                Set libraries                                             **
#******************************************************************************

# Variables for later use
set STD_TYP std150e_wst_105_p125
#set STD_TYP std150e_typ_120_p025
#set STD_TYP_MEM std150e_typ_120_p025_memory 
## remove standard memory cell

# Set libraries: Target Tech & Link
#  M18 Tech. has multiple Libs. (LAB.6)
set target_library [concat \
        $STD_TYP.db 
#	$HT_TYP.db
#        $STD_TYP_MEM.db 
]

set link_library [concat \
        * \
        $target_library 
]

set link_path $link_library

set symbol_library [list std150e_veri.sdb]


#set_fix_multiple_port_nets -all -buffer_constants

set verilogout_write_unmapped_design true
#set change_names_use_ulternative false

#******************************************************************************
#** NAMING RULE FOR Verilog HDL:                                             **
#** If you have a plan to layout your chip with Apollo,                      **
#** you MUST use this naming rule.                                           **
#**  [1] max_length was removed                                              **
#**  [2] '!' character was allowed for CTS-ed netlist.                       **
#******************************************************************************
define_name_rules sec_verilog -type port \
                              -equal_ports_nets  \
                              -allowed {A-Z a-z 0-9 _ [] !} \
                              -first_restricted {0-9 _ !}   \
                              -last_restricted {_ !}

define_name_rules sec_verilog -type cell \
                              -allowed {A-Z a-z 0-9 _ !} \
                              -first_restricted {0-9 _ !} \
                              -last_restricted {_ !} \
                              -map {{{"*cell*", "U"}, {"*-return", "RET"}}}    

define_name_rules sec_verilog -type net \
                              -equal_ports_nets \
                              -allowed {A-Z a-z 0-9 _ !} \
                              -first_restricted {0-9 _ !} \
                              -last_restricted {_ !} \
                              -map {{{"*cell*", "U"}, {"*-return", "RET"}}}    

#******************************************************************************
#** NAMING RULE FOR VHDL:                                                    **
#** If you are VHDL user, you MUST use this naming rule.                     **
#******************************************************************************
define_name_rules sec_vss -type port \
                          -equal_ports_nets \
                          -allowed {A-Z a-z 0-9 _ } \
                          -first_restricted {0-9 _ } \
                          -last_restricted _ \
                          -case_insensitive

define_name_rules sec_vss -type cell \
                          -allowed {A-Z a-z 0-9 _ } \
                          -last_restricted _ \
                          -map {{{"_$",""},{"\*cell\*","U"},{"*-return","RET"}}} \
                          -case_insensitive

define_name_rules sec_vss -type net \
                          -equal_ports_nets \
                          -allowed {A-Z a-z 0-9 _ } \
                          -first_restricted {0-9 _ } \
                          -last_restricted _ \
                          -map {{{"_$",""},{"\*cell\*","U"},{"*-return","RET"}}} \
                          -case_insensitive

#******************************************************************************
#**                 MISC                                                     **
#******************************************************************************
# These variables affects compile, report_timing and report_constraints commands.
  set enable_recovery_removal_arcs true
# To get non-functional Verilog-HDL Netlist
  set verilogout_no_tri true
# To allow infer latches which have async. reset/set pin
# hdlin_latch_always_async_set_reset = "true";

# To fix the design which have multiple ports
if {  $compatibility_version < 1999.10 } {
  echo "    ******************************************************"
  echo "       NOTE>>> SEC does NOT support  $compatibility_version"
  echo "    ******************************************************"
} else {
  echo "    ********************************************************************"
  echo "       NOTE>>> You MUST fix the design which have multiple ports"
  echo "               Use the following command"
  echo "               set_fix_multiple_port_nets -all -buffer_constants"
  echo "    ********************************************************************"
  echo "    ********************************************************************"
  echo "       NOTE>>> Use the old compile_fix_multiple_port_nets"
  echo "               because reoptimize_design does not honor"
  echo "               the set_fix_multiple_port_nets command"  
  echo "    ********************************************************************"  
}

#set_fix_multiple_port_nets -all -buffer_constants

# To fix the auto_wire_load selection
  set auto_wire_load_selection true

#******************************************************************************
#**                 Link-to-Layout Flow, Resynthesis                         **
#******************************************************************************
  set compile_create_wire_load_table true
  set lbo_lfo_enable_at_pin_count 3
  set lbo_cells_in_regions false
  set pdefin_use_nameprefix false
  set enable_slew_degradation true

#******************************************************************************
#**                 For VHDL User                                            **
#******************************************************************************
# "use" clause is written into the VHDL file automatically
  set vhdlout_use_packages [list IEEE.std_logic_1164]
# VHDLout writes a configuration statement if necessary
  set vhdlout_write_top_configuration TRUE
# VHDLout writes a architecture_name as SCHEMATIC
  set vhdlout_architecture_name SCHEMATIC
# All ports on lower-level designs are written with their original data types.
# This value affects only designs that are read in VHDL format.
  set vhdlout_preserve_hierarchical_types USER

#******************************************************************************
#  If you want to get more information about the interface between EDA tools **
#  then  refer the SYNOPSYS' Reference Manuals                               **
#******************************************************************************


