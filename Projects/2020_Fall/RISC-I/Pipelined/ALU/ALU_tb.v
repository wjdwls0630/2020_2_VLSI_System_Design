//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "ALU.v"

module ALU_tb ();

parameter num_test=30;

reg clk;
reg [3:0] r_ctrl;
reg [31:0] r_a, r_b;
reg [31:0] r_a_mem [0:num_test-1];
reg [31:0] r_b_mem [0:num_test-1];
wire [31:0] w_y;
wire w_zero;

integer i;

always #5 clk = ~clk;
initial begin
	clk = 1;
	r_ctrl = 0;
	$readmemh("r_a.txt", r_a_mem);
	$readmemh("r_b.txt", r_b_mem);

	for (i=0; i<num_test; i=i+1) begin
		test(i);
	end
	$finish;
end

task test;
	input integer i;
	begin
		r_a = r_a_mem[i];
		r_b = r_b_mem[i];
		@(posedge clk); // separte test case
		case (i)
			0: r_ctrl = 0;
			1: r_ctrl = 1;
			2: r_ctrl = 2;
			3: r_ctrl = 3;
			4: r_ctrl = 5;
			5: r_ctrl = 6;
			6: r_ctrl = 7;
			7: r_ctrl = 8;
			8: r_ctrl = 9;
			9: r_ctrl = 13;
			default: r_ctrl=0;
		endcase
	end
endtask

ALU ALU_1 (
  .i_ALUctrl(r_ctrl),
  .i_A(r_a),
  .i_B(r_b),
  .o_Y(w_y),
  .o_Zero(w_zero)
  );

endmodule //ALU_tb
