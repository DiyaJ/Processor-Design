module load_module(
	input [31:0] data_Cache,
	input [15:0] parity_Cache,
	output [31:0] corrected_data,
        output triple_error,             //stall the PC
        output single_double_error
);

wire [6:0] synd_A;
wire [7:0] synd_B;
wire parity_B;

wire [31:0] corrected_data_A;
wire [31:0] corrected_data_B;
wire [31:0] corrected_data_dbl;
 
wire [31:0] sgl_A_loc, sgl_B_loc, dbl_loc;

wire [1:0] select_data;

assign corrected_data = (select_data==3)?corrected_data_dbl:((select_data == 2)?corrected_data_B:((select_data==1)?corrected_data_A:data_Cache));


Synd synd(data_Cache, parity_Cache, synd_A, synd_B, parity_B);

Decode_A dec_A (synd_A, sgl_A_loc);
Decode_B dec_B (synd_B, sgl_B_loc);
Decode_dbl decode_dbl (synd_A, synd_B, dbl_loc);

control cntrl (synd_A, synd_B, sgl_A_loc, sgl_B_loc, parity_B, select_data, triple_error, single_double_error);

Corrector_A cor_A (data_Cache, sgl_A_loc, corrected_data_A);
Corrector_B cor_B (data_Cache, sgl_B_loc, corrected_data_B);
Corrector_double cor_dbl (data_Cache, dbl_loc, corrected_data_dbl);

endmodule 