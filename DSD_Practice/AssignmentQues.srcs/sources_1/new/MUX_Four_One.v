`timescale 1ns / 1ps
// Author Name: Deepak lal
module MUX_Four_One(out, In, Selector);
//defining size of inputs and outputs
input [3:0] In;
input [1:0] Selector;
output out;

//wires
wire a,b,c,d;

//expression in dataflow
assign a = ((In[0] & (~Selector[0]) & (~Selector[1])));
assign b = ((In[1] & (Selector[0]) & (~Selector[1])));
assign c = ((In[2] & (~Selector[0]) & (Selector[1])));
assign d = ((In[3] & (Selector[0]) & (Selector[1])));

assign out = ((A | B) | (C | D));

endmodule