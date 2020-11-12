//might use symmetric property to save area

`define n 12
`define pow2n 4096

module HWA_1(
    input [`n:0]                in[38:0],//Binary number
    input                       start,
    input                       clock,// digital clock
    input [`n-1:0]              R_y, //random numbers from RNG
    input [`n-1:0]              sel_bits,
    output logic [`n:0]         out,//Binary number
    output logic                done
);

localparam [38:0] sign_b = 39'b110011001100110011000110011001100110011;

logic [`n:0]         next_out; //running Binary output
logic [38:0]     SN_in, xored_in;

logic [5:0]          first_level;
logic [8:0]          second_level;
logic [8:0]          third_level;
logic [7:0]          fourth_level;
logic [4:0]          fifth_level;

logic [3:0]          sixth_level;
logic [3:0]          seventh_level;

logic [2:0]          eighth_level;

logic [3:0]          nineth_level;
logic [2:0]          tenth_level;
logic [1:0]          eleventh_level;
logic                final_out;


// for debugging
// first level
assign first_level[0] = (sel_bits[0] & xored_in[4])|(~sel_bits[0] & xored_in[20]);
assign first_level[1] = (sel_bits[0] & xored_in[6])|(~sel_bits[0] & xored_in[24]);
assign first_level[2] = (sel_bits[0] & xored_in[8])|(~sel_bits[0] & xored_in[28]);
assign first_level[3] = (sel_bits[0] & xored_in[10])|(~sel_bits[0] & xored_in[30]);
assign first_level[4] = (sel_bits[0] & xored_in[14])|(~sel_bits[0] & xored_in[32]);
assign first_level[5] = (sel_bits[0] & xored_in[18])|(~sel_bits[0] & xored_in[34]);

// second_level
assign second_level[0] = (sel_bits[1] & first_level[0])|(~sel_bits[1] & xored_in[16]);
assign second_level[1] = (sel_bits[1] & first_level[1])|(~sel_bits[1] & xored_in[18]);
assign second_level[2] = (sel_bits[1] & first_level[2])|(~sel_bits[1] & xored_in[20]);
assign second_level[3] = (sel_bits[1] & first_level[3])|(~sel_bits[1] & xored_in[22]);
assign second_level[4] = (sel_bits[1] & first_level[4])|(~sel_bits[1] & xored_in[28]);
assign second_level[5] = (sel_bits[1] & first_level[5])|(~sel_bits[1] & xored_in[30]);
assign second_level[6] = (sel_bits[1] & xored_in[2])|(~sel_bits[1] & xored_in[32]);
assign second_level[7] = (sel_bits[1] & xored_in[6])|(~sel_bits[1] & xored_in[10]);
assign second_level[8] = (sel_bits[1] & xored_in[8])|(~sel_bits[1] & xored_in[36]);

// third_level
assign third_level[0] = (sel_bits[2] & second_level[0])|(~sel_bits[2] & xored_in[4]);
assign third_level[1] = (sel_bits[2] & second_level[1])|(~sel_bits[2] & xored_in[8]);
assign third_level[2] = (sel_bits[2] & second_level[2])|(~sel_bits[2] & xored_in[12]);
assign third_level[3] = (sel_bits[2] & second_level[3])|(~sel_bits[2] & xored_in[14]);
assign third_level[4] = (sel_bits[2] & second_level[4])|(~sel_bits[2] & xored_in[19]);
assign third_level[5] = (sel_bits[2] & second_level[5])|(~sel_bits[2] & xored_in[24]);
assign third_level[6] = (sel_bits[2] & second_level[6])|(~sel_bits[2] & xored_in[26]);
assign third_level[7] = (sel_bits[2] & second_level[7])|(~sel_bits[2] & xored_in[30]);
assign third_level[8] = (sel_bits[2] & second_level[8])|(~sel_bits[2] & xored_in[34]);

// fourth_level
assign fourth_level[0] = (sel_bits[3] & third_level[0])|(~sel_bits[3] & third_level[7]);
assign fourth_level[1] = (sel_bits[3] & third_level[1])|(~sel_bits[3] & third_level[8]);
assign fourth_level[2] = (sel_bits[3] & third_level[2])|(~sel_bits[3] & xored_in[6]);
assign fourth_level[3] = (sel_bits[3] & third_level[3])|(~sel_bits[3] & xored_in[10]);
assign fourth_level[4] = (sel_bits[3] & third_level[4])|(~sel_bits[3] & xored_in[12]);
assign fourth_level[5] = (sel_bits[3] & third_level[5])|(~sel_bits[3] & xored_in[19]);
assign fourth_level[6] = (sel_bits[3] & third_level[6])|(~sel_bits[3] & xored_in[26]);
assign fourth_level[7] = (sel_bits[3] & xored_in[28])|(~sel_bits[3] & xored_in[32]);

// fifth_level
assign fifth_level[0] = (sel_bits[4] & fourth_level[0])|(~sel_bits[4] & fourth_level[5]);
assign fifth_level[1] = (sel_bits[4] & fourth_level[1])|(~sel_bits[4] & fourth_level[6]);
assign fifth_level[2] = (sel_bits[4] & fourth_level[2])|(~sel_bits[4] & fourth_level[7]);
assign fifth_level[3] = (sel_bits[4] & fourth_level[3])|(~sel_bits[4] & xored_in[8]);
assign fifth_level[4] = (sel_bits[4] & fourth_level[4])|(~sel_bits[4] & xored_in[30]);

// sixth_level
assign sixth_level[0] = (sel_bits[5] & fifth_level[0])|(~sel_bits[5] & fifth_level[4]);
assign sixth_level[1] = (sel_bits[5] & fifth_level[1])|(~sel_bits[5] & xored_in[10]);
assign sixth_level[2] = (sel_bits[5] & fifth_level[2])|(~sel_bits[5] & xored_in[19]);
assign sixth_level[3] = (sel_bits[5] & fifth_level[3])|(~sel_bits[5] & xored_in[28]);

// seventh_level
assign seventh_level[0] = (sel_bits[6] & sixth_level[0])|(~sel_bits[6] & xored_in[12]);
assign seventh_level[1] = (sel_bits[6] & sixth_level[1])|(~sel_bits[6] & xored_in[18]);
assign seventh_level[2] = (sel_bits[6] & sixth_level[2])|(~sel_bits[6] & xored_in[20]);
assign seventh_level[3] = (sel_bits[6] & sixth_level[3])|(~sel_bits[6] & xored_in[26]);

// eighth_level
assign eighth_level[0] = (sel_bits[7] & seventh_level[0])|(~sel_bits[7] & seventh_level[3]);
assign eighth_level[1] = (sel_bits[7] & seventh_level[1])|(~sel_bits[7] & xored_in[14]);
assign eighth_level[2] = (sel_bits[7] & seventh_level[2])|(~sel_bits[7] & xored_in[24]);

// nineth_level
assign nineth_level[0] = (sel_bits[8] & eighth_level[0])|(~sel_bits[8] & xored_in[16]);
assign nineth_level[1] = (sel_bits[8] & eighth_level[1])|(~sel_bits[8] & xored_in[18]);
assign nineth_level[2] = (sel_bits[8] & eighth_level[2])|(~sel_bits[8] & xored_in[19]);
assign nineth_level[3] = (sel_bits[8] & xored_in[20])|(~sel_bits[8] & xored_in[22]);

// tenth_level
assign tenth_level[0] = (sel_bits[9] & nineth_level[0])|(~sel_bits[9] & nineth_level[3]);
assign tenth_level[1] = (sel_bits[9] & nineth_level[1])|(~sel_bits[9] & xored_in[18]);
assign tenth_level[2] = (sel_bits[9] & nineth_level[2])|(~sel_bits[9] & xored_in[20]);

// eleventh_level
assign eleventh_level[0] = (sel_bits[10] & tenth_level[0])|(~sel_bits[10] & tenth_level[2]);
assign eleventh_level[1] = (sel_bits[10] & tenth_level[1])|(~sel_bits[10] & xored_in[19]);


// final_output
assign final_out = (sel_bits[11] & eleventh_level[0])|(~sel_bits[11] & eleventh_level[1]);

// update next value


assign     next_out = out + final_out;


genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<39; gi=gi+1) begin : genbit
    assign SN_in[gi] = (in[gi] > R_y);
    if(sign_b[gi]==1) begin
        assign xored_in[gi] = ~SN_in[gi];
    end
    else begin
        assign xored_in[gi] = SN_in[gi];
    end
end

assign done = (sel_bits==`pow2n-1);
// prepare the input
always_ff @(posedge clock) begin
    if(done | start) begin // like a combo of reset & enable
        out               <= 0;
    end
    else begin
        out <= next_out;
    end
end

endmodule