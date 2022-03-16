%% Section 1a
clc;clear;
A=1;
tau=1;
T=2;
N=10;
M=400;
dt=2*T/M;
wo=2*pi/T;

%Calculate Coefficients
a0=A*tau/T;
for k=1:N
    kn(k)=k;
    a(k)=(A/(k*pi))*sin(k*wo*tau);
    b(k)=(A/(k*pi))*(1-cos(k*wo*tau));
end

%Assemble Pulse
for i=1:M
    t(i)=i*dt;
    for k=1:N
        x(k)=a(k)*cos(k*wo*t(i))+b(k)*sin(k*wo*t(i));
    end
    xtot(i)=a0+sum(x);
end

%Plot
subplot(3,1,1),plot(t,xtot,'linewidth',2)
xlabel('time (s)');ylabel('x(t)');grid on
Nstr=num2str(N);S=strcat(Nstr,' Fourier components');
title(S)
subplot(3,1,2),stem(kn,a,'linewidth',2)
ylabel('a(k)');grid on
subplot(3,1,3),stem(kn,b,'linewidth',2)
ylabel('b(k)');xlabel('k');grid on

%% Section 1b
clc;clear;
A=1;
tau=1;
T=2;
N=100;
M=400;
dt=2*T/M;
wo=2*pi/T;

%Calculate Coefficients
a0=A*tau/T;
for k=1:N
    kn(k)=k;
    a(k)=(A/(k*pi))*sin(k*wo*tau);
    b(k)=(A/(k*pi))*(1-cos(k*wo*tau));
end

%Assemble Pulse
for i=1:M
    t(i)=i*dt;
    for k=1:N
        x(k)=a(k)*cos(k*wo*t(i))+b(k)*sin(k*wo*t(i));
    end
    xtot(i)=a0+sum(x);
end

%Plot
subplot(3,1,1),plot(t,xtot,'linewidth',2)
xlabel('time (s)');ylabel('x(t)');grid on
Nstr=num2str(N);S=strcat(Nstr,' Fourier components');
title(S)
subplot(3,1,2),stem(kn,a,'linewidth',2)
ylabel('a(k)');grid on
subplot(3,1,3),stem(kn,b,'linewidth',2)
ylabel('b(k)');xlabel('k');grid on

%% Section 2a
clc;clear;
A=1;
T=2;
N=10;
M=800;
dt=4*T/M;
wo=2*pi/T;

%Calculate Coefficients
a0=A/4;
for k=1:N
    kn(k)=k;
    %a(k)=(A/(k*pi))*sin(k*wo*tau);
    a(k)=(2/T)*(((1/((k*pi)*(k*pi)))*cos(k*pi))-1/((k*pi)*(k*pi)));
    b(k)=-(A/(k*pi))*(cos(k*pi));
end

%Assemble Pulse
for i=1:M
    t(i)=i*dt;
    for k=1:N
        x(k)=a(k)*cos(k*wo*t(i))+b(k)*sin(k*wo*t(i));
    end
    xtot(i)=a0+sum(x);
end

%Plot
subplot(2,1,1),plot(t,xtot,'linewidth',2)
xlabel('time (s)');ylabel('x(t)');grid on
Nstr=num2str(N);S=strcat(Nstr,' Fourier components');
title(S)
subplot(2,1,2),stem(kn,b,'linewidth',2)
ylabel('a(k)');xlabel('k');grid on

%% Section 2b
clc;clear;
A=1;
T=2;
N=100;
M=800;
dt=4*T/M;
wo=2*pi/T;

%Calculate Coefficients
a0=A/4;
for k=1:N
    kn(k)=k;
    %a(k)=(A/(k*pi))*sin(k*wo*tau);
    a(k)=(2/T)*(((1/((k*pi)*(k*pi)))*cos(k*pi))-1/((k*pi)*(k*pi)));
    b(k)=-(A/(k*pi))*(cos(k*pi));
end

%Assemble Pulse
for i=1:M
    t(i)=i*dt;
    for k=1:N
        x(k)=a(k)*cos(k*wo*t(i))+b(k)*sin(k*wo*t(i));
    end
    xtot(i)=a0+sum(x);
end

%Plot
subplot(2,1,1),plot(t,xtot,'linewidth',2)
xlabel('time (s)');ylabel('x(t)');grid on
Nstr=num2str(N);S=strcat(Nstr,' Fourier components');
title(S)
subplot(2,1,2),stem(kn,b,'linewidth',2)
ylabel('a(k)');xlabel('k');grid on