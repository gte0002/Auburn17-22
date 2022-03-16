function y = r(t,to)
% Unit Ramp Function
    %y = r(t,to) implements the unit ramp function r(t - to)
    %returns unit ramp function r = (t,to)
y = (t-to).*(t>=to);
end
