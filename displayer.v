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
			//select_dig <= 8'b00000001; // 0 -> light on
			select_dig <= 8'b11111110;
			select_seg <= low_digit;
		end
		3'b1: begin // 1
			cnt <= 3'b10;
			number <= sec;
			//select_dig <= 8'b00000010;
			select_dig <= 8'b11111101;
			select_seg <= high_digit;
		end
		3'b10: begin // 2
			cnt <= 3'b11;
			number <= min;
			//select_dig <= 8'b00000100;
			select_dig <= 8'b11111011;
			select_seg <= low_digit;
		end
		3'b11: begin // 3
			cnt <= 3'b100;
			number <= min;
			//select_dig <= 8'b00001000;
			select_dig <= 8'b11110111;
			select_seg <= high_digit;
		end
		3'b100: begin //4
			cnt <= 3'b101;
			number <= hour;
			//select_dig <= 8'b00010000;
			select_dig <= 8'b11101111;
			select_seg <= low_digit;
		end
		default: begin //5
			cnt <= 3'b0;
			number <= hour;
			//select_dig <= 8'b00100000;
			select_dig <= 8'b11011111;
			select_seg <= high_digit;
		end
	endcase
end


endmodule