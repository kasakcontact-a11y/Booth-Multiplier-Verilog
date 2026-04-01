`timescale 1ns/1ps

module testbench;

    reg signed [3:0] A, B;
    wire signed [7:0] Product;

    // Instantiate the module
    booth_multiplier uut (
        .A(A),
        .B(B),
        .Product(Product)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, testbench);

        // Test cases
        A = 4'd3;  B = 4'd2;   #10;
        A = -4'd3; B = 4'd2;   #10;
        A = 4'd3;  B = -4'd2;  #10;
        A = -4'd3; B = -4'd2;  #10;

        A = 4'd7;  B = 4'd3;   #10;
        A = -4'd4; B = 4'd2;   #10;

        $finish;
    end

endmodule
