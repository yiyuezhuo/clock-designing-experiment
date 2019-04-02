module displayer( // displayer just map the clock state to displayer view, so it doesn't provide any control utility
	input clk_1000hz,
	input [5:0] sec,
	input [5:0] min,
	input [5:0] hour,
	output reg [7:0] select_dig,
	output reg [7:0] select_seg
);

reg [5:0] number;
wire [7:0] low_digit;
wire [7:0] high_digit;

reg [2:0] cnt; // take 0-5

full_number_to_digit fntd(number, low_digit, high_digit);

always @(posedge clk_1000hz) begin
	case(cnt)
		3'b0: begin // 0
			cnt <= 3'b1;
			number <= sec;
			//select_dig <= 8'b00000001; // 0 -> light on. wrong map
			select_dig <= 8'b11111110; // reasonable setting, but high digit is true but low digit is wrong
			//select_dig <= 8'b01111110; // debug 0 digit
			//select_dig <= 8'b11101111; // transpose every low digit position
			select_seg <= low_digit;
		end
		3'b1: begin // 1
			cnt <= 3'b10;
			//number <= sec;
			number <= min; // for next value, fuck Verilog "current" statement
			//select_dig <= 8'b00000010;
			select_dig <= 8'b11111101;
			//select_dig <= 8'b01111101;
			//select_dig <= 8'b11111101;
			select_seg <= high_digit;
		end
		3'b10: begin // 2
			cnt <= 3'b11;
			number <= min;
			//select_dig <= 8'b00000100;
			select_dig <= 8'b11111011;
			//select_dig <= 8'b01111011;
			select_seg <= low_digit;
		end
		3'b11: begin // 3
			cnt <= 3'b100;
			//number <= min;
			number <= hour;
			//select_dig <= 8'b00001000;
			select_dig <= 8'b11110111;
			//select_dig <= 8'b01110111;
			select_seg <= high_digit;
		end
		3'b100: begin //4
			cnt <= 3'b101;
			number <= hour;
			//select_dig <= 8'b00010000;
			select_dig <= 8'b11101111;
			//select_dig <= 8'b01101111;
			select_seg <= low_digit;
		end
		default: begin //5
			cnt <= 3'b0;
			//number <= hour;
			number <= sec;
			//select_dig <= 8'b00100000;
			select_dig <= 8'b11011111;
			//select_dig <= 8'b01011111;
			select_seg <= high_digit;
		end
	endcase
end


endmodule