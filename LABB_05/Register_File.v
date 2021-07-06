`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// NAME: Deepak Lal
// CMS : 041-18-0030
// DSD Digital System Design
// Sukkur IBA University
//LAB-04
//////////////////////////////////////////////////////////////////////////////////
module Register_File
#(parameter B = 8, // number of bits 
            W = 2 // number of address bits 
) 
( 
input wire clk, 
input wire wr_en, 
input wire [W-1:0] w_addr, r_addr, 
input wire [B-1:0] w_data, 
output wire [B-1:0] r_data 
); 
// sigr~al declaration 
reg [B-1:0] array_reg [2**W-1:0] ; 
// hodv 
// rz3rire operation 
always @(posedge clk) 
if (wr_en) 
array_reg [w_addr] <= w_data; 
// read operation 
assign r_data = array_reg [r_addr] ; 
endmodule
//////////////////////////////////////////////////////////////////////////////////
// NAME: Deepak Lal
// CMS : 041-18-0030
// DSD Digital System Design
// Sukkur IBA University
//LAB-04
//////////////////////////////////////////////////////////////////////////////////
//Test bench for Register File
module Register_file_TB();
parameter B = 8,
          W = 2;
reg clk; 
reg wr_en; 
reg [W-1:0] w_addr, r_addr; 
reg [B-1:0] w_data; 
wire [B-1:0] r_data;

//instantiation register file
Register_File RF0(clk, wr_en, w_addr, r_addr, w_data, r_data);

//clock
initial
clk = 0;

always
#10 clk = ~ clk;

//simulation
initial
begin
    wr_en = 0;
    w_addr = 0;
    r_addr = 0;
    w_data = 0;
    @(negedge clk);
    
    wr_en = 1; w_data = 8'b01010101; w_addr = 2'b01;
    @(negedge clk);
    
    wr_en = 0; r_addr = 2'b01;
    @(negedge clk);
    $stop;
end
endmodule
