`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 28.03.2024 23:21:21
// Design Name: 
// Module Name: square_shape
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


module square_shape 
(
    input clk, rst, x, y,
    
    output square_detect_o
    );
    
localparam WIDTH = 4; // cordinate for quare is (0,0) (0,1)(1,0) and (1,1) 4 possible combination.   
reg [WIDTH-1 :0] shift_x;
reg [WIDTH-1 :0] shift_y;
wire [WIDTH-1 :0] shift_nxt_x;
wire [WIDTH-1 :0] shift_nxt_y;
wire data_match;

always@(posedge clk or posedge rst)
begin
    if(rst)
    begin
        shift_x <= {WIDTH{1'b0}};
        shift_y <= {WIDTH{1'b0}};
    end
    else
    begin
        shift_x <= {shift_nxt_x[WIDTH-2:0] , x};
        shift_y <= {shift_nxt_y[WIDTH-2:0] , y};
    end
end
assign shift_nxt_x = shift_x;
assign shift_nxt_y = shift_y;

//data match logic
assign data_match = (
                          //msb is matching to any lower bit data or not
                        {shift_nxt_x[3],shift_nxt_y[3]} == {shift_nxt_x[2],shift_nxt_y[2]} ||
                        {shift_nxt_x[3],shift_nxt_y[3]} == {shift_nxt_x[1],shift_nxt_y[1]} ||
                        {shift_nxt_x[3],shift_nxt_y[3]} == {shift_nxt_x[0],shift_nxt_y[0]} ||
                        //msb-1 is matching to any lower bit data or not
                        {shift_nxt_x[2],shift_nxt_y[2]} == {shift_nxt_x[1],shift_nxt_y[1]} ||
                        {shift_nxt_x[2],shift_nxt_y[2]} == {shift_nxt_x[0],shift_nxt_y[0]} ||
                        //msb-2 is matching to any lower bit data or not
                       {shift_nxt_x[1],shift_nxt_y[1]} == {shift_nxt_x[0],shift_nxt_y[0]}  
                    );
// if all 4 set of cordinates are not matching to any data then it is a square cordinate.
 assign square_detect_o = ~ data_match ;
  
endmodule
