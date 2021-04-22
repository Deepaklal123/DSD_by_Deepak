`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Deepak Lal 
// 041-18-0030
//////////////////////////////////////////////////////////////////////////////////


module Free_Running_Shift_Reg
  #(parameter N=8)
    (
      input wire clk, reset,
      input wire s_in,
      output wire s_out 
    );
    
    // signal delacaration
    reg [N-1:0] r_reg;
    wire [N-1:0] r_next;
    
    //body
    // register
    always @ posedge clk, posedge reset)
        if (reset)
            r_reg <=0;
        else
           r_reg <= r_next;
        // next state logic
        assign r_next= { s_in, r_reg[N-1:1]};
        //output logc
        assign s_out= r_reg[0]; 
endmodule
