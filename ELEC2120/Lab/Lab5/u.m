function y = u(t,to)
%u    Unit Step Function
%y = u(t,to) implements the unit step function, u(t-to).
    %u(t) is 0 for t<to and 1 for t>= to
y = t >= to;
end