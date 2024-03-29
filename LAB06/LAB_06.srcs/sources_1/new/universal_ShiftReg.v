`timescale 1ns / 1ps

// Author Name:     Deepak Lal      041-18-0030 
module universal_ShiftReg
    #(parameter N=8) 
    (
      input wire clk,reset,
      input wire [1:0] ctrl,
      input wire [N-1:0] d, 
      output wire [N-1: 0] q  
    );
    
    //signal declaration
    reg [N-1:0] r_reg, r_next;
    //body
    //register
    always @(posedge clk, posedge reset)
        if (reset)
            r_reg<=0;
        else
            r_reg <= r_next;
            
            
    //next stage logic
    always@ (*)
        case(ctrl)
            2'b00: r_next =r_reg;                              //no op
            2'b01: r_next= {r_reg[N-2:0], d[0]};               //shift left
            2'b01: r_next= {d[N-1],r_reg[N-1:1]};              //shift right
            default: r_next =d;                                //load
            endcase
            //output logic
            assign q= r_reg;
                    
endmodule
