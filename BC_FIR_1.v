module BC_FIR_1(
    input [`n:0]                in[38:0],//Binary number
    input                       clock,// sampling clock
    output logic [`n:0]         out//Binary number
);

localparam [`n-1:0] b[38:0] = {`n'd0,`n'd0,`n'd2,`n'd0,`n'd5,`n'd0,`n'd11,`n'd0,`n'd23,`n'd0,`n'd43,`n'd0,`n'd76,`n'd0,`n'd133,`n'd0,`n'd258,`n'd0,`n'd835,`n'd1324,`n'd835,`n'd0,`n'd258,`n'd0,`n'd133,`n'd0,`n'd76,`n'd0,`n'd43,`n'd0,`n'd23,`n'd0,`n'd11,`n'd0,`n'd5,`n'd0,`n'd2,`n'd0,`n'd0};

    always_comb begin
        out = 0;
        for(int i = 0; i < 38/2; i=i+1) begin
            out = out + b[i]*(in[i]+in[38-i]);
        end
        out = out + b[19]*in[19];
    end

endmodule