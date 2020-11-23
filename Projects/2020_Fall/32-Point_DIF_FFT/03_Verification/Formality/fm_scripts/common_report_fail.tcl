# This script file creates reports for all modules
echo "***********************************************************************"
echo "                                                                       "
echo "                      common_report_fail.tcl                           "
echo "                                                                       "
echo "***********************************************************************"

# report info about compare points not verified
report_aborted_points > "$REPORTS_DIR/aborted_points.rpt"

# report info about matching region for the most recent diagnosis
report_diagnosed_matching_region > "$REPORTS_DIR/diagnose.rpt"

# report about error candidates for most recent verification
report_error_candidates > "$REPORTS_DIR/error_candidates.rpt"

# report info about compare points that fail verification
report_failing_points > "$REPORTS_DIR/failing_points.rpt"

# report and summarizes th rtl and synthesis mismatches during design linking
report_hdlin_mismatches > "$REPORTS_DIR/hdlin_mismatches.rpt"

# report points that have not been matched
report_unmatched_points > "$REPORTS_DIR/unmatched_points.rpt"

# report info about compare points that you have verified
report_unverified_points > "$REPORTS_DIR/unverified_points.rpt"
