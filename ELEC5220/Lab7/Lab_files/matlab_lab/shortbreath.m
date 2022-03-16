clear
%close all
load fill2 
avey=b;
fil=(avey);
nl=length(fil);
step=40;
wi=40;
num=ceil((nl-wi)/step);

fs=40;
df=fs/wi;
xf=[0:df:df*(wi-1)]-fs/2;
sumy=zeros(num,wi);
% d = fdesign.highpass('Fst,Fp,Ast,Ap',0.035,0.04,60,1);
% Hd = design(d,'equiripple');
sp=fil;
sp1=zeros(1,nl);
 bt=zeros(1,num);
figure 
for i=1:num
ffts=fil(1,(1+(i-1)*step:(i-1)*step+wi));
%aft= filter(Hd,ffts);%filter
t = (1:length(ffts));
opol =5;
[p,s,mu] = polyfit(t,ffts,opol);
trend = polyval(p,t,[],mu);
aft = ffts-trend;
subplot(4,1,1)
plot(t,ffts);grid
subplot(4,1,2);
plot(t,trend);grid
subplot(4,1,3);
aft2=hampel(aft,5,0.01);
plot(t,aft);grid
%%FFT
% n2=length(aft2);
% yfft2=(abs(fft(aft2,n2)));
% fs=1/((3)/n2);%%time
% df=fs/n2;
% xf=[0:df:df*(n2-1)]-fs/2;
%  subplot(4,1,4);
% plot(xf,fftshift(yfft2));grid;
% hold on
%%xxor
% ac=xcorr(aft2,aft2);
% 
% subplot(4,1,4);
% plot(ac);grid;
% [~,locs]=findpeaks(ac);
% medn=(length(locs)+1)/2;
% tt=locs(1,medn)-locs(1,(medn-1));
% bt(1,i)=tt;
%%splice
sp(1,(1+(i-1)*step:(i-1)*step+wi-1))=trend(1:wi-1);
sp=hampel(sp,3,0.1);
sp1=fil-sp;
end
figure
plot(avey)
hold on
plot(sp);
figure
plot(sp1);
n=length(sp1);
yfft2=(abs(fft(sp1,n)));
fs=1/((30)/n);%%time
df=fs/n;
xf=[0:df:df*(n-1)]-fs/2;
 figure
plot(xf,fftshift(yfft2));grid;

save pm sp1
%%bt
% ff=mean(sumy);
% bt1=errorfil(bt);
% finalbt=1200/mean(bt)
% finalbt1=1200/mean(bt1)
% figure
% plot(bt)
% hold on
% plot(bt1)
%figure
%plot(xf,ff)
%save ff ff