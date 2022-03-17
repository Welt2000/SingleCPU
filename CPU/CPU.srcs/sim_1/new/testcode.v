`timescale 1ns / 1ps
module testcode; // declare testbench name
reg [3:0]d;
wire [1:0]q;
initial begin
    d<=4'b0001;
#10 d<=4'b0010;
#10 d<=4'b0100;
#10 d<=4'b1000;
#10 d<=4'b0010;
#10 $finish;
  end
// Display results
coding code1(q,d);
endmodule
