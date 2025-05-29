`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 19:30:06
// Design Name: 
// Module Name: FIR_tb
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


module fir_tb;
  reg clk = 0, rst = 1;
  reg [7:0] x_in;
  wire [15:0] y_out;

  fir_filter DUT(clk, rst, x_in, y_out);

  always #5 clk = ~clk;

  initial begin
    $dumpfile("sim/fir.vcd");
    $dumpvars(0, fir_tb);
    $display("Time\t x_in\t y_out");
    $monitor("%0t\t %d\t %d", $time, x_in, y_out);

    #10 rst = 0;
    x_in = 8'd1; #10;
    x_in = 8'd2; #10;
    x_in = 8'd3; #10;
    x_in = 8'd4; #10;
    x_in = 8'd0; #10;
    $finish;
  end
endmodule

