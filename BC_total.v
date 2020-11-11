`define n 12
`define pow2n 4096
`define order 18
`define length 19
`define len_idx 5 // ceil(log2(19))=5

module BC_total(
    input [`n:0]                in,//Binary number
    input                       clock,
    output logic [(`n+1)*4-1:0] out
);

    logic [`n:0]         out_1 [`order:0];//Binary number
    logic [`n:0]         out_2 [`order:0];//Binary number
    logic [`n:0]         out_3 [`order:0];//Binary number
    logic [`n:0]         out_4 [`order:0];//Binary number

    logic [`n:0]         tmp;//Binary number

    in_ctrl my_in_ctrl(.in,.clock,.out_1,.out_2,.out_3,.out_4);

    BC_FIR  BC_FIR_1(.in(out_1),.clock(clock),.out(out[`n:0]));
    BC_FIR  BC_FIR_2(.in(out_2),.clock(clock),.out(out[2*(`n+1)-1:`n+1]));
    BC_FIR  BC_FIR_3(.in(out_3),.clock(clock),.out(out[3*(`n+1)-1:2*(`n+1)]));
    BC_FIR  BC_FIR_4(.in(out_4),.clock(clock),.out(out[4*(`n+1)-1:3*(`n+1)]));
endmodule


