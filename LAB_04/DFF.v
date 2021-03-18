`timescale 1ns / 1ps
// Author Name : Deepak Lal       CMS: 041-18-0030

module DFF(q, d, clk );
input d, clk;
output reg q;
always@(posedge clk)
begin
    q<= d;
    
  end 
 endmodule
