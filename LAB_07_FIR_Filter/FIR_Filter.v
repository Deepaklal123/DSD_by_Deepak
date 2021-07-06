`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// NAME: Deepak Lal
// CMS : 041-18-0030
// DSD Digital System Design
// Sukkur IBA University
//LAB-04
//////////////////////////////////////////////////////////////////////////////////
module FIR_Filter(clk, reset, data_in, data_out);
parameter N = 16;
input clk, reset;
input [N-1:0] data_in;
output reg [N-1:0] data_out; 

// coefficients defination
// Moving Average Filter, 3rd order
// four coefficients; 1/(order+1) = 1/8 = 0.125 
// 0.125 x 128(scaling factor) = 16 = 6'b010000
wire [5:0] b0 =  6'b010000; 
wire [5:0] b1 =  6'b010000; 
wire [5:0] b2 =  6'b010000; 
wire [5:0] b3 =  6'b010000;
wire [5:0] b4 =  6'b010000; 
wire [5:0] b5 =  6'b010000; 
wire [5:0] b6 =  6'b010000; 
wire [5:0] b7 =  6'b010000;
wire [N-1:0] x1, x2, x3,x4,x5,x6,x7; 

// Create delays i.e x[n-1], x[n-2], .. x[n-N]
// Instantiate D Flip Flops
DFF DFF0(clk, 0, data_in, x1); // x[n-1]
DFF DFF1(clk, 0, x1, x2);      // x[x[n-2]]
DFF DFF2(clk, 0, x2, x3);      // x[n-3] 
DFF DFF3(clk, 0, x3, x4);      // x[x[n-2]]
DFF DFF4(clk, 0, x4, x5); 
DFF DFF5(clk, 0, x5, x6);      // x[x[n-2]]
DFF DFF6(clk, 0, x6, x7); 


//  Multiplication
wire [N-1:0] Mul0, Mul1, Mul2, Mul3,Mul4,Mul5,Mul6,Mul7;  
assign Mul0 = data_in * b0; 
assign Mul1 = x1 * b1;  
assign Mul2 = x2 * b2;  
assign Mul3 = x3 * b3; 
assign Mul4 = x4 * b4;
assign Mul5 = x5 * b5;
assign Mul6 = x6 * b6;
assign Mul7 = x7 * b7; 

 
// Addition operation
wire [N-1:0] Add_final; 
assign Add_final = Mul0 + Mul1 + Mul2 + Mul3 + Mul4 + Mul5 + Mul6 + Mul7;

// Final calculation to output 
always@(posedge clk)
data_out <= Add_final; 
endmodule
module DFF(clk, reset, data_in, data_delayed);
parameter N = 16;
input clk, reset;
input [N-1:0] data_in;
output reg [N-1:0] data_delayed; 

always@(posedge clk, posedge reset)
begin
    if (reset)
    data_delayed <= 0;
    else
    data_delayed <= data_in; 
end
endmodule