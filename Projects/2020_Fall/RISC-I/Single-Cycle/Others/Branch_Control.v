module Branch_Control (
  input i_Branch,
  input i_NotEqaulBranch,
  input i_Zero,
  output reg o_Branch_Taken
  );

  always @ ( * ) begin
    if(i_Zero == 1'b1 && i_Branch == 1'b1) o_Branch_Taken = 1'b1;
    else if (i_Zero == 1'b0 && i_NotEqaulBranch == 1'b1) o_Branch_Taken = 1'b1;
    else o_Branch_Taken = 1'b0;
  end

endmodule //Branch_Control
