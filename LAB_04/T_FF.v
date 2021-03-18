`timescale 1ns / 1ps


module T_FF(  q, clk, t, reset, en  );
input clk, t, reset, en;
output reg q;
always@(posedge clk, posedge reset)
begin
    if (reset)
       q<=1'b0';
       else if (en==1'b0)
        q<=q;
       else if ( t==0)
         q<=q;
       else if ( t==1)
         q<=~q;
       else 
         q<=q;
  end 

endmodule
