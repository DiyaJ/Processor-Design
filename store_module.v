module store_module(
input [31:0] data_PC,
input special_store_PC,
output [31:0] data_Cache,
output [6:0] parity_Cache,
output special_store_Cache

);

wire[5:0] encoder_parity;
wire encoder_parity_DED;

assign data_Cache = data_PC;
assign special_store_Cache = special_store_PC;
assign parity_Cache[5:0] = encoder_parity;
assign parity_Cache[6] = encoder_parity_DED;

Parity_Encoder parity_encoder (data_PC,encoder_parity,encoder_parity_DED);

endmodule
