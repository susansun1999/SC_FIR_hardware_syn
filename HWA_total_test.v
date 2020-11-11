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
    logic            clock;// digital clock
    logic [(`n+1)*4-1:0]  out;//Binary
	logic 			 quit;
	logic			 start;
// 	logic [`n-1:0]   sel_bits;
//	logic [`len_idx-1:0] idx;
//	logic [`n-1:0]       R_y;

	HWA_total my_HWA_total(.in(in), .start(start), .clock(clock), .out(out));


always begin
	#5;
	clock=~clock;
end


initial begin
		//$vcdpluson;
		$monitor("Time:%4.0f out[0]:%d out[3]:%d",
				$time,out[`n:0],out[4*(`n+1)-1:3*(`n+1)]);
		// time 0
		clock=0;
		@(negedge clock);//10
		@(negedge clock);//10
		in = `n'b11;
		start = 1;
		@(negedge clock);//10
		start = 0;
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
