//might use symmetric property to save area
`define n 12
`define pow2n 4096
`define order 18
`define length 19
`define opt_length 10


//localparam [`order:0] sign_b = `length'b1111;

module HWA(
    input [`n:0]                in[`order:0],//Binary number
    input                       start,
    input                       clock,// digital clock
    input [`n-1:0]              R_y, //random numbers from RNG
    input [`n-1:0]              sel_bits,
    output logic [`n:0]         out,//Binary number
    output logic                done
    // for debugging
//    output logic [`n:0]         mapping_idx
);

localparam [`order:0] sign_b = `length'b0011001100011001100;


logic [`n:0]         next_out; //running Binary output
logic [`order:0]     SN_in, xored_in;

logic [3:0]          first_level;
logic [4:0]          second_level;
logic [6:0]          third_level;
logic [6:0]          fourth_level;
logic [4:0]          fifth_level;
logic [4:0]          sixth_level;
logic [4:0]          seventh_level;
logic [4:0]          eighth_level;
logic [3:0]          nineth_level;
logic [2:0]          tenth_level;
logic [1:0]          eleventh_level;
logic                final_out;



// for debugging
// first level
assign first_level[0] = (sel_bits[0] & xored_in[0])|(~sel_bits[0] & xored_in[2]);
assign first_level[1] = (sel_bits[0] & xored_in[6])|(~sel_bits[0] & xored_in[9]);
assign first_level[2] = (sel_bits[0] & xored_in[10])|(~sel_bits[0] & xored_in[12]);
assign first_level[3] = (sel_bits[0] & xored_in[16])|(~sel_bits[0] & xored_in[18]);
// second_level
assign second_level[0] = (sel_bits[1] & first_level[0])|(~sel_bits[1] & xored_in[0]);
assign second_level[1] = (sel_bits[1] & first_level[1])|(~sel_bits[1] & xored_in[4]);
assign second_level[2] = (sel_bits[1] & first_level[2])|(~sel_bits[1] & xored_in[8]);
assign second_level[3] = (sel_bits[1] & first_level[3])|(~sel_bits[1] & xored_in[10]);
assign second_level[4] = (sel_bits[1] & xored_in[14])|(~sel_bits[1] & xored_in[18]);
// third_level
assign third_level[0] = (sel_bits[2] & second_level[0])|(~sel_bits[2] & xored_in[2]);
assign third_level[1] = (sel_bits[2] & second_level[1])|(~sel_bits[2] & xored_in[4]);
assign third_level[2] = (sel_bits[2] & second_level[2])|(~sel_bits[2] & xored_in[6]);
assign third_level[3] = (sel_bits[2] & second_level[3])|(~sel_bits[2] & xored_in[8]);
assign third_level[4] = (sel_bits[2] & second_level[4])|(~sel_bits[2] & xored_in[9]);
assign third_level[5] = (sel_bits[2] & xored_in[10])|(~sel_bits[2] & xored_in[12]);
assign third_level[6] = (sel_bits[2] & xored_in[14])|(~sel_bits[2] & xored_in[16]);
// fourth_level
assign fourth_level[0] = (sel_bits[3] & third_level[0])|(~sel_bits[3] & xored_in[4]);
assign fourth_level[1] = (sel_bits[3] & third_level[1])|(~sel_bits[3] & xored_in[6]);
assign fourth_level[2] = (sel_bits[3] & third_level[2])|(~sel_bits[3] & xored_in[8]);
assign fourth_level[3] = (sel_bits[3] & third_level[3])|(~sel_bits[3] & xored_in[9]);
assign fourth_level[4] = (sel_bits[3] & third_level[4])|(~sel_bits[3] & xored_in[10]);
assign fourth_level[5] = (sel_bits[3] & third_level[5])|(~sel_bits[3] & xored_in[12]);
assign fourth_level[6] = (sel_bits[3] & third_level[6])|(~sel_bits[3] & xored_in[14]);
// fifth_level
assign fifth_level[0] = (sel_bits[4] & fourth_level[0])|(~sel_bits[4] & fourth_level[5]);
assign fifth_level[1] = (sel_bits[4] & fourth_level[1])|(~sel_bits[4] & fourth_level[6]);
assign fifth_level[2] = (sel_bits[4] & fourth_level[2])|(~sel_bits[4] & xored_in[2]);
assign fifth_level[3] = (sel_bits[4] & fourth_level[3])|(~sel_bits[4] & xored_in[9]);
assign fifth_level[4] = (sel_bits[4] & fourth_level[4])|(~sel_bits[4] & xored_in[16]);
// sixth_level
assign sixth_level[0] = (sel_bits[5] & fifth_level[0])|(~sel_bits[5] & xored_in[6]);
assign sixth_level[1] = (sel_bits[5] & fifth_level[1])|(~sel_bits[5] & xored_in[8]);
assign sixth_level[2] = (sel_bits[5] & fifth_level[2])|(~sel_bits[5] & xored_in[9]);
assign sixth_level[3] = (sel_bits[5] & fifth_level[3])|(~sel_bits[5] & xored_in[10]);
assign sixth_level[4] = (sel_bits[5] & fifth_level[4])|(~sel_bits[5] & xored_in[12]);
// seventh_level
assign seventh_level[0] = (sel_bits[6] & sixth_level[0])|(~sel_bits[6] & xored_in[4]);
assign seventh_level[1] = (sel_bits[6] & sixth_level[1])|(~sel_bits[6] & xored_in[6]);
assign seventh_level[2] = (sel_bits[6] & sixth_level[2])|(~sel_bits[6] & xored_in[9]);
assign seventh_level[3] = (sel_bits[6] & sixth_level[3])|(~sel_bits[6] & xored_in[12]);
assign seventh_level[4] = (sel_bits[6] & sixth_level[4])|(~sel_bits[6] & xored_in[14]);
// eighth_level
assign eighth_level[0] = (sel_bits[7] & seventh_level[0])|(~sel_bits[7] & xored_in[6]);
assign eighth_level[1] = (sel_bits[7] & seventh_level[1])|(~sel_bits[7] & xored_in[8]);
assign eighth_level[2] = (sel_bits[7] & seventh_level[2])|(~sel_bits[7] & xored_in[9]);
assign eighth_level[3] = (sel_bits[7] & seventh_level[3])|(~sel_bits[7] & xored_in[10]);
assign eighth_level[4] = (sel_bits[7] & seventh_level[4])|(~sel_bits[7] & xored_in[12]);
// nineth_level
assign nineth_level[0] = (sel_bits[8] & eighth_level[0])|(~sel_bits[8] & eighth_level[4]);
assign nineth_level[1] = (sel_bits[8] & eighth_level[1])|(~sel_bits[8] & xored_in[8]);
assign nineth_level[2] = (sel_bits[8] & eighth_level[2])|(~sel_bits[8] & xored_in[9]);
assign nineth_level[3] = (sel_bits[8] & eighth_level[3])|(~sel_bits[8] & xored_in[10]);
// tenth_level
assign tenth_level[0] = (sel_bits[9] & nineth_level[0])|(~sel_bits[9] & nineth_level[3]);
assign tenth_level[1] = (sel_bits[9] & nineth_level[1])|(~sel_bits[9] & xored_in[8]);
assign tenth_level[2] = (sel_bits[9] & nineth_level[2])|(~sel_bits[9] & xored_in[10]);
// eleventh_level
assign eleventh_level[0] = (sel_bits[10] & tenth_level[0])|(~sel_bits[10] & tenth_level[2]);
assign eleventh_level[1] = (sel_bits[10] & tenth_level[1])|(~sel_bits[10] & xored_in[9]);
// final_output
assign final_out = (sel_bits[11] & eleventh_level[0])|(~sel_bits[11] & eleventh_level[1]);

// update next value
assign     next_out = out + final_out;


genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<`length; gi=gi+1) begin : genbit
    assign SN_in[gi] = (in[gi] > R_y);
    if(gi == 2 || gi == 3 || gi == 6 || gi == 7|| gi == 11|| gi == 12|| gi == 15|| gi == 16) begin
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