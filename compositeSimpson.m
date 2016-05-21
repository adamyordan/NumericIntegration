function x = compositeSimpson(a,b,h,f)

% h = (b - a) / n;
% x = zeros (1, n+1);

% for i = 1:n
% 	x(i) = a + (i-1) * h;
% endfor

i = 1
x(i) = a + (i-1) * h;
while x(i) < b
	i = i + 1;
	x(i) = a + (i-1) * h;
end
n = i - 1;

% The 2 factor terms
q = 0;
for i = 2:(((n+1)/2) - 1 )
   q = q + (f(x(2*i)));
end

% The 4 factor terms
p = 0;
for i = 2:((n+1)/2)
   p = p + (f(x(2*i -1)));
end

% Calculate final output
x = (h/3) * (f(a) + 2*q + 4*p + f(b));

function y = simp ( f, a, b, n )