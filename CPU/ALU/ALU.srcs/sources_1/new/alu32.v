module alu32(
 reset, in0, in1, op, out, overflow, zero, carryout
    );
    input reset;               //reset用于初始化置零
    input[31:0] in0,in1;       //操作对象
    input[10:0] op;            //操作码
    output[31:0] out;         
    output overflow,zero,carryout;
    reg[31:0] out;
    reg overflow,zero,carryout;
always@(*)              
begin
     if(reset)           //初始化
         begin
          out=0;
          overflow=0;
          zero=0;
          carryout=0;
         end
     else
         alutask( in0, in1, op, out, overflow, zero, carryout);      //把具体功能模块封装成一个任务
end
task alutask;                  //任务定义
   input[31:0] in0,in1;       
   input[10:0] op;           
   output[31:0] out;         
   output overflow,zero,carryout;
   reg[31:0] out;
   reg overflow,zero,carryout;
begin
            overflow=0;            //每次进行不同的运算的时候，标志位需要置0
            carryout=0;
            case( op )
            11'b00000100000: 
                            begin
                            out=$signed(in0)+$signed(in1);                               //$signed是强制转换，把无符号数转为有符号数
                            overflow=in0[31]&in1[31] ^ in0[30]&in1[30];         //有符号数的溢出是通过overflow，判断条件为--最高位进位状态^次高位进位状态=1，则溢出。具体可百度。
                            end
            11'b00000100001: 
                            begin               //增加了判断语句，如果操作对象不是无符号数，则结果输出为不确定的值，下同
                            if(in0[31]==1||in1[31]==1)
                            out=32'bx;
                            else
                            {carryout,out}=$unsigned(in0)+$unsigned(in1);                             //无符号数的溢出通过进借位判断，这里使用用连接符{}，使得将carryout作为最高位与out连接在一起            
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
            zero=out==0;          //zero通过直接判断out是否为0
end
endtask
endmodule