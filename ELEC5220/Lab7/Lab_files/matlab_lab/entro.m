clear
%close all
load ally
%  sumy=sumy(:,(1:23000));
[m,n]=size(sumy);

squa=zeros(1,m);
ef=zeros(1,m);
ent=zeros(1,n);
for i=1:m
    y=sumy(i,:);
    y=y-min(y);
    y=y/max(y);
    p=y/sum(y);
 ef(1,i)=-nansum(p.*log2(p));
  squa(1,i)=sum(abs((y-mean(y))))/n;
end
figure
plot(squa)
% hold on 
% plot(ef/max(ef))

a=1:length(squa);
squa2=[squa',a'];
squa3=sortrows(squa2,-1);

pick=[squa3(1,2),squa3(2,2),squa3(3,2),squa3(4,2),squa3(5,2)];
finy=zeros(5,n);
for k=1:5
    finy(k,:)=sumy((pick(k)),:);
   
end
 figure 
% xx=(1:1:23000)/11500;
subphase=sumy(3,:)-sumy(7,:);
 plot(median(sumy));
 hold on
figure
plot(mean(finy));
b=median(sumy);
figure
for i=1:30;
[~,R] = corrmtx(sumy(i,:),300,'mod');
[w,Pow] = rootmusic(R,8,'corr');
w=w(1:2:7);
W=(60*w/0.314);
plot(W,'.')

hold on
end

% figure
% b=(mean(sumy));
% plot(b)
% yf=sum(sumy);
% squas=sum(abs((yf-mean(yf))))/n

save fill2 b