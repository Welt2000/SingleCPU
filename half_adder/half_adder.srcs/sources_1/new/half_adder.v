`timescale 1ns / 1ps
module halfadd(S,Ci,A,B);
    output S,Ci;
    input A,B;
    assign S=A^B;
    assign Ci=A&B;
endmodule
module testfixture;
// Data type declaration
reg A,B;
wire S,Ci;
// MUX instance
halfadd hf (S, Ci,A,B);
// Apply stimulus
initial
begin
A = 0; B = 1;
#5 A = 0;
#5 B = 1; 
#5 A = 1;
#5 $finish;
end
// Display results
endmodule
