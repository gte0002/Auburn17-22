function a=errorfil(b,c)
squa=sum(abs((b-mean(b))))/length(b);
ff=b;
for i=1:1:(length(b))
    if abs(b(i)-mean(b))>squa;
         ff(1,i)=mean(b);
        
    else
       ff(i)=b(i);
    end
end
a=ff;
end