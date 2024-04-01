# Square Shape Detector

 This module takes clock (clk), reset (rst), x-coordinate (x), and y-coordinate (y) as inputs, and outputs square_detect_o, which indicates whether the given coordinates form a square.
 It utilizes shift registers to store the previous x and y coordinates and compares the current and previous coordinates to determine if they form a square shape. 
 The width of the coordinates is set to 4 bits, allowing for four possible combinations: (0,0), (0,1), (1,0), and (1,1).

![image](https://github.com/Abhirecket/Square-Shape-Detector/assets/46784291/7830a9c3-c2c6-4c50-a1dc-e05ea671fec1)



 This RTL design is a Verilog module named `square_shape`, which detects whether the given x and y coordinates form a square. Here's a short summary of the RTL:

- **Module Name**: `square_shape`
- **Engineer**: Abhishek Kumar Kushwaha
- **Date Created**: March 28, 2024
- **Description**: This module takes clock (`clk`), reset (`rst`), x-coordinate (`x`), and y-coordinate (`y`) as inputs, and outputs `square_detect_o`, which indicates whether the given coordinates form a square. It utilizes shift registers to store the previous x and y coordinates and compares the current and previous coordinates to determine if they form a square shape. The width of the coordinates is set to 4 bits, allowing for four possible combinations: (0,0), (0,1), (1,0), and (1,1).
- **Revision**: Revision 0.01 - File Created
- **Additional Comments**: The logic checks if any of the four possible combinations of coordinates match any of the previous coordinates. If none of the combinations match, it indicates that the coordinates form a square, and `square_detect_o` is set accordingly.


![image](https://github.com/Abhirecket/Square-Shape-Detector/assets/46784291/b01817bd-4243-42f9-813d-88271667d147)
