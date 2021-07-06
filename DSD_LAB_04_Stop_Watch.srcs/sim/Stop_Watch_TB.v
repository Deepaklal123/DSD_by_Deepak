`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// NAME: Deepak Lal
// CMS : 041-18-0030
// DSD Digital System Design
// Sukkur IBA University
//LAB-04
//////////////////////////////////////////////////////////////////////////////////
module stopwatch_TB();
//ports
reg clock_100Mhz; // 100 Mhz clock source FPGA
reg reset; // reset
reg Start;
wire [7:0] Anode_Activate; // anode signals of the 7-segment LED display
wire [6:0] LED_out;
//clock
initial
clock_100Mhz = 0;
always
#5 clock_100Mhz = ~clock_100Mhz;
//simulation
initial
begin
    reset = 0;
    #10 reset = 1;
    @(negedge clock_100Mhz) reset = 0;
   
    Start = 1;
    repeat(1000000000000000)@(negedge clock_100Mhz);
    $stop;
end
//instantiation
Time_multiplexing Watch0( clock_100Mhz,reset,Anode_Activate,LED_out,Start );
endmodule