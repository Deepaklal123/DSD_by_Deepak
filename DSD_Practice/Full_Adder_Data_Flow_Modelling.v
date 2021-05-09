`timescale 1ns / 1ps
// Deepak Lal
// Full Adder 
//data flow modeling

module xyz(a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;


    assign sum  =  a^b^cin;	// ^ xor operation in Verilog
    assign cout = (a & b)|(a & cin)|(b & cin);	 // & and operation, | or operation

endmodule