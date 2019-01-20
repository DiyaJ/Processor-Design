`timescale 1ns / 1ps
module Decode_B(
    input [7:0] Synd_B,
    output reg [31:0] sgl_B_loc 

);

always @(*)
     begin
     sgl_B_loc=0;

     if (Synd_B == 0)
        begin
        end 
     if (Synd_B == 152)
        begin
        sgl_B_loc[0]=1;
        end 
     else if (Synd_B==81)
        begin
        sgl_B_loc[1]=1;
        end   
     else if (Synd_B==19)
        begin
        sgl_B_loc[2]=1;
        end 
     else if (Synd_B==208)
        begin
        sgl_B_loc[3]=1;
        end 
     else if (Synd_B==49)
        begin
        sgl_B_loc[4]=1;
        end 
     else 
       begin
       sgl_B_loc = 4'b0111;
       end
     end
endmodule
