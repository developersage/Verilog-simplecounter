`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 07:22:29 PM
// Design Name: 
// Module Name: top
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


module top(
            input clk,
            input rst,
            input load,
            input [4:0] SW, 
            input [2:0] bitSW,
            input [3:0] digitSW,
            input enable, 
            input upd, 
            output wire [6:0] a_to_g,
            output wire [7:0] an,
            output wire dp
          );
          
         wire clk_div; 
         clk_divider  GEN    (
                              .clk(clk),
                              .rst(rst),
                              .SW(SW), 
                              .clk_div(clk_div)
                              ); 
 
         wire [31:0] numStorage;                 
                      
         bcd_32  BCD    (
                          .clk(clk_div),
                          .rst(rst),
                          .load(load),
                          .bitSW(bitSW),
                          .digitSW(digitSW),
                          .en(enable),
                          .upd(upd),
                          .numStorage(numStorage)
                          );
                          
         sdd_gen   SSD   (
                           .numStorage(numStorage),
                           .clk(clk),
                           .rst(rst),
                           .a_to_g(a_to_g),
                           .an(an),
                           .dp(dp)
                          );                 
          
endmodule
