module counter_var(
	input clk,
	input adjust,
	input clk_adjust,
	input clear,
	input keep,
	output reg [5:0] digits,
	output add
);

parameter cnt = 60;

wire clk_merged;

assign add = !digits[0] && !digits[1]  && !digits[2]  && !digits[3]  && !digits[4]  && !digits[5];
assign clk_merged = clk || (clk_adjust && adjust);

//always @(posedge clk or posedge clk_adjust or posedge clear)
always @(posedge clk_merged or posedge clear)
begin
	if(clear)
	begin
		digits <= 6'b0;//5'b0;
	end 
	else if (adjust) begin
		if(!keep) begin
			if(digits == cnt)
			begin
				digits <= 6'b0;//5'b0;
			end
			else
			begin
				digits <=  digits + 1'b1;//+5'b1;
			end
		end
		else begin
			digits <= digits;
		end
	end
	else begin
		if(!keep) begin
			if(digits == cnt)
			begin
				digits <= 6'b0;//5'b0;
			end
			else
			begin
				digits <=  digits + 1'b1;//+5'b1;
			end
		
		end
		else begin
			digits <= digits;
		end
	end
end

endmodule