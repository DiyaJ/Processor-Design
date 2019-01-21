`timescale 1ns / 1ps
module Load_TB();
reg [31:0] data;
reg [15:0] parity;
wire [31:0] corrected_data;
wire triple_error;

initial 
 begin
 
//single_error 
// correct_data 32'h0 
 data = 32'h1;
 parity = 4'h0;
 #5 
 //single_error
 // correct_data 32'h0 
 data = 32'h2;
 parity = 4'h0;
 #5 
 //single_error
 // correct_data 32'h0  
 data = 32'h4;
 parity = 4'h0;
 #5  
//double_error
 // correct_data 32'h0  
 data = 32'h5;
 parity = 4'h0;
 #5
//double_error
 // correct_data 32'h0  
 data = 32'h3;
 parity = 4'h0;
 #5
//triple_error
 // correct_data 32'h0  
 data = 32'h7;
 parity = 4'h0;

 
 end 

load_module MUT(data, parity, corrected_data, triple_error, single_double_error);  
 
endmodule