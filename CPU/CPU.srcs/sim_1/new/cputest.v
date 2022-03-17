`timescale 1ns / 1ps
module cputest;
    reg CLK;

    // Outputs
    wire [31:0] Out1;
    wire [31:0] Out2;
    wire [31:0] PCaddr;
    wire [31:0] PCnext;
    wire [31:0] Result;
    wire [5:0] OpCode;
    wire [1:0] ALUOp;
    wire zero,ExtSel,RegDst,ALUSrc,MemtoReg,RegWr,MemWr,MemRd,Branch,Jump;

    // Instantiate the Unit Under Test (UUT)
    singlecycleCPU cpu (
        .clk(CLK), 
        .OpCode(OpCode),
        .R_data1(Out1),
        .R_data2(Out2),
        .PCaddr(PCaddr),
        .PCnext(PCnext),
        .Result(Result),
        .zero(zero),.ExtSel(ExtSel),.RegDst(RegDst),.ALUSrc(ALUSrc),.MemtoReg(MemtoReg),.RegWr(RegWr),.MemWr(MemWr),.MemRd(MemRd),.Branch(Branch),.Jump(Jump),
        .ALUOp(ALUOp)
    );

    initial begin
        // Initialize Inputs
        CLK = 0;
        forever #20 begin // 产生时钟信号
            CLK = !CLK;
        end
    end
endmodule

