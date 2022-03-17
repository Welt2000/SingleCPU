`timescale 1ns / 1ps

module SigExt(
    input [15:0] Inst,
    input ExtSel,
    output [31:0] out
    );
    assign out[15:0] = Inst;  // 后15位存储立即数
    assign out[31:16] = ExtSel? (Inst[15]? 16'hffff : 16'h0000) : 16'h0000; // 前16位根据立即数符号进行补1或0的操作 
endmodule