`define n 12
`define pow2n 4096
`define order 18
`define length 19
`define orderm 38
`define lengthm 39
`define pow2n_2 1024
`define pow2n_1 2048

module HWA_total(
    input [`n-3:0]              in,//Binary number
    input                       start,
    input                       clock,// digital clock
    output logic [(`n-3)*4-1:0] out
);
    logic                sampling_clock;
    logic [`n-3:0]       out_1 [`order:0];//Binary number
    logic [`n-3:0]       out_2 [`order:0];//Binary number
    logic [`n-3:0]       out_3 [`order:0];//Binary number
    logic [`n-3:0]       out_4 [`order:0];//Binary number

    logic [`n-3:0]       all_in_2 [`order:0];
    logic [`n-3:0]       all_out_2;//Binary number


    logic [`n-3:0]       R_y; //random numbers from RNG
    logic [`n-1:0]       sel_bits;

    logic [`n-3:0]       out_2_1 [`orderm:0];//Binary number
    logic [`n-3:0]       final_out_2_1;

    logic [`n-3:0]       all_in [`orderm:0];//Binary number
    logic [`n-3:0]       all_out;//Binary number

    logic [`n-3:0]       out_4_2 [`orderm:0];//Binary number
    logic [`n-3:0]       out_4_2_1 [`orderm:0];//Binary number

    logic [`n-3:0]       all_in_1 [`orderm:0];//Binary number
    logic [`n-3:0]       all_out_1;//Binary number

    logic [`n-3:0]       out_8_4 [`orderm:0];//Binary number
    logic [`n-3:0]       out_8_4_2 [`orderm:0];//Binary number
    logic [`n-3:0]       out_8_4_2_1 [`orderm:0];//Binary number

    VDC vdc(.start(start), .clock(clock), .out_re(R_y),.out(sel_bits));
    
    assign sampling_clock = ~sel_bits[`n-1];
// input to 4 output
    in_ctrl_SC  my_in_ctrl(.in,.clock(sampling_clock),.out_1,.out_2,.out_3,.out_4);
// 4 output to 4 output
    HWA_opt_n_2 my_HWA4(.in(all_in_2),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits[`n-3:0]),.out(all_out_2),.done());

// 2 cascading filter
// input controller works at sampling clock
// 11
    in_ctrl_1_SC_2  my_in_ctrl_1(.in(all_out_2),.clock(sel_bits[`n-1] & sel_bits[`n-2]),.out(out_2_1));
    HWA_1_opt_n_2   my_HWA_11(.in(out_2_1),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits[`n-3:0]),.out(final_out_2_1),.done());

    always_comb begin
        case (sel_bits[`n-1:`n-2])
        2'b10: begin
            all_in = out_4_2;
            all_in_1 = out_8_4_2;
            all_in_2 = out_1;
        end
        2'b11: begin
            all_in = out_4_2_1;
            all_in_1 = out_8_4_2_1;
            all_in_2 = out_2;           
        end
        2'b01: begin
            all_in = out_4_2;
            all_in_1 = out_8_4;
            all_in_2 = out_3;
        end
        2'b0: begin
            all_in = out_4_2_1;
            all_in_1 = out_8_4_2_1;
            all_in_2 = out_4;
        end
        endcase
    end

// 3 cascading filter    
    // 10
    in_ctrl_2_SC    my_in_ctrl_2(.in(all_out_2),.clock(sel_bits[`n-1]),.out(out_4_2));
    in_ctrl_1_SC_2  my_in_ctrl_3(.in(all_out),.clock(sel_bits[`n-1] & sel_bits[`n-2]),.out(out_4_2_1));

    HWA_1_opt_n_2   my_HWA_22(.in(all_in),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits[`n-3:0]),.out(all_out),.done());
    
// 4 cascading filter
    // 01
    in_ctrl_4_SC    my_in_ctrl_4(.in(all_out_2),.clock((~sel_bits[`n-1]) & sel_bits[`n-2]),.out(out_8_4));
    in_ctrl_2_SC    my_in_ctrl_5(.in(all_out_1),.clock(sel_bits[`n-1]),.out(out_8_4_2));
    in_ctrl_1_SC_2  my_in_ctrl_6(.in(all_out_1),.clock(sel_bits[`n-1] & sel_bits[`n-2]),.out(out_8_4_2_1));

    HWA_1_opt_n_2   my_HWA_44(.in(all_in_1),.start(start),.clock(clock),.R_y(R_y),.sel_bits(sel_bits[`n-3:0]),.out(all_out_1),.done());


    assign out = {all_out_1, all_out,final_out_2_1,all_out_2};
endmodule