`timescale 1ns / 1ps
module Load_TB();
reg [31:0] data;
reg [6:0] parity;
reg special_load;
wire [31:0] sec_corrected_data;
wire [6:0] sec_corrected_parity;
wire DED_exception;
wire single_error;

initial 
 begin
special_load = 1'b0;
 
//double_error 
// correct_data 32'h0 
 data = 32'h3;
 parity = 7'b000;
 #5 
 //single_error
 // correct_parity 6'h0 
 data = 32'h0;
 parity = 7'b001;
 #5 
 //single_error
 // correct_parity 6'h3 
 data = 32'h1;
 parity = 7'b1000010;
 #5 
 //single_error
 // correct_parity 6'h5
 data = 32'h6;
 parity = 7'b1000101;
 #5 
//no_error
 // correct_parity 6'h5
 data = 32'h2;
 parity = 7'b1000101;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h2;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h4;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h8;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h10;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h20;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h40;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h80;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h100;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h200;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h400;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h800;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h1000;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h2000;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h4000;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h8000;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h10000;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h20000;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h40000;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 32'h80000;
 parity = 7'b000;
 #5
 //single_error
 // correct_data 32'h0 
 data = 1<<32'h080000;
 
 end 

load_module MUT(data, parity, special_load, sec_corrected_data, sec_corrected_parity, DED_exception,  single_error);  
 
endmodule 
