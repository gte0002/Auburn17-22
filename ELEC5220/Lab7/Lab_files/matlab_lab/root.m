clear
close all
load ally
plot(sumy')
s=mean(sumy);
R=sumy'*sumy;


%[~,R] = corrmtx(s,12,'mod');
[W,P] = rootmusic(R,6,'corr');
breath=(W./pi)*10*60
%%
figure
for i=1:30
    da=sumy(i,:);
a=fft(da,length(da));
df=20/(length(da)-1);
ff=-10:df:10;

plot(ff,fftshift(abs(a)))
hold on
end
pcomp=(W./pi)
%%
[m,n]=size(s);
row=n/2;

tensordata=zeros(row,n-row,m);
for i=1:m
    tensordata(:,:,i)=hankelfil(s(i,:),row);
end
R2=tensordata'*tensordata;
[W,P] = rootmusic(R2,6,'corr');
breath=(W./pi)*10*60
%%
smap=sumy(2,:)
figure
plot(smap)
save samp smap