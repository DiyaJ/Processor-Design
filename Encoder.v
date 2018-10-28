`timescale 1ns / 1ps
module Parity_Encoder(
    input enable,
    input [31:0] data,
    output[39:0] encoded_data,
);

    wire parity[6:0];
    
    always @(posedge clk)
        begin
            if (enable == 1'b1)
                assign parity[0] = data[0] xor data[1] xor data[3] xor data[4] xor data[6] xor data[8] xor data[10] xor data[11] xor data[13] xor data[15] xor data[17] xor data[19] xor data[21] xor data[23] xor data[25] xor data[26] xor data[28] xor data[30];
                assign parity[1] = data[0] xor data[2] xor data[3] xor data[5] xor data[6] xor data[9] xor data[10] xor data[12] xor data[13] xor data[16] xor data[17] xor data[20] xor data[21] xor data[24] xor data[25] xor data[27] xor data[28] xor data[31];
                assign parity[2] = data[1] xor data[2] xor data[3] xor data[7] xor data[8] xor data[9] xor data[10] xor data[14] xor data[15] xor data[16] xor data[17] xor data[22] xor data[23] xor data[24] xor data[25] xor data[29] xor data[30] xor data[31];
                assign parity[3] = data[4] xor data[5] xor data[6] xor data[7] xor data[8] xor data[9] xor data[10] xor data[18] xor data[19] xor data[20] xor data[21] xor data[22] xor data[23] xor data[24] xor data[25];
                assign parity[4] = data[11] xor data[12] xor data[13] xor data[14] xor data[15] xor data[16] xor data[17] xor data[18] xor data[19] xor data[20] xor data[21] xor data[22] xor data[23] xor data[24] xor data[25];
                assign parity[5] = data[26] xor data[27] xor data[28] xor data[29] xor data[30] xor data[31]; 
                assign parity[6] = data[0] xor data[1] xor data[3] xor data[4] xor data[6] xor data[7] xor data[8] xor data[9] xor data[10] xor data[11] xor data[12] xor data[13] xor data[14] xor data[15] xor data[16] xor data[17] xor data[18] xor data[19] xor data[20] xor data[21] xor data[22] xor data[23] xor data[24] xor data[25] xor data[26] xor data[27] xor data[28] xor data[29] xor data[30] xor data[31] xor parity[8] ;
                


        end   
        
    //assign q = q_out;
    
endmodule
