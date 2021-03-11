`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 12:54:30 PM
// Design Name: 
// Module Name: conditional_oper
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


module conditional_oper(  output Out, input D0, D1, D2, D3, s0, s1 );
// 4 bit multiplexer 

assign Out = s1? (s0 ? D3: D1) : (s0? D1:D0);

endmodule
