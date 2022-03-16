% Pulse 1
t = 0:0.1:10
u1 = t>=0
u2 = t>=5
x = (1/5).*(((1-exp(-t/2)).*u1)-(1-exp(-(t-5)/2)).*u2)
figure(1);plot(t,x,'LineWidth',2)
xlabel('t');
ylabel('x(t)');
title('Problem 2.21(a)');
grid on

% Pulse 2
t = 0:0.1:10
u1 = t>=0
u2 = t>=0.05
x = (1/0.05).*(((1-exp(-t/2)).*u1)-(1-exp(-(t-0.05)/2)).*u2)
figure(2);plot(t,x,'LineWidth',2)
xlabel('t');
ylabel('x(t)');
title('Problem 2.21(b)');
grid on

% Pulse 3 (Time step 0.1)
t = 0:0.1:10
u1 = t>=0
u2 = t>=0.01
x = (1/0.01).*(((1-exp(-t/2)).*u1)-(1-exp(-(t-0.01)/2)).*u2)
figure(3);plot(t,x,'LineWidth',2)
xlabel('t');
ylabel('x(t)');
title('Problem 2.21(c) (Time step 0.1)');
grid on

% Pulse 3 (Time step 0.001)
t = 0:0.001:10
u1 = t>=0
u2 = t>=0.01
x = (1/0.01).*(((1-exp(-t/2)).*u1)-(1-exp(-(t-0.01)/2)).*u2)
figure(4);plot(t,x,'LineWidth',2)
xlabel('t');
ylabel('x(t)');
title('Problem 2.21(c) (Time step 0.001)');
grid on