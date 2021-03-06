module counter(
	input clk,
	input adjust_sec,
	input adjust_min,
	input adjust_hour,
	input clear,
	input keep,
	output [5:0]sec,
	output [5:0]min,
	output [5:0]hour,
	output clk_day
);

wire clk_min, clk_hour;

/*
counter60 counter_sec(clk,			adjust_sec, clk, clear, keep, sec, clk_min);
counter60 counter_min(clk_min,		adjust_min, clk, clear, keep, min, clk_hour);
counter24 counter_hour(clk_hour,	adjust_hour, clk, clear, keep, hour,clk_day);
*/
/*
counter60 counter_sec(clk,			adjust_sec, clear, keep, sec, clk_min);
counter60 counter_min(clk_min,		adjust_min, clear, keep, min, clk_hour);
counter24 counter_hour(clk_hour,	adjust_hour, clear, keep, hour,clk_day);
*/

wire adjust_sec_delayed, adjust_min_delayed, adjust_hour_delayed;

adjust_delayer adjust_delayer_sec(clk, clear, adjust_sec, adjust_sec_delayed);
adjust_delayer adjust_delayer_min(clk, clear, adjust_min, adjust_min_delayed);
adjust_delayer adjust_delayer_hour(clk, clear, adjust_hour, adjust_hour_delayed);

counter_var #(59) counter_sec(clk,			adjust_sec_delayed, clk, clear, keep, sec, clk_min);
counter_var #(59) counter_min(clk_min,		adjust_min_delayed, clk, clear, keep, min, clk_hour);
counter_var #(23) counter_hour(clk_hour,	adjust_hour_delayed, clk, clear, keep, hour,clk_day);


/*
counter_var #(59) counter_sec(clk,			adjust_sec, clk, clear, keep, sec, clk_min);
counter_var #(59) counter_min(clk_min,		adjust_min, clk, clear, keep, min, clk_hour);
counter_var #(23) counter_hour(clk_hour,	adjust_hour, clk, clear, keep, hour,clk_day);
*/

endmodule