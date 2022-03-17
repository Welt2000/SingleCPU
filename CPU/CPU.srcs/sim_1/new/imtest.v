`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/03 00:55:47
// Design Name: 
// Module Name: imtest
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


module imtest;
    reg [31:0] Addr;   
    wire [5:0] op;
    wire [25:0]nextaddr;   
    wire [4:0] rs, rt, rd;  
    wire [15:0] inst0;
    wire [5:0] funct;
    initial begin
    Addr =8'h00000001;
    end
    IM imt(Addr,op,nextaddr,rs,rt,rd,inst0,funct);
endmodule
