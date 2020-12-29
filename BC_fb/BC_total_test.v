`define n 8
`define pow2n 256
`define order 18
`define length 19
`define len_idx 5 // ceil(log2(19))=5


module testbench();
    logic [`n-1:0]         in;//Binary number
    logic                clock;// sampling clock
    logic [`n*4-1:0] out;//Binary number
	logic				 reset;
	logic quit;

    BC_total myBC_total (.in,.reset,.clock,.out);

always begin
	#500;
	clock=~clock;
end
// the clock cycle is 1000

initial begin
		//$vcdpluson;
		$monitor("Time:%4.0f out:%d",
				$time,out);
		clock=0;
		quit = 0;
		@(negedge clock);//10
		reset = 1;
		quit <= #400000 1;
		@(negedge clock);//10
		reset = 0;
		while(~quit) begin
		in = `n'b11;
		#40000;
		in = in + `n'b100;
		end




        $finish;
	end

endmodule
