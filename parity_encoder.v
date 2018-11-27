`timescale 1ns / 1ps
module parity_encoder(
    input [31:0] data,
    output [5:0] parity,
    output parity_DED
);

begin
                assign parity[0] = data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[6] ^ data[8] ^ data[10] ^ data[11] ^ data[13] ^ data[15] ^ data[17] ^ data[19] 
                                   ^ data[21] ^ data[23] ^ data[25] ^ data[26] ^ data[28] ^ data[30];
                assign parity[1] = data[0] ^ data[2] ^ data[3] ^ data[5] ^ data[6] ^ data[9] ^ data[10] ^ data[12] ^ data[13] ^ data[16] ^ data[17] ^ data[20]
                                   ^ data[21] ^ data[24] ^ data[25] ^ data[27] ^ data[28] ^ data[31];
                assign parity[2] = data[1] ^ data[2] ^ data[3] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[14] ^ data[15] ^ data[16] ^ data[17] ^ data[22] 
                                   ^ data[23] ^ data[24] ^ data[25] ^ data[29] ^ data[30] ^ data[31];
                assign parity[3] = data[4] ^ data[5] ^ data[6] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[18] ^ data[19] ^ data[20] ^ data[21] ^ data[22] 
                                   ^ data[23] ^ data[24] ^ data[25];
                assign parity[4] = data[11] ^ data[12] ^ data[13] ^ data[14] ^ data[15] ^ data[16] ^ data[17] ^ data[18] ^ data[19] ^ data[20] ^ data[21] 
                                   ^ data[22] ^ data[23] ^ data[24] ^ data[25];
                assign parity[5] = data[26] ^ data[27] ^ data[28] ^ data[29] ^ data[30] ^ data[31]; 
                assign parity_DED = data[0] ^ data[1] ^ data[2] ^ data[3] ^ data[4] ^ data[5] ^ data[6] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[11] ^ data[12] ^ data[13] 
                                   ^ data[14] ^ data[15] ^ data[16] ^ data[17] ^ data[18] ^ data[19] ^ data[20] ^ data[21] ^ data[22] ^ data[23] ^ data[24] ^ data[25] ^ data[26] ^ data[27] ^ data[28] ^ data[29] ^ data[30] ^ data[31] ^ parity[0] ^ parity[1] ^ parity[2] ^ parity[3] ^ parity[4] ^ parity[5];
end      
     

endmodule
