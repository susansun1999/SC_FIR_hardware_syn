module BC_FIR(
    input [`n-1:0]                in[19-1:0],//Binary number
    output logic [`n-1:0]         out//Binary number
);
// n = 12
//localparam [`n-1:0] b[18:0] = {`n'd3,`n'd0,`n'd4075,`n'd0,`n'd78,`n'd0,`n'd3859,`n'd0,`n'd943,`n'd1533,`n'd943,`n'd0,`n'd3859,`n'd0,`n'd78,`n'd0,`n'd4075,`n'd0,`n'd3};

localparam [`n-1:0] b[9:0] = {`n'd0,`n'd0,`n'd255,`n'd0,`n'd2,`n'd0,`n'd249,`n'd0,`n'd29,`n'd48};

assign out = b[2]*(in[2]+in[18-2])+b[4]*(in[4]+in[18-4])+b[6]*(in[6]+in[18-6])+b[8]*(in[8]+in[18-8])+b[9]*in[9];

endmodule