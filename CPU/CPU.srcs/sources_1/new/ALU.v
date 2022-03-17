module ALU(
    // ��������ͨ·ͼ�������е��������
    input [31:0] A, 
    input [31:0] B,
    input [2:0] ALUCtrl,
    output reg zero,
    output reg [31:0] result
    );
    always @(A or B or ALUCtrl)  
        begin  
             case(ALUCtrl)
             // ����ALUOpʵ����Ӧ������
                    3'b100: begin  //ADD
                        result = A + B;  
                        zero = (result == 0)? 1 : 0;  
                    end  
                    3'b110: begin  //SUB
                        result = A - B;  
                        zero = (result == 0)? 1 : 0;  
                    end  
                    3'b101: begin  //ADDU
                        result = A + B;  
                        zero = (result == 0)? 1 : 0;  
                    end  
                    3'b000: begin //AND 
                        result = A & B;  
                        zero = (result == 0)? 1 : 0;  
                    end  
                    3'b001: begin  //OR
                        result = A | B;  
                        zero = (result == 0)? 1 : 0;  
                    end  
                    3'b011: begin  //�Ƚ�
                        result = (A < B) ? 1 : 0;  
                        zero = (result == 0)? 1 : 0;  
                    end   
             endcase  
         end  
endmodule 