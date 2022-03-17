module add;
// Data type declaration
reg [31:0]A;
reg [31:0]B;
reg Ci;
wire [31:0]S;
wire Co;

// MUX instance
full_add32 add32 (S,Co,A,B,Ci);
// Apply stimulus
initial
begin
A = 8'b00000001; B = 8'b00000001;Ci=0;
#5 A = A*2;
#5 B = B*2; 
#5 A = A*2;
#5 Ci=1;
#5 A=-1;B=1;Ci=0;
#5 Ci=1;
#5 $finish;
end
// Display results
endmodule