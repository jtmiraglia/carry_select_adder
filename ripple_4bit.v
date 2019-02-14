module ripple_4bit(A, B, cin, S, cout);
	input [3:0] A, B;
	input cin;
	output [3:0] S;
	output cout;
	wire [3:0] carry; 
	
	
	assign carry[0] = cin;
	
	
	full_adder U1 (A[0], B[0], carry[0], S[0], carry[1]);
	full_adder U2 (A[1], B[1], carry[1], S[1], carry[2]);
	full_adder U3 (A[2], B[2], carry[2], S[2], carry[3]);
	full_adder U4 (A[3], B[3], carry[3], S[3], cout);
	
	
	
endmodule