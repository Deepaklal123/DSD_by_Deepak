`timescale 1ns / 1ps
// Author deepak Lal
// Sukkur IBA University
module Register_file(r_data, clk, r_addr, w_addr, w_data,wr_en );

// size of the memory
parameter      B=8;         // word size
parameter      W=2;        //bits for address

//define port size
input wire clk;
input wire wr_en;
input wire [W-1:0] r_addr,w_addr;
input wire [B-1:0] w_data;
output reg  [B-1:0] r_data;

// lets initialize the memory 2D
reg [B-1:0] RAM [(2**W)-1:0];

// define reading and writing logic
always @(posedge clk)
begin
    if(wr_en)
        RAM [w_addr] <=w_data;
    else 
        r_data<= RAM [r_addr];
 
end 
endmodule



// Test Bench

module TB;
// size of the memory
parameter      B=8;         // word size
parameter      W=2;        //bits for address


reg clk;
reg wr_en;
reg [W-1:0] r_addr,w_addr;
reg [B-1:0] w_data;
wire  [B-1:0] r_data;

// instantiation
Register_file RF_inst(r_data, clk, r_addr, w_addr, w_data,wr_en );
initial
clk=0;
always 
#10 clk = ~ clk;

initial 
begin
    // writing operation
    wr_en=1; w_addr=0; w_data=100;
    @(negedge clk) w_addr=1; w_data=110;
    @(negedge clk) w_addr=2; w_data=120;
    @(negedge clk) w_addr=3; w_data=130;
    @(negedge clk) w_addr=3; w_data=140;
    
    
    // Reading Operation
    @(negedge clk)wr_en=0;       r_addr=0;
    @(negedge clk) r_addr=1; 
    @(negedge clk) r_addr=2; 
    @(negedge clk) r_addr=3;    
    
    @(negedge clk) $stop;
end
endmodule 




