module BC_FIR_1(
    input [`n-1:0]                in[38:0],//Binary number
    output logic [`n-1:0]         out//Binary number
);

// n = 12
//localparam [`n-1:0] b[38:0] = {`n'd0,`n'd0,`n'd2,`n'd0,`n'd5,`n'd0,`n'd11,`n'd0,`n'd23,`n'd0,`n'd43,`n'd0,`n'd76,`n'd0,`n'd133,`n'd0,`n'd258,`n'd0,`n'd835,`n'd1324,`n'd835,`n'd0,`n'd258,`n'd0,`n'd133,`n'd0,`n'd76,`n'd0,`n'd43,`n'd0,`n'd23,`n'd0,`n'd11,`n'd0,`n'd5,`n'd0,`n'd2,`n'd0,`n'd0};
// n = 8
localparam [`n-1:0] b[19:0] = {`n'd0,`n'd0,`n'd244,`n'd0,`n'd199,`n'd0,`n'd230,`n'd0,`n'd255,`n'd0,`n'd139,`n'd0,`n'd254,`n'd0,`n'd226,`n'd0,`n'd248,`n'd0,`n'd124,`n'd213};
/*
    always_comb begin
        out = b[2] * (in[2]+in[38-2]);
        out = out + b[4] * (in[4]+in[38-4]);
        out = out + b[6] * (in[6]+in[38-6]);
        out = out + b[8] * (in[8]+in[38-8]);
        out = out + b[10] * (in[10]+in[38-10]);
        out = out + b[12] * (in[12]+in[38-12]);
        out = out + b[14] * (in[14]+in[38-14]);
        out = out + b[16] * (in[16]+in[38-16]);
        out = out + b[18] * (in[18]+in[38-18]);
        out = out + b[19]*in[19];
    end
*/
    always_comb begin
        out = 999 * (in[2]+in[38-2]);
        out = out + 888 * (in[4]+in[38-4]);
        out = out + 777 * (in[6]+in[38-6]);
        out = out + 666 * (in[8]+in[38-8]);
        out = out + 555 * (in[10]+in[38-10]);
        out = out + 444 * (in[12]+in[38-12]);
        out = out + 333 * (in[14]+in[38-14]);
        out = out + 222 * (in[16]+in[38-16]);
        out = out + 111 * (in[18]+in[38-18]);
        out = out + 345*in[19];
    end

endmodule