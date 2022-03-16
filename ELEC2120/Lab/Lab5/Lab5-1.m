clc
clear
close all
%Create Array t
t = -10:0.1:10;

%Create Outputs y = u(t) and y = r(t)
y_u = u(t,0);
y_r = r(t,0);
subplot(1,2,1), plot(t,y_u)
title('Plot of u(t)')
xlabel('Time (s)')
ylabel('Amplitude')
xlim([-10 10])
ylim([-0.2 1.2])
subplot(1,2,2), plot(t,y_r)
title('Plot of r(t)')
xlabel('Time (s)')
ylabel('Amplitude')
xlim([-10 10])
ylim([0 10])

%Build Pulse Function
x1 = u(t,-1/2)-u(t,1/2)
x2 = u(t,-3/2)-u(t,3/2)
figure(2); 
plot(t,x1)
title('Pulse function when tau = 1')
xlim([-3 3])
ylim([0 1.5])
figure(3);
plot(t,x2)
title('Pulse function when tau = 3')
xlim([-3 3])
ylim([0 1.5])

%% Section 1
subplot(1,3,1), plot(t,y_u)
title('Plot of u(t)')
xlabel('Time (s)')
ylabel('Amplitude')
xlim([-10 10])
ylim([-0.2 1.2])
subplot(1,3,2), plot(t,y_r)
title('Plot of r(t)')
xlabel('Time (s)')
ylabel('Amplitude')
xlim([-10 10])
ylim([0 10])
subplot(1,3,3), plot(t,x1)
title('Plot of P(t)')
xlabel('Time (s)')
ylabel('Amplitude')
xlim([-3 3])
ylim([0 1.5])

%% Section 2
% This x3 is defintely wrong
x3 = (r(t,0)-r(t,2))+3.*u(t,2)+(0.4.*(u(t,2)-u(t,5.6)))
x4 = r(t,0)-2*r(t,2)+4*u(t,2)+r(t,4)-4*u(t,4)
plot(t,x3,'LineWidth',2)
title('Plot of equation 2 and 3')
xlabel('Time (s)')
ylabel('Amplitude')
xlim([-10 10])
ylim([-10 10])
hold on
plot(t,x4,'--','LineWidth',2)
legend('eq2','eq3');
grid on
hold off