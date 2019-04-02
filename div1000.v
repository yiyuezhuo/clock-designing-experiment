module div1000(input clk, input rst_n, output reg clk_out);

reg [9:0] cnt;

always @(posedge clk or negedge rst_n) 
begin
	if(!rst_n) 
	begin
		//cnt <= 0; // it may assign a 32 bit value. Though is truncated.
		cnt <= 9'b0;
		clk_out <= 1'b0;
	end 
	else
	begin
		//if(cnt == 999) 
		if(cnt == 499)
		begin
			//cnt <= 0;
			cnt <= 9'b0;
			clk_out <= ~clk_out;
		end
		else 
		begin
			//cnt <= cnt + 1'b1;
			cnt <= cnt + 1'b1;
		end
	end
end

endmodule