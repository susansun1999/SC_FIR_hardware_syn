`timescale 1 ns / 1 ns

module total_cas
               (
                clk,
                clk_enable,
                reset,
                filter_in,
                filter_out
                );

    wire signed [15:0] product10; // sfix16_En14
    wire signed [15:0] product11; // sfix16_En14
    wire signed [15:0] product13; // sfix16_En14
    wire signed [15:0] product15; // sfix16_En14
    wire signed [15:0] product17; // sfix16_En14

  input   clk; 
  input   clk_enable; 
  input   reset; 
  input   signed [7:0] filter_in; //sfix8_En7
  output  signed [7:0] filter_out[3:0]; //sfix8_En7


input_ctrl_cas my_input_ctrl_cas(.clk, .clk_enable, .reset, .filter_in, .product10, .product11, .product13, .product15, .product17);
fir1           my_fir1(.clk, .clk_enable, .reset, .product10, .product11, .product13, .product15, .product17, .filter_out(filter_out[0]));
fir2           my_fir2(.clk, .clk_enable, .reset, .product19(product10), .product21(product11), .product25(product13), .product29(product15), .product33(product17), .filter_out(filter_out[1]));
fir3           my_fir3(.clk, .clk_enable, .reset, .product37(product10), .product41(product11), .product49(product13), .product57(product15), .product65(product17), .filter_out(filter_out[2]));
fir4           my_fir4(.clk, .clk_enable, .reset, .product73(product10), .product81(product11), .product97(product13), .product113(product15), .product129(product17), .filter_out(filter_out[3]));

endmodule