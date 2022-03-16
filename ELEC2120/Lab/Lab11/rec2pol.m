function x = rec2pol(z)
    r = abs(z)
    theta = atan2(imag(z),real(z));
    theta = theta*(180/pi);
    x = [r, theta];
    fprintf('%f /_ %f(degrees)',r,theta);
end