module test;
	wire [15:0] Frc, Fcs;
	wire cout, cout_rc;
	reg [15:0] A, B;
	reg cin;
	reg [16:0] test_output;
			
	//test ripple adder
	ripple_carry_adder rc16 (.A(A), .B(B), .S(Frc), .cin(cin), .cout(cout_rc));
	carry_select_adder cs16 (.A(A), .B(B), .S(Fcs), .cin(cin), .cout(cout));
	
	integer itr0, itr1;
	
	initial 
		begin
	
		cin = 0;
		A = 0;
		B = 0;
		check();	
		
		cin = 1;
		A = 1;
		B = 1;
		check();
		
		A = 16'b111111111111111;
		B = 16'b111111111111111;
		cin = 0;
		check();
		 
		 
		A = 16'b111111111111111;
		B = 16'b111111111111111;
		cin = 1;
		check();
		
		A = 16'hffff;
		B = 16'hffff;
		cin = 0;
		check();
			
		A = 16'hffff;
		B = 16'hffff;
		cin = 1;
		check();
		
		A = 16'hbfff;
		B = 16'hbfff;
		cin = 0;
		check();
		
		A = 16'hbfff;
		B = 16'hbfff;
		cin = 1;
		check();
		
		for ( itr0 = 1; itr0 <= 200; itr0 = itr0 + 2) begin
			for (itr1  = 0; itr1 <= 375; itr1 = itr1 + 3) begin
				A = itr0 + itr1;
				B = itr0 * itr1;
				cin = 0;
				check();
				cin = 1;
				check();
			end
		end
		
	end
	
	task check; begin
		test_output = A + B + cin;
		#10;
		if ({cout,Fcs} != test_output) 
					$display ("faild carry select 16 bit at A = %b, B = %b, cin = %b, F = %b, F_calculated = %b, cout = %b, cout_calc = %b",A, B, cin, Fcs, test_output[15:0], cout, test_output[16]);
		if ({cout,Frc} != test_output) 
					$display ("faild ripple carry 16 bit at A = %b, B = %b, cin = %b, F = %b, F_calculated = %b, cout = %b, cout_calc = %b",A, B, cin, Frc, test_output[15:0], cout_rc, test_output[16]);
		#5;
	end
	endtask

	
endmodule