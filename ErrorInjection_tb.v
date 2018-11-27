`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:21:07 12/29/2016 
// Design Name: 
// Module Name:    SimpleMIPS_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "macros.v"
module ErrorInjection_tb(
    );
	 
	 localparam		integer		NUM = 64;
	 localparam     integer     RAM_NUM = 64;
	 
	 reg 				    clk, rst;
	 reg [31:0]				instructions [NUM - 1:0];
	 wire [31:0] 			instruction;
	 wire [31:0] 			pc;
	 wire [12:0]	        user_addr;
	 reg                   user_we;
	 reg [31:0]            user_din;
	 wire signed [31:0]	   user_dout;
	 integer 				index;
	 integer                srand;
	 integer                cosumed_time;
	 reg [20:0]  addr_tag;
     reg [5:0]   addr_index;
     reg [2:0]   addr_offset;
     wire [31:0] addr;
     // EDC ports
     reg                  error_dwe;
     reg                  error_pwe;
     reg [31:0]           error_din;
     reg [6:0]            error_pin;
     reg [8:0]           error_addr;
	 
	 assign instruction = instructions[ pc>>2 ];
	 
	 /* set the address */
	 assign addr = {addr_tag, addr_index, addr_offset, 2'b00};
	 assign user_addr = addr[14:2];
	 
	 always #5 clk = ~clk;
	 

	 initial
	 begin
		clk = 1;
		rst = 1;
		user_we = 0;
		user_din = 0;
		index = 0;
		error_dwe = 1'd0;
        error_pwe = 1'd0;
		
//`ifdef _RAM_INIT__
		srand = 898989;
		/* write some data to the Main Memory */
		#5;
		for( index = 0; index < 20; index = index + 1)
		begin
		addr_tag = 21'd0; addr_index = index/8; addr_offset = index%8; 
		user_din = {$random(srand)}%50 + 1; 
		user_we = 1;
		#10;
		end
		user_we = 0;
//`endif
		
		instructions[9] = 32'd0;
		instructions[10] = 32'd0;
		instructions[11] = 32'd0;
		instructions[12] = 32'd0;
		instructions[13] = 32'd0;
		instructions[14] = 32'd0;
		instructions[15] = 32'd0;
		instructions[16] = 32'd0;
		instructions[17] = 32'd0;
		instructions[18] = 32'd0;
		
		//read the First TESTBENCH
		//Just stores
		$readmemb("/home/marc/MIRI/PD/project/MIPS/TestBenchs/errorTestbench1.txt", instructions);

		repeat(3) @(posedge clk)
		#1;
		rst = 0;
		
		/* wait for the NOP instruction */
		wait( instruction == `NOP);
		/* wait for the testbench to be finished */
		repeat(5) @(posedge clk);
		
		
		/* Write the errors in the cache */
		/* M[0] will not have errors */
		
		/* Change 1 bit of the data (M[1] <- 3) */
		error_dwe = 1'd1;
		error_pwe = 1'd0;
		error_din = 32'd3;
		error_pin = 7'd0;
		error_addr = 9'd1;
		repeat(1) @(posedge clk)
		
		/* Change 1 bit of the parity bits (M_p[2] <- 0000111) */
        error_dwe = 1'd0;
        error_pwe = 1'd1;
        error_din = 32'd3;
        error_pin = 7'b0000111;
        error_addr = 9'd2;
        repeat(1) @(posedge clk)
        
        /* Change 2 bits */
        /* M[3] <- 5) */
        /* M_p[3] <- 1000111) */
        error_dwe = 1'd1;
        error_pwe = 1'd1;
        error_din = 32'd5;
        error_pin = 7'b1000111;
        error_addr = 9'd3;
        repeat(1) @(posedge clk)
		
		error_dwe = 1'd0;
        error_pwe = 1'd0;
        error_din = 32'd3;
        error_pin = 7'd0;
        error_addr = 9'd0;
		repeat(1) @(posedge clk)
		
		/* Read the Secon TESTBENCH
		/* Just loads */
		$readmemb("/home/marc/MIRI/PD/project/MIPS/TestBenchs/errorTestbench2.txt", instructions, 19);
        repeat(3) @(posedge clk)
        #1;
		/* wait for the NOP instruction */
        wait( instruction == `NOP);
        /* wait for the testbench to be finished */
        repeat(5) @(posedge clk);
	 end
	 
	 PipelineMIPS PipelineMIPS_inst (
    .clk(clk), 
    .rst(rst), 
    .pc(pc), 
    .instruction(instruction),
	 .user_addr( user_addr ),
	 .user_we( user_we ),
	 .user_din( user_din ),
	 .user_dout( user_dout ),
	 .error_dwe( error_dwe ),
	 .error_pwe( error_pwe ),
     .error_din( error_din ),
     .error_pin( error_pin ),
     .error_addr( error_addr )
    );


endmodule
