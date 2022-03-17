module addtest;
reg reset;           
reg [31:0] in0,in1;      
reg[10:0] op;            
wire[31:0] out;         
wire overflow,zero,carryout;

alu_32 unit(            //模块实例化
    .reset(reset),
    .in0(in0),
    .in1(in1),
    .op(op),
    .out(out),
    .overflow(overflow),
    .zero(zero),
    .carryout(carryout)
);
initial
begin
    #10 reset=1;
    #10 reset=0;in0=32'd1; in1=32'd2;        //对操作对象都是正数进行仿真，相当于对无符号数验证，且作为有符号数参与运算是没有问题的
    for(op=11'b00000100000;op<11'b00000100111;op=op+1)
    #20;
    #20 op=11'b00000101010;
    #20 op=11'b00000101011;
    #20 op=11'b00000000000;
    #20 op=11'b00000000010;
    #20 op=11'b00000000011;
    #20 op=11'b00000000100;
    #20 op=11'b00000000110;
    #20 op=11'b00000000111;
    
    #10 reset=1;
    #10 reset=0;in0=-32'd1; in1=32'd2;            //对有负数的情况进行仿真，也就是有符号数的情况
    for(op=11'b00000100000;op<11'b00000100111;op=op+1)
    #20;
    #20 op=11'b00000101010;
    #20 op=11'b00000101011;
    #20 op=11'b00000000000;
    #20 op=11'b00000000010;
    #20 op=11'b00000000011;
    #20 op=11'b00000000100;
    #20 op=11'b00000000110;
    #20 op=11'b00000000111;
    
    #100 $finish;
end
initial
$monitor ($time,,,"reset=%b in0=%b in1=%b op=%b out=%b overflow=%b zero=%b carryout=%b ",
reset,in0,in1,op,out,overflow,zero,carryout);
endmodule