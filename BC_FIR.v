`define n 12
`define pow2n 4096
`define order 18
`define length 19
`define len_idx 5
`define scale   2
`define total_input_size `scale*`length


module BC_FIR(
    input [`n:0]                in,//Binary number
    input                       clock_s,// sampling clock
    output logic [`n:0]         out//Binary number
);


localparam [`n-1:0] b[`length-1:0] = {`n'd3,`n'd0,`n'd4075,`n'd0,`n'd78,`n'd0,`n'd3859,`n'd0,`n'd943,`n'd1533,`n'd943,`n'd0,`n'd3859,`n'd0,`n'd78,`n'd0,`n'd4075,`n'd0,`n'd3};

logic [`n-1:0]       mux_in_large [`total_input_size-1:0];
logic [`n-1:0]       next_mux_in_large [`total_input_size-1:0]; // (order+1) binary numbers
logic [`n-1:0]       mux_in [`length-1:0]; // (order+1) binary numbers

assign next_mux_in_large[`total_input_size-1:1] = mux_in_large[`total_input_size-2:0];
assign next_mux_in_large[0] = in;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<`length; gi=gi+1) begin : genbit
    assign mux_in[gi] = mux_in_large[(gi+1)*`scale-1];
end

// generate and endgenerate is optional
// generate (optional)
    always_comb begin
        out = b[0]*mux_in[0];
        for(int i = 1; i < `order/2; i=i+1) begin
            out = out + b[i]*(mux_in[i]+mux_in[`order-i]);
        end
        out = out + b[9]*mux_in[9];
    end



always_ff @(posedge clock_s) begin
    mux_in_large <= next_mux_in_large;
end

endmodule