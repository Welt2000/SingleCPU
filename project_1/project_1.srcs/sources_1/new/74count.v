`timescale 1ns / 1ps
module count74(//74����
clk,en,r,num
    );
    //74����������Ҫ7λ��ʾ��Ϊ����ѡ��8λ
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
