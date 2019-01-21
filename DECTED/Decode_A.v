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
     else if (Synd_A==49)
        begin
        sgl_A_loc[5]=1;
        end 
     else if (Synd_A==41)
        begin
        sgl_A_loc[6]=1;
        end 
    else if (Synd_A==19)
        begin
        sgl_A_loc[7]=1;
        end 
    else if (Synd_A==98)
        begin
        sgl_A_loc[8]=1;
        end
    else if (Synd_A==82)
        begin
        sgl_A_loc[9]=1;
        end 
    else if (Synd_A==74)
        begin
        sgl_A_loc[10]=1;
        end 
    else if (Synd_A==70)
        begin
        sgl_A_loc[11]=1;
        end 
    else if (Synd_A==50)
        begin
        sgl_A_loc[12]=1;
        end  
    else if (Synd_A==42)
        begin
        sgl_A_loc[13]=1;
        end  
    else if (Synd_A==35)
        begin
        sgl_A_loc[14]=1;
        end  
    else if (Synd_A==26)
        begin
        sgl_A_loc[15]=1;
        end  
    else if (Synd_A==44)
        begin
        sgl_A_loc[16]=1;
        end 
    else if (Synd_A==100)
        begin
        sgl_A_loc[17]=1;
        end  
    else if (Synd_A==38)
        begin
        sgl_A_loc[18]=1;
        end 
    else if (Synd_A==37)
        begin
        sgl_A_loc[19]=1;
        end  
    else if (Synd_A==52)
        begin
        sgl_A_loc[20]=1;
        end    
     else 
        begin 
        sgl_A_loc = 4'b1111;
        end
     end
endmodule
