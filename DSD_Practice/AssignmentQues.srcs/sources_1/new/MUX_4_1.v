`timescale 1ns / 1ps

//Author NAme: Deepak Lal       041-18-0030
module MUX_4_1(out, In, Selector);
//comment here
input [3:0] In;
input [1:0] Selector;
output out;
//comment here
wire a, b, c, d, e, f;

//comment here
not not1(a, Selector[0]);
not not2(b, Selector[1]);

and and1(c, In[0], a, b);
and and2(d, In[1], Selector[0], b);
and and3(e, In[2], a, Selector[1]);
and and4(f, In[3], Selector[0], Selector[1]);

or or1(out, c, d, e, f);

endmodule
