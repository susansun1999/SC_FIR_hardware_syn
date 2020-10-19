// the VDC sequence is basically a reversed counter
`define n 12
`define order 18

module VDC(
    input           reset,
    input           clock,
    output logic [`n-1: 0]  out_re,
    output logic [`n-1: 0]  out
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