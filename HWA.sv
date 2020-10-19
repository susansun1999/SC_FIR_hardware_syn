`define n 12
`define pow2n 4096
`define order 18

module HWA(
    input [`n-1:0]           in,//Binary
    input                   clock_d,// digital clock
    input                   clock_s,// sampling clock
    output logic [`n-1:0]   out,//Binary
    output logic            done
);

localparam logic sign_b[3:0] = '{1'b0,1'b0,1'b0,1'b0};
// another array 'mapping' is needed 
//example : localparam logic [`n-1:0] abs_b[3:0] = '{12'd256,12'd256,12'd256,12'd256}; // round(coefficient*pow2n)
//localparam logic [`n-1:0] mapping[`pow2n-1:0] = 
// delete the following line
logic [`pow2n-1:0] mapping = ~`pow2n'b0;

logic [`n-1:0]       mux_in [`order:0]; // (order+1) binary numbers
logic [`n-1:0]       next_mux_in [`order:0]; // (order+1) binary numbers

logic [`n-1:0]       sel_bits; // select bits

logic [`n-1:0]       R_y,xored_in; //random numbers from RNG
logic                reset; // signals for generating random numbers 
logic [`n-1:0]       next_out; //running Binary output
logic                SN_in;
VDC vdc( .reset(reset), .clock(clock_d), .out_re(R_y),.out(sel_bits));

always_comb begin
    xored_in = mux_in[mapping[sel_bits]] ^ sign_b[mapping[sel_bits]];
    SN_in = (xored_in > R_y);
    next_out = out + SN_in;
    next_mux_in[`order:1] = mux_in[`order:1];
    next_mux_in[0] = in;
end

assign done = (sel_bits==`pow2n-1);
// prepare the input
always_ff @(posedge clock_d) begin
    if(clock_s) begin
        mux_in <= next_mux_in;
        reset <= 1;
        out   <= 0;
    end
    else begin
        reset <= 0;
        out <= next_out;
    end
end

endmodule