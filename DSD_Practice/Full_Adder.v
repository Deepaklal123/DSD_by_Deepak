`timescale 1ns / 1ps

//Author Name:  Deepak Lal
// Full Adder circuit Using Gate-level Modelling
module Full_Adder(sum, cout, cin, A, B );
input cin,A, B;
output cout, sum;
wire s1,s2, s3;
//gates for sum expression
xor xor1(s1, A, B);
xor xor2(sum, s1, cin);
 // gates for cout  expression
and and1(s3, A,B);
and and2(s2, s1, cin);
or or1(cout,s2, s3);   
endmodule
