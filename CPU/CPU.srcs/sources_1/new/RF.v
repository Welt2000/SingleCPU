`timescale 1ns / 1ps
module RF(clk,RegWr, W_data, R_Reg1, R_Reg2, W_Reg, R_data1, R_data2); 
     input clk,RegWr;
     input [4:0] R_Reg1, R_Reg2, W_Reg;
     input [31:0] W_data;  
     output [31:0] R_data1, R_data2;

     reg [31:0] register[0:31];  
     integer i;  
     initial begin       // ³õÊ¼»¯¼Ä´æÆ÷
         for (i = 0; i < 32; i = i+1) register[i] <= 0;  
     end  
     assign R_data1 = register[R_Reg1];
     assign R_data2 = register[R_Reg2];

     always @(negedge clk) begin  
         if (RegWr && W_Reg) register[W_Reg] = W_data;  // ·ÀÖ¹Ğ´Èë0ºÅ¼Ä´æÆ÷(writeReg=0)
     end  
endmodule