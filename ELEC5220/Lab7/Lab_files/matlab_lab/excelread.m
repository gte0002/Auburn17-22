clear 
close all
num = xlsread('heraterror.xls');
phaseerror=abs(num((1:99),3));
amperror=abs(num((1:99),3));
b=[amperror;amperror.*(0.3*rand(99,1))];
figure
[y,x]=ecdf(phaseerror);
plot(x,y,'b');
hold on
[y2,x2]=ecdf(b);
plot(x2,y2,'r');
pa=mean(phaseerror);
pm=median(phaseerror);
ps=std(phaseerror);
aa=mean(amperror);
am=median(amperror);
as=std(amperror);
%figure
xh=[pa,aa;ps,as];
% figure
% bar(xh)
% title 'blue-phase,yellow-amplitude,left-average,left-squareerror'
%
% X=1:length(b)
% Y = b;
% E = std(Y)*ones(size(X));
% errorbar(Y,E)