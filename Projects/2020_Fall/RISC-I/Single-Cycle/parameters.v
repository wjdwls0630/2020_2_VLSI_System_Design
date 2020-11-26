`define WORD_LEN 32
`define OP_CODE_LEN 6


`define InstrMEM_SIZE 32
`define Register_SIZE 32
`define DataMEM_SIZE  32

// in Control.v
`define OP_Rtype 6'b000000
`define OP_J     6'b000010
`define OP_BEQ   6'b000100
`define OP_BNE   6'b000101
`define OP_ADDI  6'b001000
`define OP_LW    6'b100011
`define OP_SW    6'b101011


// in ALU.v, ALU_Control.v
`define ALU_AND  4'b0000
`define ALU_OR   4'b0001
`define ALU_ADD  4'b0010
`define ALU_MUL  4'b0011
`define ALU_SUB  4'b0110
`define ALU_SLT  4'b0111
`define ALU_SLTU 4'b1000
`define ALU_SLL  4'b1001
`define ALU_SRA  4'b1010
`define ALU_SRL  4'b1011
`define ALU_XOR  4'b1101
`define ALU_NOOP 4'b1111 // for NOOP
