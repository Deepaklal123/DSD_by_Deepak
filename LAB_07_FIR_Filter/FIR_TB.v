`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// NAME: Deepak Lal
// CMS : 041-18-0030
// DSD Digital System Design
// Sukkur IBA University
//////////////////////////////////////////////////////////////////////////////////
module FIR_TB; 
parameter N = 16;
reg clk, reset;
reg [N-1:0] data_in;
wire [N-1:0] data_out; 
FIR_Filter inst0(clk, reset, data_in, data_out);
// input sine wave data
initial
$readmemb("C:/Users/IBA Student/Desktop/AQPSA LAB#06 Continue of Lab5/signal.data", RAMM);
// Create the RAM
reg [N-1:0] RAMM [31:0]; 
// create a clock
initial 
clk = 0;
always 
#10 clk = ~ clk;  

// Read RAMM data and give to design
always@(posedge clk)
    data_in <= RAMM[Address]; 
    
// Address counter
reg [4:0] Address; 
initial
Address = 1; 
always@(posedge clk)
begin
    if (Address == 31)
        Address = 0; 
    else
        Address = Address + 1; 
end     

endmodule