module clock(
	/*
	input clk_sec,
	input clk_500hz,
	input clk_1000hz,
	*/
	input clk_48mhz, // system clock signal 
	input adjust_sec,
	input adjust_min,
	input adjust_hour,
	input clear,
	input keep,
	output [7:0] select_dig,
	output [7:0] select_seg,
	output beep
);


wire [5:0] sec;
wire [5:0] min;
wire [5:0] hour;
wire clk_1000hz, clk_500hz, clk_sec;


wire clk_day;


divs ds(clk_48mhz, , clk_1000hz, clk_500hz, clk_sec);
counter cout(clk_sec, adjust_sec, adjust_min, adjust_hour, clear, keep, sec, min, hour, clk_day);
displayer dsp(clk_1000hz, sec, min, hour, select_dig, select_seg);
sounder sod(clk_1000hz, clk_500hz, sec, min, hour, beep);

endmodule