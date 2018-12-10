module load_module(
input [31:0] data_Cache,
input [6:0] parity_Cache,
input special_load_PC,
output [31:0] data_PC,
output [6:0] EC_parity,
output DED_exception,
output single_error
);

wire [31:0] EC_data;
wire double_error;
 

assign DED_exception = double_error;

Override_mux_load override_mux_load (data_Cache,EC_data,special_load_PC,data_PC);
correction_detection cor_det (data_Cache,parity_Cache,EC_data,EC_parity,double_error,single_error);

endmodule 