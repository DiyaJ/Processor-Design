`timescale 1ns / 1ps
module Corrector_double(
    input [31:0] data_Cache,
    input [31:0] dbl_loc,
    output [31:0] corrected_data_dbl

);

assign corrected_data_dbl = data_Cache ^ dbl_loc;

endmodule 
