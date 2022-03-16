% 1.25(b)

t=-10:.01:10;
u= t>=0;
x=-10*exp(-0.1*t).*u;
figure(1);plot(t,x,'LineWidth',2)
xlabel('t');
ylabel('x(t)');
title('Problem 1.25(b)');
grid on

% 1.25(c)

t=-10:.01:10;
u= t>=5;
x=-10*exp(-0.1*t).*u;
figure(2);plot(t,x,'LineWidth',2)
xlabel('t');
ylabel('x(t)');
title('Problem 1.25(c)');
grid on