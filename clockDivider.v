module clockDivider ( clk, p_clock, reset);
output reg p_clock;
input clk ;
input reset;
	always @(posedge clk)
	begin
	if (~reset)
    	 p_clock <= 1'b0;

    else
	     p_clock <= ~ p_clock;	
	end
endmodule