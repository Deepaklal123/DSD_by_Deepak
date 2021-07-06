`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// NAME: Deepak Lal
// CMS : 041-18-0030
// DSD Digital System Design
// Sukkur IBA University
//LAB-04
//////////////////////////////////////////////////////////////////////////////////
module Univ_Shift_Reg
#(parameter N=8)
    (
    input wire clk, reset, 
    input wire [1:0] ctrl,
    input wire [N-1:0] d,
    output wire [N-1:0] q,
    output reg Sout
    );
//signal declaration
reg [N-1:0] r_reg, r_next;
//central block
always@(posedge clk, posedge reset)
begin
    if(reset)
        r_reg <= 0;
    else
        r_reg <= r_next;
end
//next state logic
always@(*)
begin
    case(ctrl)
    2'b00: r_next = r_reg;
    2'b01: r_next = {d[N-1], r_reg[N-1:1]}; //right
    2'b10: r_next = {r_reg[N-2:0], d[0]};   //left
    default: r_next = d;
    endcase
end
//output logic 
assign q =r_reg;
endmodule

//test bench universal shift register
module Universal_shft_TB;
parameter N = 8;
//inputs and outputs declaration
reg clk, reset;
reg [1:0] ctrl;
reg [N-1:0] d;
wire [N-1:0] q;
wire Sout;


//instantiation
Univ_Shift_Reg UNS0(clk, reset, ctrl, d, q, Sout);
//clock generation
initial
begin
    clk = 0;
end
always
#10 clk = ~clk;
initial 
begin
//reset
reset = 0;
#10 reset = 1;
//unreset snd test functionality
 @(negedge clk) reset = 0;
//------------------
// SIPO, left shifting
   @(negedge clk); ctrl = 2'b10; d[0] = 1'b1;
   repeat(8) @(negedge clk);    
//-----------------
reset = 1;
//SIPO, right shifting
 @(negedge clk); reset = 0; ctrl = 2'b01; d[7] = 1'b1;
 repeat(8) @(negedge clk);
 //-------------
reset = 1;
 //PIPO, loading condition
  @(negedge clk); reset = 0; ctrl = 2'b11; d = 8'b10101101;
  
 //-------------
 reset = 1;
 //PIPO, left shifting
 @(negedge clk); reset = 0;ctrl = 2'b10; d = 8'b10101101;
 repeat(8) @(negedge clk); 
 //----------------
  reset = 1;
 //PIPO, right shifting
 @(negedge clk); reset = 0;ctrl = 2'b01; d = 8'b10101101;
 repeat(8) @(negedge clk); 
 $stop;  
end


endmodule