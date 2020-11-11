module BC_FIR(
    input [`n:0]                in[`order:0],//Binary number
    input                       clock,// sampling clock
    output logic [`n:0]         out//Binary number
);

localparam [`n-1:0] b[`length-1:0] = {`n'd3,`n'd0,`n'd4075,`n'd0,`n'd78,`n'd0,`n'd3859,`n'd0,`n'd943,`n'd1533,`n'd943,`n'd0,`n'd3859,`n'd0,`n'd78,`n'd0,`n'd4075,`n'd0,`n'd3};

    always_comb begin
        out = 0;
        for(int i = 0; i < `order/2; i=i+1) begin
            out = out + b[i]*(in[i]+in[`order-i]);
        end
        out = out + b[9]*in[9];
    end

endmodule