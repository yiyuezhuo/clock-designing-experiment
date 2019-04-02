module full_number_to_digit(input [5:0]number, output [7:0] low_digit, output [7:0] high_digit);

wire [3:0] low_number;
wire [3:0] high_number;
//wire [3:0] dummy_number;
wire [7:0] full_number;

/*
assign low_number = number % 10;
assign hight_number = number / 10; // Will it generate a float, or is it only a C style integer dividing operation?
*/
// Too bad the division and module may systhesis too costly or fail to represent my purpose.
assign full_number[7:6] = 0;
assign full_number[5:0] = number;

//bcd bcd_decoder(full_number, dummy_number, high_number, low_number);
bcd bcd_decoder(full_number,, high_number, low_number);

one_number_to_digit low_decoder(low_number ,low_digit);
one_number_to_digit high_decoder(high_number, high_digit);

endmodule