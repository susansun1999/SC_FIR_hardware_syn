`timescale 1 ns / 1 ns

module input_ctrl_cas
(
    clk,
    clk_enable,
    reset,
    filter_in,
    product10, // sfix16_En14
    product11, // sfix16_En14
    product13, // sfix16_En14
    product15, // sfix16_En14
    product17, // sfix16_En14
    product19, // sfix20_En18
    negproduct8, // sfix20_En18
    negproduct12 // sfix20_En18
);
  input   clk;
  input   clk_enable; 
  input   reset; 
  input   signed [9:0] filter_in; //sfix8_En7

  output wire signed [19:0] product10; // sfix16_En14
  output wire signed [19:0] product11; // sfix16_En14
  output wire signed [19:0] product13; // sfix16_En14
  output wire signed [19:0] product15; // sfix16_En14
  output wire signed [19:0] product17; // sfix16_En14
  output wire signed [19:0] product19; // sfix20_En18
  output wire signed [19:0] negproduct8; // sfix20_En18
  output wire signed [19:0] negproduct12; // sfix20_En18

  reg  signed [9:0] inputreg; // sfix8_En7

  wire signed [20:0] unaryminus_temp; // sfix21_En18
  wire signed [20:0] unaryminus_temp_1; // sfix21_En18

  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [9:0] coeff1 = 10'b0000000001; //sfix10_En9
  parameter signed [9:0] coeff2 = 10'b0000000000; //sfix10_En9
  parameter signed [9:0] coeff3 = 10'b1111111101; //sfix10_En9
  parameter signed [9:0] coeff4 = 10'b0000000000; //sfix10_En9
  parameter signed [9:0] coeff5 = 10'b0000001101; //sfix10_En9
  parameter signed [9:0] coeff6 = 10'b0000000001; //sfix10_En9
  parameter signed [9:0] coeff7 = 10'b1111011000; //sfix10_En9
  parameter signed [9:0] coeff8 = 10'b1111111111; //sfix10_En9
  parameter signed [9:0] coeff9 = 10'b0010011101; //sfix10_En9
  parameter signed [9:0] coeff10 = 10'b0100000010; //sfix10_En9
  parameter signed [9:0] coeff11 = 10'b0010011101; //sfix10_En9
  parameter signed [9:0] coeff12 = 10'b1111111111; //sfix10_En9
  parameter signed [9:0] coeff13 = 10'b1111011000; //sfix10_En9
  parameter signed [9:0] coeff14 = 10'b0000000001; //sfix10_En9
  parameter signed [9:0] coeff15 = 10'b0000001101; //sfix10_En9
  parameter signed [9:0] coeff16 = 10'b0000000000; //sfix10_En9
  parameter signed [9:0] coeff17 = 10'b1111111101; //sfix10_En9
  parameter signed [9:0] coeff18 = 10'b0000000000; //sfix10_En9
  parameter signed [9:0] coeff19 = 10'b0000000001; //sfix10_En9

  // Block Statements
  always @ (posedge clk or posedge reset)
    begin: input_reg_process
      if (reset == 1'b1) begin
        inputreg <= 0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          inputreg <= filter_in;
        end
      end
    end // input_reg_process

  assign product10 = inputreg * coeff10;

  assign product11 = inputreg * coeff11;

  assign product13 = inputreg * coeff13;

  assign product15 = inputreg * coeff15;

  assign product17 = inputreg * coeff17;

  assign product19 = $signed({{10{inputreg[9]}}, inputreg});
  
  assign unaryminus_temp = (product19==20'b10000000000000000000) ? $signed({1'b0, product19}) : -product19;
  assign negproduct8 = unaryminus_temp[19:0];

  assign unaryminus_temp_1 = (product19==20'b10000000000000000000) ? $signed({1'b0, product19}) : -product19;
  assign negproduct12 = unaryminus_temp_1[19:0];

endmodule