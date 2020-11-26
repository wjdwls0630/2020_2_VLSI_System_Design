module Sign_Extend_tb ();


reg [15:0] r_A;
wire [31:0] w_Y;
initial begin
  r_A = 16'h3FFF;
  #20 r_A = 16'hBFFF;
  #20 $finish;
end
Sign_Extend Sign_Extend (
  .i_A(r_A),
  .o_Y(w_Y)
  );

endmodule // Sign_Extend_tb
