`timescale 1ns / 1ps
// Author Name: Deepak Lal
// cms : 041-18-0030

module Universal_shit_reg_TB( );
      parameter N=8;
      reg clk,reset;
      reg [1:0] ctrl;
      reg [N-1:0] d;
      wire [N-1: 0] q;
      
      
      
      
      
     // instantiation
     universal_ShiftReg inst0(clk,reset,ctrl, d, q);
     
     // clk generation
     initial 
     clk =0;
     always
     #10 clk= ~ clk;
     
     // reset
initial
begin     
     reset =0;
     #10 reset =1;
      // un-reset and test the functionality  
     @(negedge clk) reset = 0;
     // SISO, left shifting
         @(negedge clk);
          ctrl = 2'b01; 
          d[0] = 1'b1;
         repeat(8) @(negedge clk); 
         $stop;     
     end 
   
endmodule
