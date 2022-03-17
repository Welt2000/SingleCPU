`timescale 1ns / 1ps

module PCadd(
input [31:0]PCaddr,
input[31:0]ext,
input[25:0]nextaddr,
input zero,Branch,Jump,
output [31:0]pcnext
    );
   wire [31:0] add1;
   wire [27:0]shl21;
   wire [31:0]shl22;
   wire [31:0]add2;
   wire [31:0]jaddr;//×ªÒÆµØÖ·
   wire[31:0]y1;
   wire [31:0]y2;
   assign add1=PCaddr+4; 
   assign shl21=nextaddr<<2;
   assign shl22=ext<<2;
   assign add2=add1+shl22;
   assign jaddr[31:28]=add1[31:28];
   assign jaddr[27:0]=shl22;
   MUX32 ad2(add1,add2,zero&Branch,y1);
   MUX32 mu(y1,jaddr,Jump,pcnext);
endmodule
