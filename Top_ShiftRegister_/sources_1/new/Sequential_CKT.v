`timescale 1ns / 1ps


module Sequential_CKT(clkin, clkout);
input clkin;
output reg clkout;

reg [31:0] counter;

initial 
begin
clkout = 1'b0; // blocking assignment 
counter=0;
end
always@(posedge clkin)
begin
    if (counter >= 100000000)begin
    counter <= 1'b0;   // non-blocking assignment 
    clkout <= ~ clkout; end
    else
    counter <= counter + 1;
end
endmodule 

//module TB;
//reg clkin;
//wire clkout;

//parameter T = 10; // 10 ns

//initial
//clkin = 0;
//always 
//#(T/2) clkin = ~ clkin;

//Sequential_CKT inst0(clkin, clkout);

//endmodule 
