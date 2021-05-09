`timescale 1ns / 1ps
/*
Author Name: Deepak Lal
Sukkur IBA University
Code: Test Bench for Full Adder
*/

module xyz_TB(  );
reg a,b,cin;
wire cout,sum;

initial
begin 

#00 a=1'b0; b=1'b0; cin=0;  //0
#10 a=1'b0; b=1'b0; cin=1;  //1
#10 a=1'b0; b=1'b1; cin=0;  //2
#10 a=1'b0; b=1'b1; cin=1;  //3
#10 a=1'b1; b=1'b0; cin=0;  //4
#10 a=1'b1; b=1'b0; cin=1;  //5
#10 a=1'b1; b=1'b1; cin=0;  //6
#10 a=1'b1; b=1'b1; cin=1;  //7
#10 $finish;
end

initial 
$monitor ($time ,"ns, a=%b,b=%b, cin=%b, sum=%b, cout=%b", a,b,cin, sum, cout);
xyz abc(a,b,cin,sum, cout);
endmodule
