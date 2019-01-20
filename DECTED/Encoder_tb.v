`timescale 1ns / 1ps
module Encoder_TB();
reg [31:0] data;
wire [15:0] parity;

initial
 begin
  data = 32'h0;
  #5 
  data = 32'h1;
  #5 
  data = 32'h2;
  #5 
  data = 32'h3;
  #5 
  data = 32'h4;
 end 

store_module MUT(data, parity);  
 
endmodule 