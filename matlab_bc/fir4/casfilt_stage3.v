// -------------------------------------------------------------
//
// Module: filter
// Generated by MATLAB(R) 9.8 and Filter Design HDL Coder 3.1.7.
// Generated on: 2021-01-22 11:24:17
// -------------------------------------------------------------

// -------------------------------------------------------------
// HDL Code Generation Options:
//
// Name: casfilt
// InputDataType: numerictype(1,8,7)
// TargetLanguage: Verilog
// GenerateHDLTestBench: off

// -------------------------------------------------------------
// HDL Implementation    : Fully parallel
// Folding Factor        : 1
// -------------------------------------------------------------
// Filter Settings:
//
// Discrete-Time FIR Filter (real)
// -------------------------------
// Filter Structure  : Direct-Form Symmetric FIR
// Filter Length     : 77
// Stable            : Yes
// Linear Phase      : Yes (Type 1)
// Arithmetic        : fixed
// Numerator         : s8,7 -> [-1 1)
// -------------------------------------------------------------
// Multipliers           : 9



`timescale 1 ns / 1 ns

module casfilt_stage3
               (
                clk,
                clk_enable_stage3,
                reset,
                filter_in_stage3,
                filter_out_stage3
                );

  input   clk; 
  input   clk_enable_stage3; 
  input   reset; 
  input   signed [7:0] filter_in_stage3; //sfix8_En7
  output  signed [7:0] filter_out_stage3; //sfix8_En7

////////////////////////////////////////////////////////////////
//Module Architecture: casfilt_stage3
////////////////////////////////////////////////////////////////
  // Local Functions
  // Type Definitions
  // Constants
  parameter signed [7:0] coeff1 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff2 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff3 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff4 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff5 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff6 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff7 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff8 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff9 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff10 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff11 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff12 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff13 = 8'b00000001; //sfix8_En7
  parameter signed [7:0] coeff14 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff15 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff16 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff17 = 8'b11111111; //sfix8_En7
  parameter signed [7:0] coeff18 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff19 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff20 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff21 = 8'b00000010; //sfix8_En7
  parameter signed [7:0] coeff22 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff23 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff24 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff25 = 8'b11111100; //sfix8_En7
  parameter signed [7:0] coeff26 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff27 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff28 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff29 = 8'b00000111; //sfix8_En7
  parameter signed [7:0] coeff30 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff31 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff32 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff33 = 8'b11110011; //sfix8_En7
  parameter signed [7:0] coeff34 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff35 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff36 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff37 = 8'b00101000; //sfix8_En7
  parameter signed [7:0] coeff38 = 8'b00000000; //sfix8_En7
  parameter signed [7:0] coeff39 = 8'b01000000; //sfix8_En7

  // Signals
  reg  signed [7:0] delay_pipeline [0:75] ; // sfix8_En7
  wire signed [8:0] tapsum13; // sfix9_En7
  wire signed [7:0] add_signext; // sfix8_En7
  wire signed [7:0] add_signext_1; // sfix8_En7
  wire signed [8:0] tapsum_mcand; // sfix9_En7
  wire signed [8:0] tapsum17; // sfix9_En7
  wire signed [7:0] add_signext_2; // sfix8_En7
  wire signed [7:0] add_signext_3; // sfix8_En7
  wire signed [8:0] tapsum_mcand_1; // sfix9_En7
  wire signed [8:0] tapsum21; // sfix9_En7
  wire signed [7:0] add_signext_4; // sfix8_En7
  wire signed [7:0] add_signext_5; // sfix8_En7
  wire signed [8:0] tapsum_mcand_2; // sfix9_En7
  wire signed [8:0] tapsum25; // sfix9_En7
  wire signed [7:0] add_signext_6; // sfix8_En7
  wire signed [7:0] add_signext_7; // sfix8_En7
  wire signed [8:0] tapsum_mcand_3; // sfix9_En7
  wire signed [8:0] tapsum29; // sfix9_En7
  wire signed [7:0] add_signext_8; // sfix8_En7
  wire signed [7:0] add_signext_9; // sfix8_En7
  wire signed [8:0] tapsum_mcand_4; // sfix9_En7
  wire signed [8:0] tapsum33; // sfix9_En7
  wire signed [7:0] add_signext_10; // sfix8_En7
  wire signed [7:0] add_signext_11; // sfix8_En7
  wire signed [8:0] tapsum_mcand_5; // sfix9_En7
  wire signed [8:0] tapsum37; // sfix9_En7
  wire signed [7:0] add_signext_12; // sfix8_En7
  wire signed [7:0] add_signext_13; // sfix8_En7
  wire signed [8:0] tapsum_mcand_6; // sfix9_En7
  wire signed [16:0] product39; // sfix17_En14
  wire signed [16:0] product37; // sfix17_En14
  wire signed [16:0] product33; // sfix17_En14
  wire signed [16:0] product29; // sfix17_En14
  wire signed [16:0] product25; // sfix17_En14
  wire signed [9:0] mulpwr2_temp; // sfix10_En7
  wire signed [16:0] product21; // sfix17_En14
  wire signed [16:0] product17; // sfix17_En14
  wire signed [9:0] mulpwr2_temp_1; // sfix10_En7
  wire signed [16:0] product13; // sfix17_En14
  wire signed [22:0] sum1; // sfix23_En14
  wire signed [16:0] add_signext_14; // sfix17_En14
  wire signed [16:0] add_signext_15; // sfix17_En14
  wire signed [17:0] add_temp; // sfix18_En14
  wire signed [22:0] sum2; // sfix23_En14
  wire signed [22:0] add_signext_16; // sfix23_En14
  wire signed [22:0] add_signext_17; // sfix23_En14
  wire signed [23:0] add_temp_1; // sfix24_En14
  wire signed [22:0] sum3; // sfix23_En14
  wire signed [22:0] add_signext_18; // sfix23_En14
  wire signed [22:0] add_signext_19; // sfix23_En14
  wire signed [23:0] add_temp_2; // sfix24_En14
  wire signed [22:0] sum4; // sfix23_En14
  wire signed [22:0] add_signext_20; // sfix23_En14
  wire signed [22:0] add_signext_21; // sfix23_En14
  wire signed [23:0] add_temp_3; // sfix24_En14
  wire signed [22:0] sum5; // sfix23_En14
  wire signed [22:0] add_signext_22; // sfix23_En14
  wire signed [22:0] add_signext_23; // sfix23_En14
  wire signed [23:0] add_temp_4; // sfix24_En14
  wire signed [22:0] sum6; // sfix23_En14
  wire signed [22:0] add_signext_24; // sfix23_En14
  wire signed [22:0] add_signext_25; // sfix23_En14
  wire signed [23:0] add_temp_5; // sfix24_En14
  wire signed [22:0] sum7; // sfix23_En14
  wire signed [22:0] add_signext_26; // sfix23_En14
  wire signed [22:0] add_signext_27; // sfix23_En14
  wire signed [23:0] add_temp_6; // sfix24_En14
  wire signed [7:0] output_typeconvert; // sfix8_En7

  // Block Statements
  always @( posedge clk or posedge reset)
    begin: Delay_Pipeline_process
      if (reset == 1'b1) begin
        delay_pipeline[0] <= 0;
        delay_pipeline[1] <= 0;
        delay_pipeline[2] <= 0;
        delay_pipeline[3] <= 0;
        delay_pipeline[4] <= 0;
        delay_pipeline[5] <= 0;
        delay_pipeline[6] <= 0;
        delay_pipeline[7] <= 0;
        delay_pipeline[8] <= 0;
        delay_pipeline[9] <= 0;
        delay_pipeline[10] <= 0;
        delay_pipeline[11] <= 0;
        delay_pipeline[12] <= 0;
        delay_pipeline[13] <= 0;
        delay_pipeline[14] <= 0;
        delay_pipeline[15] <= 0;
        delay_pipeline[16] <= 0;
        delay_pipeline[17] <= 0;
        delay_pipeline[18] <= 0;
        delay_pipeline[19] <= 0;
        delay_pipeline[20] <= 0;
        delay_pipeline[21] <= 0;
        delay_pipeline[22] <= 0;
        delay_pipeline[23] <= 0;
        delay_pipeline[24] <= 0;
        delay_pipeline[25] <= 0;
        delay_pipeline[26] <= 0;
        delay_pipeline[27] <= 0;
        delay_pipeline[28] <= 0;
        delay_pipeline[29] <= 0;
        delay_pipeline[30] <= 0;
        delay_pipeline[31] <= 0;
        delay_pipeline[32] <= 0;
        delay_pipeline[33] <= 0;
        delay_pipeline[34] <= 0;
        delay_pipeline[35] <= 0;
        delay_pipeline[36] <= 0;
        delay_pipeline[37] <= 0;
        delay_pipeline[38] <= 0;
        delay_pipeline[39] <= 0;
        delay_pipeline[40] <= 0;
        delay_pipeline[41] <= 0;
        delay_pipeline[42] <= 0;
        delay_pipeline[43] <= 0;
        delay_pipeline[44] <= 0;
        delay_pipeline[45] <= 0;
        delay_pipeline[46] <= 0;
        delay_pipeline[47] <= 0;
        delay_pipeline[48] <= 0;
        delay_pipeline[49] <= 0;
        delay_pipeline[50] <= 0;
        delay_pipeline[51] <= 0;
        delay_pipeline[52] <= 0;
        delay_pipeline[53] <= 0;
        delay_pipeline[54] <= 0;
        delay_pipeline[55] <= 0;
        delay_pipeline[56] <= 0;
        delay_pipeline[57] <= 0;
        delay_pipeline[58] <= 0;
        delay_pipeline[59] <= 0;
        delay_pipeline[60] <= 0;
        delay_pipeline[61] <= 0;
        delay_pipeline[62] <= 0;
        delay_pipeline[63] <= 0;
        delay_pipeline[64] <= 0;
        delay_pipeline[65] <= 0;
        delay_pipeline[66] <= 0;
        delay_pipeline[67] <= 0;
        delay_pipeline[68] <= 0;
        delay_pipeline[69] <= 0;
        delay_pipeline[70] <= 0;
        delay_pipeline[71] <= 0;
        delay_pipeline[72] <= 0;
        delay_pipeline[73] <= 0;
        delay_pipeline[74] <= 0;
        delay_pipeline[75] <= 0;
      end
      else begin
        if (clk_enable_stage3 == 1'b1) begin
          delay_pipeline[0] <= filter_in_stage3;
          delay_pipeline[1] <= delay_pipeline[0];
          delay_pipeline[2] <= delay_pipeline[1];
          delay_pipeline[3] <= delay_pipeline[2];
          delay_pipeline[4] <= delay_pipeline[3];
          delay_pipeline[5] <= delay_pipeline[4];
          delay_pipeline[6] <= delay_pipeline[5];
          delay_pipeline[7] <= delay_pipeline[6];
          delay_pipeline[8] <= delay_pipeline[7];
          delay_pipeline[9] <= delay_pipeline[8];
          delay_pipeline[10] <= delay_pipeline[9];
          delay_pipeline[11] <= delay_pipeline[10];
          delay_pipeline[12] <= delay_pipeline[11];
          delay_pipeline[13] <= delay_pipeline[12];
          delay_pipeline[14] <= delay_pipeline[13];
          delay_pipeline[15] <= delay_pipeline[14];
          delay_pipeline[16] <= delay_pipeline[15];
          delay_pipeline[17] <= delay_pipeline[16];
          delay_pipeline[18] <= delay_pipeline[17];
          delay_pipeline[19] <= delay_pipeline[18];
          delay_pipeline[20] <= delay_pipeline[19];
          delay_pipeline[21] <= delay_pipeline[20];
          delay_pipeline[22] <= delay_pipeline[21];
          delay_pipeline[23] <= delay_pipeline[22];
          delay_pipeline[24] <= delay_pipeline[23];
          delay_pipeline[25] <= delay_pipeline[24];
          delay_pipeline[26] <= delay_pipeline[25];
          delay_pipeline[27] <= delay_pipeline[26];
          delay_pipeline[28] <= delay_pipeline[27];
          delay_pipeline[29] <= delay_pipeline[28];
          delay_pipeline[30] <= delay_pipeline[29];
          delay_pipeline[31] <= delay_pipeline[30];
          delay_pipeline[32] <= delay_pipeline[31];
          delay_pipeline[33] <= delay_pipeline[32];
          delay_pipeline[34] <= delay_pipeline[33];
          delay_pipeline[35] <= delay_pipeline[34];
          delay_pipeline[36] <= delay_pipeline[35];
          delay_pipeline[37] <= delay_pipeline[36];
          delay_pipeline[38] <= delay_pipeline[37];
          delay_pipeline[39] <= delay_pipeline[38];
          delay_pipeline[40] <= delay_pipeline[39];
          delay_pipeline[41] <= delay_pipeline[40];
          delay_pipeline[42] <= delay_pipeline[41];
          delay_pipeline[43] <= delay_pipeline[42];
          delay_pipeline[44] <= delay_pipeline[43];
          delay_pipeline[45] <= delay_pipeline[44];
          delay_pipeline[46] <= delay_pipeline[45];
          delay_pipeline[47] <= delay_pipeline[46];
          delay_pipeline[48] <= delay_pipeline[47];
          delay_pipeline[49] <= delay_pipeline[48];
          delay_pipeline[50] <= delay_pipeline[49];
          delay_pipeline[51] <= delay_pipeline[50];
          delay_pipeline[52] <= delay_pipeline[51];
          delay_pipeline[53] <= delay_pipeline[52];
          delay_pipeline[54] <= delay_pipeline[53];
          delay_pipeline[55] <= delay_pipeline[54];
          delay_pipeline[56] <= delay_pipeline[55];
          delay_pipeline[57] <= delay_pipeline[56];
          delay_pipeline[58] <= delay_pipeline[57];
          delay_pipeline[59] <= delay_pipeline[58];
          delay_pipeline[60] <= delay_pipeline[59];
          delay_pipeline[61] <= delay_pipeline[60];
          delay_pipeline[62] <= delay_pipeline[61];
          delay_pipeline[63] <= delay_pipeline[62];
          delay_pipeline[64] <= delay_pipeline[63];
          delay_pipeline[65] <= delay_pipeline[64];
          delay_pipeline[66] <= delay_pipeline[65];
          delay_pipeline[67] <= delay_pipeline[66];
          delay_pipeline[68] <= delay_pipeline[67];
          delay_pipeline[69] <= delay_pipeline[68];
          delay_pipeline[70] <= delay_pipeline[69];
          delay_pipeline[71] <= delay_pipeline[70];
          delay_pipeline[72] <= delay_pipeline[71];
          delay_pipeline[73] <= delay_pipeline[72];
          delay_pipeline[74] <= delay_pipeline[73];
          delay_pipeline[75] <= delay_pipeline[74];
        end
      end
    end // Delay_Pipeline_process


  assign add_signext = delay_pipeline[11];
  assign add_signext_1 = delay_pipeline[63];
  assign tapsum13 = add_signext + add_signext_1;

  assign tapsum_mcand = tapsum13;

  assign add_signext_2 = delay_pipeline[15];
  assign add_signext_3 = delay_pipeline[59];
  assign tapsum17 = add_signext_2 + add_signext_3;

  assign tapsum_mcand_1 = tapsum17;

  assign add_signext_4 = delay_pipeline[19];
  assign add_signext_5 = delay_pipeline[55];
  assign tapsum21 = add_signext_4 + add_signext_5;

  assign tapsum_mcand_2 = tapsum21;

  assign add_signext_6 = delay_pipeline[23];
  assign add_signext_7 = delay_pipeline[51];
  assign tapsum25 = add_signext_6 + add_signext_7;

  assign tapsum_mcand_3 = tapsum25;

  assign add_signext_8 = delay_pipeline[27];
  assign add_signext_9 = delay_pipeline[47];
  assign tapsum29 = add_signext_8 + add_signext_9;

  assign tapsum_mcand_4 = tapsum29;

  assign add_signext_10 = delay_pipeline[31];
  assign add_signext_11 = delay_pipeline[43];
  assign tapsum33 = add_signext_10 + add_signext_11;

  assign tapsum_mcand_5 = tapsum33;

  assign add_signext_12 = delay_pipeline[35];
  assign add_signext_13 = delay_pipeline[39];
  assign tapsum37 = add_signext_12 + add_signext_13;

  assign tapsum_mcand_6 = tapsum37;

  assign product39 = $signed({delay_pipeline[37][7:0], 6'b000000});

  assign product37 = tapsum_mcand_6 * coeff37;

  assign product33 = tapsum_mcand_5 * coeff33;

  assign product29 = tapsum_mcand_4 * coeff29;

  assign mulpwr2_temp = (tapsum_mcand_3==9'b100000000) ? $signed({1'b0, tapsum_mcand_3}) : -tapsum_mcand_3;

  assign product25 = $signed({mulpwr2_temp[9:0], 2'b00});

  assign product21 = $signed({tapsum_mcand_2[8:0], 1'b0});

  assign mulpwr2_temp_1 = (tapsum_mcand_1==9'b100000000) ? $signed({1'b0, tapsum_mcand_1}) : -tapsum_mcand_1;

  assign product17 = $signed({{7{mulpwr2_temp_1[9]}}, mulpwr2_temp_1});

  assign product13 = $signed({{8{tapsum_mcand[8]}}, tapsum_mcand});

  assign add_signext_14 = product13;
  assign add_signext_15 = product17;
  assign add_temp = add_signext_14 + add_signext_15;
  assign sum1 = $signed({{5{add_temp[17]}}, add_temp});

  assign add_signext_16 = sum1;
  assign add_signext_17 = $signed({{6{product21[16]}}, product21});
  assign add_temp_1 = add_signext_16 + add_signext_17;
  assign sum2 = add_temp_1[22:0];

  assign add_signext_18 = sum2;
  assign add_signext_19 = $signed({{6{product25[16]}}, product25});
  assign add_temp_2 = add_signext_18 + add_signext_19;
  assign sum3 = add_temp_2[22:0];

  assign add_signext_20 = sum3;
  assign add_signext_21 = $signed({{6{product29[16]}}, product29});
  assign add_temp_3 = add_signext_20 + add_signext_21;
  assign sum4 = add_temp_3[22:0];

  assign add_signext_22 = sum4;
  assign add_signext_23 = $signed({{6{product33[16]}}, product33});
  assign add_temp_4 = add_signext_22 + add_signext_23;
  assign sum5 = add_temp_4[22:0];

  assign add_signext_24 = sum5;
  assign add_signext_25 = $signed({{6{product37[16]}}, product37});
  assign add_temp_5 = add_signext_24 + add_signext_25;
  assign sum6 = add_temp_5[22:0];

  assign add_signext_26 = sum6;
  assign add_signext_27 = $signed({{6{product39[16]}}, product39});
  assign add_temp_6 = add_signext_26 + add_signext_27;
  assign sum7 = add_temp_6[22:0];

  assign output_typeconvert = sum7[14:7];

  // Assignment Statements
  assign filter_out_stage3 = output_typeconvert;
endmodule  // casfilt_stage3
