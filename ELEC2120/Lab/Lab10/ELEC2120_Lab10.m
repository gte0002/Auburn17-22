%% --------------- Part A ----------------
% Plot the fundamental frequency and hear associated sound
t = 0:.1:1000;
y = sin(t);
plot(t,y);
sound(y)

%% Next add the third harmonic to the fundamental, and plot/hear it.
y = sin(t) + sin(3*t)/3;
plot(t,y);
sound(y)
%% Now use the first, third, fifth, seventh, and ninth harmonics.
y = sin(t) + sin(3*t)/3 + sin(5*t)/5 + sin(7*t)/7 + sin(9*t)/9;
plot(t,y);
sound(y)

%% --------------- Part B ----------------
% CODE 1
% Ideal square wave
t=-10:0.0001:10;
x=0.5*(square(t)+1);
plot(t,x)
hold on

% CODE 2
clc, syms n x
L = pi; N_TERMS = input('Number of terms: '); n = 1:N_TERMS;

% Calculating the coefficients of the Fourier Series
tic
a0 = (1/L)*int(1, x, 0, pi);
an = (1/L)*int(1*cos(n*x), x, 0, pi);
bn = (1/L)*int(1*sin(n*x), x, 0, pi);

% Plugging the coefficient values in the Fourier Series
f = 0;
for n=1:N_TERMS   
    f=f+(an(n)*cos(n*x) + bn(n)*sin(n*x));
end
toc

fprintf('Approximation using %d terms\n', n)
f_approx=(a0/2)+f;
ezplot(f_approx,[-10,10])
title('Fourier Series Approximation')
xlabel('x')
ylabel('F(x) approximated')
hold off
legend('f(x)','f`(x)');

%% --------------- Part C ----------------
% CODE 1
% Ideal sawtooth wave
t=-10:0.0001:10;
x=0.5*(sawtooth(t)+1);
plot(t,x)
hold on

% CODE 2
clc, syms n x
L = pi; N_TERMS = input('Number of terms: '); n = 1:N_TERMS;

% Calculating the coefficients of the Fourier Series
tic
a0 = (1/L)*int(1, x, 0, pi);
%an = (1/L)*int(1*cos(n*x), x, 0, pi);
bn = (1/L)*int(-1./(n*pi), x, 0, pi);

% Plugging the coefficient values in the Fourier Series
f = 0;
for n=1:N_TERMS   
    f=f+bn(n)*sin(n*x);
end
toc

fprintf('Approximation using %d terms\n', n)
f_approx=(a0/2)+f;
ezplot(f_approx,[-10,10])
title('Fourier Series Approximation')
xlabel('x')
ylabel('F(x) approximated')
hold off
legend('f(x)','f`(x)');
