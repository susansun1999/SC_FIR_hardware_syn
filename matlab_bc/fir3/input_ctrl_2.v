module input_ctrl_2(
    clk,
    clk_enable,
    reset,
    filter_in,
    tapsum_mcand,
    tapsum_mcand_1,
    tapsum_mcand_2,
    tapsum_mcand_3,
    tapsum_mcand_4,
    tapsum_mcand_5,
    tapsum_mcand_6,
    tapsum_mcand_7
);

  input   clk; 
  input   clk_enable; 
  input   reset; 
  input   signed [7:0] filter_in; //sfix8_En7
  output wire signed [8:0] tapsum_mcand; // sfix9_En7
  output wire signed [8:0] tapsum_mcand_1; // sfix9_En7
  output wire signed [8:0] tapsum_mcand_2; // sfix9_En7
  output wire signed [8:0] tapsum_mcand_3; // sfix9_En7
  output wire signed [8:0] tapsum_mcand_4; // sfix9_En7
  output wire signed [8:0] tapsum_mcand_5; // sfix9_En7  
  output wire signed [8:0] tapsum_mcand_6; // sfix9_En7
  output wire signed [7:0] tapsum_mcand_7; // sfix9_En7

  // Signals
  reg  signed [7:0] delay_pipeline [0:75] ; // sfix8_En7
  wire signed [8:0] tapsum13; // sfix9_En7
  wire signed [7:0] add_signext; // sfix8_En7
  wire signed [7:0] add_signext_1; // sfix8_En7
  wire signed [8:0] tapsum17; // sfix9_En7
  wire signed [7:0] add_signext_2; // sfix8_En7
  wire signed [7:0] add_signext_3; // sfix8_En7
  wire signed [8:0] tapsum21; // sfix9_En7
  wire signed [7:0] add_signext_4; // sfix8_En7
  wire signed [7:0] add_signext_5; // sfix8_En7
  wire signed [8:0] tapsum25; // sfix9_En7
  wire signed [7:0] add_signext_6; // sfix8_En7
  wire signed [7:0] add_signext_7; // sfix8_En7
  wire signed [8:0] tapsum29; // sfix9_En7
  wire signed [7:0] add_signext_8; // sfix8_En7
  wire signed [7:0] add_signext_9; // sfix8_En7
  wire signed [8:0] tapsum33; // sfix9_En7
  wire signed [7:0] add_signext_10; // sfix8_En7
  wire signed [7:0] add_signext_11; // sfix8_En7
  wire signed [8:0] tapsum37; // sfix9_En7
  wire signed [7:0] add_signext_12; // sfix8_En7
  wire signed [7:0] add_signext_13; // sfix8_En7

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
        if (clk_enable == 1'b1) begin
          delay_pipeline[0] <= filter_in;
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



/////////////////////////////
  assign add_signext = delay_pipeline[11];
  assign add_signext_1 = delay_pipeline[63];
  assign tapsum13 = add_signext + add_signext_1;

  assign tapsum_mcand = tapsum13;
/////////////////////////////
  assign add_signext_2 = delay_pipeline[15];
  assign add_signext_3 = delay_pipeline[59];
  assign tapsum17 = add_signext_2 + add_signext_3;

  assign tapsum_mcand_1 = tapsum17;
/////////////////////////////
  assign add_signext_4 = delay_pipeline[19];
  assign add_signext_5 = delay_pipeline[55];
  assign tapsum21 = add_signext_4 + add_signext_5;

  assign tapsum_mcand_2 = tapsum21;
/////////////////////////////
  assign add_signext_6 = delay_pipeline[23];
  assign add_signext_7 = delay_pipeline[51];
  assign tapsum25 = add_signext_6 + add_signext_7;

  assign tapsum_mcand_3 = tapsum25;
/////////////////////////////
  assign add_signext_8 = delay_pipeline[27];
  assign add_signext_9 = delay_pipeline[47];
  assign tapsum29 = add_signext_8 + add_signext_9;

  assign tapsum_mcand_4 = tapsum29;
/////////////////////////////
  assign add_signext_10 = delay_pipeline[31];
  assign add_signext_11 = delay_pipeline[43];
  assign tapsum33 = add_signext_10 + add_signext_11;

  assign tapsum_mcand_5 = tapsum33;
/////////////////////////////
  assign add_signext_12 = delay_pipeline[35];
  assign add_signext_13 = delay_pipeline[39];
  assign tapsum37 = add_signext_12 + add_signext_13;

  assign tapsum_mcand_6 = tapsum37;
/////////////////////////////
  assign tapsum_mcand_7 = delay_pipeline[37][7:0];

endmodule