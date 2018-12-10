`timescale 1ns / 1ps
module DED(
input [31:0] data,                   //sec_corrected_data
input [5:0] parity,                  //sec_corrected_parity
input parity_DED,
output double_error
);


assign double_error = parity_DED ^ data[0] ^ data[1] ^ data[2] ^ data[3] ^ data[4] ^ data[5] ^ data[6] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[11] ^ data[12] ^ data[13] 
                                   ^ data[14] ^ data[15] ^ data[16] ^ data[17] ^ data[18] ^ data[19] ^ data[20] ^ data[21] ^ data[22] ^ data[23] ^ data[24] ^ data[25] ^ data[26] ^ data[27] ^ data[28] ^ data[29] ^ data[30] ^ data[31] ^ parity[0] ^ parity[1] ^ parity[2] ^ parity[3] ^ parity[4] ^ parity[5];



endmodule 