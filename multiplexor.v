module multiplexor(w0, w1, s,f0);
	input w0, w1, s;
	output f0;
	wire n, a, b;
	
	not(n, s);
	and(a, n, w0);
	and(b, s, w1);
	or(f0, a, b);
	
endmodule