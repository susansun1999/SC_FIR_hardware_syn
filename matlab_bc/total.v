`timescale 1 ns / 1 ns

module total
               (
                clk,
                clk_enable,
                reset,
                filter_in,
                filter_out
                );


  input   clk; 
  input   clk_enable; 
  input   reset; 
  input   signed [7:0] filter_in; //sfix8_En7
  output  signed [7:0] filter_out [7:0]; //sfix8_En7

  reg  signed [7:0] delay_pipeline [0:151] ; // sfix8_En7

    input_ctrl myinput(.clk,.clk_enable,.reset,.filter_in,.delay_pipeline);

    bc_1 mybc_1(.clk,.clk_enable,.reset,.delay_pipeline,.filter_out(filter_out[0]));
    bc_2 mybc_2(.clk,.clk_enable,.reset,.delay_pipeline,.filter_out(filter_out[1]));
    bc_3 mybc_3(.clk,.clk_enable,.reset,.delay_pipeline,.filter_out(filter_out[2]));
    bc_4 mybc_4(.clk,.clk_enable,.reset,.delay_pipeline,.filter_out(filter_out[3]));
    bc_5 mybc_5(.clk,.clk_enable,.reset,.delay_pipeline,.filter_out(filter_out[4]));
    bc_6 mybc_6(.clk,.clk_enable,.reset,.delay_pipeline,.filter_out(filter_out[5]));
    bc_7 mybc_7(.clk,.clk_enable,.reset,.delay_pipeline,.filter_out(filter_out[6]));
    bc_8 mybc_8(.clk,.clk_enable,.reset,.delay_pipeline,.filter_out(filter_out[7]));

endmodule