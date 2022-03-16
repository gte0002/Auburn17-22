clear
%close all
cells = read_bf_file('experiments/1min3');
m=4800;
K = 12000;
N=30;
window=1;
mw=1;
fmw = (1/mw)*ones(1,mw);
K=floor(K/window);
phase1 = zeros(1, K);
phase2 = zeros(1, K);
phase3 = zeros(1, K);
relative_phase12 = zeros(1, K);
relative_phase23 = zeros(1, K);
relative_phase31 = zeros(1, K);
t=zeros(1,K);
sumy=zeros(N,K/20);
%sumy=zeros(10,floor(length(cells)/20));

count = 1;
 figure
for id=1:30 
  for i = m+1 :  m+K
	csi = cells{i}.csi;
    
	csi1 = reshape(csi(1,1, :), 1, N);
	csi2 = reshape(csi(1,2, :), 1, N);
	csi3 = reshape(csi(1,3, :), 1, N);
    
	
	phase1(count) =angle(csi1(id));
	phase2(count) =angle(csi2(id));
	phase3(count) =angle(csi3(id));
	
   relative_phase12(count) = angle(csi2(id)*conj(csi1(id)));
    relative_phase23(count) = angle(csi3(id)*conj(csi2(id)) );
	relative_phase31(count) = angle(csi1(id)*conj(csi3(id)));
	count = count + 1;
 end
count=1;

p0=(phase1);
pp0=unwrap(phase2);
ppp0=unwrap(phase3);


p1=pp0;
p1=meanfilter(p1,1);
p2=hampel(p1,2000,0.01);%1000.0.001
y1=p1; 
%y1 = filter(fmw,1,y1);
y2=1*(hampel((y1),20,0.01));%150 0.1
y3=meanfilter(y1,20);
%y3=y2;
n=length(y3);
sumy(id,:)=y3;
xx=1:n;
plot(y3)%plot 
dd=num2str(id);
% legend(dd)
 hold on
% fs=1/((30)/n);
% df=fs/n;
% yfft=db(abs(fft(y3,n)));
% xf=[0:df:df*(n-1)]-fs/2;
% %filter=[zeros(1,6),ones(1,44)];
% %fff=yfft(1,1:50);
% subplot(2,1,2)
% plot(xf,fftshift(yfft),'.');
% hold on
end
avey=median(sumy(:,:));
% modi=errorfil(avey,1.5);
% modi=meanfilter(modi,40);
% d = fdesign.lowpass('Fp,Fst,Ap,Ast',0.15,0.18,1,60);
% designmethods(d)
% Hd = design(d,'equiripple');
% fvtool(Hd);
% modi2= filter(Hd,avey);
 fil=(avey);
n2=length(fil);
yfft2=(abs(fft(fil,n2)));
fs=1/((30)/n2);
df=fs/n2;
xf=[0:df:df*(n2-1)]-fs/2;
figure 
plot(fil)
figure
plot(xf,fftshift(yfft2));
figure
im=1500*(sumy);
image(im)
colormap(jet(512))
save fill avey
save ally sumy
