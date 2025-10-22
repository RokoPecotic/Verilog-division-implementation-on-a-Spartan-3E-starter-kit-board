`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:35:37 09/11/2024 
// Design Name: 
// Module Name:    division 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module division(input [3:0] sw, input clk, btn, reset, output reg [7:0] led);
  reg [7:0] dividend = 0;
  reg [7:0] divisor = 0;

  reg [7:0] quotient = 0;
  reg [7:0] remainder = 0;
  
  reg [3:0] btn_counter = 0;
  
  integer n = 8;
  integer counter = 8 - 1;
  
  wire pb_out;

  debounce db (.pb_1(btn), .clk(clk), .pb_out(pb_out));
	
	always @(posedge clk) begin
	if (reset) begin
		btn_counter <= 0;
		dividend <= 0;
		divisor <= 0;
	end
	
   if (pb_out) begin
      if (btn_counter == 0) begin
        dividend[7:4] <= sw[3:0];
      end else if (btn_counter == 1) begin
        dividend[3:0] <= sw[3:0];
      end else if (btn_counter == 2) begin
        divisor[7:4] <= sw[3:0];
      end else if (btn_counter == 3) begin
        divisor[3:0] <= sw[3:0];
      end
      btn_counter <= btn_counter + 1;
    end
  end
	
  always @(posedge clk) begin
  	if (reset) begin
		counter = 7;
		led <= 0;
		quotient = 0;
		remainder = 0;
	end
    if (btn_counter > 3) begin
      if (divisor > dividend) begin
        quotient = 8'b0;
        remainder = dividend;
      end
      else begin
        if ((counter >= 0) && (counter < n)) begin
          remainder = (remainder << 1) | ((dividend >> counter) & 1);
          quotient = quotient << 1;

          if (remainder >= divisor) begin
            remainder = remainder - divisor;
            quotient = quotient | 1;
          end

          counter = counter - 1;
        end
      end

      if (btn_counter == 4) begin
        led <= quotient;
      end
      else if (btn_counter > 4) begin
        led <= remainder;
      end
    end
  end
endmodule
