module carry_select_tb;
	reg [3:0] A4, B4;
	reg [4:0] test_4bit;
	reg cin;
	wire [3:0] F4c;
	wire cout;
	
	
	carry_select_4bit uut (A4, B4, cin, F4c, cout);
	
	integer ai, bi;
	initial begin
		cin = 0;
		for (ai = 0; ai < 15; ai = ai + 1) begin 
			for (bi = 0; bi < 15; bi = bi +1) begin
				#5;
				A4 = ai;
				B4 = bi;
				test_4bit = A4 + B4 + cin;
				#10;
				if (F4c != test_4bit[3:0])
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
				#10;
				if (F4c != test_4bit[3:0])
					$display ("faild carry select at A = %b, B = %b, cin = %b, F = %b, F_test = %b",A4, B4, cin, F4c, test_4bit);
			end
		end
	end
	
	task check; begin
		test_4bit = A4 + B4 + cin;
		#10;
		if (F4c != test_4bit[3:0] || cout != test_4bit[4]) 
					$display ("faild carry select 16 bit at A = %b, B = %b, cin = %b, F = %b, F_calculated = %b",A4, B4, cin, F4c, test_4bit);
		#5;
	end
	endtask
endmodule 