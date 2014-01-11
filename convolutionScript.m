clear;

% Create target function and other presets
% targetFunction = @(x) sin(x);
% targetFunction = @(x) 1;
% targetFunction = @(x) (1-x*x)*x^(1/3);
% targetFunction = @(x) 1/cosh(x);
% targetFunction = @(x) atan(x*(1-x));
 targetFunction = @myFunction;
start = 0;
finish = 1;
count = 1024;

d = discretization(start, finish, count, targetFunction);
f = fft(d, count*2);
c = convolution(f);

cs00 = convolutionWithShift(f, 0.0, start, finish*2);
cs05 = convolutionWithShift(f, 0.5, start, finish*2);
cs10 = convolutionWithShift(f, 1.0, start, finish*2);
cs15 = convolutionWithShift(f, 1.5, start, finish*2);
cs20 = convolutionWithShift(f, 2.0, start, finish*2);

noised = awgn(c, 40, 'measured');

% Plot of discretization
x = createAxis(start, finish, count);
plot(x, d);
title('Plot of discretization')
pause;

% Plot of convolution
x = createAxis(start, finish*2, length(c));
plot(x, c);
title('Plot of convolution')
pause;

% Plot of convolution with shift 0.0
x = createAxis(start, finish*2, length(c));
sc = max(cs00);
scA = arrayfun(@(v) (v/sc), cs00);
plot(x, scA);
title('Plot of convolution with shift 0.0')
pause;

% Plot of convolution with shift 0.5
x = createAxis(start, finish*2, length(c));
sc = max(cs05);
scA = arrayfun(@(v) (v/sc), cs05);
plot(x, scA);
title('Plot of convolution with shift 0.5')
pause;

% Plot of convolution with shift 1.0
x = createAxis(start, finish*2, length(c));
sc = max(cs10);
scA = arrayfun(@(v) (v/sc), cs10);
plot(x, scA);
title('Plot of convolution with shift 1.0')
pause;

% Plot of convolution with shift 1.5
x = createAxis(start, finish*2, length(c));
sc = max(cs15);
scA = arrayfun(@(v) (v/sc), cs15);
plot(x, scA);
title('Plot of convolution with shift 1.5')
pause;

% Plot of convolution with shift 2.0
x = createAxis(start, finish*2, length(c));
sc = max(cs20);
scA = arrayfun(@(v) (v/sc), cs20);
plot(x, scA);
title('Plot of convolution with shift 2.0')
pause;

% Plot of convolution with shift 2.0
x = createAxis(start, finish*2, length(c));
plot(x, noised);
title('Plot of noise convolution')
pause;

