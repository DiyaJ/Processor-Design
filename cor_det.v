module correction_detection(
input [31:0] data,
input [6:0] parity, 
output [31:0] sec_corrected_data,
output double_error,
output single_error 
);


wire [5:0] sec_corrected_parity;


SEC sec(data,parity[5:0],sec_corrected_data,sec_corrected_parity,single_error,error_location);
DED ded(single_error,sec_corrected_data,sec_corrected_parity,parity[6],double_error);

endmodule 