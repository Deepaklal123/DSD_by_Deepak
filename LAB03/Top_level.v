`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 07:26:23 PM
// Design Name: 
// Module Name: Top_level
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


module Top_level(In, cc, Outt);
input [9:0] In;
output cc;
output [6:0] Outt;

wire [3:0] bcd;

Dec_to_BCD inst0(In, bcd);
Seven_SegDri inst1(bcd, Outt, cc);
endmodule
















