//create a 16bit ripple carry adder using 4 bit ripple carry modules

module ripple_carry_adder (A, B, cin, S, cout);
	input [15:0] A, B;
	input cin;
	output [15:0] S;
	output cout;
	wire [4:0] carrybits; //connects the carry from one ripple carry to the next to the next

	assign carrybits[0] = cin;
	

	genvar i;
	generate for (i = 0; i <= 3; i = i + 1)
		begin:rc_loop
				ripple_4bit RC0 (.A(A[(4*i)+3: (4*i)]), .B(B[(4*i)+3: (4*i)]), .S(S[(4*i)+3: (4*i)]), .cin(carrybits[i]), .cout(carrybits[i+1]));
		end
	endgenerate

	assign cout = carrybits[4];

endmodule
