`timescale 1ns / 1ps

module Reg(
clk,d,op,q
    );
    input clk;
    input[31:0]d;
    input[1:0]op;
    output reg [31:0]q;
    reg tmp;
    always @(posedge clk)begin
        case (op)
        2'b00:q<=d;
        2'b01:begin //Ñ­»·×óÒÆ
                tmp=q[31];
                q[31:1]=q[30:0];
                q[0]=tmp;
               end
        2'b10:begin //Ñ­»·ÓÒÒÆ
                tmp=q[0];
                q[30:0]=q[31:1];
                q[31]=tmp;
               end
        default:q=8'hxxxxxxxx;
        endcase
    end
endmodule
