echo "***********************************************************************"
echo "                                                                       "
echo "                     synopsys_fm_setup.tcl                             "
echo "                                                                       "
echo "***********************************************************************"

# Remove all libraries and containers before starting new verification
remove_library   -all
remove_container -all

#******************************************************************************
#                       set basic parameter                                  **
#******************************************************************************
set designer "Man"
set company "KHU Room327"
#******************************************************************************

#******************************************************************************
#**                         Set Library Parameter                            **
#******************************************************************************
# set env(SEC_SYNOPSYS)  <installed_synopsys_dk_path>
# set env(SEC_FM)       $env(SEC_SYNOPSYS)/formality
set env(SEC_SYNOPSYS) /Tools/Library/samsung65_2016/CB_1502/PRIMITIVE
set env(SEC_FM) $env(SEC_SYNOPSYS)/formality
set env(synopsys_root) /Tools/Synopsys/DesignCompiler_2017

set sh_source_logging       false
set sh_new_variable_message false

proc count {} {
  if {[current_design] == "0"} {
    puts "The count function works on the current design"
    return 0
  } else {
    set orig_current_des [current_design]
    set cell_count [llength [find_cells]]

    foreach design [find_references -hierarchy] {
      if {[string first : $design] > 0} {
        current_design $design
        set cell_count [expr $cell_count + [llength [find_cells]]]
      }
    }
    current_design $orig_current_des
    puts "number of cells: $cell_count"
    return $cell_count
  }
}
proc make_time {start_t end_t} {
   val = [expr int($end_t - $start_t)]
   hor = [expr int($val / 3600)]
   val = [expr $val - $hor * 3600]
   min = [expr int($val / 60)]
   val = [expr $val - $min * 60]
   sec = $val
   return [format "%02i:%02i:%02i" $hor $min $sec]
}

if [catch {set env(SEC_SYNOPSYS)} msg] {
   puts "***"
   puts "*** Note :"
   puts "***"
   puts "***      You must set SEC_SYNOPSYS environment variables"
   puts "***      to a propriate direcotry path in which SEC Synopsys D/K was"
   puts "***      installed."
   puts "***"
   puts "***      And execute the following command"
   puts "***"
   puts "***      fm_shell> source \$env(SEC_SYNOPSYS)/formality/synopsys_fm.setup"
   puts "***"
} else {
   if [catch {set env(SEC_FM)} msg] {
      set env(SEC_FM) $env(SEC_SYNOPSYS)/formality
      source $env(SEC_FM)/utils/sec_read.tcl
      source $env(SEC_FM)/utils/sec_read_udc.tcl
      source $env(SEC_FM)/utils/sec_read_change_names_rpt.tcl
   } else {
      source $env(SEC_FM)/utils/sec_read.tcl
      source $env(SEC_FM)/utils/sec_read_udc.tcl
      source $env(SEC_FM)/utils/sec_read_change_names_rpt.tcl
   }
}

# Sets certain conservative Formality default variables to values that better conform to Design
# Compiler behavior. Certain guide commands are also accepted, instead of ignored. Set this
# variable before reading the automated setup file(.svf)
set synopsys_auto_setup true
