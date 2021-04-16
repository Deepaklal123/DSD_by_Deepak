`timescale 1ns / 1ps
//Author Name:  Deepak Lal
module SelectorSw_TB(  );
  reg [15:0] In;
  reg [1:0] Selector;
  wire [3:0] out;

//assigning values to the inputs and slectors 
initial
begin
    #00 In = 16'b0101011101001001; Selector = 2'b00;
    #10 In = 16'b0011101011001011; Selector = 2'b01;
    #10 In = 16'b0011101011001011; Selector = 2'b10;
    #10 In = 16'b0011011011110101; Selector = 2'b11;
    #10 $finish;
end

initial
begin
$display("Deepak\n");
$monitor($time,"ns  Input = %b, Selector = %b, Output = %b", In, Selector, out);
end

//Instantiation 
SekectorSwitches M1(out, In, Selector);

endmodule
