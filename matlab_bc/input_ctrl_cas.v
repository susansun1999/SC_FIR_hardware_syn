`timescale 1 ns / 1 ns

module input_ctrl_cas
(
    clk,
    clk_enable,
    reset,
    filter_in,
    product10,
    product11,
    product13,
    product15,
    product17
);
  input   clk;
  input   clk_enable; 
  input   reset; 
  input   signed [7:0] filter_in; //sfix8_En7

  output wire signed [15:0] product10; // sfix16_En14
  output wire signed [15:0] product11; // sfix16_En14
  output wire signed [15:0] product13; // sfix16_En14
  output wire signed [15:0] product15; // sfix16_En14
  output wire signed [15:0] product17; // sfix16_En14
  
  reg  signed [7:0] inputreg; // sfix8_En7

  wire signed [8:0] mulpwr2_temp; // sfix9_En7

  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [7:0] coeff1 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff2 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff3 = 8'b11111111; //sfix8_En7
  parameter signed [7:0] coeff4 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff5 = 8'b00000011; //sfix8_En7
  parameter signed [7:0] coeff6 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff7 = 8'b11110110; //sfix8_En7
  parameter signed [7:0] coeff8 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff9 = 8'b00100111; //sfix8_En7
  parameter signed [7:0] coeff10 = 8'b01000000; //sfix8_En7
  parameter signed [7:0] coeff11 = 8'b00100111; //sfix8_En7
  parameter signed [7:0] coeff12 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff13 = 8'b11110110; //sfix8_En7
  parameter signed [7:0] coeff14 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff15 = 8'b00000011; //sfix8_En7
  parameter signed [7:0] coeff16 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff17 = 8'b11111111; //sfix8_En7
  parameter signed [7:0] coeff18 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff19 = 8'b00000000; //sfix8_En7

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

  assign product10 = $signed({inputreg[7:0], 6'b000000});

  assign product11 = inputreg * coeff11;

  assign product13 = inputreg * coeff13;

  assign product15 = inputreg * coeff15;

  assign mulpwr2_temp = (inputreg==8'b10000000) ? $signed({1'b0, inputreg}) : -inputreg;

  assign product17 = $signed({{7{mulpwr2_temp[8]}}, mulpwr2_temp});

endmodule