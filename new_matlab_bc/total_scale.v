`timescale 1 ns / 1 ns

module total_scale(
    clk,
    clk_enable,
    reset,
    filter_in,
    filter_out
);

  input   clk; 
  input   clk_enable; 
  input   reset; 
  input   signed [9:0] filter_in; //sfix8_En7

  output signed [9:0] filter_out[3:0]; //sfix8_En7

  reg signed [10:0] tapsum_mcand; // sfix9_En7
  reg signed [10:0] tapsum_mcand_1; // sfix9_En7
  reg signed [10:0] tapsum_mcand_2; // sfix9_En7
  reg signed [10:0] tapsum_mcand_3; // sfix9_En7
  reg signed [10:0] tapsum_mcand_4; // sfix9_En7
  reg signed [10:0] tapsum_mcand_5; // sfix9_En7  
  reg signed [10:0] tapsum_mcand_6; // sfix9_En7
  reg signed [10:0] tapsum_mcand_7; // sfix9_En7
  reg signed [10:0] tapsum_mcand_8; // sfix9_En7
  reg signed [10:0] tapsum_mcand_9; // sfix9_En7
  reg signed [10:0] tapsum_mcand_10; // sfix9_En7
  reg signed [10:0] tapsum_mcand_11; // sfix9_En7
  reg signed [10:0] tapsum_mcand_12; // sfix9_En7
  reg signed [10:0] tapsum_mcand_13; // sfix9_En7
  reg signed [9:0] tapsum_mcand_14; // sfix9_En7


  wire signed [10:0] a0[5:0]; // sfix9_En7
  wire signed [10:0] a1[5:0]; // sfix9_En7
  wire signed [10:0] a2[5:0]; // sfix9_En7
  wire signed [10:0] a3[5:0]; // sfix9_En7
  wire signed [10:0] a4[5:0]; // sfix9_En7
  wire signed [10:0] a5[5:0]; // sfix9_En7  
  wire signed [10:0] a6[5:0]; // sfix9_En7
  wire signed [10:0] a7[5:0]; // sfix9_En7
  wire signed [10:0] a8[5:0]; // sfix9_En7
  wire signed [10:0] a9[5:0]; // sfix9_En7
  wire signed [10:0] a10[5:0]; // sfix9_En7
  wire signed [10:0] a11[5:0]; // sfix9_En7
  wire signed [10:0] a12[5:0]; // sfix9_En7
  wire signed [10:0] a13[5:0]; // sfix9_En7
  wire signed [9:0] a14[5:0]; // sfix9_En7


  reg signed [9:0] pro_filter_out[3:0]; //sfix8_En7
  reg signed [9:0] scale_filter_in; //sfix8_En7
  reg signed [9:0] mult_filter_out;

  reg [2:0] counter;

  always @(posedge clk)begin
      if(reset) begin
          counter <= 0;
      end 
      else begin
          if(counter == 3'b101) begin
                counter <= 0;
          end
          else begin
                counter <= counter + 1;
          end
      end
  end

  always_comb begin
      case (counter)
        3'b0 :begin
        //    scale_1_filter_in = pro_filter_out[1];
            tapsum_mcand = a0[0];
            tapsum_mcand_1 = a1[0];
            tapsum_mcand_2 = a2[0];
            tapsum_mcand_3 = a3[0];
            tapsum_mcand_4 = a4[0];
            tapsum_mcand_5 = a5[0];
            tapsum_mcand_6 = a6[0];
            tapsum_mcand_7 = a7[0];
            tapsum_mcand_8 = a8[0];
            tapsum_mcand_9 = a9[0];
            tapsum_mcand_10 = a10[0];
            tapsum_mcand_11 = a11[0];
            tapsum_mcand_12 = a12[0];
            tapsum_mcand_13 = a13[0];            
            tapsum_mcand_14 = a14[0];
        end 
        3'b1:begin
            //scale_2_filter_in = pro_filter_out[2];
            tapsum_mcand = a0[1];
            tapsum_mcand_1 = a1[1];
            tapsum_mcand_2 = a2[1];
            tapsum_mcand_3 = a3[1];
            tapsum_mcand_4 = a4[1];
            tapsum_mcand_5 = a5[1];
            tapsum_mcand_6 = a6[1];
            tapsum_mcand_7 = a7[1];
            tapsum_mcand_8 = a8[1];
            tapsum_mcand_9 = a9[1];
            tapsum_mcand_10 = a10[1];
            tapsum_mcand_11 = a11[1];
            tapsum_mcand_12 = a12[1];
            tapsum_mcand_13 = a13[1];
            tapsum_mcand_14 = a14[1];
        end
        3'b10: begin
            scale_filter_in = mult_filter_out;
            tapsum_mcand = a0[2];
            tapsum_mcand_1 = a1[2];
            tapsum_mcand_2 = a2[2];
            tapsum_mcand_3 = a3[2];
            tapsum_mcand_4 = a4[2];
            tapsum_mcand_5 = a5[2];
            tapsum_mcand_6 = a6[2];
            tapsum_mcand_7 = a7[2];
            tapsum_mcand_8 = a8[2];
            tapsum_mcand_9 = a9[2];
            tapsum_mcand_10 = a10[2];
            tapsum_mcand_11 = a11[2];
            tapsum_mcand_12 = a12[2];
            tapsum_mcand_13 = a13[2];
            tapsum_mcand_14 = a14[2];
        end
        3'b11: begin
            //scale_2_filter_in = pro_filter_out[3];
            tapsum_mcand = a0[3];
            tapsum_mcand_1 = a1[3];
            tapsum_mcand_2 = a2[3];
            tapsum_mcand_3 = a3[3];
            tapsum_mcand_4 = a4[3];
            tapsum_mcand_5 = a5[3];
            tapsum_mcand_6 = a6[3];
            tapsum_mcand_7 = a7[3];
            tapsum_mcand_8 = a8[3];
            tapsum_mcand_9 = a9[3];
            tapsum_mcand_10 = a10[3];
            tapsum_mcand_11 = a11[3];
            tapsum_mcand_12 = a12[3];
            tapsum_mcand_13 = a13[3];
            tapsum_mcand_14 = a14[3];
        end
        3'b100: begin
            scale_filter_in = mult_filter_out;
            tapsum_mcand = a0[4];
            tapsum_mcand_1 = a1[4];
            tapsum_mcand_2 = a2[4];
            tapsum_mcand_3 = a3[4];
            tapsum_mcand_4 = a4[4];
            tapsum_mcand_5 = a5[4];
            tapsum_mcand_6 = a6[4];
            tapsum_mcand_7 = a7[4];
            tapsum_mcand_8 = a8[4];
            tapsum_mcand_9 = a9[4];
            tapsum_mcand_10 = a10[4];
            tapsum_mcand_11 = a11[4];
            tapsum_mcand_12 = a12[4];
            tapsum_mcand_13 = a13[4];
            tapsum_mcand_14 = a14[4];
        end
        3'b101: begin
            scale_filter_in = mult_filter_out;
            tapsum_mcand = a0[5];
            tapsum_mcand_1 = a1[5];
            tapsum_mcand_2 = a2[5];
            tapsum_mcand_3 = a3[5];
            tapsum_mcand_4 = a4[5];
            tapsum_mcand_5 = a5[5];
            tapsum_mcand_6 = a6[5];
            tapsum_mcand_7 = a7[5];
            tapsum_mcand_8 = a8[5];
            tapsum_mcand_9 = a9[5];
            tapsum_mcand_10 = a10[5];
            tapsum_mcand_11 = a11[5];
            tapsum_mcand_12 = a12[5];
            tapsum_mcand_13 = a13[5];
            tapsum_mcand_14 = a13[5];
        end
      endcase
  end
  

  total_cas my_total_cas(.clk(counter == 6), .clk_enable, .reset, .filter_in, .filter_out(pro_filter_out));

  assign filter_out[0] = pro_filter_out[0];
   
  input_ctrl my_input_ctrl(.clk(counter == 0), .clk_enable, .reset, .filter_in(pro_filter_out[1]), .tapsum_mcand(a0[0]), .tapsum_mcand_1(a1[0]),.tapsum_mcand_2(a2[0]),.tapsum_mcand_3(a3[0]),.tapsum_mcand_4(a4[0]),.tapsum_mcand_5(a5[0]),.tapsum_mcand_6(a6[0]),.tapsum_mcand_7(a7[0]),.tapsum_mcand_8(a8[0]),.tapsum_mcand_9(a9[0]),.tapsum_mcand_10(a10[0]),.tapsum_mcand_11(a11[0]),.tapsum_mcand_12(a12[0]),.tapsum_mcand_13(a13[0]),.tapsum_mcand_14(a14[0]));
  
  input_ctrl_2 my_input_ctrl_2(.clk(counter == 1), .clk_enable, .reset, .filter_in(pro_filter_out[2]), .tapsum_mcand(a0[1]), .tapsum_mcand_1(a1[1]),.tapsum_mcand_2(a2[1]),.tapsum_mcand_3(a3[1]),.tapsum_mcand_4(a4[1]),.tapsum_mcand_5(a5[1]),.tapsum_mcand_6(a6[1]),.tapsum_mcand_7(a7[1]),.tapsum_mcand_8(a8[1]),.tapsum_mcand_9(a9[1]),.tapsum_mcand_10(a10[1]),.tapsum_mcand_11(a11[1]),.tapsum_mcand_12(a12[1]),.tapsum_mcand_13(a13[1]),.tapsum_mcand_14(a14[1]));
  input_ctrl my_input_ctrl1(.clk(counter == 2), .clk_enable, .reset, .filter_in(scale_filter_in), .tapsum_mcand(a0[2]), .tapsum_mcand_1(a1[2]),.tapsum_mcand_2(a2[2]),.tapsum_mcand_3(a3[2]),.tapsum_mcand_4(a4[2]),.tapsum_mcand_5(a5[2]),.tapsum_mcand_6(a6[2]),.tapsum_mcand_7(a7[2]),.tapsum_mcand_8(a8[2]),.tapsum_mcand_9(a9[2]),.tapsum_mcand_10(a10[2]),.tapsum_mcand_11(a11[2]),.tapsum_mcand_12(a12[2]),.tapsum_mcand_13(a13[2]),.tapsum_mcand_14(a14[2]));
  
  input_ctrl_4 my_input_ctrl_4(.clk((counter == 3)), .clk_enable, .reset, .filter_in(pro_filter_out[3]), .tapsum_mcand(a0[3]), .tapsum_mcand_1(a1[3]),.tapsum_mcand_2(a2[3]),.tapsum_mcand_3(a3[3]),.tapsum_mcand_4(a4[3]),.tapsum_mcand_5(a5[3]),.tapsum_mcand_6(a6[3]),.tapsum_mcand_7(a7[3]),.tapsum_mcand_8(a8[1]),.tapsum_mcand_9(a9[1]),.tapsum_mcand_10(a10[1]),.tapsum_mcand_11(a11[1]),.tapsum_mcand_12(a12[1]),.tapsum_mcand_13(a13[1]),.tapsum_mcand_14(a14[1]));
  input_ctrl_2 my_input_ctrl_3(.clk(counter == 4), .clk_enable, .reset, .filter_in(scale_filter_in), .tapsum_mcand(a0[4]), .tapsum_mcand_1(a1[4]),.tapsum_mcand_2(a2[4]),.tapsum_mcand_3(a3[4]),.tapsum_mcand_4(a4[4]),.tapsum_mcand_5(a5[4]),.tapsum_mcand_6(a6[4]),.tapsum_mcand_7(a7[4]),.tapsum_mcand_8(a8[4]),.tapsum_mcand_9(a9[4]),.tapsum_mcand_10(a10[4]),.tapsum_mcand_11(a11[4]),.tapsum_mcand_12(a12[4]),.tapsum_mcand_13(a13[4]),.tapsum_mcand_14(a14[4]));
  input_ctrl my_input_ctrl2(.clk(counter == 5), .clk_enable, .reset, .filter_in(scale_filter_in), .tapsum_mcand(a0[5]), .tapsum_mcand_1(a1[5]),.tapsum_mcand_2(a2[5]),.tapsum_mcand_3(a3[5]),.tapsum_mcand_4(a4[5]),.tapsum_mcand_5(a5[5]),.tapsum_mcand_6(a6[5]),.tapsum_mcand_7(a7[5]),.tapsum_mcand_8(a8[5]),.tapsum_mcand_9(a9[5]),.tapsum_mcand_10(a10[5]),.tapsum_mcand_11(a11[5]),.tapsum_mcand_12(a12[5]),.tapsum_mcand_13(a13[5]),.tapsum_mcand_14(a14[5]));
  

  mult_out my_mult_out(.tapsum_mcand,.tapsum_mcand_1, .tapsum_mcand_2, .tapsum_mcand_3, .tapsum_mcand_4, .tapsum_mcand_5, .tapsum_mcand_6, .tapsum_mcand_7,.tapsum_mcand_8,.tapsum_mcand_9,.tapsum_mcand_10,.tapsum_mcand_11,.tapsum_mcand_12,.tapsum_mcand_13,.tapsum_mcand_14, .filter_out(mult_filter_out));

  assign filter_out[1] = mult_filter_out;
  assign filter_out[2] = mult_filter_out;
  assign filter_out[3] = mult_filter_out;

endmodule