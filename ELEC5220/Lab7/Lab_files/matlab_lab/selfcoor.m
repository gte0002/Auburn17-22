clear 
close all
load fill
fs =1;
t = (0:length(avey) - 1)/fs;

plot(t,avey)
%
% d = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2',0.17,0.19,0.33,0.35,80,1,80);
% Hd = design(d,'equiripple');
% avey= filter(Hd,avey);
%
xlabel('Time')
ylabel('phase')
axis tight
 [autocor,lags] = xcorr(avey,300,'coeff');
 figure
 plot(lags/fs,autocor)
 xlabel('Lag (100ms)')
ylabel('pha')
 axis([-300 300 -0.4 1.1])