module clockDivider_TB;
output reg clk;
input wire p_clock;
output reg rst;
	clockDivider uut(clk,p_clock,rst);
	initial
		clk = 1'b0;

		always
		#10 clk = ~clk;

		initial begin

		$monitor($time,"clk = %b,rst=%b, p_clock = %b",clk,p_clock,rst);
		
		rst =0;
		#20 rst =1;
		#100 $finish;

	end

	initial begin: TEST_CASE
		$dumpfile("clockDivider_TB.vcd");

		$dumpvars(-1,uut);
		#(200) $finish;
	end	
endmodule