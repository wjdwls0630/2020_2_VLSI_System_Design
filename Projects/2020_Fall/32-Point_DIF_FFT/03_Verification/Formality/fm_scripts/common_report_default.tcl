# This script file creates reports for all modules
echo "***********************************************************************"
echo "                                                                       "
echo "                    common_report_default.tcl                          "
echo "                                                                       "
echo "***********************************************************************"

# report about lists all the black boxes in a design
report_black_boxes > "$REPORTS_DIR/black_boxes.rpt"

# report user-defined constants
report_constants > "$REPORTS_DIR/constants.rpt"

# report constraint
report_constraint > "$REPORTS_DIR/constraints.rpt"

# report constraint type
report_constraint_type >> "$REPORTS_DIR/constraints.rpt"

# report a list of containers
report_containers > "$REPORTS_DIR/containers.rpt"

# report all user-defined cutpoints
report_cutpoints > "$REPORTS_DIR/cutpoints.rpt"

# report about design libraries
report_design_libraries > "$REPORTS_DIR/design_libraries.rpt"

# report about designs
report_designs > "$REPORTS_DIR/designs.rpt"

# report compare points disabled by the set_dont_verify_points
report_dont_verify_points > "$REPORTS_DIR/dont_verify_points.rpt"

# report .svf info
# 2 path
report_guidance -to $REPORTS_DIR/report_guidance
report_guidance -to $SVF_DIR/report_guidance

# report info about technology libraries
report_libraries > "$REPORTS_DIR/libraries.rpt"

# report loops or portions of loops
report_loops > "$REPORTS_DIR/loops.rpt"

# report the current status of verification
report_status > "$REPORTS_DIR/status.rpt"

# report a list of points matched byt the set_user_match command
report_user_matches > "$REPORTS_DIR/user_matches.rpt"

# save the current Formality session including a design matched state.
save_session -replace "$REPORTS_DIR/session"
