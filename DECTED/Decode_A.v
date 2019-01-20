`timescale 1ns / 1ps
module Decode_A(
    input [6:0] Synd_A,
    output reg [31:0] sgl_A_loc 

);

always @(*)
     begin
     sgl_A_loc=0;
     
     if (Synd_A == 0)
        begin
        end      

     else if (Synd_A==97)
        begin
        sgl_A_loc[0]=1;
        end 
     else if (Synd_A==81)
        begin
        sgl_A_loc[1]=1;
        end   
     else if (Synd_A==25)
        begin
        sgl_A_loc[2]=1;
        end 
     else if (Synd_A==69)
        begin
        sgl_A_loc[3]=1;
        end 
     else if (Synd_A==67)
        begin
        sgl_A_loc[4]=1;
        end 
     else 
        begin 
        sgl_A_loc = 4'b1111;
        end
     end
endmodule
