% AdaptiveSimpson     approximate the definite integral of an arbitrary function
%                     to within a specified error tolerance using adaptive 
%                     quadrature based on Simpsons rule
%
%     inputs:
%             f       function
%             a       lower limit of integration
%             b       upper limit of integration
%             TOL     absolute error convergence tolerance
%
%     output:
%             y       approximate value of the definite integral of f(x)
%                     over the interval a < x < b
%
% ATAS INI MASIH COPASAN

function y = adaptiveSimpson (f, a, b, TOL)

	c = (a + b) / 2;

	fa = f(a);
	fb = f(b);
	fc = f(c);

	% Calculating Simpson Rule for interval a .. b
	s = (b-a) * (fa + 4*fc + fb) / 6;

	% Calculating result for Adaptive Rule 
	y = adapSimpHelper (f, a, c, b, TOL, fa, fc, fb, s);

end


function y = adapSimpHelper (f, a, c, b, TOL, fa, fc, fb, s)

	d  = (a + c) / 2;
	e  = (c + b) / 2;
	fd = f(d);
	fe = f(e);
	s1 = (c-a) * (fa + 4 * fd + fc) / 6;
	s2 = (b-c) * (fc + 4 * fe + fb) / 6;

	% Estimating error 
	err = abs(s1 + s2 - s);

	% Checking Stop Condition
	if (err < TOL * 15.0)
		y = (s1 + s2) / 15.0;
	else
		y1 = adapSimpHelper (f, a, d, c, TOL / 2.0, fa, fd, fc, s1);
		y2 = adapSimpHelper (f, c, e, b, TOL / 2.0, fc, fe, fb, s2);
		y = y1 + y2;
	end

end
