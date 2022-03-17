`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/28 16:43:30
// Design Name: 
// Module Name: testram
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


module testram;
reg clk;
reg [7:0]address;
reg cs;
reg we;
reg oe;
wire [31:0]data,data_out;
reg [31:0]data_in;
assign data=(we==1&&oe==0)?data_in:32'bz;
assign data_out=(we==0&&oe==1)?data:32'bz;
initial begin
clk=0;cs=1;oe=0;we=1;
forever #5 begin
clk=!clk;
end
end
initial begin
address<=0;data_in<=1;
#10 address<=1;data_in<=2;
#10 address<=3;data_in<=4;
#10 we=0;oe=1;
#10 address<=0;
#10 address<=1;
#10 address<=5;we=1;oe=0;data_in<=8;
#10 address<=7;data_in<=16;
#10 address<=9;data_in<=32;
#10 we=0;oe=1;
#10 address<=7;
#10 address<=5;
#10 $finish;
end
ram ram1(clk,address,data,cs,we,oe);

endmodule
