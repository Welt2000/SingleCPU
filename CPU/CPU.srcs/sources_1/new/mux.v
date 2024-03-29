`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/30 23:17:01
// Design Name: 
// Module Name: mux
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
module MUX5(A0,A1,S,Y);//5λ2ѡһ
    input [4:0] A0,A1;
    input S;
    output [4:0] Y;

    function [4:0] select;
        input [4:0] A0,A1;
        input S;
        case(S)
            0:select=A0;
            1:select=A1;
        endcase
    endfunction

    assign Y=select(A0,A1,S);
endmodule

module MUX32(A0,A1,S,Y);//32λ2ѡ1
    input [31:0] A0,A1;
    input S;
    output [31:0] Y;

    function [31:0] select;
        input [31:0] A0,A1;
        input S;
        case(S)
            0:select=A0;
            1:select=A1;
        endcase
    endfunction

    assign Y=select(A0,A1,S);
endmodule