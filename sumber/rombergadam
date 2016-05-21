function r = myromberg(a,b,f,n)

% r(1,0) = (b - a) / (2^1) * (f(a) + f(b))
% r(2,0) = (b - a) / (2^2) * (f(a) + 2*f(c) + f(b))

for j = 1 : n
	h(j) = (b - a) / (2 ^ (j-1));
end

for j = 1 : n
	subtotal = 0;
	% for i = 2:(2^(j-1) - 1)
	% 	subtotal = subtotal + 2 * f(a + i * h(j));
	% end
	for i = 1:2^(j-1)
		subtotal = subtotal + 2 * f(a + (i - 1) * h(j));
	end
	r(j,1) = (h(j) / 2) * (f(a) + f(b) + subtotal);

	for k = 2:j
		r(j,k) = (4^(k-1) * r(j,k-1) - r(j-1,k-1)) / (4^(k-1) - 1);
	end

end