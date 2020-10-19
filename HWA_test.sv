`define n 12
`define order 18

module testbench();
    logic [`n-1:0]   in;//Binary
    logic            clock_d;// digital clock
    logic            clock_s;// sampling clock
    logic [`n-1:0]   out;//Binary
    logic            done;
	HWA myhwa(.in,.clock_d,.clock_s,.out,.done);


always begin
	#5;
	clock_d=~clock_d;
end
always begin
    #20480;//5*4096
	clock_s=~clock_s;
end
initial begin
		//$vcdpluson;
		$monitor("Time:%4.0f out:%d",
				$time,out);
		clock_d=0;
		clock_s=0;

		@(negedge clock_d);
		@(negedge clock_d);
		@(negedge clock_d);
		@(negedge clock_d);
		@(negedge clock_d);
		@(negedge clock_d);
		@(negedge clock_d);
		@(negedge clock_d);
		@(negedge clock_d);
		@(negedge clock_d);
		@(negedge clock_d);

		$finish;
	end

endmodule
