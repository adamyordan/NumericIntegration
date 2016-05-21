% AdaptiveSimpson     approximate the definite integral of an arbitrary function
%                     to within a specified error tolerance using adaptive 
%                     quadrature based on Simpson's rule <-- SALAH
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

function [y err] = adaptiveSimpson (f, a, b, TOL)

fa = f(a);
fb = f(b);
fc = f((a-b)/2);

s = (b-a) * (fa + 4*fc + fb)/6;

[y err] = adapSimpHelper (f, a, b, TOL, s);


function [y err] = adapSimpHelper (f, a, b, TOL, s)

c = (a+b) / 2;
fa = f(a);
fb = f(b);
fc = f((a-b)/2);
fd = f((a+c)/2);
fe = f((c+b)/2);
s1 = (c-a) * (fa + 4 * fd + fc) / 6;
s2 = (b-c) * (fc + 4 * fe + fb) / 6;

err = calcError(s,s1,s2);

if (err < TOL)
	y = s1 + s2;
else
	[y1 err1] = adapSimpHelper (f, a, c, TOL / 2, s1);
	[y2 err2] = adapSimpHelper (f, c, b, TOL / 2, s2);
	err = err1 + err2;
	y = y1 + y2;
end

function e = calcError (s1, s21, s22)
s2 = s21 + s22;
e = abs((s1 - s2) / s2);
