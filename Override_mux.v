module Override_mux_load(
input [31:0] raw_data,
input [31:0] EC_data,
input special_load,          
output [31:0] data
);

assign data = special_load ? raw_data : EC_data;

endmodule   