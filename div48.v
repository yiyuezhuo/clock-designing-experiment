module div48(input clk, input rst_n, output reg clk_out);

reg [5:0] cnt;

always @(posedge clk or negedge rst_n) 
begin
	if(!rst_n) 
	begin
		cnt <= 3'b0;
		clk_out <= 1'b0;
	end 
	else
	begin
		//if(cnt == 47) 
		if(cnt == 23)
		begin
			cnt <= 1'b0;
			clk_out <= ~clk_out;
		end
		else 
		begin
			cnt <= cnt + 1'b1;
		end
	end
end

endmodule