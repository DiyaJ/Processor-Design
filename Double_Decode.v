`timescale 1ns / 1ps
module Decode_dbl(
    input [6:0] Synd_A,
    input [7:0] Synd_B,
    output reg [31:0] dbl_loc 

);

always @(*)
     begin
     dbl_loc=0;
     
     if (Synd_A==48 && Synd_B==201)
        begin
        dbl_loc[0]=1;
        dbl_loc[1]=1;
        end 
     else if (Synd_A==120 && Synd_B==139)
        begin
        dbl_loc[0]=1;
        dbl_loc[2]=1;
        end   
     
     end
endmodule
