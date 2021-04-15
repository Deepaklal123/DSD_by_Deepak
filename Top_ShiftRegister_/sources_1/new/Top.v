`timescale 1ns / 1ps
module Top(clkIn, In, q0, q1, q2, q3);
input clkIn, In;
output q0, q1, q2, q3;
wire clkout;

Sequential_CKT inst0(clkIn, clkout);
Shift_register inst1(q0, q1, q2, q3, In, clkout);



endmodule

