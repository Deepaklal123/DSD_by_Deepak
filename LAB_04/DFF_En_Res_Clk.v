`timescale 1ns / 1ps
// Author :     Deepak Lal  CMS: 041-18-0030
// Asynchronous Reset, Synchrnous Enable
module DFF_En_Res_Clk(q,clk, d, reset, en  );
input clk, d, reset, en;
output reg q;
always@(posedge clk, posedge reset)
begin
    if (reset)
       q <=1'b0;
    else if( en==0)
        q<=q; 
    else
        q<=d;    
  end 
endmodule
