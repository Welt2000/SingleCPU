`timescale 1ns / 1ps
module testalu;
reg [31:0]a;
reg [31:0]b;
reg [1:0]ALUOP;
wire [31:0]res;
initial begin
a<=32'b00000000000000000100000000000000;
b<=32'b00000000000000000100000000000000;
ALUOP<=2'b00;
#10 ALUOP<=2'b01;
#10 ALUOP<=2'b10;
#10 ALUOP<=2'b11;
#10 ALUOP<=2'b00;
end
alu32 alutest(.a(a),.b(b),.ALUOp(ALUOP),.result(res));
endmodule

