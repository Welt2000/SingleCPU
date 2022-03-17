module alu32(
 reset, in0, in1, op, out, overflow, zero, carryout
    );
    input reset;               //reset���ڳ�ʼ������
    input[31:0] in0,in1;       //��������
    input[10:0] op;            //������
    output[31:0] out;         
    output overflow,zero,carryout;
    reg[31:0] out;
    reg overflow,zero,carryout;
always@(*)              
begin
     if(reset)           //��ʼ��
         begin
          out=0;
          overflow=0;
          zero=0;
          carryout=0;
         end
     else
         alutask( in0, in1, op, out, overflow, zero, carryout);      //�Ѿ��幦��ģ���װ��һ������
end
task alutask;                  //������
   input[31:0] in0,in1;       
   input[10:0] op;           
   output[31:0] out;         
   output overflow,zero,carryout;
   reg[31:0] out;
   reg overflow,zero,carryout;
begin
            overflow=0;            //ÿ�ν��в�ͬ�������ʱ�򣬱�־λ��Ҫ��0
            carryout=0;
            case( op )
            11'b00000100000: 
                            begin
                            out=$signed(in0)+$signed(in1);                               //$signed��ǿ��ת�������޷�����תΪ�з�����
                            overflow=in0[31]&in1[31] ^ in0[30]&in1[30];         //�з������������ͨ��overflow���ж�����Ϊ--���λ��λ״̬^�θ�λ��λ״̬=1�������������ɰٶȡ�
                            end
            11'b00000100001: 
                            begin               //�������ж���䣬��������������޷��������������Ϊ��ȷ����ֵ����ͬ
                            if(in0[31]==1||in1[31]==1)
                            out=32'bx;
                            else
                            {carryout,out}=$unsigned(in0)+$unsigned(in1);                             //�޷����������ͨ������λ�жϣ�����ʹ�������ӷ�{}��ʹ�ý�carryout��Ϊ���λ��out������һ��            
                            end
            11'b00000100010:
                             begin
                             out=$signed(in0)-$signed(in1);
                             overflow=in0[31]&in1[31] ^ in0[30]&in1[30];
                             end
            11'b00000100011: 
                             begin
                             if(in0[31]==1||in1[31]==1)
                             out=32'bx;
                             else
                             {carryout,out}=$unsigned(in0)-$unsigned(in1);
                             end
            11'b00000100100: out=in0&in1;
            11'b00000100101: out=in0|in1;
            11'b00000100110: out=in0^in1;
            11'b00000100111: out=~(in0|in1);
            11'b00000101010: out=( $signed(in0)<$signed(in1) )? 1:0;
            11'b00000101011: out=(in0<in1)? 1:0;
            11'b00000000000: out=in0<<10;
            11'b00000000010: out=in0>>10;
            11'b00000000011: out=in0>>>10;
            11'b00000000100: out=in0<<in1;
            11'b00000000110: out=in0>>in1;
            11'b00000000111: out=in0>>>in1;
            endcase
            zero=out==0;          //zeroͨ��ֱ���ж�out�Ƿ�Ϊ0
end
endtask
endmodule