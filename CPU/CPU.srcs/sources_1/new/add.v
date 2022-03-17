`timescale 1ns / 1ps
module halfadd(S,Ci,A,B);
    output S,Ci;
    input A,B;
    assign S=A^B;
    assign Ci=A&B;
endmodule
module full_add4(S,Co,A,B,Ci);
    output [3:0]S;
    output Co;
    input [3:0]A;
    input [3:0]B;
    input Ci;
    assign{Co,S}=A+B+Ci;
    endmodule
module full_add8(S,Co,A,B,Ci);
    output [7:0]S;
    output Co;
    input [7:0]A;
    input [7:0]B;
    input Ci;
    wire Ctmp;
    full_add4 a41(S[3:0],Ctmp,A[3:0],B[3:0],Ci);
    full_add4 a42(S[7:4],Co,A[7:4],B[7:4],Ctmp);
endmodule
module full_add32(s,co,a,b,ci);
input [31:0]a;
input[31:0]b;
input ci;
output [31:0]s;
output co;
wire	[2:0]	c;
full_add8 ad8_1(s[7:0],c[0],a[7:0],b[7:0],ci);
full_add8 ad8_2(s[15:8],c[1],a[15:8],b[15:8],c[0]);
full_add8 ad8_3(s[23:16],c[2],a[23:16],b[23:16],c[1]);
full_add8 ad8_4(s[31:24],co,a[31:24],b[31:24],c[2]);
endmodule