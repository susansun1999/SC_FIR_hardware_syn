`define n 12
`define pow2n 4096
`define order 18
`define length 19
`define orderm 38
`define lengthm 39
`define len_idx 5 // ceil(log2(19))=5

module HWA_total(
    input [`n:0]                in,//Binary number
    input                       start,
    input                       clock,
    output logic [(`n+1)*4-1:0] out
);

    logic [`n:0]         out_1 [`order:0];//Binary number
    logic [`n:0]         out_2 [`order:0];//Binary number
    logic [`n:0]         out_3 [`order:0];//Binary number
    logic [`n:0]         out_4 [`order:0];//Binary number
    logic [`n-1:0]       R_y; //random numbers from RNG
    logic [`n-1:0]       sel_bits;

    logic [`n:0]         in_2_1;//Binary number
    logic [`n:0]         out_2_1 [`orderm:0];//Binary number

    logic [`n:0]         in_4_2;//Binary number
    logic [`n:0]         out_4_2 [`orderm:0];//Binary number

    logic [`n:0]         in_4_2_1;//Binary number
    logic [`n:0]         out_4_2_1 [`orderm:0];//Binary number

    logic [`n:0]         in_8_4;//Binary number
    logic [`n:0]         out_8_4 [`orderm:0];//Binary number

    VDC vdc(.start(start), .clock(clock), .out_re(R_y),.out(sel_bits));

    in_ctrl my_in_ctrl(.in,.clock,.out_1,.out_2,.out_3,.out_4);

    HWA     my_HWA1(.in(out_1),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits),.out(out[`n:0]),.done());
    HWA     my_HWA2(.in(out_2),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits),.out(in_2_1),.done());
    HWA     my_HWA3(.in(out_3),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits),.out(in_4_2),.done());
    HWA     my_HWA4(.in(out_4),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits),.out(out[4*(`n+1)-1:3*(`n+1)]),.done());

    in_ctrl_1 my_in_ctrl_1(.in(in_2_1),.clock(clock),.out(out_2_1));
    HWA_1     my_HWA_11(.in(out_2_1),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits),.out(out[2*(`n+1)-1:`n+1]),.done());
    
    in_ctrl_2 my_in_ctrl_2(.in(in_4_2),.clock(clock),.out(out_4_2));
    HWA_1     my_HWA_22(.in(out_4_2),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits),.out(in_4_2_1),.done());

    in_ctrl_4 my_in_ctrl_4(.in(in_2_1),.clock(clock),.out(out_2_1));
    HWA_1     my_HWA_11(.in(out_2_1),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits),.out(out[2*(`n+1)-1:`n+1]),.done());

endmodule