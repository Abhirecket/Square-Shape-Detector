`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2024 14:02:08
// Design Name: 
// Module Name: square_shape_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module square_shape_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Inputs
    reg clk, rst, x, y;

    // Outputs
    wire square_detect_o;

    // Instantiate the unit under test (UUT)
    square_shape uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y),
        .square_detect_o(square_detect_o)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initial stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        x = 0;
        y = 0;

        // Wait for a few clock cycles after reset
        #10;
        @(posedge clk) rst = 0;

        // Test cases
        // Test case 1: (0, 0) - not a square
        
        x = 0; y = 0;

        // Test case 2: (0, 1) - not a square
        #10;
        x = 0; y = 1;

        // Test case 3: (1, 0) - not a square
        #10;
        x = 1; y = 0;

        // Test case 4: (1, 1) - square
        #10;
        x = 1; y = 1;

        // Test case 5: (0, 0) - square
        #10;
        x = 0; y = 0;
                #10;
        x = 0; y = 0;
        #10;
        x = 1; y = 1;

        // Add more test cases as needed

        // Finish simulation
        #10;
        $finish;
    end

endmodule

