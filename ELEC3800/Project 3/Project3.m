%Part 1
N = 2000000;
x = rand(N,1);      %samples in uniform distribution
n = randn(N,1);     %random noise from gaussian
y = 3*x+n;          %output
figure(1)
scatter(x(1:1000,1),y(1:1000,1))

%Part 2
xc = [-0.2:0.025:1.2];  %histogram bin x-centers
yc = [-4.5:0.2:8];     %histogram bin y-centers
fxy = hist3([x y],{xc yc});
figure(2)
mesh(xc,yc,fxy')
xlabel('x')
ylabel('y')

%Part 4
summation = (1:N);
for i = (1:N)
   summation(i) = x(i)*y(i);
end
answer = sum(summation)/N

%Part 5
fx = hist(x,xc);
fy = hist(y,yc);
figure(3)
mesh(xc,yc,fy'*fx)