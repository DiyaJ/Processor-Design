`timescale 1ns / 1ps
module SEC(
    input enable,
    input [31:0] data,
    input [6:0] parity_bits,
    output[31:0] sec_corrected_data,
    output[6:0] sec_corrected_parity,
    output single_error,
    output [6:0] error_location
);

    

    always @(*)
        begin
            if (enable == 1'b1)
                assign error_location[0] = parity_bits[0] xor data[0] xor data[1] xor data[3] xor data[4] xor data[6] xor data[8] xor data[10] xor data[11] xor data[13] xor data[15] xor data[17] xor data[19] xor data[21] xor data[23] xor data[25] xor data[26] xor data[28] xor data[30];
                assign error_location[1] = parity_bits[1] xor data[0] xor data[2] xor data[3] xor data[5] xor data[6] xor data[9] xor data[10] xor data[12] xor data[13] xor data[16] xor data[17] xor data[20] xor data[21] xor data[24] xor data[25] xor data[27] xor data[28] xor data[31];
                assign error_location[2] = parity_bits[2] xor data[1] xor data[2] xor data[3] xor data[7] xor data[8] xor data[9] xor data[10] xor data[14] xor data[15] xor data[16] xor data[17] xor data[22] xor data[23] xor data[24] xor data[25] xor data[29] xor data[30] xor data[31];
                assign error_location[3] = parity_bits[3] xor data[4] xor data[5] xor data[6] xor data[7] xor data[8] xor data[9] xor data[10] xor data[18] xor data[19] xor data[20] xor data[21] xor data[22] xor data[23] xor data[24] xor data[25];
                assign error_location[4] = parity_bits[4] xor data[11] xor data[12] xor data[13] xor data[14] xor data[15] xor data[16] xor data[17] xor data[18] xor data[19] xor data[20] xor data[21] xor data[22] xor data[23] xor data[24] xor data[25];
                assign error_location[5] = parity_bits[5] xor data[26] xor data[27] xor data[28] xor data[29] xor data[30] xor data[31]; 
                assign error_location[6] = parity_bits[6] xor data[0] xor data[1] xor data[3] xor data[4] xor data[6] xor data[7] xor data[8] xor data[9] xor data[10] xor data[11] xor data[12] xor data[13] xor data[14] xor data[15] xor data[16] xor data[17] xor data[18] xor data[19] xor data[20] xor data[21] xor data[22] xor data[23] xor data[24] xor data[25] xor data[26] xor data[27] xor data[28] xor data[29] xor data[30] xor data[31] xor parity[8] ;

             
                assign single_error = error_location[0] and error_location[1] and error_location[2] and error_location[3] and error_location[4] and error_location[5] and error_location[6]               
                
               // correct the data
             
                
        end   
        
    
    
endmodule
