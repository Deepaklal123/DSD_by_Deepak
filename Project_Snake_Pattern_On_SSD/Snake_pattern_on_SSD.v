`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 01:02:03 AM
// Design Name: 
// Module Name: Snake_pattern_on_SSD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Snake_pattern_on_SSD(anodes, cathodes, clk, reset);
input clk, reset; 
output reg [7:0] anodes;
output reg [6:0] cathodes; 

parameter N = 30;  // 100 MHz /(2**17) ~= 763 Hz  : 1/763 Hz = 1.31 ms
 
// internal registers
reg [N-1:0] current_state;  
wire [N-1:0] next_state;

// 
  

// current_state logic
always@(posedge clk, posedge reset)
begin
    if(reset)
        current_state <= 0;
    else 
        current_state <= next_state;     
end


// next_state logic
assign next_state = current_state + 1; 

wire [6:0] Outt1, Outt2, Outt3, Outt4, Outt5, Outt6, Outt7; 


// output logic 
always@(*)
begin
    case(current_state[N-1:N-7])
    7'b0000000 : begin   anodes = 8'b11111110;
                    cathodes = Outt2; end

    7'b0000001 : begin   anodes = 8'b11111110;
                    cathodes = Outt7; end

    7'b0000010 : begin   anodes = 8'b11111101;
                    cathodes = Outt7; end

    7'b0000011 : begin   anodes = 8'b11111011;
                    cathodes = Outt7; end

    7'b0000100 : begin   anodes = 8'b11110111;
                    cathodes = Outt7; end

    7'b0000101 : begin   anodes = 8'b11101111;
                    cathodes = Outt7; end

    7'b0000110 : begin   anodes = 8'b11011111;
                    cathodes = Outt7; end

    7'b0000111 : begin   anodes = 8'b10111111;
                    cathodes = Outt7; end

    7'b0001000 : begin   anodes = 8'b01111111;
                    cathodes = Outt7; end

    7'b0001001 : begin   anodes = 8'b01111111;
                    cathodes = Outt5; end

    7'b0001010 : begin   anodes = 8'b01111111;
                    cathodes = Outt4; end

    7'b0001011 : begin   anodes = 8'b10111111;
                    cathodes = Outt4; end

    7'b0001100 : begin   anodes = 8'b11011111;
                    cathodes = Outt4; end

    7'b0001101 : begin   anodes = 8'b11101111;
                    cathodes = Outt4; end

    7'b0001110 : begin   anodes = 8'b11110111;
                    cathodes = Outt4; end

    7'b0001111 : begin   anodes = 8'b11111011;
                    cathodes = Outt4; end

    7'b0010000 : begin   anodes = 8'b11111101;
                    cathodes = Outt4; end

    7'b0010001 : begin   anodes = 8'b11111110;
                    cathodes = Outt4; end

    7'b0010010 : begin   anodes = 8'b11111110;
                    cathodes = Outt3; end

    7'b0010011 : begin   anodes = 8'b11111110;
                    cathodes = Outt2; end

    7'b0010100 : begin   anodes = 8'b11111110;
                    cathodes = Outt1; end

    7'b0010101 : begin   anodes = 8'b11111110;
                    cathodes = Outt6; end

    7'b0010110 : begin   anodes = 8'b11111110;
                    cathodes = Outt5; end

    7'b0010111 : begin   anodes = 8'b11111101;
                    cathodes = Outt3; end

    7'b0011000 : begin   anodes = 8'b11111101;
                    cathodes = Outt2; end

    7'b0011001 : begin   anodes = 8'b11111101;
                    cathodes = Outt1; end

    7'b0011010 : begin   anodes = 8'b11111101;
                    cathodes = Outt6; end

    7'b0011011 : begin   anodes = 8'b11111101;
                    cathodes = Outt5; end

    7'b0011100 : begin   anodes = 8'b11111011;
                    cathodes = Outt3; end

    7'b0011101 : begin   anodes = 8'b11111011;
                    cathodes = Outt2; end

    7'b0011110 : begin   anodes = 8'b11111011;
                    cathodes = Outt1; end

    7'b0011111 : begin   anodes = 8'b11111011;
                    cathodes = Outt6; end

    7'b0100000 : begin   anodes = 8'b11111011;
                    cathodes = Outt5; end

    7'b0100001 : begin   anodes = 8'b11110111;
                    cathodes = Outt3; end

    7'b0100010 : begin   anodes = 8'b11110111;
                    cathodes = Outt2; end

    7'b0100011 : begin   anodes = 8'b11110111;
                    cathodes = Outt1; end

    7'b0100100 : begin   anodes = 8'b11110111;
                    cathodes = Outt6; end

    7'b0100101 : begin   anodes = 8'b11110111;
                    cathodes = Outt5; end

    7'b0100110 : begin   anodes = 8'b11101111;
                    cathodes = Outt3; end

    7'b0100111 : begin   anodes = 8'b11101111;
                    cathodes = Outt2; end

    7'b0101000 : begin   anodes = 8'b11101111;
                    cathodes = Outt1; end

    7'b0101001 : begin   anodes = 8'b11101111;
                    cathodes = Outt6; end

    7'b0101010 : begin   anodes = 8'b11101111;
                    cathodes = Outt5; end

    7'b0101011 : begin   anodes = 8'b11011111;
                    cathodes = Outt3; end

    7'b0101100 : begin   anodes = 8'b11011111;
                    cathodes = Outt2; end

    7'b0101101 : begin   anodes = 8'b11011111;
                    cathodes = Outt1; end

    7'b0101110 : begin   anodes = 8'b11011111;
                    cathodes = Outt6; end

    7'b0101111 : begin   anodes = 8'b11011111;
                    cathodes = Outt5; end

    7'b0110000 : begin   anodes = 8'b10111111;
                    cathodes = Outt3; end

    7'b0110001 : begin   anodes = 8'b10111111;
                    cathodes = Outt2; end

    7'b0110010 : begin   anodes = 8'b10111111;
                    cathodes = Outt1; end

    7'b0110011 : begin   anodes = 8'b10111111;
                    cathodes = Outt6; end

    7'b0110100 : begin   anodes = 8'b10111111;
                    cathodes = Outt5; end

    7'b0110101 : begin   anodes = 8'b01111111;
                    cathodes = Outt3; end

    7'b0110110 : begin   anodes = 8'b01111111;
                    cathodes = Outt2; end

    7'b0110111 : begin   anodes = 8'b01111111;
                    cathodes = Outt1; end

    7'b0111000 : begin   anodes = 8'b01111111;
                    cathodes = Outt6; end

    7'b0111001 : begin   anodes = 8'b01111111;
                    cathodes = Outt5; end

    7'b0111010 : begin   anodes = 8'b01111111;
                    cathodes = Outt4; end

    7'b0111011 : begin   anodes = 8'b10111111;
                    cathodes = Outt4; end

    7'b0111100 : begin   anodes = 8'b11011111;
                    cathodes = Outt4; end

    7'b0111101 : begin   anodes = 8'b11101111;
                    cathodes = Outt4; end

    7'b0111110 : begin   anodes = 8'b11110111;
                    cathodes = Outt4; end

    7'b0111111 : begin   anodes = 8'b11111011;
                    cathodes = Outt4; end

    7'b1000000 : begin   anodes = 8'b11111101;
                    cathodes = Outt4; end

    7'b1000001 : begin   anodes = 8'b11111110;
                    cathodes = Outt4; end

    7'b1000010 : begin   anodes = 8'b11111110;
                    cathodes = Outt3; end

    7'b1000011 : begin   anodes = 8'b11111110;
                    cathodes = Outt7; end

    7'b1000100 : begin   anodes = 8'b11111101;
                    cathodes = Outt7; end

    7'b1000101 : begin   anodes = 8'b11111011;
                    cathodes = Outt7; end

    7'b1000110 : begin   anodes = 8'b11110111;
                    cathodes = Outt7; end

    7'b1000111 : begin   anodes = 8'b11101111;
                    cathodes = Outt7; end

    7'b1001000 : begin   anodes = 8'b11011111;
                    cathodes = Outt7; end

    7'b1001001 : begin   anodes = 8'b10111111;
                    cathodes = Outt7; end

    7'b1001010 : begin   anodes = 8'b01111111;
                    cathodes = Outt7; end

    7'b1001011 : begin   anodes = 8'b01111111;
                    cathodes = Outt6; end

    7'b1001100 : begin   anodes = 8'b01111111;
                    cathodes = Outt1; end

    7'b1001101 : begin   anodes = 8'b01111111;
                    cathodes = Outt2; end

    7'b1001110 : begin   anodes = 8'b01111111;
                    cathodes = Outt3; end

    7'b1001111 : begin   anodes = 8'b10111111;
                    cathodes = Outt5; end

    7'b1010000 : begin   anodes = 8'b10111111;
                    cathodes = Outt6; end

    7'b1010001 : begin   anodes = 8'b10111111;
                    cathodes = Outt1; end

    7'b1010010 : begin   anodes = 8'b10111111;
                    cathodes = Outt2; end

    7'b1010011 : begin   anodes = 8'b10111111;
                    cathodes = Outt3; end

    7'b1010100 : begin   anodes = 8'b11011111;
                    cathodes = Outt5; end

    7'b1010101 : begin   anodes = 8'b11011111;
                    cathodes = Outt6; end

    7'b1010110 : begin   anodes = 8'b11011111;
                    cathodes = Outt1; end

    7'b1010111 : begin   anodes = 8'b11011111;
                    cathodes = Outt2; end

    7'b1011000 : begin   anodes = 8'b11011111;
                    cathodes = Outt3; end

    7'b1011001 : begin   anodes = 8'b11101111;
                    cathodes = Outt5; end

    7'b1011010 : begin   anodes = 8'b11101111;
                    cathodes = Outt6; end

    7'b1011011 : begin   anodes = 8'b11101111;
                    cathodes = Outt1; end

    7'b1011100 : begin   anodes = 8'b11101111;
                    cathodes = Outt2; end

    7'b1011101 : begin   anodes = 8'b11101111;
                    cathodes = Outt3; end

    7'b1011110 : begin   anodes = 8'b11110111;
                    cathodes = Outt5; end

    7'b1011111 : begin   anodes = 8'b11110111;
                    cathodes = Outt6; end

    7'b1100000 : begin   anodes = 8'b11110111;
                    cathodes = Outt1; end

    7'b1100001 : begin   anodes = 8'b11110111;
                    cathodes = Outt2; end

    7'b1100010 : begin   anodes = 8'b11110111;
                    cathodes = Outt3; end

    7'b1100011 : begin   anodes = 8'b11111011;
                    cathodes = Outt5; end

    7'b1100100 : begin   anodes = 8'b11111011;
                    cathodes = Outt6; end

    7'b1100101 : begin   anodes = 8'b11111011;
                    cathodes = Outt1; end

    7'b1100110 : begin   anodes = 8'b11111011;
                    cathodes = Outt2; end

    7'b1100111 : begin   anodes = 8'b11111011;
                    cathodes = Outt3; end

    7'b1101000 : begin   anodes = 8'b11111101;
                    cathodes = Outt5; end

    7'b1101001 : begin   anodes = 8'b11111101;
                    cathodes = Outt6; end

    7'b1101010 : begin   anodes = 8'b11111101;
                    cathodes = Outt1; end

    7'b1101011 : begin   anodes = 8'b11111101;
                    cathodes = Outt2; end

    7'b1101100 : begin   anodes = 8'b11111101;
                    cathodes = Outt3; end

    7'b1101101 : begin   anodes = 8'b11111110;
                    cathodes = Outt5; end

    7'b1101110 : begin   anodes = 8'b11111110;
                    cathodes = Outt6; end

    7'b1101111 : begin   anodes = 8'b11111110;
                    cathodes = Outt1; end
                                        
    default : begin anodes = 8'b00000000;
                    cathodes = 7'b1111111; end                               
    
    endcase
end


assign Outt1 = 7'b1111110;// a segment high
assign Outt2 = 7'b1111101;// b segment high
assign Outt3 = 7'b1111011;// c segment high
assign Outt4 = 7'b1110111;// d segment high
assign Outt5 = 7'b1101111;// e segment high
assign Outt6 = 7'b1011111;// f segment high
assign Outt7 = 7'b0111111;// g segment high

endmodule