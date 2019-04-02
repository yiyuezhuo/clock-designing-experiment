module one_number_to_digit(input [3:0]number, output reg[7:0] digit);

always @ * begin 
	// case must be placed in a always block, though digit is declared as `reg`, it will not be infer to a register.
	// See: https://electronics.stackexchange.com/questions/240012/case-statement-without-always
	case(number)         ///hgfedcba // 0 = light on, 1 = light off
		/*
		4'b0000: digit = 8'b00111111; //0
		4'b0001: digit = 8'b00000110; //1
		4'b0010: digit = 8'b01011011; //2
		4'b0011: digit = 8'b01001111; //3
		4'b0100: digit = 8'b01100110; //4
		4'b0101: digit = 8'b01101101; //5
		4'b0110: digit = 8'b01111101; //6
		4'b0111: digit = 8'b00000111; //7
		4'b1000: digit = 8'b01111111; //8
		4'b1001: digit = 8'b01101111; //9
		default: digit = 8'b11111110; // undefined
		*/
		4'b0000: digit = 8'b11000000; //0
		4'b0001: digit = 8'b11111001; //1
		4'b0010: digit = 8'b10100100; //2
		4'b0011: digit = 8'b10110000; //3
		4'b0100: digit = 8'b10011001; //4
		4'b0101: digit = 8'b10010010; //5
		4'b0110: digit = 8'b10000010; //6
		4'b0111: digit = 8'b11111000; //7
		4'b1000: digit = 8'b10000000; //8
		4'b1001: digit = 8'b10010000; //9
		default: digit = 8'b00000000; // undefined
	endcase
end

endmodule