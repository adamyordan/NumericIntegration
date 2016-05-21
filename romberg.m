% ROMBERG     approximate the definite integral of an arbitrary function
%             to within a specified error tolerance using adaptive 
%             quadrature based on Simpson's rule <-- SALAH
%
%     inputs:
%             f       function
%             a       lower limit of integration
%             b       upper limit of integration
%             TOL     absolute error convergence tolerance
%
%     output:
%             result  approximate value of the definite integral of f(x)
%                     over the interval a < x < b
% ATAS INI MASIH COPASAN

function result =  romberg (f, a, b, TOL)

finished = false;
j = 0;

% Iterate until stop condition met
while (!finished)

	j = j + 1;

	h(j) = (b - a) / (2 ^ (j-1));

	subtotal = 0;

	for i = 1 : 2^(j-1) - 1
		x = a + i * h(j);
		subtotal = subtotal + f(x);
	end

	% Calculate R(J,1)
	r(j,1) = (h(j) / 2) * (f(a) + f(b) + 2 * subtotal);

	% Calculate R(J,K), K = 2 .. J
	for k = 2 : j
		r(j,k) = (4^(k-1) * r(j, k-1) - r(j-1, k-1)) / (4^(k-1) - 1);
	end

	% Checking stop condition
	if j ~= 1 && abs (r(j,j) - r(j-1,j-1)) < TOL
		finished = true;
		result = r(j,j);
	end

end
