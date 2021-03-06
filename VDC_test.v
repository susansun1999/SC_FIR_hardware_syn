`define n 2
`define pow2n 4
`define order 3
`define length 4
`define len_idx 2 // ceil(log2(4))=2

module testbench();
    logic reset, clock;
    logic [`n-1:0] out,out_re;

	VDC myvdc( .reset, .clock,.out_re, .out);


always begin
		#5;
		clock=~clock;
end

initial begin
		//$vcdpluson;
		$monitor("Time:%4.0f reset:%b out_re:%b out:%b",
				$time,reset,out_re,out);
		clock=0;

		@(negedge clock);
		reset=1;
		@(negedge clock);
        reset = 0;
		@(negedge clock);
		@(negedge clock);
		reset = 1;
		@(negedge clock);
		reset = 0;
		@(negedge clock);
		@(negedge clock);
		@(negedge clock);
		@(negedge clock);
		@(negedge clock);
		@(negedge clock);

		$finish;
	end

endmodule
