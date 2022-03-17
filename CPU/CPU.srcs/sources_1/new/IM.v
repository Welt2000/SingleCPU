`timescale 1ns / 1ps

module IM(
    input [31:0] Addr,   
    output [5:0] op,
    output [25:0]nextaddr,   
    output [4:0] rs, rt, rd,  
    output [15:0] inst0,
    output [5:0] funct
    );
    reg [31:0] mem[0:127];
    reg [31:0] address;
    reg [31:0] instruction;
    initial begin
        $readmemh("D:/instructions.txt", mem); // 从文件中读取16进制指令
        instruction = 0; // 指令初始化
    end

    always @(Addr) begin
         address = Addr[6:2] ; 
         instruction = mem[address];
    end
    // output  
    assign op = instruction[31:26];
    assign nextaddr=instruction[25:0];  
    assign rs = instruction[25:21];  
    assign rt = instruction[20:16];  
    assign rd = instruction[15:11];  
    assign inst0 = instruction[15:0];
    assign funct = instruction[5:0];

endmodule 