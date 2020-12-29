module BC_FIR_1(
    input [`n-1:0]                in[38:0],//Binary number
    output logic [`n-1:0]         out//Binary number
);

// n = 12
//localparam [`n-1:0] b[38:0] = {`n'd0,`n'd0,`n'd2,`n'd0,`n'd5,`n'd0,`n'd11,`n'd0,`n'd23,`n'd0,`n'd43,`n'd0,`n'd76,`n'd0,`n'd133,`n'd0,`n'd258,`n'd0,`n'd835,`n'd1324,`n'd835,`n'd0,`n'd258,`n'd0,`n'd133,`n'd0,`n'd76,`n'd0,`n'd43,`n'd0,`n'd23,`n'd0,`n'd11,`n'd0,`n'd5,`n'd0,`n'd2,`n'd0,`n'd0};
// n = 8
localparam [`n-1:0] b[19:0] = {`n'd0,`n'd0,`n'd0,`n'd0,`n'd0,`n'd0,`n'd0,`n'd0,`n'd255,`n'd0,`n'd1,`n'd0,`n'd254,`n'd0,`n'd4,`n'd0,`n'd248,`n'd0,`n'd26,`n'd41};

    always_comb begin
        out = out + b[8] * (in[8]+in[38-8]);
        out = out + b[10] * (in[10]+in[38-10]);
        out = out + b[12] * (in[12]+in[38-12]);
        out = out + b[14] * (in[14]+in[38-14]);
        out = out + b[16] * (in[16]+in[38-16]);
        out = out + b[18] * (in[18]+in[38-18]);
        out = out + b[19]*in[19];
    end

endmodule