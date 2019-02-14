module mux_test;
	reg w0, w1, s;
	reg test;
	wire f;
	
	multiplexor uut (w0, w1, s, f);
	
	initial begin
		w0 = 0;w1=1; s=0;
		test = s ? w1 : w0;
		if (f != test) 
			$display ("faild mux at W0 = %b, W1 = %b, s = %b, F = %b, test_F = %b",w0, w1, s, f, test);
		else;
		#5;
		w0 = 0; w1 = 1;s=1;
		test = s ? w1 : w0;
		if (f != test) 
			$display ("faild mux at W0 = %b, W1 = %b, s = %b, F = %b, test_F = %b",w0, w1, s, f, test);
		else;
		
		#5;
		
		w0 = 1;w1=1; s=0;
		test = s ? w1 : w0;
		if (f != test) 
			$display ("faild mux at W0 = %b, W1 = %b, s = %b, F = %b",w0, w1, s, f);
		else; 
		#5;
		w0 = 1;w1=1; s=1;
		test = s ? w1 : w0;
		if (f != test) 
			$display ("faild mux at W0 = %b, W1 = %b, s = %b, F = %b",w0, w1, s, f);
		else;
	end 
	
	endmodule
	