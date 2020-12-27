// the VDC sequence is basically a reversed counter
//`define n 2
//`define pow2n 4
//`define order 3
//`define length 4
//`define len_idx 2 // ceil(log2(4))=2

module VDC(
    input                   start,
    input                   clock,
    output logic [`n-1: 0]  out_re,// in reverse order
    output logic [`n-1: 0]  out // in original order
);

logic [`n-1:0]    count,next_count;

assign next_count = count + 1;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<`n; gi=gi+1) begin : genbit
    assign out_re[gi] = count[`n-1-gi];
end

assign out = count;

always_ff @(posedge clock) begin
    if(start) begin
        count <= 0;
    end 
    else begin
        count <= next_count;
    end
end

endmodule