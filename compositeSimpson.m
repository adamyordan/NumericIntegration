% COMPOSITESIMPSON    approximate the definite integral of an arbitrary function
%                     to within a specified error tolerance using adaptive 
%                     quadrature based on Simpson's rule <-- SALAH
%
%     inputs:
%             f       function
%             a       lower limit of integration
%             b       upper limit of integration
%             h       panjang langkah
%
%     output:
%             result  approximate value of the definite integral of f(x)
%                     over the interval a < x < b
% ATAS INI MASIH COPASAN

function result = compositeSimpson(f,a,b,h)

% Checking prerequisite for simpson formula
n = floor((b-a) / h);
if (mod(n+1, 3) ~= 0)
	% warning ('n + 1 should be a factor of 3');
end

% Calculating values of x
x(1) = a;
for i = 2:n
	x(i) = x(i-1) + h;
end
x(n+1) = b;


% Calculating the 2 factor polinomial elements
q = 0;
for i = 2:(((n+1)/2) - 1 )
   q = q + (f(x(2*i)));
end

% Calculating the 4 factor polinomial elements
p = 0;
for i = 2:((n+1)/2)
   p = p + (f(x(2*i -1)));
end

% Calculate final output
result = h * (f(a) + 2*q + 4*p + f(b)) / 3;
