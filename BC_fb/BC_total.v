`define n 8
`define pow2n 256
`define order 18
`define length 19
`define orderm 38
`define lengthm 39

module BC_total(
    input [`n-1:0]                in,//Binary number
    input                       reset,
    input                       clock,
    output logic [`n*4-1:0] out
);

    logic [`n-1:0]         out_1 [`order:0];//Binary number
    logic [`n-1:0]         out_2 [`order:0];//Binary number
    logic [`n-1:0]         out_3 [`order:0];//Binary number
    logic [`n-1:0]         out_4 [`order:0];//Binary number
    logic                clock_1;
    logic                clock_2;
    logic                clock_3;

    logic [`n-1:0]         out_2_1 [`orderm:0];//Binary number

    logic [`n-1:0]         all_in_3 [`orderm:0];//Binary number
    logic [`n-1:0]         all_out_3;//Binary number

    logic [`n-1:0]         out_4_2 [`orderm:0];//Binary number
    logic [`n-1:0]         out_4_2_1 [`orderm:0];//Binary number
    
    logic [`n-1:0]         all_in_4 [`orderm:0];//Binary number
    logic [`n-1:0]         all_out_4;

    logic [`n-1:0]         out_8_4 [`orderm:0];//Binary number
    logic [`n-1:0]         out_8_4_2 [`orderm:0];//Binary number
    logic [`n-1:0]         out_8_4_2_1 [`orderm:0];//Binary number

    logic [`n-1:0]         all_in[19-1:0];//Binary number
    logic [`n-1:0]         all_out;//Binary number

    logic [1:0]         counter;

    always_ff @(posedge clock) begin
        if(reset) begin
            counter = 0;
        end 
        else begin
            counter = counter + 1;
        end
    end

    always_comb begin
        case (counter)
        2'b0:
        begin
            all_in = out_2;
            all_in_3 = out_4_2;  
            all_in_4 = out_8_4_2;          
        end
        2'b1:
        begin
            all_in = out_1;
            all_in_3 = out_4_2_1;
            all_in_4 = out_8_4_2_1;            
        end
        2'b10:
        begin
            all_in = out_4;
            all_in_3 = out_4_2_1;    
            all_in_4 = out_8_4_2_1;
        end
        2'b11:
        begin
            all_in = out_3;
            all_in_3 = out_4_2; 
            all_in_4 = out_8_4;          
        end
        endcase
    end

    assign clock_1 = (counter == 2'b1);
    assign clock_2 = (counter == 2'b0);
    assign clock_3 = (counter == 2'b11);

    assign out[3*`n-1:2*`n] = all_out_3;
    assign out[`n-1:0] = all_out;
    assign out[4*`n-1:3*`n] = all_out_4;
// input to 4 output
    in_ctrl my_in_ctrl(.in,.clock(counter[1]),.out_1,.out_2,.out_3,.out_4);
// 4 output to 4 output
    BC_FIR  my_BC_FIR1(.in(all_in),.out(all_out));

// 2 cascading filter
// only read in the output after counter = 0
    in_ctrl_1 my_in_ctrl_1(.in(all_out),.clock(clock_1),.out(out_2_1));
    
    BC_FIR_1  my_BC_FIR_11(.in(out_2_1),.out(out[2*`n-1:`n]));
// 3 cascading filter
// only read in the output after counter = 2'b11, counter = 0
    in_ctrl_2 my_in_ctrl_2(.in(all_out),.clock(clock_2),.out(out_4_2));
// only read in the output after counter = 2'b00, counter = 2'b1
    in_ctrl_1 my_in_ctrl_3(.in(all_out_3),.clock(clock_1),.out(out_4_2_1));
    
    BC_FIR_1  my_BC_FIR_22(.in(all_in_3),.out(all_out_3));
// 4 cascading filter
// only read in the output after counter = 2'b10, counter = 2'b11
    in_ctrl_4 my_in_ctrl_4(.in(all_out),.clock(clock_3),.out(out_8_4));
// only read in the output after counter = 2'b11, counter = 2'b00
    in_ctrl_2 my_in_ctrl_5(.in(all_out_4),.clock(clock_2),.out(out_8_4_2));
// only read in the output after counter = 2'b0, counter = 2'b1
    in_ctrl_4 my_in_ctrl_6(.in(all_out_4),.clock(clock_1),.out(out_8_4_2_1));

    BC_FIR_1  my_BC_FIR_44(.in(all_in_4),.out(all_out_4));

endmodule


