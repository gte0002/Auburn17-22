function z = pol2rec(x)
    r = x(1,1);
    theta = x(1,2);
    theta = theta*(pi/180);
    z = r*exp(j*theta);
    fprintf('%f + %fj',real(z),imag(z));
end