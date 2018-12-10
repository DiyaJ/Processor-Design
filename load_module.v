module load_module(
input [31:0] data_Cache,
input [6:0] parity_Cache,
output [31:0] data_PC,
output [6:0] EC_parity,
output DED_exception,
output single_error
);

correction_detection cor_det(
    data_Cache,
    parity_Cache,
    data_PC,
    EC_parity,
    DED_exception,
    single_error);

endmodule