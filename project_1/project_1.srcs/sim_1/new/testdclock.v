`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/09 14:15:12
// Design Name: 
// Module Name: testdclock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testdclock;
reg clk,r,d;
wire q,nq;
Dclock dclock1(clk,r,d,q,nq);
initial begin
r=1;clk=0;d=0;
forever #10 begin
clk=~clk;
end
end
initial begin
d=1;
#20 r=0;
#20 r=1;
#20 $finish;
end
endmodule
