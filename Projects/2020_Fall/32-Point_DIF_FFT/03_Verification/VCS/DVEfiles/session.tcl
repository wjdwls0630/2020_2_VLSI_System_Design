# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Sun Nov 22 14:29:24 2020
# Designs open: 1
#   V1: /home/VLSI_graduated_2020/2015104027/2020_2_VLSI_System_Design/32-Point_DIF_FFT/03_Verification/VCS/outputs/FFT_RTL.vcd
# Toplevel windows open: 1
# 	TopLevel.2
#   Wave.1: 77 signals
#   Group count = 1
#   Group FFT signal count = 77
# End_DVE_Session_Save_Info

# DVE version: L-2016.06
# DVE build date: May 24 2016 21:00:26


#<Session mode="Full" path="/home/VLSI_graduated_2020/2015104027/2020_2_VLSI_System_Design/32-Point_DIF_FFT/03_Verification/VCS/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.2

if {![gui_exist_window -window TopLevel.2]} {
    set TopLevel.2 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.2 TopLevel.2
}
gui_show_window -window ${TopLevel.2} -show_state maximized -rect {{0 28} {1852 1052}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_hide_toolbar -toolbar {Simulator}
gui_hide_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.2}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 537} {child_wave_right 1310} {child_wave_colname 266} {child_wave_colvalue 266} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) none
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) none
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) none
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) none
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.2}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { ![gui_is_db_opened -db {/home/VLSI_graduated_2020/2015104027/2020_2_VLSI_System_Design/32-Point_DIF_FFT/03_Verification/VCS/outputs/FFT_RTL.vcd.vpd}] } {
	gui_open_db -design V1 -file /home/VLSI_graduated_2020/2015104027/2020_2_VLSI_System_Design/32-Point_DIF_FFT/03_Verification/VCS/outputs/FFT_RTL.vcd.vpd -nosource
}
gui_set_precision 1ps
gui_set_time_units 1ps
#</Database>

# DVE Global setting session: 


# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {TESTBED.FFT}


set _session_group_1 FFT
gui_sg_create "$_session_group_1"
set FFT "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { TESTBED.FFT.clk TESTBED.FFT.rst_n TESTBED.FFT.in_valid TESTBED.FFT.din_r TESTBED.FFT.din_i TESTBED.FFT.out_valid TESTBED.FFT.dout_r TESTBED.FFT.dout_i TESTBED.FFT.i TESTBED.FFT.next_dout_r TESTBED.FFT.next_dout_i TESTBED.FFT.count_y TESTBED.FFT.next_count_y TESTBED.FFT.din_r_reg TESTBED.FFT.din_i_reg TESTBED.FFT.in_valid_reg TESTBED.FFT.r4_valid TESTBED.FFT.next_r4_valid TESTBED.FFT.no5_state TESTBED.FFT.s5_count TESTBED.FFT.next_s5_count TESTBED.FFT.next_over TESTBED.FFT.over TESTBED.FFT.assign_out TESTBED.FFT.next_out_valid TESTBED.FFT.y_1_delay TESTBED.FFT.out_r TESTBED.FFT.out_i TESTBED.FFT.y_1 TESTBED.FFT.din_r_wire TESTBED.FFT.din_i_wire TESTBED.FFT.rom16_state TESTBED.FFT.rom16_w_r TESTBED.FFT.rom16_w_i TESTBED.FFT.shift_16_dout_r TESTBED.FFT.shift_16_dout_i TESTBED.FFT.radix_no1_delay_r TESTBED.FFT.radix_no1_delay_i TESTBED.FFT.rom8_state TESTBED.FFT.rom8_w_r TESTBED.FFT.rom8_w_i TESTBED.FFT.shift_8_dout_r TESTBED.FFT.shift_8_dout_i TESTBED.FFT.radix_no2_delay_r TESTBED.FFT.radix_no2_delay_i TESTBED.FFT.radix_no1_op_r TESTBED.FFT.radix_no1_op_i TESTBED.FFT.radix_no2_op_r TESTBED.FFT.radix_no2_op_i TESTBED.FFT.radix_no1_outvalid TESTBED.FFT.radix_no2_outvalid TESTBED.FFT.rom4_state TESTBED.FFT.rom4_w_r TESTBED.FFT.rom4_w_i TESTBED.FFT.shift_4_dout_r TESTBED.FFT.shift_4_dout_i TESTBED.FFT.radix_no3_delay_r TESTBED.FFT.radix_no3_delay_i TESTBED.FFT.radix_no3_op_r TESTBED.FFT.radix_no3_op_i TESTBED.FFT.radix_no3_outvalid TESTBED.FFT.rom2_state TESTBED.FFT.rom2_w_r TESTBED.FFT.rom2_w_i TESTBED.FFT.shift_2_dout_r TESTBED.FFT.shift_2_dout_i TESTBED.FFT.radix_no4_delay_r TESTBED.FFT.radix_no4_delay_i TESTBED.FFT.radix_no4_op_r TESTBED.FFT.radix_no4_op_i TESTBED.FFT.radix_no4_outvalid TESTBED.FFT.shift_1_dout_r TESTBED.FFT.shift_1_dout_i TESTBED.FFT.radix_no5_delay_r TESTBED.FFT.radix_no5_delay_i TESTBED.FFT.radix_no5_op_r TESTBED.FFT.radix_no5_op_i }
gui_set_radix -radix {decimal} -signals {V1:TESTBED.FFT.i}
gui_set_radix -radix {twosComplement} -signals {V1:TESTBED.FFT.i}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 0



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 60757 501077
gui_list_add_group -id ${Wave.1} -after {New Group} {FFT}
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group FFT  -position in

gui_marker_move -id ${Wave.1} {C1} 0
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

