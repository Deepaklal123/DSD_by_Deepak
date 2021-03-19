`timescale 1ns / 1ps

// Author Name: Deepak Lal       041-18-0030
module Four_to_one_Mux( out, s0,s1, I0, I1, I2, I3); // size of ports
input s0,s1, I0, I1, I2, I3;  
output out;
wire wr0, wr1, wr2, wr3;
// inverting inputs s0 and s1
not not1(invS0, s0);
not not2(invS1, s1);
// gates 
or or1(out, wr0, wr1, wr2, wr3);
and and0(wr3, s0, s1, I3);
and and1(wr2, invS0, s1, I2);
and and2(wr1, s0, invS1, I1);
and and3(wr0, invS0, invS1, I0);
endmodule
