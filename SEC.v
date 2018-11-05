`timescale 1ns / 1ps
module SEC(
    input [31:0] data,
    input [5:0] parity,
    output reg [31:0] sec_corrected_data,
    output reg [5:0] sec_corrected_parity,
    output reg single_error,
    output reg[5:0] error_location
);
 wire select_done;
 reg [31:0] sec_data;
 reg [5:0] sec_parity;
 integer i;

      always @(*)
             begin
                sec_corrected_data = data;
                sec_corrected_parity = parity; 
                error_location[0] = parity[0] ^ data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[6] ^ data[8] ^ data[10] ^ data[11] ^ data[13] ^ data[15] ^ data[17] ^ data[19] 
                                           ^ data[21] ^ data[23] ^ data[25] ^ data[26] ^ data[28] ^ data[30];
                error_location[1] = parity[1] ^ data[0] ^ data[2] ^ data[3] ^ data[5] ^ data[6] ^ data[9] ^ data[10] ^ data[12] ^ data[13] ^ data[16] ^ data[17] ^ data[20]
                                           ^ data[21] ^ data[24] ^ data[25] ^ data[27] ^ data[28] ^ data[31];
                error_location[2] = parity[2] ^ data[1] ^ data[2] ^ data[3] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[14] ^ data[15] ^ data[16] ^ data[17] ^ data[22] 
                                           ^ data[23] ^ data[24] ^ data[25] ^ data[29] ^ data[30] ^ data[31];
                error_location[3] = parity[3] ^ data[4] ^ data[5] ^ data[6] ^ data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[18] ^ data[19] ^ data[20] ^ data[21] ^ data[22] 
                                           ^ data[23] ^ data[24] ^ data[25];
                error_location[4] = parity[4] ^ data[11] ^ data[12] ^ data[13] ^ data[14] ^ data[15] ^ data[16] ^ data[17] ^ data[18] ^ data[19] ^ data[20] ^ data[21] 
                                           ^ data[22] ^ data[23] ^ data[24] ^ data[25];
                error_location[5] = parity[5] ^ data[26] ^ data[27] ^ data[28] ^ data[29] ^ data[30] ^ data[31]; 
               
                 if(error_location == 1 || error_location ==2 || error_location ==4 || error_location ==8 || error_location ==16 ||  error_location == 32)
                    begin
                      for( i =0; i<=5; i = i+1)
                        begin
                         if(error_location[i] == 1)
                           begin
                           sec_corrected_parity[i] = ~parity[i];
                           end
                          
                        end 
                                             
                    end
                 else if (error_location == 0)
                    begin
                       
                    end  
                 else if (error_location<4)
                    begin
                    sec_corrected_data[(error_location -2)- 1] = ~ data[(error_location -2)- 1];  
                    end  
                 else if (error_location<8)
                    begin
                    sec_corrected_data[(error_location -3)- 1] = ~ data[(error_location -3)- 1];  
                    end  
                 else if (error_location<16)
                    begin
                    sec_corrected_data[(error_location -4)- 1] = ~ data[(error_location -4)- 1]; 
                    end  
                 else if (error_location<32)
                    begin
                    sec_corrected_data[(error_location -5)- 1] = ~ data[(error_location -5)- 1];  
                    end  

             single_error = error_location[0] | error_location[1] | error_location[2] | error_location[3] | error_location[4] | error_location[5] ;               
        
             end      
endmodule 