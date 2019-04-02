module sounder(
	input clk_1000hz,
	input clk_500hz,
	input [5:0] sec,
	input [5:0] min,
	input [5:0] hour,
	output reg beep
);

always @ * begin
	if(min == 59) begin
		case(sec)
			53: beep <= clk_500hz;
			55: beep <= clk_500hz;
			57: beep <= clk_500hz;
			59: beep <= clk_1000hz;
			default: beep <= 0;
		endcase
	end
	else begin
		beep <= 0;
	end
end

endmodule