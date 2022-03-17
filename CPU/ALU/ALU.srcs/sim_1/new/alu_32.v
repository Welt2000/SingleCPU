module addtest;
reg reset;           
reg [31:0] in0,in1;      
reg[10:0] op;            
wire[31:0] out;         
wire overflow,zero,carryout;

alu_32 unit(            //ģ��ʵ����
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
    #10 reset=0;in0=32'd1; in1=32'd2;        //�Բ����������������з��棬�൱�ڶ��޷�������֤������Ϊ�з���������������û�������
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
    #10 reset=0;in0=-32'd1; in1=32'd2;            //���и�����������з��棬Ҳ�����з����������
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