
`define CYCLE_TIME 10.0          	  // Modify your clock period here
`define End_CYCLE  300             // Modify cycle times once your design need more cycle times!


module testfixture;

reg                Clk;
reg                reset;//used to initalize memorys and registers
reg [7:0]          instr_i;
reg [31:0] inst_addr;
wire [31:0] inst;
reg [7:0]          instr_store[0:(64*4+1)];
integer counter;
Instruction_Memory Instruction_Memory(
    .clk        (Clk),
    .reset      (reset),
    .addr_i     (inst_addr),
    .instr_i    (instr_i),
    .instr_o    (inst)          //to IF_ID.inst_i
);
always #(`CYCLE_TIME/2) Clk = ~Clk;
integer k;
initial begin
    counter = 0;
    instr_i = 0;
    inst_addr=0;
    for(k=0;k < (64*4+1) ;k=k+1) instr_store[k] = 0;
    // Load instructions into instruction memory
    $readmemb("instruction2.txt", instr_store);

    Clk = 1;

    reset = 0;
    reset = 1;
    #(`CYCLE_TIME)
    reset = 0;
end


always@(posedge Clk) begin
    if(counter<256)begin
        #(`CYCLE_TIME/4)
        instr_i = instr_store[counter];

    end
    else instr_i = 0;
end
//8'b1111_1110 = start
//8'b1111_1111 = end

always@(posedge Clk) begin
    if(counter >= 300)    // stop after 240 cycles
        inst_addr= inst_addr+32'd4;
    else if (counter == 600) $finish;
    else counter = counter + 1;


end


endmodule
