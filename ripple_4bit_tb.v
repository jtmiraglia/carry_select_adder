module ripple_carry_tb;
	reg [3:0] A4, B4, test_4bit;
	reg cin;
	wire [3:0] F4c;
	wire cout;
	
	
	ripple_4bit uut (A4, B4, cin, F4c, cout);
	
	integer ai, bi;
	initial begin
		cin = 0;
		for (ai = 0; ai < 15; ai = ai + 1) begin 
			for (bi = 0; bi < 15; bi = bi +1) begin
				#5;
				A4 = ai;
				B4 = bi;
				test_4bit = A4 + B4 + cin;
				if (F4c != test_4bit)
					$display ("faild carry select at A = %b, B = %b, cin = %b, F = %b, F_test = %b",A4, B4, cin, F4c, test_4bit);
					
			end
		end
		cin = 1;
		for (ai = 0; ai < 15; ai = ai + 1) begin 
			for (bi = 0; bi < 15; bi = bi +1) begin
				#5;
				A4 = ai;
				B4 = bi;
				test_4bit = A4 + B4 + cin;
				if (F4c != test_4bit)
					$display ("faild carry select at A = %b, B = %b, cin = %b, F = %b, F_test = %b",A4, B4, cin, F4c, test_4bit);
			end
		end
	end
	
endmodule 