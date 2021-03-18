`timescale 1ns / 1ps

// Author :     Deepak Lal  CMS: 041-18-0030

module SR_FF( q, clk, s, r, reset, en   );
input clk, s, r , reset, en;
output reg q;
always@(posedge clk, posedge reset)
begin
    if (reset)
       q <=1'b0;
    else if( en==1'b0)
                   q<=q; 
        else if (s==1'b0 && r==1'b1)
                    q<=0;
        else if( s==1'b0 && r==1'b0)
                      q<=q;
        else if( s==1'b1 && r==1'b0)
                     q<=1;
        else if( s==1'b1 && r==1'b0)
                     q<=1'bx;
              else 
                    q<=q;
  end 
endmodule
