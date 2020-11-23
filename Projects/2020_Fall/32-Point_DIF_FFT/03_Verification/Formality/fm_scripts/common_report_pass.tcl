# This script file creates reports for all modules
echo "***********************************************************************"
echo "                                                                       "
echo "                       common_report_pass.tcl                          "
echo "                                                                       "
echo "***********************************************************************"


# report all design objects (including compare points) matched
report_matched_points > "$REPORTS_DIR/matched_points.rpt"

# report info about compare points that passed the most recent verification
report_passing_points > "$REPORTS_DIR/passing_points.rpt"
