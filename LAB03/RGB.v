`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 05:14:46 PM
// Design Name: 
// Module Name: RGB
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


module RGB( out,sw  );
input wire [5:0] sw;
output reg [5:0] out;
always@(*) // aesterick * takes all inputs automatically
begin 
   
    out=sw;
    end
   
endmodule
