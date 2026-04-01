module booth_multiplier(
    input signed [3:0] A,   // Multiplicand
    input signed [3:0] B,   // Multiplier
    output reg signed [7:0] Product
);

    integer i;
    reg signed [7:0] temp;
    reg Q_1;

    always @(*) begin
        temp = 0;
        Product = 0;
        Q_1 = 0;

        for (i = 0; i < 4; i = i + 1) begin
            case ({B[i], Q_1})
                2'b01: temp = temp + (A << i);
                2'b10: temp = temp - (A << i);
                default: temp = temp;
            endcase
            Q_1 = B[i];
        end

        Product = temp;
    end

endmodule
