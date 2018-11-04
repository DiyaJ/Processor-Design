`timescale 1ns / 1ps
module SEC_TB();
reg [31:0] data;
reg [5:0] parity;
wire [31:0] sec_data;
wire [5:0] sec_parity;
wire single_error;
wire [5:0] error_location;

initial begin
data = 32'h1;
parity = 6'b000;
#5 
data = 32'h0;
parity = 6'b001;
#5 
data = 32'h1;
parity = 6'b010;
#5 
data = 32'h2;
parity = 6'b001;
end 

SEC MUT(data, parity, sec_data, sec_parity, single_error, error_location);  
 
endmodule 
