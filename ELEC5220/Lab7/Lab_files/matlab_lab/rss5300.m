clear
close all
cells = read_bf_file('experiments/wall2m1');
m=2000;
K = length(cells)-m;
N=30;
window=1;
phase1 = zeros(1, K);
phase2 = zeros(1, K);
phase3 = zeros(1, K);
t=zeros(1,K);
%sumy=zeros(10,floor(length(cells)/20));

count = 1;
  for i = m+1 :  length(cells)
    
	
	phase1(count) =cells{i}.rssi_a;
	phase2(count) =cells{i}.rssi_b;
	phase3(count) =cells{i}.rssi_c;
    count=count+1
  end
p0=phase1;
pp0=phase2;
ppp0=phase3;

plot(p0)
p1=p0;
p2=hampel(p1,1000,0.001);%1000.0.001
y1=p1; 
%y1 = filter(fmw,1,y1);
y2=1*(hampel((y1),40,0.01));%150 0.1
y3=meanfilter(y1,window);
n=length(y3);

