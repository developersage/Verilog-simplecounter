`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2020 01:46:52 AM
// Design Name: 
// Module Name: demux
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


module demux(
        input clk,
        input [2:0] bitSW,
        input [3:0] digitSW,
        output reg [31:0] numStorage
    );
    
    always@ (posedge clk)
    begin
            case(bitSW)
                0: numStorage[3 : 0] = digitSW[3:0];
                1: numStorage[7 : 4] = digitSW[3:0];
                2: numStorage[11: 8] = digitSW[3:0];
                3: numStorage[15:12] = digitSW[3:0];
                4: numStorage[19:16] = digitSW[3:0];
                5: numStorage[23:20] = digitSW[3:0];
                6: numStorage[27:24] = digitSW[3:0];
                7: numStorage[31:28] = digitSW[3:0];
            default:;
            endcase
    end
endmodule
