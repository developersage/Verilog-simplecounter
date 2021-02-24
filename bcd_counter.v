`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 06:35:20 PM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
                    input clk,
                    input rst,
                    input load,
                    input [2:0] bit,
                    input [3:0] digit,
                    input en_in, 
                    input upd,
                    input [2:0] current_idx,
                    output reg [3:0] op,
                    output wire en_out
                  );
            always@(posedge clk or posedge rst or posedge load)
                begin 
                    if (rst)
                        begin
                            if (upd) 
                                op <= 4'd9;
                            else 
                                op <= 4'd0;
                        end
                    //This part is for lab 6. 
                    //if load button is on and if the bit switch is equal to the current index of for loop,  
                    //set the specific numStorage to digitSW value.     
                    else if (load)
                        begin
                            if (bit == current_idx)
                                op <= digit;
                        end
                    else
                      begin 
                        if (en_in)
                            begin 
                                if (upd == 1'b1)
                                    begin 
                                      if (op > 0) 
                                        op <= op - 1;
                                      else 
                                        op <= 4'd9; 
                                      end 
                                  else
                                    begin 
                                      if(op < 9)
                                        op <= op+ 1;
                                      else 
                                        op <= 4'd0;  
                                    end 
                              end                            
                       end 
                 end
      //set en_out to 1 if upd is down, and 1001 = 9 AND en_in == 1     or    upd is up and 0000 = 0 AND en_in == 1.
      //This one statement ANDing en_in on both side fixed everything. 
      assign en_out = (op[3] & op[0] & (~op[2]) & (~op[1]) & (~upd) & (en_in) ) | ((~op[3]) & (~op[0]) & (~op[2]) & (~op[1]) & (upd) & (en_in) ) ;

endmodule
