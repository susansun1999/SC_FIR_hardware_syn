`define n 12
`define pow2n 4096
`define order 18
`define length 19
`define len_idx 5 // ceil(log2(19))=5


module testbench();
    logic [`n:0]         in;//Binary number
    logic                clock;// sampling clock
    logic [(`n+1)*4-1:0] out;//Binary number
	logic quit;
    BC_total myBC_total (.in,.clock,.out);

always begin
	#5000;
	clock=~clock;
    #5000;
end


initial begin
		//$vcdpluson;
		$monitor("Time:%4.0f out:%d",
				$time,out);
		clock=0;
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
