module smoother(
input clk,
input clear,
input adjust,
output adjust_delayed
);

reg adjust_delay1, adjust_delay2, adjust_delay3;

assign adjust_delayed = adjust_delay1 & adjust_delay2 & adjust_delay3;

always@(posedge clk) begin
	if(clear) begin
		adjust_delay1 <= 1'b0;
		adjust_delay2 <= 1'b0;
		adjust_delay3 <= 1'b0;
	end
	else begin
		adjust_delay1 <= adjust;
		adjust_delay2 <= adjust_delay1;
		adjust_delay3 <= adjust_delay2;
	end
end

endmodule