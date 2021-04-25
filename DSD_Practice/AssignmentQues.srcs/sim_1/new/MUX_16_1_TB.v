`timescale 1ns / 1ps

//Author NAme: Deepak Lal       041-18-0030
module MUX_16_1_TB( );
  reg [15:0] In;
  reg [7:0] Selector;
  wire [3:0] out;

//assigning values to the inputs and slectors 
initial
begin
    #00 In = 16'b0001001001001000; Selector = 8'b00100100;
    #10 In = 16'b0011101011001011; Selector = 8'b01010101;
    #10 In = 16'b0011011011110101; Selector = 8'b00001111;
    #10 $finish;
end

// dispaying author name  
initial
begin
$display("Deepak\n");
$monitor($time,"ns  Input = %b, Selector = %b, Output = %b", In, Selector, out);
end

//Instantiation here for 16 to 4
MUX_16_4 M1(out, In, Selector);

endmodule
