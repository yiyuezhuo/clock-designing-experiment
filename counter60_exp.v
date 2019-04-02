module counter60(
	input clk,
	input adjust,
	input clear,
	input keep,
	output reg [5:0] digits//,
	//output add
);

//assign add = digits[0] && digits[1]  && digits[2]  && digits[3]  && digits[4]  && digits[5];
//always @(posedge clk or posedge adjust)
/*
always @(posedge clk or posedge adjust)
begin
	//if(clk || adjust) begin
	if(adjust) begin
		digits = digits + 1'b1;
	end
	else begin
		
		//digits
		if(digits == 59) begin
			digits = 5'b0;
		end
		else begin
			digits <=  digits + 1'b1;//+5'b1;
		end
	end
end
*/
//always @(posedge clk)
/*
always @(posedge clk or posedge adjust or posedge clear)
begin
	if(clk) begin
		if(digits == 59) begin
			digits = 5'b0;
		end
		else begin
			digits <=  digits + 1'b1;//+5'b1;
		end
	end
end
*/


always @(posedge clk or posedge adjust or posedge clear)
begin
	if(clear)
	begin
		digits <= 6'b0;//5'b0;
	end 
	//else if(adjust || clk)
	else if (adjust) begin
		if(!keep) begin
			if(digits == 59)
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
			if(digits == 59)
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

/*
always @(posedge clear) begin
	digits <= 0;
end

always @(posedge clk) begin
	if(!keep) begin
		if(digits == 59)
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
*/

endmodule