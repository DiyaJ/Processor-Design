module Synd(
        input [31:0] data_Cache,
        input [15:0] parity_Cache,
        output [6:0] synd_A,
        output [7:0] synd_B,
        output par_b

);

wire[6:0] chk_A_Cache;
wire[7:0] chk_B_Cache;
wire[6:0] encoded_A;
wire[7:0] encoded_B;
wire parity_B_Cache;

begin
    assign chk_A_Cache = parity_Cache[6:0];
    assign chk_B_Cache = parity_Cache[14:7];
    assign parity_B_Cache = parity_Cache[15];

    Parity_Encoder_A chk_encoder_A (data_Cache,encoded_A);
    Parity_Encoder_B chk_encoder_B (data_Cache,encoded_B);


    assign synd_A = encoded_A ^ chk_A_Cache;
    assign synd_B = encoded_B ^ chk_B_Cache;
    assign par_b = chk_B_Cache[0] ^ chk_B_Cache[1] ^ chk_B_Cache[2] ^ chk_B_Cache[3] ^ chk_B_Cache[4] ^ chk_B_Cache[5] ^ chk_B_Cache[6] ^ chk_B_Cache[7] ^ parity_B_Cache;
end


endmodule
