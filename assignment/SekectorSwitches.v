`timescale 1ns / 1ps

module SekectorSwitches(out, In, Selector);
//size
input wire [15:0] In;
input wire [1:0] Selector;
output reg [3:0] out;


always@(*)
begin
    case(Selector)
    2'b00:  out = In[3:0];
    2'b01:  out = In[7:4];
    2'b10:  out = In[11:8];
    2'b11:  out = In[15:12];
    default:out = 4'bzzzz;
    endcase
end

endmodule
