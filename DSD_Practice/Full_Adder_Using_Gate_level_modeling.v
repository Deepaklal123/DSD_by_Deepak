`timescale 1ns / 1ps
// Deepak Lal
// Full Adder 
//using Gate Level Modeling

module xyz(a, b, cin, sum, cout);
input a, b, cin;
output sum, cout;
wire d,e,f,g;

    xor (d, a, b);
    xor (sum, d, cin);
    and (e, a, b);
    and (f, a, cin);
    and (g, b, cin);
    or (cout, e, f, g);

endmodule