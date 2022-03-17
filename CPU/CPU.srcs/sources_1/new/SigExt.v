`timescale 1ns / 1ps

module SigExt(
    input [15:0] Inst,
    input ExtSel,
    output [31:0] out
    );
    assign out[15:0] = Inst;  // ��15λ�洢������
    assign out[31:16] = ExtSel? (Inst[15]? 16'hffff : 16'h0000) : 16'h0000; // ǰ16λ�������������Ž��в�1��0�Ĳ��� 
endmodule