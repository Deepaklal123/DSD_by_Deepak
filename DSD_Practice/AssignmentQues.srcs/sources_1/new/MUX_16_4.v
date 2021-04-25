`timescale 1ns / 1ps

module MUX_16_4(out, In, Selector);
//Defining Inputs and output sizes
input [15:0] In;
input [7:0] Selector;
output [3:0] out;

//Instantiation here
Four4_1MUx M1(out[0], In[3:0], Selector[1:0]);
Four4_1MUx M2(out[1], In[7:4], Selector[3:2]);
Four4_1MUx M3(out[2], In[11:8], Selector[5:4]);
Four4_1MUx M4(out[3], In[15:12], Selector[7:6]);

endmodule
