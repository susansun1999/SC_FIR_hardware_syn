//might use symmetric property to save area

`define opt_length 10

module HWA_opt(
    input [`n-1:0]              in[`order:0],//Binary number
    input                       start,
    input                       clock,// digital clock
    input [`n-1:0]              R_y, //random numbers from RNG
    input [`n-1:0]              sel_bits,
    output logic [`n-1:0]       out,//Binary number
    output logic                done
);
//localparam [`opt_length-1:0] sign_b = `opt_length'b0011001100;

logic [`n-1:0]              next_out; //running Binary output
logic [`opt_length-1:0]     SN_in, xored_in;

logic                   first_level;
logic [2:0]             second_level;
logic [3:0]             third_level;
logic [3:0]             fourth_level;
logic [2:0]             fifth_level;
logic [2:0]             sixth_level;
logic [2:0]             seventh_level;
logic [2:0]             eighth_level;
logic [1:0]             nineth_level;
logic [1:0]             tenth_level;
logic                   final_out;

// for debugging
// first level
assign first_level = (sel_bits[0] & xored_in[0])|(~sel_bits[0] & xored_in[2]);
// second_level
assign second_level[0] = (sel_bits[1] & xored_in[0])|(~sel_bits[1] & xored_in[4]);
assign second_level[1] = (sel_bits[1] & xored_in[8])|(~sel_bits[1] & xored_in[9]);
assign second_level[2] = (sel_bits[1] & first_level)|(~sel_bits[1] & xored_in[6]);
// third_level
assign third_level[0] = (sel_bits[2] & second_level[0])|(~sel_bits[2] & xored_in[2]);
assign third_level[1] = (sel_bits[2] & second_level[1])|(~sel_bits[2] & xored_in[4]);
assign third_level[2] = (sel_bits[2] & second_level[2])|(~sel_bits[2] & xored_in[6]);
assign third_level[3] = (sel_bits[2] & xored_in[8])|(~sel_bits[2] & xored_in[9]);

// fourth_level
assign fourth_level[0] = (sel_bits[3] & third_level[0])|(~sel_bits[3] & xored_in[4]);
assign fourth_level[1] = (sel_bits[3] & third_level[1])|(~sel_bits[3] & xored_in[6]);
assign fourth_level[2] = (sel_bits[3] & third_level[2])|(~sel_bits[3] & xored_in[8]);
assign fourth_level[3] = (sel_bits[3] & third_level[3])|(~sel_bits[3] & xored_in[9]);

// fifth_level
assign fifth_level[0] = (sel_bits[4] & fourth_level[0])|(~sel_bits[4] & fourth_level[3]);
assign fifth_level[1] = (sel_bits[4] & fourth_level[1])|(~sel_bits[4] & xored_in[9]);
assign fifth_level[2] = (sel_bits[4] & fourth_level[2])|(~sel_bits[4] & xored_in[2]);

// sixth_level
assign sixth_level[0] = (sel_bits[5] & fifth_level[0])|(~sel_bits[5] & xored_in[6]);
assign sixth_level[1] = (sel_bits[5] & fifth_level[1])|(~sel_bits[5] & xored_in[8]);
assign sixth_level[2] = (sel_bits[5] & fifth_level[2])|(~sel_bits[5] & xored_in[9]);

// seventh_level
assign seventh_level[0] = (sel_bits[6] & sixth_level[0])|(~sel_bits[6] & xored_in[4]);
assign seventh_level[1] = (sel_bits[6] & sixth_level[1])|(~sel_bits[6] & xored_in[6]);
assign seventh_level[2] = (sel_bits[6] & sixth_level[2])|(~sel_bits[6] & xored_in[9]);

// eighth_level
assign eighth_level[0] = (sel_bits[7] & seventh_level[0])|(~sel_bits[7] & xored_in[6]);
assign eighth_level[1] = (sel_bits[7] & seventh_level[1])|(~sel_bits[7] & xored_in[8]);
assign eighth_level[2] = (sel_bits[7] & seventh_level[2])|(~sel_bits[7] & xored_in[9]);

// nineth_level
assign nineth_level[0] = (sel_bits[8] & eighth_level[0])|(~sel_bits[8] & eighth_level[2]);
assign nineth_level[1] = (sel_bits[8] & eighth_level[1])|(~sel_bits[8] & xored_in[8]);

// tenth_level
assign tenth_level[0] = (sel_bits[9] & nineth_level[0])|(~sel_bits[9] & xored_in[8]);
assign tenth_level[1] = (sel_bits[9] & nineth_level[1])|(~sel_bits[9] & xored_in[9]);

// eleventh_level
assign final_out = (sel_bits[10] & tenth_level[0])|(~sel_bits[10] & tenth_level[1]);

// update next value
assign     next_out = out + final_out;


genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<`opt_length; gi=gi+1) begin : genbit
    if(gi == 0 || gi == 2 || gi == 4 || gi == 6 || gi == 8 || gi ==9) begin
        assign SN_in[gi] = ((~sel_bits[`n-1] & in[gi]) | (sel_bits[`n-1] & in[`order - gi])) > R_y;
        if(gi == 2 || gi == 6) begin
            assign xored_in[gi] = ~SN_in[gi];
        end
        else begin
            assign xored_in[gi] = SN_in[gi];
        end 
    end
end

assign done = (sel_bits ==`pow2n-1);

// prepare the input
always_ff @(posedge clock) begin
    if(done | start) begin // like a combo of reset & enable
        out <= 0;
    end
    else begin
        out <= next_out;
    end
end

endmodule

module HWA_opt_n_1(
    input [`n-2:0]                in[`order:0],//Binary number
    input                         start,
    input                         clock,// digital clock
    input [`n-2:0]                R_y, //random numbers from RNG
    input [`n-2:0]                sel_bits,
    output logic [`n-2:0]         out,//Binary number
    output logic                  done
);
//localparam [`opt_length-1:0] sign_b = `opt_length'b0011001100;

logic [`n-2:0]                next_out; //running Binary output
logic [`opt_length-1:0]       SN_in, xored_in;

logic                   first_level;
logic [3:0]             second_level;
logic [3:0]             third_level;
logic [2:0]             fourth_level;
logic [2:0]             fifth_level;
logic [2:0]             sixth_level;
logic [2:0]             seventh_level;
logic [1:0]             eighth_level;
logic [1:0]             nineth_level;
logic                   tenth_level;
logic                   final_out;

// for debugging
// first level
assign first_level = (sel_bits[0] & xored_in[4])|(~sel_bits[0] & xored_in[6]);
// second_level
assign second_level[0] = (sel_bits[1] & xored_in[0])|(~sel_bits[1] & xored_in[2]);
assign second_level[1] = (sel_bits[1] & xored_in[4])|(~sel_bits[1] & xored_in[6]);
assign second_level[2] = (sel_bits[1] & first_level)|(~sel_bits[1] & xored_in[9]);

// third_level
assign third_level[0] = (sel_bits[2] & second_level[0])|(~sel_bits[2] & xored_in[4]);
assign third_level[1] = (sel_bits[2] & second_level[1])|(~sel_bits[2] & xored_in[6]);
assign third_level[2] = (sel_bits[2] & second_level[2])|(~sel_bits[2] & xored_in[9]);

// fourth_level
assign fourth_level[0] = (sel_bits[3] & third_level[0])|(~sel_bits[3] & xored_in[2]);
assign fourth_level[1] = (sel_bits[3] & third_level[1])|(~sel_bits[3] & xored_in[9]);
assign fourth_level[2] = (sel_bits[3] & third_level[2])|(~sel_bits[3] & xored_in[8]);

// fifth_level
assign fifth_level[0] = (sel_bits[4] & fourth_level[0])|(~sel_bits[4] & xored_in[6]);
assign fifth_level[1] = (sel_bits[4] & fourth_level[1])|(~sel_bits[4] & xored_in[8]);
assign fifth_level[2] = (sel_bits[4] & fourth_level[2])|(~sel_bits[4] & xored_in[9]);

// sixth_level
assign sixth_level[0] = (sel_bits[5] & fifth_level[0])|(~sel_bits[5] & xored_in[4]);
assign sixth_level[1] = (sel_bits[5] & fifth_level[1])|(~sel_bits[5] & xored_in[6]);
assign sixth_level[2] = (sel_bits[5] & fifth_level[2])|(~sel_bits[5] & xored_in[9]);

// seventh_level
assign seventh_level[0] = (sel_bits[6] & sixth_level[0])|(~sel_bits[6] & xored_in[6]);
assign seventh_level[1] = (sel_bits[6] & sixth_level[1])|(~sel_bits[6] & xored_in[8]);
assign seventh_level[2] = (sel_bits[6] & sixth_level[2])|(~sel_bits[6] & xored_in[9]);

// eighth_level
assign eighth_level[0] = (sel_bits[7] & seventh_level[0])|(~sel_bits[7] & seventh_level[2]);
assign eighth_level[1] = (sel_bits[7] & seventh_level[1])|(~sel_bits[7] & xored_in[8]);

// nineth_level
assign nineth_level[0] = (sel_bits[8] & eighth_level[0])|(~sel_bits[8] & xored_in[9]);
assign nineth_level[1] = (sel_bits[8] & eighth_level[1])|(~sel_bits[8] & xored_in[8]);

//ten_level
assign tenth_level = (sel_bits[9] & nineth_level[0])|(~sel_bits[9] & nineth_level[1]);

// final_level
assign final_out = (sel_bits[10] & tenth_level)|(~sel_bits[10] & xored_in[9]);

// update next value
assign     next_out = out + final_out;


genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<`opt_length; gi=gi+1) begin : genbit
    if(gi == 0 || gi == 2 || gi == 4 || gi == 6 || gi == 8 || gi ==9) begin
        assign SN_in[gi] = ((~sel_bits[`n-2] & in[gi]) | (sel_bits[`n-2] & in[`order - gi])) > R_y;
        if(gi == 2 || gi == 6) begin
            assign xored_in[gi] = ~SN_in[gi];
        end
        else begin
            assign xored_in[gi] = SN_in[gi];
        end 
    end
end

assign done = (sel_bits ==`pow2n_1-1);

// prepare the input
always_ff @(posedge clock) begin
    if(done | start) begin // like a combo of reset & enable
        out <= 0;
    end
    else begin
        out <= next_out;
    end
end

endmodule

module HWA_opt_n_2(
    input [`n-3:0]                in[`order:0],//Binary number
    input                         start,
    input                         clock,// digital clock
    input [`n-3:0]                R_y, //random numbers from RNG
    input [`n-3:0]                sel_bits,
    output logic [`n-3:0]         out,//Binary number
    output logic                  done
);
//localparam [`opt_length-1:0] sign_b = `opt_length'b0011001100;

logic [`n-3:0]                next_out; //running Binary output
logic [`opt_length-1:0]       SN_in, xored_in;

logic [1:0]             first_level;
logic [1:0]             second_level;
logic [1:0]             third_level;
logic [1:0]             fourth_level;
logic [1:0]             fifth_level;
logic [1:0]             sixth_level;
logic [1:0]             seventh_level;
logic [1:0]             eighth_level;
logic                   nineth_level;
logic                   final_out;

// for debugging
// first level
assign first_level[0] = (sel_bits[0] & xored_in[0])|(~sel_bits[0] & xored_in[2]);
assign first_level[1] = (sel_bits[0] & xored_in[4])|(~sel_bits[0] & xored_in[6]);

// second_level
assign second_level[0] = (sel_bits[1] & first_level[0])|(~sel_bits[1] & first_level[1]);
assign second_level[1] = (sel_bits[1] & xored_in[4])|(~sel_bits[1] & xored_in[6]);

// third_level
assign third_level[0] = (sel_bits[2] & second_level[0])|(~sel_bits[2] & xored_in[2]);
assign third_level[1] = (sel_bits[2] & second_level[1])|(~sel_bits[2] & xored_in[8]);

// fourth_level
assign fourth_level[0] = (sel_bits[3] & third_level[0])|(~sel_bits[3] & xored_in[6]);
assign fourth_level[1] = (sel_bits[3] & third_level[1])|(~sel_bits[3] & xored_in[8]);

// fifth_level
assign fifth_level[0] = (sel_bits[4] & fourth_level[0])|(~sel_bits[4] & xored_in[4]);
assign fifth_level[1] = (sel_bits[4] & fourth_level[1])|(~sel_bits[4] & xored_in[6]);

// sixth_level
assign sixth_level[0] = (sel_bits[5] & fifth_level[0])|(~sel_bits[5] & xored_in[6]);
assign sixth_level[1] = (sel_bits[5] & fifth_level[1])|(~sel_bits[5] & xored_in[8]);

// seventh_level
assign seventh_level[0] = (sel_bits[6] & sixth_level[0])|(~sel_bits[6] & xored_in[8]);
assign seventh_level[1] = (sel_bits[6] & sixth_level[1])|(~sel_bits[6] & xored_in[9]);

// eighth_level
assign eighth_level[0] = (sel_bits[7] & seventh_level[0])|(~sel_bits[7] & xored_in[8]);
assign eighth_level[1] = (sel_bits[7] & seventh_level[1])|(~sel_bits[7] & xored_in[9]);

// nineth_level
assign nineth_level = (sel_bits[8] & eighth_level[0])|(~sel_bits[8] & eighth_level[1]);

// tenth_level
assign final_out = (sel_bits[9] & nineth_level)|(~sel_bits[9] & xored_in[9]);

// update next value
assign     next_out = out + final_out;


genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<`opt_length; gi=gi+1) begin : genbit
    if(gi == 0 || gi == 2 || gi == 4 || gi == 6 || gi == 8 || gi ==9) begin
        assign SN_in[gi] = ((~sel_bits[`n-3] & in[gi]) | (sel_bits[`n-3] & in[`order - gi])) > R_y;
        if(gi == 2 || gi == 6) begin
            assign xored_in[gi] = ~SN_in[gi];
        end
        else begin
            assign xored_in[gi] = SN_in[gi];
        end 
    end
end

assign done = (sel_bits ==`pow2n_2-1);

// prepare the input
always_ff @(posedge clock) begin
    if(done | start) begin // like a combo of reset & enable
        out <= 0;
    end
    else begin
        out <= next_out;
    end
end

endmodule

