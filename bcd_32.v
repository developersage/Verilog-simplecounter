`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 07:13:44 PM
// Design Name: 
// Module Name: bcd_32
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

//clk = clock
//rst = reset buttons
//en = enable switch[14]
//upd = inc or dec switch[15]
//numStorage = variable to store 0 to 9 digits for 8 numbers (32 bits size)
//op = separated storage to store 0 to 9 digits. (4 bits size)
//
module bcd_32(
                input clk,
                input rst,
                input load,
                input [2:0] bitSW,
                input [3:0] digitSW,
                input en,
                input upd,
                output wire [31:0] numStorage
                );
               wire [7:0] opFlag;
               
               //Set en_in to 0 when load button is pressed down.                     
               assign opFlag[0] = en & (~load); 

               genvar i;               
               generate 
               for (i = 0; i<8 ; i = i+1)
               begin 
               bcd_counter  UNIT  (
                                    .clk(clk),
                                    .rst(rst),
                                    .load(load),
                                    .bit(bitSW),
                                    .digit(digitSW),
                                    .en_in(opFlag[i]), 
                                    .upd(upd),
                                    .current_idx(i),
                                    .op(numStorage [4*(i+1)-1 : 4*i]), 
                                    .en_out(opFlag[i+1])
                                   ); 
             end 
             endgenerate    
endmodule
