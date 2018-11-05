`timescale 1ns / 1ps
module COR_DET_TB();
reg [31:0] data;
reg [6:0] parity;
wire [31:0] sec_corrected_data;
wire single_error;
wire double_error;

initial 
 begin
 // correct_data 32'h0 
 data = 32'h1;
 parity = 7'b000;
 #5 
// correct_data 32'h0 
 data = 32'h3;
 parity = 7'b000;
 #5 
 // correct_parity 6'h0 
 data = 32'h0;
 parity = 7'b001;
 #5 
 // correct_parity 6'h3 
 data = 32'h1;
 parity = 7'b010;
 #5 
 // correct_parity 6'h5
 data = 32'h2;
 parity = 7'b001;
 end 

correction_detection MUT(data, parity, sec_corrected_data, double_error,  single_error);  
 
endmodule 