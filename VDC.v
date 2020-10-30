// the VDC sequence is basically a reversed counter
//`define n 2
//`define pow2n 4
//`define order 3
//`define length 4
//`define len_idx 2 // ceil(log2(4))=2

`define n 12
`define pow2n 4096
`define order 18
`define length 19
`define len_idx 5 // ceil(log2(19))=5


module VDC(
    input                   reset,
    input                   clock,
    output logic [`n-1: 0]  out_re,// in reverse order
    output logic [`n-1: 0]  out // in original order
);


logic [`n-1:0]    count,next_count;

assign next_count = count + 1;
always_comb begin
    for (int i = 0; i < `n; ++i) begin
        out_re[i] = count[`n-1-i];
    end
end

assign out = count;

always_ff @(posedge clock) begin
    if(reset) begin
        count <= 0;
    end 
    else begin
        count <= next_count;
    end
end

endmodule