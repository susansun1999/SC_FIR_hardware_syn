`define n 12
`define pow2n 4096
`define order 18
`define length 19
`define orderm 38
`define lengthm 39
`define pow2n_2 1024
`define pow2n_1 2048

module HWA_total(
    input [`n-1:0]              in,//Binary number
    input                       start,
    input                       clock,// digital clock
    output logic [`n*4-6:0] out
);
    logic                sampling_clock;
    logic [`n-1:0]       out_1 [`order:0];//Binary number
    logic [`n-2:0]       out_2 [`order:0];//Binary number
    logic [`n-2:0]       out_3 [`order:0];//Binary number
    logic [`n-3:0]       out_4 [`order:0];//Binary number

    logic [`n-1:0]       R_y; //random numbers from RNG
    logic [`n-1:0]       sel_bits;

    logic [`n-2:0]       in_2_1;//Binary number
    logic [`n-2:0]       out_2_1 [`orderm:0];//Binary number

    logic [`n-3:0]       all_in [`orderm:0];//Binary number
    logic [`n-3:0]       all_out;//Binary number

    logic [`n-2:0]       in_4_2;//Binary number
    logic [`n-3:0]       out_4_2 [`orderm:0];//Binary number
    logic [`n-3:0]       out_4_2_1 [`orderm:0];//Binary number

    logic [`n-3:0]       all_in_1 [`orderm:0];//Binary number
    logic [`n-3:0]       all_out_1;//Binary number

    logic [`n-3:0]       in_8_4;//Binary number
    logic [`n-3:0]       out_8_4 [`orderm:0];//Binary number
    logic [`n-3:0]       out_8_4_2 [`orderm:0];//Binary number
    logic [`n-3:0]       out_8_4_2_1 [`orderm:0];//Binary number

    VDC vdc(.start(start), .clock(clock), .out_re(R_y),.out(sel_bits));
    
    assign sampling_clock = ~sel_bits[`n-1];
// input to 4 output
    in_ctrl_SC  my_in_ctrl(.in,.clock(sampling_clock),.out_1,.out_2,.out_3,.out_4);
// 4 output to 4 output
    HWA_opt     my_HWA1(.in(out_1),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits),.out(out[`n-1:0]),.done());
    HWA_opt_n_1 my_HWA2(.in(out_2),.start(start),.clock(clock),.R_y(R_y[`n-1:1]),.sel_bits(sel_bits[`n-2:0]),.out(in_2_1),.done());
    HWA_opt_n_1 my_HWA3(.in(out_3),.start(start),.clock(clock),.R_y(R_y[`n-1:1]),.sel_bits(sel_bits[`n-2:0]),.out(in_4_2),.done());
    HWA_opt_n_2 my_HWA4(.in(out_4),.start(start),.clock(clock),.R_y(R_y[`n-1:2]),.sel_bits(sel_bits[`n-3:0]),.out(in_8_4),.done());

// 2 cascading filter
// input controller works at sampling clock
    in_ctrl_1_SC    my_in_ctrl_1(.in(in_2_1),.clock(sel_bits[`n-1]),.out(out_2_1));
    HWA_1_opt_n_1   my_HWA_11(.in(out_2_1),.start(start),.clock(clock),.R_y(R_y[`n-1:1]),.sel_bits(sel_bits[`n-2:0]),.out(out[2*`n-2:`n]),.done());

    always_comb begin
        case (sel_bits[`n-1:`n-2])
        2'b10: begin
            all_in = out_4_2;
            all_in_1 = out_8_4_2;
        end
        2'b11: begin
            all_in = out_4_2_1;
            all_in_1 = out_8_4_2_1;            
        end
        2'b01: begin
            all_in = out_4_2;
            all_in_1 = out_8_4;
        end
        default: begin
            all_in = out_4_2_1;
            all_in_1 = out_8_4_2_1;
        end
        endcase
    end

// 3 cascading filter    
    in_ctrl_2_SC    my_in_ctrl_2(.in(in_4_2[`n-3:0]),.clock(sel_bits[`n-1]),.out(out_4_2));
    in_ctrl_1_SC_2  my_in_ctrl_3(.in(all_out),.clock(sel_bits[`n-1] & sel_bits[`n-2]),.out(out_4_2_1));

    HWA_1_opt_n_2   my_HWA_22(.in(all_in),.start(start),.clock(clock),.R_y(R_y[`n-1:2]),.sel_bits(sel_bits[`n-3:0]),.out(all_out),.done());
    
    assign out[3*`n-4:2*`n-1] = all_out;
// 4 cascading filter
    in_ctrl_4_SC    my_in_ctrl_4(.in(in_8_4),.clock((~sel_bits[`n-1]) & sel_bits[`n-2]),.out(out_8_4));
    in_ctrl_2_SC    my_in_ctrl_5(.in(all_out_1),.clock(sel_bits[`n-1]),.out(out_8_4_2));
    in_ctrl_1_SC_2  my_in_ctrl_6(.in(all_out_1),.clock(sel_bits[`n-1] & sel_bits[`n-2]),.out(out_8_4_2_1));

    HWA_1_opt_n_2   my_HWA_44(.in(all_in_1),.start(start),.clock(clock),.R_y(R_y[`n-1:2]),.sel_bits(sel_bits[`n-3:0]),.out(all_out_1),.done());

    assign out[4*`n-6:3*`n-3] = all_out_1;
endmodule