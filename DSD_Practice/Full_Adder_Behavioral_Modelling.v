`timescale 1ns / 1ps
// Deepak Lal
// Full Adder 
//data flow modeling

module xyz(a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;

assign {cout,sum} = a + b + cin;

endmodule