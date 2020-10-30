`define n 12
`define pow2n 4096
`define order 18
`define length 19
`define len_idx 5

module testbench();
    logic [`n:0]         in;//Binary number
    logic                clock_s;// sampling clock
    logic [`n:0]         out;//Binary number
    logic                quit;
    BC_FIR myBC_FIR (.in,.clock_s,.out);

always begin
	#5000;
	clock_s=~clock_s;
    #5000;
end


initial begin
		//$vcdpluson;
		$monitor("Time:%4.0f  out:%b",
				$time,out);
		clock_s=0;
		quit = 0;
		quit <= #4096000 1;
		while(~quit) begin
		in = `n'b11;
		#500;
		in = in + `n'b100;
		end




        $finish;
	end

endmodule
