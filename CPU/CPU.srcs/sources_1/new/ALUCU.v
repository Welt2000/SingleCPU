`timescale 1ns / 1ps
module ALUCU(//通过Op，ALUOp，Funct确定ALUCtrl
input [5:0]OpCode,
input [1:0]ALUOp,
input [5:0]Funct,
output reg[2:0]ALUCtrl
    );
    always @(ALUOp or Funct or OpCode)
    begin
    case(ALUOp)
        2'b00:begin
            ALUCtrl<=3'b100;
            end
        2'b01:begin
            ALUCtrl<=3'b110;
            end
        2'b10:begin
            case(Funct)
                6'b100000:begin
                ALUCtrl<=3'b100;
                end
                6'b100001:begin
                ALUCtrl<=3'b101;
                end
                6'b100010:begin
                ALUCtrl<=3'b110;
                end
                6'b100100:begin
                ALUCtrl<=3'b000;
                end
                6'b100101:begin
                 ALUCtrl<=3'b001;
                end
                6'b101010:begin
                ALUCtrl<=3'b011;
                end
             endcase
                end
         2'b11:begin
         case(OpCode)
            6'b001000:begin
            ALUCtrl<=3'b100;
            end
            6'b001101:begin
            ALUCtrl<=3'b001;
            end
            6'b000100:begin
            ALUCtrl<=3'b110;
            end
            endcase
            end
    endcase
end
endmodule
