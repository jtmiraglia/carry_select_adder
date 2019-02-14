//create a 16bit carry select adder using 4 bit carry select modules

module carry_select_adder(A, B, cin, S, cout);
	input [15:0] A, B;
	input cin;
	output [15:0] S;
	output cout;
	wire [4:0] carrybits; //connects the carry from on carry select to the next

	assign carrybits[0] = cin;
	
	//carry_select_4bit CS0 (.A(A[3:0]), .B(B[3: 0]), .S(S[3: 0]), .cin(carrybits[0]), .cout(carrybits[1]));
	//carry_select_4bit CS1 (.A(A[7:4]), .B(B[7: 4]), .S(S[7: 4]), .cin(carrybits[1]), .cout(carrybits[2]));
	//carry_select_4bit CS2 (.A(A[11:8]), .B(B[11: 8]), .S(S[11: 8]), .cin(carrybits[2]), .cout(carrybits[3]));
	//carry_select_4bit CS3 (.A(A[15:12]), .B(B[15: 12]), .S(S[15: 12]), .cin(carrybits[3]), .cout(cout));
	
	
	genvar i;
	generate
		for (i = 0; i <= 3; i = i + 1) begin:cs_loop
			carry_select_4bit CS0 (.A(A[(4*i)+3: (4*i)]), .B(B[(4*i)+3: (4*i)]), .S(S[(4*i)+3: (4*i)]), .cin(carrybits[i]), .cout(carrybits[i+1]));
		end
	endgenerate

	assign cout = carrybits[4];

endmodule
