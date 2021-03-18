`timescale 1ns / 1ps
// Author NAme : Deepak Lal     041-18-0030
module Two_Bit_comp(A_less_B, A_equ_B, A_grt_B, A0, A1, B0, B1 );
input A0, A1, B0, B1 ;
output A_less_B, A_equ_B, A_grt_B;
wire inv_A0,inv_A1,inv_B0,inv_B1;
wire s0,s1,s2,s3,s4,s5,s6,s7;

  not not0(inv_A0, A0);
  not not1(inv_A1, A1);
  not not2(inv_B0, B0);
  not not3(inv_B1, B1);

// A< B
or or1(A_less_B, s0,s1,s2);
and and1(s0, inv_A1, B1);
and and2(s1,inv_A0, B0, B1);
and and3(s2, inv_A1,inv_A0, B0);
//  A=B
and and4(A_equ_B, s3,s4);
xnor xnor1(s3,A1,B1);
xnor xnor2(s4, A0,B0);
// A>B
or or2(A_grt_B, s5,s6,s7);
and and5(s5,A1,~B1);
and and6(s6, A0, inv_B1,inv_B0);
and and7(s7, A1,A0,inv_B0);
endmodule