`timescale 1ns / 1ps
module PC(clk,in, addr); 
     input clk; 
     input [31:0] in;  
     output [31:0] addr;  
     reg [31:0] addr;  
    initial begin
        addr  <= -4;
    end
     // clock�����ر仯��D������
     always @(posedge clk)  
         begin  
                addr<=in;
         end
endmodule  
