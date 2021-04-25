`timescale 1ns / 1ps

// Author Deepak Lal
module Four4_1MUx(out, In, Selector);
//size
input wire [3:0] In;
input wire [1:0] Selector;
output reg out;


always@(*)
begin
    case(Selector)
    2'b00: out = In[0];
    2'b01: out = In[1];
    2'b10: out = In[2];
    2'b11: out = In[3];
    default: out = 1'bz;
    endcase
end

endmodule
