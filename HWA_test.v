//`define n 2
//`define pow2n 4
//`define order 3
//`define length 4
//`define len_idx 2 // ceil(log2(4))=2

`define n 12
`define pow2n 4096
//`define order 18
//`define length 19
//`define len_idx 5 // ceil(log2(19))=5
//`define scale   2
//`define total_input_size `scale*`length


module testbench();
    logic [`n:0]     in;//Binary (the probability can be 1)
    logic            clock_d;// digital clock
    logic            clock_s;// sampling clock
    logic [`n:0]     out;//Binary
    logic            done;
	logic 			 quit;
// 	logic [`n-1:0]   sel_bits;
//	logic [`len_idx-1:0] idx;
//	logic [`n-1:0]       R_y;

	HWA myhwa(.in,.clock_d,.clock_s, .out,.done);


always begin
	#5;
	clock_d=~clock_d;
end

always begin
    #10;//5*4096
	clock_s=~clock_s;
	//#20465;
	#10;
	clock_s=~clock_s;
	//#`pow2n*10-20;
	#40940;
end

initial begin
		//$vcdpluson;
		$monitor("Time:%4.0f clock_s: %b  out:%d   done: %b",
				$time,clock_s,out,done);
		// time 0
		clock_d=0;
		clock_s=0;
		@(negedge clock_d);//10
		@(negedge clock_d);//10
		@(negedge clock_d);//10
		quit = 0;
		quit <= #4096000 1;
		while(~quit) begin
		in = `n'b11;
		#80;
		in = in + `n'b100;
		end

		$finish;
	end

endmodule
