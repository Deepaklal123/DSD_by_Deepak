`timescale 1ns / 1ps
module And_Gate_TB(  );
reg a,b;
wire c;

initial
begin

#00 a=1'b0; b=1'b0;
#10 a=1'b0; b=1'b1;
#10 a=1'b1; b=1'b0;
#10 a=1'b1; b=1'b1;
#10 $finish;
end

initial
$monitor($time, "ns, a=%b, b=%b, c=%b", a,b,c);
And_Gate abc(a,b,c);
endmodule
