`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/30 15:45:50
// Design Name: 
// Module Name: alu32
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


module alu32(
 input [31:0] a, 
 input [31:0] b,
 input [1:0]ALUOp,
 output reg[31:0]result
    );
    always @(a or b or ALUOp)
    begin
     case(ALUOp)
     2'b00:     begin
        result=a+b;
        end
     2'b01:   begin
        result=a-b;
     end
     2'b10:begin
     result=a*b;
     end
     2'b11:begin
     result=a/b;
     end
     endcase
        end
endmodule
