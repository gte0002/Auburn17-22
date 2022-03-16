syms x y z
%%4.1
eqns1 = [x^2-5*x+6==0];
S1 = solve(eqns1,[x]);

%%4.2
eqns2 = [2*x+y-2*z==3, x-y-z==0, x+y+3*z==12];
S2 = solve(eqns2,[x y z]);
S2.x
S2.y
S2.z

%%4.3
eqns3 = [(1-x)^2+(4-y)^2==6.5^2, (5-x)^2+(1-y)^2==6.5^2];
S3 = solve(eqns3,[x y]);
S3.x
S3.y

%%4.4
ezplot('cos(x)', [-4,4]);
hold on
ezplot('x^2-4', [-4,4]);
title('Plot of cos(x) = x^2 - 4');
xlabel('x')
ylabel('y')

eqn1 = cos(x) == x^2 - 4;
V1 = vpasolve(eqn1,x,[-2 0]);
V2 = vpasolve(eqn1,x,[0 2]);

%%4.5
% eqn2 = cos(x) == sin(x);
% V3 = vpasolve(eqn2,x,[0 100]);
ezplot('cos(x)', [0,10]);
hold on
ezplot('sin(x)', [0,10]);
title('Plot of cos(x) = sin(x)');
xlabel('x')
ylabel('y')

%%4.6
ezplot('cos(x)', [-5,5]);
hold on
ezplot('2*x^2', [-5,5]);
title('Plot of cos(x) = 2*x^2');
xlabel('x')
ylabel('y')
eqn3 = cos(x) == 2*x^2;
V4 = vpasolve(eqn3,x,[-1 0]);
V5 = vpasolve(eqn3,x,[0 1]);