`timescale 1ns / 1ps
//
// Author Name:     Deepak lal  CMS: 041-18-0030
module DFF_2( q, clk, d, reset );
input clk, d, reset;
output reg q;
always@(posedge clk, posedge reset)
begin
    if (reset==1)
   
        q <=1'b0;
       else 
        q<=d; 

    
  end 
endmodule
