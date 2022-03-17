`timescale 1ns / 1ps

module ram(
clk,
address,
data,
cs,
we,
oe
    );

parameter DATA_WIDTH=32;
parameter ADDR_WIDTH=8;
parameter RAM_DEPTH=1<<ADDR_WIDTH;
//INPUT
input clk;
input [ADDR_WIDTH-1:0]address;
input cs;
input we;
input oe;

//inout
inout [DATA_WIDTH-1:0] data;

//internal
reg [DATA_WIDTH-1:0] data_out;
reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];
//code
assign data=(cs&&oe&&!we)?data_out:8'bz;//data_out->data reg->wire
always @(posedge clk)
begin : MEM_WRITE
    if(cs&&we) begin
        mem[address]=data;
    end
end
always @(negedge clk)
begin : MEM_READ
    if(cs&&!we&&oe) begin
        data_out=mem[address];
    end
end
endmodule