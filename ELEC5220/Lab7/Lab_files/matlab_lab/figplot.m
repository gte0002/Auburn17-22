clear
close all
num = xlsread('exldata.xls');
a=mean(abs(num((16:19),6)));
b=mean(abs(num((51:53),6)));
c=mean(abs(num((48:50),6)));
d=mean(abs(num((3:9),6)));

mm=[0.213	0.289	0.26	0.17	0.4967	0.2115	0.252	0.32
];
bar(mm);
title '0,45,90,135,180,225,270,315'

