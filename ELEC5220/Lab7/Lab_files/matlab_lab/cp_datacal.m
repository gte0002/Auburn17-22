clear
% close all
data = xlsread('single_cdf.xls');
locs=find(data(1,:)==1);
data=data(:,locs);
[m,~]=size(data);
data=abs(data(2:m,:));
data(isnan(data)) = [];
[m,n]=size(data);
data=(data);
 data(data>=2.5)=[];
[f,xx] = ecdf(data./2.5);
plot(xx,f)
hold on


% figure
% hitrate1_5=[98.8,97.3,94.4,89.7,83.4];
% hitrate_samplerate=[70.2,76.7,84.3,89.7,88.9,91.1];
% windowsize_hitrate=[30.9,37.4,70.2,86.5,88.6,89.5,89.1]+rand(1,7);
% los_nlos=[97.3,97.8;94.4,92.8;89.7,84.5;83.4,76.6];
% x=[1,2,3,4,5];
% %x=[15,20,25,30,35,40,45];
% bar(x,hitrate1_5)
