module decode3_8(data_in,data_out);
      
        input[2:0] data_in;           //¶Ë¿ÚÉùÃ÷
        output[7:0] data_out;   
        reg[7:0] data_out;
         
always@(data_in) 
   begin 
        case(data_in)
                 3'd0:data_out = 8'b0000_0001;
                 3'd1:data_out = 8'b0000_0010;
                 3'd2:data_out = 8'b0000_0100;
                 3'd3:data_out = 8'b0000_1000;
                 3'd4:data_out = 8'b0001_0000;
                 3'd5:data_out = 8'b0010_0000;
                 3'd6:data_out = 8'b0100_0000;
                 3'd7:data_out = 8'b1000_0000;
         endcase
     end
     
endmodule
