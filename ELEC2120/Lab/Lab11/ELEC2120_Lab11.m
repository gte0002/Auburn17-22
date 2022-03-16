%% Use MATLAB to plot Table 1
x = [0,30,60,90,120,150,180,210,240,270,300,330,360];
y = [2.0,1.711,1.147,0.1648,1.129,1.729,2.162,1.729,1.147,0.1665,...
    1.112,1.711,2.118];
plot(x,y);
title('Output (Amplitude) vs Phase (degrees)');
xlabel('Phase (degrees)');
ylabel('Output (Amplitude)');
grid on
