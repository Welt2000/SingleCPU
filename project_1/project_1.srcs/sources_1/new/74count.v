`timescale 1ns / 1ps
module count74(//74进制
clk,en,r,num
    );
    //74进制至少需要7位表示，为方便选择8位
    input clk,en,r;
    output reg [7:0]num;
    always @(posedge clk)begin
    if(r) num<=0;
        else if(en) begin
                if(num<74)
                num=num+1;
                else num=0;
           end
    end
endmodule
