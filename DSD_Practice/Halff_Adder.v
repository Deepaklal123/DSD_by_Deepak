`timescale 1ns / 1ps
// Author Name: Deepak Lal
module Halff_Adder(sum, cout, A,B);
input A,B;
output sum, cout;

xor xor1(sum, A,B);
and and1(cout, A,B); 
endmodule
