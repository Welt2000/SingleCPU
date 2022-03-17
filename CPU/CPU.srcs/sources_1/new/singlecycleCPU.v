`timescale 1ns / 1ps
module singlecycleCPU(
    input clk,
    output wire[5:0] OpCode,
    output wire[31:0] R_data1, R_data2, PCaddr,PCnext, Result,
    output wire zero,ExtSel,RegDst,ALUSrc,MemtoReg,RegWr,MemWr,MemRd,Branch,Jump,
    output wire[1:0] ALUOp
    );

    wire[2:0] ALUCtrl;
    wire[31:0] Extout,R_data,W_data;
    wire[15:0] Inst;
    wire [25:0]nextaddr;
    wire[4:0] rs, rt, rd,W_Reg;
    wire[5:0] Funct;
    wire[31:0]ALU_B;


    ALU alu(R_data1, ALU_B, ALUCtrl, zero, Result);
    MUX32 aludm(Result,R_data,MemtoReg,W_data);
    ALUCU acu(OpCode,ALUOp,Funct,ALUCtrl);
    SigExt se(Inst,ExtSel,Extout);
    PCadd add(PCaddr,Extout,nextaddr,zero,Branch,Jump,PCnext);
    PC pc(clk,PCnext, PCaddr);
    CU mcu(OpCode,RegDst,ALUSrc,MemtoReg,RegWr,MemWr,MemRd,ExtSel,Branch,Jump,ALUOp);
    DM dm(Result, R_data2, MemRd, MemWr, R_data);
    IM im(PCaddr, OpCode,nextaddr, rs, rt, rd, Inst, Funct);
    MUX5 rtrd(rt,rd,RegDst,W_Reg);
    RF rf(clk,RegWr, W_data, rs, rt, W_Reg, R_data1, R_data2);
    MUX32 rfext(R_data2,Extout,ALUSrc,ALU_B);

endmodule
