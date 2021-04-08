`timescale 1ns / 1ps
// Deepak Lal       041-18-0030
module Four_Bit_Comp(output A_LT_B, A_GT_B, A_EQ_B,
                               input [3:0] A, [3:0] B);
// Expression for A equal B                            
assign  A_EQ_B =   ((A[3] & B[3]) & (A[2] & B[2]) & (A[1] & B[1]) & (A[0] & B[0]));
//Expression for A greater than B
assign  A_GT_B =   ((A[3] & (~B[3])) | (A[3] & B[3]) & (A[2] & ~B[2]) | 
                    ((A[3] & B[3]) & (A[2] & B[2]) & (A[1] & (~B[1])) 
                     |(A[3] & B[3]) & (A[2] & B[2]) & A[1] & B[1]) & (A[0] & ( ~B[0])) );
// Expression for A less than B        
assign  A_LT_B  = ((~A[3] & B[3]) | (A[3] & B[3]) & (~A[2] & B[2]) |
                     (A[3] & B[3]) & (A[2] & B[2]) & (~A[1] & B[1])|
                     (A[3] & B[3]) & (A[2] & B[2]) & (A[1] & B[1]) & (~A[0] & (~B[0])) );

endmodule      
