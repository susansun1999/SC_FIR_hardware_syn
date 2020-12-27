module BC_FIR_1(
    input [`n:0]                in[38:0],//Binary number
    input                       clock,// sampling clock
    output logic [`n:0]         out//Binary number
);

localparam [`n-1:0] b[38:0] = {`n'd0,`n'd0,`n'd2,`n'd0,`n'd5,`n'd0,`n'd11,`n'd0,`n'd23,`n'd0,`n'd43,`n'd0,`n'd76,`n'd0,`n'd133,`n'd0,`n'd258,`n'd0,`n'd835,`n'd1324,`n'd835,`n'd0,`n'd258,`n'd0,`n'd133,`n'd0,`n'd76,`n'd0,`n'd43,`n'd0,`n'd23,`n'd0,`n'd11,`n'd0,`n'd5,`n'd0,`n'd2,`n'd0,`n'd0};

    always_comb begin
//        for(int i = 0; i < 38/2; i=i+1) begin
//            out = out + b[i]*(in[i]+in[38-i]);
//        end
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

endmodule