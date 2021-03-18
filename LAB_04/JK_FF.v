`timescale 1ns / 1ps
// Author :     Deepak Lal  CMS: 041-18-0030

module JK_FF( q, clk, j, k, reset, en   );
input clk, j, k , reset, en;
output reg q;
always@(posedge clk, posedge reset)
begin
    if (reset)
       q <=1'b0;
        else if( en==1'b0)
                   q<=q; 
        else if (j==1'b0 && k==1'b1)
                    q<=0;
        else if( j==1'b0 && k==1'b0)
                    q<=q;
        else if( j==1'b1 && k==1'b0)
                     q<=1;
        else if( j==1'b1 && k==1'b0)
                     q<= ~q;
              else 
                     q<=q;
  end 

endmodule
