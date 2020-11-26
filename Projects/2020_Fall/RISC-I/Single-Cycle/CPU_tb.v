//
// Created by Park, JungJin - 23 Nov 2020
// wjdwls0630@khu.ac.kr
//
`include "parameters.v"
`include "CPU.v"

`define CYCLE_TIME 10.0
`define End_CYCLE  300

module CPU_tb();
  reg clk, rstn, Reg_or_Data; // 0 - Data 1 - Reg
  reg [$clog2(`Register_SIZE)-1:0] test_addr;
  wire [`WORD_LEN-1:0] test_data;
  reg [`WORD_LEN-1:0] write_instr;


  integer counter, i, j, k;
  reg [31:0] instrs_store[0:33];
  reg  [31:0] golden [0:63];

  always #(`CYCLE_TIME/2) clk = ~clk;

  initial begin
      counter = 0;
      Reg_or_Data = 1;
      test_addr = 0;
      write_instr = 0;
      for(k=0;k < `InstrMEM_SIZE ;k=k+1) instrs_store[k] = 0;
      // Load instructions into instruction memory
      $readmemh("test/instructions.txt", instrs_store);
      //$readmemh("test/golden.dat",golden);


      clk = 0;

      rstn = 1;
      rstn = 0;
      #(`CYCLE_TIME)
      rstn = 1;
  end

  always@(posedge clk) begin
      if(counter < 34)begin
          write_instr = instrs_store[counter];
      end
      else write_instr = 0;
  end
  //8'b1111_1110 = start
  //8'b1111_1111 = end
  always@(posedge clk) begin
      if(counter == 300)    // stop after 240 cycles
          $finish;
      counter = counter + 1;
  end
  integer err;
  initial begin
      j =0 ;
      test_addr = 0;
       $display("--------------------------- [ Simulation Starts !! ] ---------------------------");
          #(`CYCLE_TIME*100);
          for(j=0;j<`Register_SIZE;j=j+1)begin
              test_addr = test_addr + 1;
          end
          #(`CYCLE_TIME*2);
       $display("--------------------------- Simulation Stops !!---------------------------");
       if (err) begin
       	$display("============================================================================");
  		$display("             ▄▄▄▄▄▄▄ ");
  		$display("         ▄▀▀▀       ▀▄");
  		$display("       ▄▀            ▀▄ 		ERROR FOUND!!");
  		$display("      ▄▀          ▄▀▀▄▀▄");
  		$display("    ▄▀          ▄▀  ██▄▀▄");
  		$display("   ▄▀  ▄▀▀▀▄    █   ▀▀ █▀▄ 	There are");
  		$display("   █  █▄▄   █   ▀▄     ▐ █  %d errors in total.", err);
  		$display("  ▐▌  █▀▀  ▄▀     ▀▄▄▄▄▀  █ ");
  		$display("  ▐▌  █   ▄▀              █");
  		$display("  ▐▌   ▀▀▀                ▐▌");
  		$display("  ▐▌               ▄      ▐▌ ");
  		$display("  ▐▌         ▄     █      ▐▌ ");
  		$display("   █         ▀█▄  ▄█      ▐▌ ");
  		$display("   ▐▌          ▀▀▀▀       ▐▌ ");
  		$display("    █                     █ ");
  		$display("    ▐▌▀▄                 ▐▌");
  		$display("     █  ▀                ▀ ");
          $display("============================================================================");
  	end
       else begin
          $display("============================================================================");
          $display("/ \033[1;33m##########\                                  #########\033[m");
          $display("//\033[1;33m############/                           #############\033[m");
          $display("  \033[1;33m  (#############       /            ##################\033[m");
          $display("  \033[1;33m  ################################################ \033[m ");
          $display("  \033[1;33m     /###########################################  \033[m   ");
          $display(" \033[1;33m         //(#####################################(  \033[m    ");
          $display("   \033[1;33m        (##################################(/     \033[m    ");
  		$display("   \033[1;33m     /####################################(     \033[m    ");
  		$display("   \033[1;33m   #####(   /###############(    ########(   \033[m     ");
  		$display("   \033[1;33m (#####       ##############     (########  \033[m	   ");
  		$display(".  \033[1;33m  #######(  (################   (#########( \033[m	   ");
  		$display(".   \033[1;33m/###############/  (######################/	\033[m   ");
  		$display("\033[1;35m    . /////\033[m\033[1;33m############################\033[m\033[1;35m/ ///(\033\033[1;33m###( \033[m	   ");
  		$display("\033[1;35m  .//////(\033[m\033[1;33m##########################\033[m\033[1;35m///////\033\033[1;33m######  \033[m	   ");
  		$display("\033[1;35m   . /////\033[m \033[1;33m#########(       /#########\033[m\033[1;35m(//////\033\033[1;33m####( \033[m    ");
  		$display("\033[1;35m   (#((\033[m\033[1;33m###########(        (#########\033[m\033[1;35m(((((\033\033[1;33m######/  \033[m  ");
  		$display("  \033[1;33m /###############(      /(####################( \033[m   ");
  		$display("   \033[1;33m/#################(  (#######################  \033[m  ");
  		$display("\033[1;33m   (###########################################(  \033[m ");
  		$display("\033[1;36m	^o^		WOOOOOW  YOU  PASSED!!!\033[m");
          $display("\n");
          $display("============================================================================");
          $finish;
  	end
  $finish;

  end


  CPU CPU (
    .i_CLK(clk),
    .i_RSTN(rstn),
    .i_Reg_or_Data(Reg_or_Data),
    .i_Test_Addr(test_addr),
    .o_Test_Data(test_data),
    .i_Write_Instr(write_instr)
    );
endmodule
