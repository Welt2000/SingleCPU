`timescale 1ns / 1ps
module coding(q,d);       
input[3:0]d;          
output[1:0] q;        
reg[1:0] q;         
always@(d) 
    begin
        case(d)               
            4'b1000: q<=2'b11;
            4'b0100: q<=2'b10;
            4'b0010: q<=2'b01;
            4'b0001: q<=2'b00;
            default: q<=2'bzz;
        endcase
    end
endmodule