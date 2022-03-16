A = xlsread('3800fa14');
average = mean(A);
sigma = std(A);

%one sided
%H0: X>=1450
%H1: X<1450
%n>30, use z
z = (average-1450)/(sigma/sqrt(50));
%Pr(Z>Zc)=0.94 => 1-phi(Zc)=0.94 => Q(Zc)=0.94
%Q(-Zc) = 0.06 => -Zc=1.55 = Zc=-1.55
%Z<Zc , Therefore reject H0

%one sided
%H0: X>=1450
%H1: X<1450
%n<30, use t
survey = [500;600;1000;1400;2000];
averagesurvey = mean(survey);
z2 = (averagesurvey-1450)/(sigma/sqrt(5));
%Pr(Z>Zc)=0.94 => 1-phi(Zc)=0.94 => Q(Zc)=0.94
%Q(-Zc) = 0.06 => -Zc=1.55 = Zc=-1.55
%Z>Zc , Therefore accept H0


