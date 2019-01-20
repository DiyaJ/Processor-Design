`timescale 1ns / 1ps
module Corrector_B(
    input [31:0] data_Cache,
    input [31:0] sgl_B_loc,
    output [31:0] corrected_data_B

);

assign corrected_data_B = data_Cache ^ sgl_B_loc;

endmodule 
