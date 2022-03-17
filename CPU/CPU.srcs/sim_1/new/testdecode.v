
`timescale 1ns / 1ps
 module testdecode; // declare testbench name
  reg clock;
  reg [2:0] add_count;
  wire[7:0] decode;
  
  initial begin
  clock = 0;
  add_count = 0;
  repeat(16) #50
      begin
        clock <= ~clock;
        add_count <= add_count + 1;
      end
  $stop;
  end
  
  decode3_8 d38(add_count,decode);
 endmodule
