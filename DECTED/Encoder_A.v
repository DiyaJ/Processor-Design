`timescale 1ns / 1ps
module Parity_Encoder_A(
    input [31:0] data,
    output [6:0] parity
);

begin
                assign parity[0] = data[0] ^ data[1] ^ data[2] ^ data[3] ^ data[4] ^ data[5] ^ data[6] ^ data[7] ^ data[14] ^ data[19] ^ data[22] ^ data[24] ^ data[30] ^ data[31];
                assign parity[1] = data[4] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[11] ^ data[12] ^ data[13] ^ data[14] ^ data[15] ^ data[18] ^ data[21] ^ data[24] ^ data[29];
                assign parity[2] = data[3] ^ data[11] ^ data[16] ^ data[17] ^ data[18] ^ data[19] ^ data[20] ^ data[21] ^ data[22] ^ data[23] ^ data[26] ^ data[27] ^ data[29] ^ data[30];
                assign parity[3] = data[2] ^ data[6] ^ data[10] ^ data[13] ^ data[15] ^ data[16] ^ data[24] ^ data[25] ^ data[26] ^ data[27] ^ data[28] ^ data[29] ^ data[30] ^ data[31];
                assign parity[4] = data[1] ^ data[2] ^ data[5] ^ data[7] ^ data[9] ^ data[12] ^ data[15] ^ data[20] ^ data[21] ^ data[22] ^ data[23] ^ data[25] ^ data[26] ^ data[28];
                assign parity[5] = data[0] ^ data[5] ^ data[6] ^ data[8] ^ data[12] ^ data[13] ^ data[14] ^ data[16] ^ data[17] ^ data[18] ^ data[19] ^ data[20] ^ data[28]; 
                assign parity[6] = data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[8] ^ data[9] ^ data[10] ^ data[11] ^ data[17] ^ data[23] ^ data[25] ^ data[27] ^ data[31]; 
               
end      
     

endmodule
