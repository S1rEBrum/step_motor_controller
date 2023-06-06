module posedge_detector (
	// IO declaration
	input wire clk,
	input wire rst,
	input wire rpm,
	output wire out
);

// inner reg
reg [1:0] shift_reg;

// detector logic - 2-bit posedge detector 
always @(posedge clk or negedge rst)
	if (~rst) begin
		shift_reg <= 2'b11;	// reset 
	end else	begin 
		shift_reg <= {shift_reg[0], rpm};
	end 
		
assign out = (~shift_reg[0] & (shift_reg[1]));
		
endmodule