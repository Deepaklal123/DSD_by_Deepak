`timescale 1ns / 1ps
// Deepak Lal
module FourBitComp_TB( );
reg [3:0] A, B;
wire AgtB, ALsB, AeqB;
initial 
begin 
// developing truth table
#00 A=4'b1110;  B=4'b0101;
#10 A=4'b1000;  B=4'b1101;
#10 A=4'b1011;  B=4'b1011;
#10 A=4'b1000;  B=4'b1000;
#10 $finish;
end
initial 
begin
$display ("Deepak Lal \n");
$monitor ($time,"ns A=%b, B=%b, (A>B) =%b, (A<B)=%b, (A=B)=%b", A,B, AgtB, ALsB, AeqB);
end
// instantiation 
Four_Bit_Comp FBC0(AgtB, ALsB, AeqB, A,B);
endmodule
