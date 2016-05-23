function x = experiment()

f1 = @(x) (sqrt(x) * log (x));
a1 = 1e-32;
b1 = 1;

f2 = @(x) cos (x);
a2 = -1;
b2 = 1;

f3 = @(x) (1 / (1 + 100 * x^2));
a3 = -1;
b3 = 1;

f4 = @(x) sqrt(abs(x));
a4 = -1;
b4 = 1;

exact = [-4/9      2*sin(1)      (1/5)*atan(10)      4/3]

h = [0.8 0.5 0.25 0.125 0.1 0.05 0.01 0.001 0.0001];

for i = 1:8
	[tcomp(i,1) comp(i,1)] = timeCompositeSimpson (f1, a1, b1, h(i));
	[tcomp(i,2) comp(i,2)] = timeCompositeSimpson (f2, a2, b2, h(i));
	[tcomp(i,3) comp(i,3)] = timeCompositeSimpson (f3, a3, b3, h(i));
	[tcomp(i,4) comp(i,4)] = timeCompositeSimpson (f4, a4, b4, h(i));
end

% tol = [log(2) log(3) log(4) log(5) log(6) log(7) log(8) log(10) log(12)];
tol = h;
for i = 1:8
	[tadap(i,1) adap(i,1)] = timeAdaptiveSimpson (f1, a1, b1, tol(i));
	[tadap(i,2) adap(i,2)] = timeAdaptiveSimpson (f2, a2, b2, tol(i));
	[tadap(i,3) adap(i,3)] = timeAdaptiveSimpson (f3, a3, b3, tol(i));
	[tadap(i,4) adap(i,4)] = timeAdaptiveSimpson (f4, a4, b4, tol(i));
end

for i = 1:8
	[tromb(i,1) romb(i,1)] = timeRomberg (f1, a1, b1, tol(i));
	[tromb(i,2) romb(i,2)] = timeRomberg (f2, a2, b2, tol(i));
	[tromb(i,3) romb(i,3)] = timeRomberg (f3, a3, b3, tol(i));
	[tromb(i,4) romb(i,4)] = timeRomberg (f4, a4, b4, tol(i));
end

% error calculation
for k = 1:4
	for i = 1:8
		errcomp(i,k) = exact(k) - comp(i,k);
		erradap(i,k) = exact(k) - adap(i,k);
		errromb(i,k) = exact(k) - romb(i,k);
	end
end


comp
adap
romb
errcomp
erradap
errromb
tcomp
tadap
tromb

end


function [t val] = timeCompositeSimpson (arg1, arg2, arg3, arg4)
	t = time;
	val = compositeSimpson(arg1, arg2, arg3, arg4);
	t = (time - t) * 1000;
end

function [t val] = timeAdaptiveSimpson (arg1, arg2, arg3, arg4)
	t = time;
	val = adaptiveSimpson(arg1, arg2, arg3, arg4);
	t = (time - t) * 1000;
end

function [t val] = timeRomberg (arg1, arg2, arg3, arg4)
	t = time;
	val = romberg(arg1, arg2, arg3, arg4);
	t = (time - t) * 1000;
end
