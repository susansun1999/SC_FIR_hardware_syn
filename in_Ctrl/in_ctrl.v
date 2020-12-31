module in_ctrl(
    input [`n-1:0]                in,//Binary number
    input                       clock,
    output logic [`n-1:0]         out_1 [18:0],//Binary number
    output logic [`n-1:0]         out_2 [18:0],//Binary number
    output logic [`n-1:0]         out_3 [18:0],//Binary number
    output logic [`n-1:0]         out_4 [18:0]//Binary number
);

logic [`n-1:0]       mux_in_large [8*19-1:0];
logic [`n-1:0]       next_mux_in_large [8*19-1:0]; // (order+1) binary numbers

assign     next_mux_in_large[8*19-1:1] = mux_in_large[8*19-2:0];
assign     next_mux_in_large[0] = in;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<19; gi=gi+1) begin : genbit
    assign out_1[gi] = mux_in_large[(gi+1)*1-1];
    assign out_2[gi] = mux_in_large[(gi+1)*2-1];
    assign out_3[gi] = mux_in_large[(gi+1)*3-1];
    assign out_4[gi] = mux_in_large[(gi+1)*4-1];
end

always_ff @(posedge clock) begin
    mux_in_large <= next_mux_in_large;
end

endmodule

module in_ctrl_SC(
    input [`n-3:0]                in,//Binary number
    input                         clock,
    output logic [`n-3:0]         out_1 [18:0],//Binary number
    output logic [`n-3:0]         out_2 [18:0],//Binary number
    output logic [`n-3:0]         out_3 [18:0],//Binary number
    output logic [`n-3:0]         out_4 [18:0]//Binary number
);

logic [`n-3:0]       mux_in_large [8*19-1:0];
logic [`n-3:0]       next_mux_in_large [8*19-1:0]; // (order+1) binary numbers

assign     next_mux_in_large[8*19-1:1] = mux_in_large[8*19-2:0];
assign     next_mux_in_large[0] = in;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<19; gi=gi+1) begin : genbit
    assign out_1[gi] = mux_in_large[(gi+1)*1-1];
    assign out_2[gi] = mux_in_large[(gi+1)*2-1];
    assign out_3[gi] = mux_in_large[(gi+1)*3-1];
    assign out_4[gi] = mux_in_large[(gi+1)*4-1];
end

always_ff @(posedge clock) begin
    mux_in_large <= next_mux_in_large;
end

endmodule



module in_ctrl_1(
    input [`n-1:0]                in,//Binary number
    input                       clock,
    output logic [`n-1:0]         out [38:0]//Binary number
);

logic [`n-1:0]       mux_in_large [1*39-1:0];
logic [`n-1:0]       next_mux_in_large [1*39-1:0]; // (order+1) binary numbers

assign     next_mux_in_large[1*39-1:1] = mux_in_large[1*39-2:0];
assign     next_mux_in_large[0] = in;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<39; gi=gi+1) begin : genbit
    assign out[gi] = mux_in_large[(gi+1)*1-1];
end

always_ff @(posedge clock) begin
    mux_in_large <= next_mux_in_large;
end
endmodule

module in_ctrl_1_SC(
    input [`n-2:0]                in,//Binary number
    input                       clock,
    output logic [`n-2:0]         out [38:0]//Binary number
);

logic [`n-2:0]       mux_in_large [1*39-1:0];
logic [`n-2:0]       next_mux_in_large [1*39-1:0]; // (order+1) binary numbers

assign     next_mux_in_large[1*39-1:1] = mux_in_large[1*39-2:0];
assign     next_mux_in_large[0] = in;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<39; gi=gi+1) begin : genbit
    assign out[gi] = mux_in_large[(gi+1)*1-1];
end

always_ff @(posedge clock) begin
    mux_in_large <= next_mux_in_large;
end
endmodule

module in_ctrl_1_SC_2(
    input [`n-3:0]                in,//Binary number
    input                       clock,
    output logic [`n-3:0]         out [38:0]//Binary number
);

logic [`n-3:0]       mux_in_large [1*39-1:0];
logic [`n-3:0]       next_mux_in_large [1*39-1:0]; // (order+1) binary numbers

assign     next_mux_in_large[1*39-1:1] = mux_in_large[1*39-2:0];
assign     next_mux_in_large[0] = in;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<39; gi=gi+1) begin : genbit
    assign out[gi] = mux_in_large[(gi+1)*1-1];
end

always_ff @(posedge clock) begin
    mux_in_large <= next_mux_in_large;
end
endmodule

module in_ctrl_2(
    input [`n-1:0]                in,//Binary number
    input                       clock,
    output logic [`n-1:0]         out [38:0]//Binary number
);

logic [`n-1:0]       mux_in_large [2*39-1:0];
logic [`n-1:0]       next_mux_in_large [2*39-1:0]; // (order+1) binary numbers

assign     next_mux_in_large[2*39-1:1] = mux_in_large[2*39-2:0];
assign     next_mux_in_large[0] = in;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<39; gi=gi+1) begin : genbit
    assign out[gi] = mux_in_large[(gi+1)*2-1];
end

always_ff @(posedge clock) begin
    mux_in_large <= next_mux_in_large;
end
endmodule

module in_ctrl_2_SC(
    input [`n-3:0]                in,//Binary number
    input                       clock,
    output logic [`n-3:0]         out [38:0]//Binary number
);

logic [`n-3:0]       mux_in_large [2*39-1:0];
logic [`n-3:0]       next_mux_in_large [2*39-1:0]; // (order+1) binary numbers

assign     next_mux_in_large[2*39-1:1] = mux_in_large[2*39-2:0];
assign     next_mux_in_large[0] = in;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<39; gi=gi+1) begin : genbit
    assign out[gi] = mux_in_large[(gi+1)*2-1];
end

always_ff @(posedge clock) begin
    mux_in_large <= next_mux_in_large;
end
endmodule

module in_ctrl_4(
    input [`n-1:0]                in,//Binary number
    input                       clock,
    output logic [`n-1:0]         out [38:0]//Binary number
);

logic [`n-1:0]       mux_in_large [4*39-1:0];
logic [`n-1:0]       next_mux_in_large [4*39-1:0]; // (order+1) binary numbers

assign     next_mux_in_large[4*39-1:1] = mux_in_large[4*39-2:0];
assign     next_mux_in_large[0] = in;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<39; gi=gi+1) begin : genbit
    assign out[gi] = mux_in_large[(gi+1)*4-1];
end

always_ff @(posedge clock) begin
    mux_in_large <= next_mux_in_large;
end
endmodule

module in_ctrl_4_SC(
    input [`n-3:0]                in,//Binary number
    input                       clock,
    output logic [`n-3:0]         out [38:0]//Binary number
);

logic [`n-3:0]       mux_in_large [4*39-1:0];
logic [`n-3:0]       next_mux_in_large [4*39-1:0]; // (order+1) binary numbers

assign     next_mux_in_large[4*39-1:1] = mux_in_large[4*39-2:0];
assign     next_mux_in_large[0] = in;

genvar gi;
// generate and endgenerate is optional
// generate (optional)
for (gi=0; gi<39; gi=gi+1) begin : genbit
    assign out[gi] = mux_in_large[(gi+1)*4-1];
end

always_ff @(posedge clock) begin
    mux_in_large <= next_mux_in_large;
end
endmodule