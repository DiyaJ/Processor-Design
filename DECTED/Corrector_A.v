`timescale 1ns / 1ps
module Corrector_A(
    input [31:0] data_Cache,
    input [31:0] sgl_A_loc,
    output [31:0] corrected_data_A

);

assign corrected_data_A = data_Cache ^ sgl_A_loc;

endmodule 