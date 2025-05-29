`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 19:28:50
// Design Name: 
// Module Name: FIR_Filter
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


module fir_filter (
  input wire clk,
  input wire rst,
  input wire [7:0] x_in,
  output reg [15:0] y_out
);

  reg [7:0] x[0:2]; // 3-tap shift register
  reg [15:0] coeff[0:2];

  initial begin
    coeff[0] = 1;
    coeff[1] = 2;
    coeff[2] = 1;
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      x[0] <= 0; x[1] <= 0; x[2] <= 0;
      y_out <= 0;
    end else begin
      x[2] <= x[1];
      x[1] <= x[0];
      x[0] <= x_in;
      y_out <= coeff[0]*x[0] + coeff[1]*x[1] + coeff[2]*x[2];
    end
  end

endmodule

