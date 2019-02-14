module full_add_test;
	reg a, b, cin;
	reg test;
	wire s, cout;
	
	full_adder uut (a, b, cin, s, cout);
	
	initial begin
		#5;
		a=0;b=0;cin=0;
		test = a + b + cin;
		if (s != test) 
			$display ("faild full adder at A = %b, B = %b, cin = %b, F = %b",a, b, cin, s);
		else;
		#5;
		a=1;b=0;cin=0;
		test = a + b + cin;
		if (s != test) 
			$display ("faild full adder at A = %b, B = %b, cin = %b, F = %b",a, b, cin, s);
		else;
		#5;
		a=0;b=1;cin=0;
		test = a + b + cin;
		if (s != test) 
			$display ("faild full adder at A = %b, B = %b, cin = %b, F = %b",a, b, cin, s);
		else;
		#5;
		a=1;b=1;cin=0;
		test = a + b + cin;
		if (s != test) 
			$display ("faild full adder at A = %b, B = %b, cin = %b, F = %b",a, b, cin, s);
		else;
		#5;
		a=0;b=1;cin=1;
		test = a + b + cin;
		if (s != test) 
			$display ("faild full adder at A = %b, B = %b, cin = %b, F = %b",a, b, cin, s);
		else;
		#5;
		a=0;b=0;cin=1;
		test = a + b + cin;
		if (s != test) 
			$display ("faild full adder at A = %b, B = %b, cin = %b, F = %b",a, b, cin, s);
		else;
	
	end
	
	
	 
	
	
endmodule
