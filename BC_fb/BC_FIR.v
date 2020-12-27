module BC_FIR(
    input [`n:0]                in[(19*4-1):0],//Binary number
    input                       clock,// sampling clock
    output logic [`n:0]         out[3:0]//Binary number
);

localparam [`n-1:0] b[18:0] = {`n'd3,`n'd0,`n'd4075,`n'd0,`n'd78,`n'd0,`n'd3859,`n'd0,`n'd943,`n'd1533,`n'd943,`n'd0,`n'd3859,`n'd0,`n'd78,`n'd0,`n'd4075,`n'd0,`n'd3};
logic [`n:0]         tmp;

    always_comb begin
        /*
        for(int i = 0; i < 18/2; i=i+1) begin
            out = out + b[i]*(in[i]+in[18-i]);
        end
        */
        for(int i = 0; i < 4; i = i + 1) begin
            tmp = b[0]*in[i * 19 + 0];
            tmp = tmp + b[2]*(in[i * 19 + 2] + in[i * 19 + 18-2]);
            tmp = tmp + b[4]*(in[i * 19 + 4] + in[i * 19 + 18-4]);
            tmp = tmp + b[6]*(in[i * 19 + 6] + in[i * 19 + 18-6]);
            tmp = tmp + b[8]*(in[i * 19 + 8] + in[i * 19 + 18-8]);
            tmp = tmp + b[9]*in[i*19 + 9];
            out[i] = tmp;
        end
    end

endmodule