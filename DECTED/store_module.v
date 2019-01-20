module store_module(
input [31:0] data_PC,
output [15:0] parity_Cache
);

wire[6:0] chk_encoder_A;
wire[7:0] chk_encoder_B;
wire parity_B;

assign parity_Cache[6:0] = chk_encoder_A;
assign parity_Cache[14:7] = chk_encoder_B;
assign parity_Cache[15] = parity_B;

Parity_Encoder_A encoder_A (data_PC,chk_encoder_A);
Parity_Encoder_B encoder_B (data_PC,chk_encoder_B);

assign parity_B = chk_encoder_B[0] ^ chk_encoder_B[1] ^ chk_encoder_B[2] ^ chk_encoder_B[3] ^ chk_encoder_B[4] ^ chk_encoder_B[5] ^ chk_encoder_B[6] ^ chk_encoder_B[7];

endmodule
