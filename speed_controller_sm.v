module speed_controller_sm(
	input wire rst,
	input wire step,
	input wire [2:0] speed_sel,
	output reg [20:0] count_to
);



// all the values must be *4 but in reality we got the right speed values by dividing by 2


// REAL VALUES 
//parameter full_10rpm =21'd375000;	// 750000
//parameter full_20rpm =21'd187500;	// 375000
//parameter full_30rpm =21'd125000;	// 250000
//parameter full_40rpm =21'd93750;	// 187500
//parameter full_50rpm =21'd75000;	// 150000
//parameter full_60rpm =21'd62500;	// 125000
//parameter half_10rpm =21'd187500;	// 375000
//parameter half_20rpm =21'd93750;	// 187500
//parameter half_30rpm =21'd62500;	// 125000
//parameter half_40rpm =21'd46750;	//	93500
//parameter half_50rpm =21'd37500;	//	75000
//parameter half_60rpm =21'd31250;	// 62500


// VALUES FOR WAVEFORM TEST
parameter full_10rpm =21'd1;	// 750000
parameter full_20rpm =21'd2;	// 375000
parameter full_30rpm =21'd3;	// 250000
parameter full_40rpm =21'd4;	// 187500
parameter full_50rpm =21'd5;	// 150000
parameter full_60rpm =21'd6;	// 125000
parameter half_10rpm =21'd7;	// 375000
parameter half_20rpm =21'd8;	// 187500
parameter half_30rpm =21'd9;	// 125000
parameter half_40rpm =21'd10;	//	93500
parameter half_50rpm =21'd11;	//	75000
parameter half_60rpm =21'd12;	// 62500

// logic 
always @(*)
begin 	
			if (~rst)
				count_to <= full_10rpm;
			if ((speed_sel == 3'b001) && (step))
				count_to <= full_10rpm;
				
			else if ((speed_sel == 3'b001) && (~step))
				count_to <= half_10rpm;
				
			else if ((speed_sel == 3'b010) && (step))
				count_to <= full_20rpm;
				
			else if ((speed_sel == 3'b010) && (~step))
				count_to <= half_20rpm;
				
			else if ((speed_sel == 3'b011) && (step))
				count_to <= full_30rpm;
				
			else if ((speed_sel == 3'b011) && (~step))
				count_to <= half_30rpm;
				
			else if ((speed_sel == 3'b100) && (step))
				count_to <= full_40rpm;
				
			else if ((speed_sel == 3'b100) && (~step))
				count_to <= half_40rpm;
				
			else if ((speed_sel == 3'b101) && (step))
				count_to <= full_50rpm;
				
			else if ((speed_sel == 3'b101) && (~step))
				count_to <= half_50rpm;
				
			else if ((speed_sel == 3'b110) && (step))
				count_to <= full_60rpm;
				
			else if ((speed_sel == 3'b110) && (~step))
				count_to <= half_60rpm;
			else
				count_to <= full_10rpm;
end 


endmodule


