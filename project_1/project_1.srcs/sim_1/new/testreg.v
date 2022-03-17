`timescale 1ns / 1ps
module testreg;
reg clk;
reg[1:0]op;
reg[31:0]d;
wire[31:0]q;
initial begin
clk=0;d=32'b11;
forever #5 begin
clk=~clk;
end
end
initial begin
#10 op=2'b00;
#10 op=2'b01;
#10 op=2'b01;
#10 op=2'b10;
#10 op=2'b10;
#10 op=2'b10;
#10 $finish;
end
Reg reg1(clk,d,op,q);
endmodule
