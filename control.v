`timescale 1ns / 1ps
module control(
    input [6:0] Synd_A,
    input [7:0] Synd_B,
    input [31:0] sgl_A_loc,
    input [31:0] sgl_B_loc,
    input par_b,
    output reg [2:0] select_data,
    output reg triple_error 

);
wire sgl_tpl, lb0;
reg [3:0] number_A, number_B;

assign sgl_tpl = (sgl_A_loc == sgl_B_loc)?0:1;
assign lb0 = (sgl_B_loc == 0)?1:0;


always @(*)
     begin
     number_A = Synd_A[0] + Synd_A[1] + Synd_A[2] + Synd_A[3] + Synd_A[4] + Synd_A[5] + Synd_A[6];
     number_B = Synd_B[0] + Synd_B[1] + Synd_B[2] + Synd_B[3] + Synd_B[4] + Synd_B[5] + Synd_B[6] + Synd_B[7];

     triple_error = 0;
     //no error
     if (number_A == 0 && number_B == 0 && par_b == 0 && sgl_tpl == 0 && lb0 == 0)
        begin
        select_data = 2'b0;
        end 
     //single error
     else if (number_A == 3 && number_B == 3 && par_b == 0 && sgl_tpl == 0 && lb0 == 0)
        begin
        select_data = 2'b1;
        end 
     //double error
     else if ((number_A == 2 || number_A == 4 || number_A == 6 )&& (number_B == 2 || number_B == 4 || number_B == 6 ) && par_b == 0 )
        begin
        select_data = 2'b11;
        end
     //triple error
     else if (number_A == 3 && number_B == 3 && lb0 ==1 )
        begin
        triple_error = 1;
        end 
    //triple error
     else if (( number_A == 0 || number_A == 1 || number_A == 3 || number_A == 5 || number_A == 7 || number_A == 9 ) && ( number_B == 0 || number_B == 1 || number_B == 3 || number_B == 5 || number_B == 7 || number_B == 9 ) && sgl_tpl == 1 )
        begin
        triple_error = 1;
        end 

     end
endmodule 