`define n 12
`define pow2n 4096
`define order 18
`define length 19
`define orderm 38
`define lengthm 39

module BC_total(
    input [`n:0]                in,//Binary number
    input                       clock,
    output logic [(`n+1)*4-1:0] out
);

    logic [`n:0]         out_1 [`order:0];//Binary number
    logic [`n:0]         out_2 [`order:0];//Binary number
    logic [`n:0]         out_3 [`order:0];//Binary number
    logic [`n:0]         out_4 [`order:0];//Binary number

    logic [`n:0]         in_2_1;//Binary number
    logic [`n:0]         out_2_1 [`orderm:0];//Binary number

    logic [`n:0]         in_4_2;//Binary number
    logic [`n:0]         out_4_2 [`orderm:0];//Binary number

    logic [`n:0]         in_4_2_1;//Binary number
    logic [`n:0]         out_4_2_1 [`orderm:0];//Binary number

    logic [`n:0]         in_8_4;//Binary number
    logic [`n:0]         out_8_4 [`orderm:0];//Binary number

    logic [`n:0]         in_8_4_2;//Binary number
    logic [`n:0]         out_8_4_2 [`orderm:0];//Binary number

    logic [`n:0]         in_8_4_2_1;//Binary number
    logic [`n:0]         out_8_4_2_1 [`orderm:0];//Binary number

    in_ctrl my_in_ctrl(.in,.clock,.out_1,.out_2,.out_3,.out_4);

    BC_FIR  my_BC_FIR1(.in(out_1),.clock(clock),.out(out[`n:0]));
    BC_FIR  my_BC_FIR2(.in(out_2),.clock(clock),.out(in_2_1));
    BC_FIR  my_BC_FIR3(.in(out_3),.clock(clock),.out(in_4_2));
    BC_FIR  my_BC_FIR4(.in(out_4),.clock(clock),.out(in_8_4));

    in_ctrl_1 my_in_ctrl_1(.in(in_2_1),.clock(clock),.out(out_2_1));
    BC_FIR_1  my_BC_FIR_11(.in(out_2_1),.clock(clock),.out(out[2*(`n+1)-1:`n+1]));

    in_ctrl_2 my_in_ctrl_2(.in(in_4_2),.clock(clock),.out(out_4_2));
    BC_FIR_1  my_BC_FIR_22(.in(out_4_2),.clock(clock),.out(in_4_2_1));

    in_ctrl_1 my_in_ctrl_3(.in(in_4_2_1),.clock(clock),.out(out_4_2_1));
    BC_FIR_1  my_BC_FIR_33(.in(out_4_2_1),.clock(clock),.out(out[3*(`n+1)-1:2*(`n+1)]));

    in_ctrl_4 my_in_ctrl_4(.in(in_8_4),.clock(clock),.out(out_8_4));
    BC_FIR_1  my_BC_FIR_44(.in(out_8_4),.clock(clock),.out(in_8_4_2));

    in_ctrl_2 my_in_ctrl_5(.in(in_8_4_2),.clock(clock),.out(out_8_4_2));
    BC_FIR_1  my_BC_FIR_55(.in(out_8_4_2),.clock(clock),.out(in_8_4_2_1));

    in_ctrl_4 my_in_ctrl_6(.in(in_8_4_2_1),.clock(clock),.out(out_8_4_2_1));
    BC_FIR_1  my_BC_FIR_66(.in(out_8_4_2_1),.clock(clock),.out(out[4*(`n+1)-1:3*(`n+1)]));

endmodule


