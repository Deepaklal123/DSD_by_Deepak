`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// NAME: Deepak Lal
// CMS : 041-18-0030
// DSD Digital System Design
// Sukkur IBA University
//////////////////////////////////////////////////////////////////////////////////


module Time_multiplexing(
clock_100Mhz,reset,Anode_Activate,LED_out,Start );
input clock_100Mhz; // 100 Mhz clock source FPGA
input reset; // reset
input Start;
output reg [7:0] Anode_Activate; // anode signals of the 7-segment LED display
output reg [6:0] LED_out;
wire [2:0] LED_activating_counter;
reg [19:0] refresh_counter;
wire clock_out;
wire [13:0] seg1;
wire [13:0] seg2;
wire [13:0] seg3;
wire [5:0] counter;
wire [5:0] min_counter;
wire [3:0] hours_counter;

Blinky_1Hz inst0(.clock_in(clock_100Mhz), .clock_out(clock_out));

Seconds_counter inst1(.clk(clock_out),.reset(reset),.counter(counter),.Start(Start));

Segment_Seconds inst2(.bcd(counter),.seg1(seg1));

Minuts_counter inst3(.clk(clock_out),.reset(reset),.min_counter(min_counter),.Start(Start));

Segments_Minuts inst4(.minuts_bcd(min_counter),.seg2(seg2));

Hour_Counter inst5(.clk(clock_out), .reset(reset),.hours_counter(hours_counter),.Start(Start));

Hours_segment inst6(.hours_bcd(hours_counter),.seg3(seg3));


always @(posedge clock_100Mhz or posedge reset)
    begin
        if(reset==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end
    assign LED_activating_counter = refresh_counter[19:17];
    // anode activating signals for 4 LEDs, digit period of 2.6ms
    // decoder to generate anode signals
    always @(*)
    begin
        case(LED_activating_counter)
        3'b000: begin
            Anode_Activate = 8'b0111_1111;
            LED_out=seg1 [6:0];
            // activate LED1 and Deactivate LED2, LED3, LED4
         
              end
        3'b001: begin
            Anode_Activate = 8'b1011_1111;
            LED_out=seg1 [13:7];
            // activate LED2 and Deactivate LED1, LED3, LED4
           
              end
        3'b010: begin
            Anode_Activate = 8'b1101_1111;
            LED_out=seg2 [6:0];
            // activate LED3 and Deactivate LED2, LED1, LED4
            end
        3'b011: begin
            Anode_Activate = 8'b1110_1111;
            LED_out=seg2 [13:7];
            // activate LED4 and Deactivate LED2, LED3, LED1
               
               end
        3'b100: begin
                           Anode_Activate = 8'b1111_0111;
                          LED_out=seg3 [6:0];
                                        // activate LED4 and Deactivate LED2, LED3, LED1
                             
                              end
         3'b101: begin
                         Anode_Activate = 8'b1111_1011;
                                          LED_out=seg3 [13:7];
                                          // activate LED4 and Deactivate LED2, LED3, LED1
                                         
                                    end
          3'b110: begin
                           Anode_Activate = 8'b1111_1111;
                                             //            LED_out=seg2 [13:7];
                                                         // activate LED4 and Deactivate LED2, LED3, LED1
                                                           
                                     end
            3'b111: begin
                             Anode_Activate = 8'b1111_1111;
                                                            //            LED_out=seg2 [13:7];
                                                                        // activate LED4 and Deactivate LED2, LED3, LED1
                                                                        //LED_BCD = ((displayed_number % 1000)%100)%10;
                                                                        // the fourth digit of the 16-bit number    
                                       end
        endcase
    end



endmodule

///Hourse module


module Hours_segment(hours_bcd,seg3);

input [3:0] hours_bcd;
output reg [13:0] seg3;


always @ (hours_bcd)
begin
   case(hours_bcd)
           0: seg3 = 14'b0000001_0000001; // "0"    
           1: seg3 = 14'b0000001_1001111; // "1"
           2: seg3 = 14'b0000001_0010010; // "2"
           3: seg3 = 14'b0000001_0000110; // "3"
           4: seg3 = 14'b0000001_1001100; // "4"
           5: seg3 = 14'b0000001_0100100; // "5"
           6: seg3 = 14'b0000001_0100000; // "6"
           7: seg3 = 14'b0000001_0001111; // "7"
           8: seg3 = 14'b0000001_0000000; // "8"    
           9: seg3 = 14'b0000001_0000100; // "9"
           
           10: seg3 = 14'b1001111_0000001; // "10"    
           11: seg3 = 14'b1001111_1001111; // "11"
           12: seg3 = 14'b1001111_0010010; // "12"
 
   
           default: seg3 = 14'b0000001_0000001;
    endcase
   
end    

endmodule
////minutes module


module Segments_Minuts(minuts_bcd,seg2);

input [5:0] minuts_bcd;
output reg [13:0] seg2;


always @ (minuts_bcd)
begin
   case(minuts_bcd)
           0: seg2 = 14'b0000001_0000001; // "0"    
           1: seg2 = 14'b0000001_1001111; // "1"
           2: seg2 = 14'b0000001_0010010; // "2"
           3: seg2 = 14'b0000001_0000110; // "3"
           4: seg2 = 14'b0000001_1001100; // "4"
           5: seg2 = 14'b0000001_0100100; // "5"
           6: seg2 = 14'b0000001_0100000; // "6"
           7: seg2 = 14'b0000001_0001111; // "7"
           8: seg2 = 14'b0000001_0000000; // "8"    
           9: seg2 = 14'b0000001_0000100; // "9"
           
           10: seg2 = 14'b1001111_0000001; // "10"    
           11: seg2 = 14'b1001111_1001111; // "11"
           12: seg2 = 14'b1001111_0010010; // "12"
           13: seg2 = 14'b1001111_0000110; // "13"
           14: seg2 = 14'b1001111_1001100; // "14"
           15: seg2 = 14'b1001111_0100100; // "15"
           16: seg2 = 14'b1001111_0100000; // "16"
           17: seg2 = 14'b1001111_0001111; // "17"
           18: seg2 = 14'b1001111_0000000; // "18"    
           19: seg2 = 14'b1001111_0000100; // "19"
         
   
           20: seg2 = 14'b0010010_0000001; // "10"    
           21: seg2 = 14'b0010010_1001111; // "11"
           22: seg2 = 14'b0010010_0010010; // "12"
           23: seg2 = 14'b0010010_0000110; // "13"
           24: seg2 = 14'b0010010_1001100; // "14"
           25: seg2 = 14'b0010010_0100100; // "15"
           26: seg2 = 14'b0010010_0100000; // "16"
           27: seg2 = 14'b0010010_0001111; // "17"
           28: seg2 = 14'b0010010_0000000; // "18"    
           29: seg2 = 14'b0010010_0000100; // "19"
 
 
           30: seg2 = 14'b0000110_0000001; // "10"    
           31: seg2 = 14'b0000110_1001111; // "11"
           32: seg2 = 14'b0000110_0010010; // "12"
           33: seg2 = 14'b0000110_0000110; // "13"
           34: seg2 = 14'b0000110_1001100; // "14"
           35: seg2 = 14'b0000110_0100100; // "15"
           36: seg2 = 14'b0000110_0100000; // "16"
           37: seg2 = 14'b0000110_0001111; // "17"
           38: seg2 = 14'b0000110_0000000; // "18"    
           39: seg2 = 14'b0000110_0000100; // "19"
 
           40: seg2 = 14'b1001100_0000001; // "10"    
           41: seg2 = 14'b1001100_1001111; // "11"
           42: seg2 = 14'b1001100_0010010; // "12"
           43: seg2 = 14'b1001100_0000110; // "13"
           44: seg2 = 14'b1001100_1001100; // "14"
           45: seg2 = 14'b1001100_0100100; // "15"
           46: seg2 = 14'b1001100_0100000; // "16"
           47: seg2 = 14'b1001100_0001111; // "17"
           48: seg2 = 14'b1001100_0000000; // "18"    
           49: seg2 = 14'b1001100_0000100; // "19"
 
           50: seg2 = 14'b0100100_0000001; // "10"    
           51: seg2 = 14'b0100100_1001111; // "11"
           52: seg2 = 14'b0100100_0010010; // "12"
           53: seg2 = 14'b0100100_0000110; // "13"
           54: seg2 = 14'b0100100_1001100; // "14"
           55: seg2 = 14'b0100100_0100100; // "15"
           56: seg2 = 14'b0100100_0100000; // "16"
           57: seg2 = 14'b0100100_0001111; // "17"
           58: seg2 = 14'b0100100_0000000; // "18"    
           59: seg2 = 14'b0100100_0000100; // "19"
 
   
           default: seg2 = 14'b0000001_0000001;
    endcase
   
end    

endmodule

//seconds module


module Segment_Seconds(bcd,seg1);

input [5:0] bcd;
output reg [13:0] seg1;

always @ (bcd)
begin
   case(bcd)
          0: seg1 = 14'b0000001_0000001; // "0"    
          1: seg1 = 14'b0000001_1001111; // "1"
          2: seg1 = 14'b0000001_0010010; // "2"
          3: seg1 = 14'b0000001_0000110; // "3"
          4: seg1 = 14'b0000001_1001100; // "4"
          5: seg1 = 14'b0000001_0100100; // "5"
          6: seg1 = 14'b0000001_0100000; // "6"
          7: seg1 = 14'b0000001_0001111; // "7"
          8: seg1 = 14'b0000001_0000000; // "8"    
          9: seg1 = 14'b0000001_0000100; // "9"
         
          10: seg1 = 14'b1001111_0000001; // "10"    
          11: seg1 = 14'b1001111_1001111; // "11"
          12: seg1 = 14'b1001111_0010010; // "12"
          13: seg1 = 14'b1001111_0000110; // "13"
          14: seg1 = 14'b1001111_1001100; // "14"
          15: seg1 = 14'b1001111_0100100; // "15"
          16: seg1 = 14'b1001111_0100000; // "16"
          17: seg1 = 14'b1001111_0001111; // "17"
          18: seg1 = 14'b1001111_0000000; // "18"    
          19: seg1 = 14'b1001111_0000100; // "19"
         
 
          20: seg1 = 14'b0010010_0000001; // "10"    
          21: seg1 = 14'b0010010_1001111; // "11"
          22: seg1 = 14'b0010010_0010010; // "12"
          23: seg1 = 14'b0010010_0000110; // "13"
          24: seg1 = 14'b0010010_1001100; // "14"
          25: seg1 = 14'b0010010_0100100; // "15"
          26: seg1 = 14'b0010010_0100000; // "16"
          27: seg1 = 14'b0010010_0001111; // "17"
          28: seg1 = 14'b0010010_0000000; // "18"    
          29: seg1 = 14'b0010010_0000100; // "19"


          30: seg1 = 14'b0000110_0000001; // "10"    
          31: seg1 = 14'b0000110_1001111; // "11"
          32: seg1 = 14'b0000110_0010010; // "12"
          33: seg1 = 14'b0000110_0000110; // "13"
          34: seg1 = 14'b0000110_1001100; // "14"
          35: seg1 = 14'b0000110_0100100; // "15"
          36: seg1 = 14'b0000110_0100000; // "16"
          37: seg1 = 14'b0000110_0001111; // "17"
          38: seg1 = 14'b0000110_0000000; // "18"    
          39: seg1 = 14'b0000110_0000100; // "19"

          40: seg1 = 14'b1001100_0000001; // "10"    
          41: seg1 = 14'b1001100_1001111; // "11"
          42: seg1 = 14'b1001100_0010010; // "12"
          43: seg1 = 14'b1001100_0000110; // "13"
          44: seg1 = 14'b1001100_1001100; // "14"
          45: seg1 = 14'b1001100_0100100; // "15"
          46: seg1 = 14'b1001100_0100000; // "16"
          47: seg1 = 14'b1001100_0001111; // "17"
          48: seg1 = 14'b1001100_0000000; // "18"    
          49: seg1 = 14'b1001100_0000100; // "19"

          50: seg1 = 14'b0100100_0000001; // "10"    
          51: seg1 = 14'b0100100_1001111; // "11"
          52: seg1 = 14'b0100100_0010010; // "12"
          53: seg1 = 14'b0100100_0000110; // "13"
          54: seg1 = 14'b0100100_1001100; // "14"
          55: seg1 = 14'b0100100_0100100; // "15"
          56: seg1 = 14'b0100100_0100000; // "16"
          57: seg1 = 14'b0100100_0001111; // "17"
          58: seg1 = 14'b0100100_0000000; // "18"    
          59: seg1 = 14'b0100100_0000100; // "19"
         
         
         
         
         
         
 
          default: seg1 = 14'b0000001_0000001;
    endcase
   
end    

endmodule

//seconds counter



module Seconds_counter(clk,reset,counter,Start);
   
input clk,reset,Start; //start stop buttton "Start"
output [5:0] counter;

reg [5:0] counter_up;


always @(posedge clk or posedge reset)
begin
if(reset)
counter_up<=6'd0;
else if(Start)
begin
counter_up<=counter_up+6'd1;
if(counter_up>=59)
begin
counter_up<=6'd0;
end
end
else
begin
counter_up<=counter_up;
end
end

assign counter = counter_up;



endmodule

//minutes counter


module Minuts_counter(clk,reset,min_counter,Start);
   
    input clk,reset,Start; //start stop buttton "Start"
   
    output [5:0] min_counter;
reg [5:0] counter_up;
reg [5:0] counter_up1;
reg enable;

initial
begin
counter_up1<=6'd0;
end
initial
begin
counter_up<=6'd0;
end

always @(posedge clk or posedge reset )
begin

if(reset)
begin
 counter_up1 <= 6'd0;
 counter_up <=6'd0;
 end
else if (Start)
 begin
 counter_up <= counter_up + 6'd1;
if(counter_up>=59)
begin
counter_up<=0;
enable<=1;
end

if(enable==1 && counter_up==0)
begin
counter_up1<=counter_up1+6'd1;
end
if(counter_up1>=59)
begin
counter_up1<=0;
end
end
else begin
counter_up1 <= counter_up1;
 counter_up <=counter_up;
end
end
assign min_counter = counter_up1;

endmodule

//hourse counter



module Hour_Counter(clk, reset,hours_counter,Start);
   
    input clk, reset,Start;
   
    output [3:0] hours_counter;
reg [11:0] counter_up;
reg [3:0] counter_up1;
reg enable;

initial
begin
counter_up1<=4'd0;
end
initial
begin
counter_up<=12'd0;
end

always @(posedge clk or posedge reset)
begin
if(reset)
begin
 counter_up1 <= 4'd0;
 counter_up<=12'd0;
end
else if(Start)
 begin
 counter_up <= counter_up + 12'd1;
if(counter_up>=3599)
begin
counter_up<=0;
enable<=1;
end

if(enable==1 && counter_up==0)
begin
counter_up1<=counter_up1+4'd1;
end
if(counter_up1>=12)
begin
counter_up1<=0;
end
end
else
begin
counter_up1 <= counter_up1;
counter_up <=counter_up;
end
end
assign hours_counter = counter_up1;

endmodule

////Blinky

module Blinky_1Hz(clock_in, clock_out);
 input clock_in; // System clock
 output clock_out; // Low-frequency clock
 reg [31:0] counter_out; // register for storing values
 reg clock_out; // register buffer for output port

 initial begin
    counter_out<=32'h00000000; // 0 in Hexadecimal format
    clock_out<=0;
 end
 
 //this always block runs on the fast 100MHz clock
 always @(posedge clock_in)
 begin
    counter_out<=counter_out + 32'h0000001; // Adding one at every clock pulse
    if (counter_out>32'h2FAF080) // If count value reaches to 50000000
    begin
   
        counter_out<=32'h00000000; // reset the counter
        clock_out <= ~clock_out; // and invert the clock pulse level
    end
 end
 
 endmodule
