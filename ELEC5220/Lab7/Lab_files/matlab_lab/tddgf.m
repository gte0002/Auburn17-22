clear

h_line=get(gca,'Children');%get line handles
xdata=get(h_line,'Xdata');
ydata=get(h_line,'Ydata');
zdata=get(h_line,'Zdata');
s=cell2mat(zdata);
s=s';
figure
plot(s(:,4))
hold on
plot(s(:,6))