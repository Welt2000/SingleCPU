`timescale 1ns / 1ps

module DM(
    input [31:0] DAddr,
    input [31:0] W_data,
    input R,
    input W,
    output reg [31:0] R_data
    );
     reg[31:0] memory[0:256];  
         // read data  
         always @(R)  begin:Data_Read 
             if (R == 1) begin
                 R_data = memory[DAddr];
             end
         end  
        // Wite data  
         integer i;  
         initial begin  
             for (i = 0; i < 128; i = i+1) memory[i] <= 0;  
         end  
         always @(W or DAddr or W_data)  
             begin :Data_Write 
                  if (W == 1) begin
                      memory[DAddr] = W_data;
                  end  
              end  
endmodule
