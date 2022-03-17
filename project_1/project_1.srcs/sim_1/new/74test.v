`timescale 1ns / 1ps
module test74;
reg clk,en,r;
wire [7:0]num;
initial begin// ±÷”–≈∫≈
clk=0;
forever #5 clk=~clk;
end
initial begin
r=1;en=0;
#10 r=0;en=1;
#800 en=0;
#10 r=1;
#10 $finish;
end
count74 cont1(clk,en,r,num);
endmodule
