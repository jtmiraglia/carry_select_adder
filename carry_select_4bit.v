module carry_select_4bit(A, B, cin, S, cout);
	input [3:0] A, B;
	input cin;
	output [3:0] S;
	output cout;

	wire [3:0] W0, W1;
	wire [1:0] Wcout; //carry out bits for ripple carries for cin of 0 and 1


	//ripple carry outputs for cin of 0 and 1
	ripple_4bit rip0 (.A(A), .B(B), .cin(1'b0), .S(W0), .cout(Wcout[0]));
	ripple_4bit rip1 (.A(A), .B(B), .cin(1'b1), .S(W1), .cout(Wcout[1]));
	
	//construct multiplexor gates to decide which ripple carry solution to use,
	//select signal is cin (carry in)
	
	multiplexor M0 (.w0(W0[0]), .w1(W1[0]), .s(cin), .f0(S[0]));
	multiplexor M1 (.w0(W0[1]), .w1(W1[1]), .s(cin), .f0(S[1]));
	multiplexor M2 (.w0(W0[2]), .w1(W1[2]), .s(cin), .f0(S[2]));
	multiplexor M3 (.w0(W0[3]), .w1(W1[3]), .s(cin), .f0(S[3]));
	
	
	//genvar i;
	//generate 
	//	for (i = 0; i < 3; i = i +1) begin:mux_loop
	//		multiplexor M0 (.w0(W0[i]), .w1(W1[i]), .s(cin), .f0(S[i]));
	//	end
	//endgenerate

	//generate carrout bit
	multiplexor M4 (.w0(Wcout[0]), .w1(Wcout[1]), .s(cin), .f0(cout));

endmodule
