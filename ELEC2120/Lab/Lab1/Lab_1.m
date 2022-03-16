clc
clear
x = 3;
y = 6;
a = x+y;
b = x*y;
c = y-x;
d = y/x;
%% Matrix Math
E = [1 2 3 4 5 6 7 8 9 10];
F = [1:10];
G = [1 2 ; 3 4];
H = eye(2);
I = G+H;
J = G*H;
K = G.*H;
L = G-H;
M = G*inv(H);
N = G/H;
%Gabriel Emerson