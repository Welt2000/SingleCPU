`timescale 1ns / 1ps
module CU(
    input [5:0] OpCode,//6位opcode
    output RegDst,
    output ALUSrc,
    output MemtoReg,
    output RegWr,
    output MemWr,
    output MemRd,
    output ExtSel,
    output Branch,
    output Jump,
    output [1:0] ALUOp
    );
    // 根据opcode定义控制信号为1或0
    assign RegDst=(OpCode == 6'b000000) ?1:0;
    assign ALUSrc=(OpCode==6'b001000||OpCode==6'b001101||OpCode==6'b100011||OpCode==6'b101011)?1:0;
    assign MemtoReg=(OpCode==6'b100011)?1:0;
    assign RegWr=(OpCode==6'b000000||OpCode==6'b001000||OpCode==6'b001101||OpCode==6'b100011)?1:0;
    assign MemWr=(OpCode==6'b101011)?1:0;
    assign MemRd=(OpCode==6'b100011)?1:0;
    assign ExtSel = (OpCode == 6'b000000||OpCode==6'b001101||OpCode==6'b000010)?0:1;
    assign Branch=(OpCode==6'b000100)?1:0;
    assign Jump=(OpCode==6'b000010)?1:0;
    assign ALUOp[1]=(OpCode==6'b000000||OpCode==6'b001000||OpCode==6'b001101)?1:0;
    assign ALUOp[0] = (OpCode==6'b001000||OpCode==6'b001101||OpCode == 6'b000100)?1:0;
endmodule
