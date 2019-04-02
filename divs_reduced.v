module divs_reduced(input clk, input rst_n, output clk_out_1000, output clk_out_500, output clk_out_1);

//wire div5_1_o, div5_2_o, div5_3_o; It seems that those temp variables are not required to declare for Verilog.
wire div2_5_o,div2_6_o,div5_4_o,div5_5_o;

/*
div5 div5_1(clk, rst_n, div5_1_o);
div5 div5_2(div5_1_o, rst_n, div5_2_o);
div5 div5_3(div5_2_o, rst_n, div5_3_o);
div2 div2_1(div5_3_o, rst_n, div2_1_o);
div2 div2_2(div2_1_o, rst_n, div2_2_o);
div2 div2_3(div2_2_o, rst_n, clk_out_1000);
*/
assign clk_out_1000 =  clk;

div2 div2_4(clk, rst_n, clk_out_500);

div2 div2_5(clk_out_500, rst_n, div2_5_o);
div2 div2_6(div2_5_o, rst_n, div2_6_o);
div5 div5_4(div2_6_o, rst_n, div5_4_o);
div5 div5_5(div5_4_o, rst_n, div5_5_o);
div5 div5_6(div5_5_o, rst_n, clk_out_1);

endmodule