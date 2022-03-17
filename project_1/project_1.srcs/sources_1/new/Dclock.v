`timescale 1ns / 1ps
module Dclock(
clk,
r,
d,
q,
nq
    );
    input clk,r,d;
    output reg q,nq;
    always @(posedge clk)
        begin
            if(r)begin
              q=d;
              nq=~d;
             end
             else 
             q=0;
             nq=1;
        end
endmodule
