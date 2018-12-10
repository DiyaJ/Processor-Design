module correction_detection(
input [31:0] data,
input [6:0] parity, 
output [31:0] sec_corrected_data,
output [6:0] sec_corrected_parity,   
output double_error,
output single_error 
);

wire [5:0] error_location;

assign sec_corrected_parity[6] = parity[6];

SEC sec(data,parity[5:0],sec_corrected_data,sec_corrected_parity [5:0],single_error,error_location);
DED ded(sec_corrected_data,sec_corrected_parity [5:0],parity[6],double_error);

endmodule 