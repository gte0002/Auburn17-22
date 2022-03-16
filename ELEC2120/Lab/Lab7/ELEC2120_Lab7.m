% Laplace Lab MATLAB
% This MATLAB exercise should help the student understand the tools that
% MATLAB provides for analysis using Laplace transforms.
% Fill in the sections that are labeled To-Do
clc
clear
close all
% Define R and C Constants from Figure 2 in Lab Manual
C1 = 250e-12;
C2 = 22e-9;
C3 = 22e-9;

R1 = 100e3;
R2 = 125e3;
R3 = 125e3;
R4 = 125e3;
R5 = 125e3;
R6 = 125e3;

% Initiate Symbolic Variable s (this is the laplace transform s)
syms s
%% Section 1
%-------------------------------------------------------------------------%
%                           To - Do                                       %
%-------------------------------------------------------------------------%
% Derive the mesh analysis matrix for the circuit after transformed into
% the Laplace domain (i.e. C -> 1/(sC)). You should end up with a matrix
% equation V = A*I where V is 3x1, I is 3x1 and A is 3x3. Declare A and V
% below and then solve for I (I = inv(A)*V). It will make your life easier
% if you keep all R and C values as the variables (don't plug in numbers).
% That way you can type in the equation using the variables defined above.
V = [0; 0; 1];
A = [R1+R2+R3+(1/(s*C1))+(1/(s*C2)) -(1/(s*C2)) -(R1); ...
    -(1/(s*C2)) (1/(s*C2))+(1/(s*C3))+R4+R5 -(1/(s*C3)); ...
    -R1 -(1/(s*C3)) R1+R6+(1/(s*C3))];
I = inv(A)*V;

%-------------------------------------------------------------------------%
%% Section 2

% looking at figure 2, the output voltage can be written as follows:
% if you define your currents differently, this will need to be changed.
V_out = simplify(I(1)*(R3) + I(2)*(R4+R5) + I(3)*(R6));

% Explain how this equation was derived.

%-------------------------------------------------------------------------%
%                           To - Do                                       %
%-------------------------------------------------------------------------%
% We now have an expression for V_out, but it's extremely messy and
% unsimplified (It should show up in your command window). We will now try
% to extract just the numerator and denominator. Simplify V_out using the
% simplify() function, then use the numden() function to get a variable N
% that contains just the numerator and a variable D that contains the
% denominator.
simplify(V_out);
[N,D] = numden(V_out);
%-------------------------------------------------------------------------%

%% Section 3
clc
% Now we have variables N and D. Let's look at them in the command window
N
D

% As you can see, they are still fairly messy. Lets try just printing 4 sig
% figs
disp(vpa(N,4))
disp(vpa(D,4))
% Now, we're getting somewhere. You might notice that the coefficients are
% extremely large ~1e+94. This could be solved by multipling the bottom and
% top by the same number. We'll do that shortly

%% Section 4
clc
% Okay, the symbolic toolbox was helpful, but in order to do more advanced
% modelling, we need to convert this polynomial into an array. Read the 
% following MATLAB documentation to understand what we're doing here.

%doc sym2poly
%-------------------------------------------------------------------------%
%                           To - Do                                       %
%-------------------------------------------------------------------------%
% use the sym2poly() function to convert the symbolic variables N and D
% into polynomial coefficent arrays (Np and Dp)
Np = sym2poly(N);
Dp = sym2poly(D);
%-------------------------------------------------------------------------%

%% Section 5
% We're going to simplify this expression by dividing both Np and Dp by the
% same number (in this case the max of the two). This is called normalizing.
disp('Old Polynomial Coefficients: ')
disp(Np)
disp(Dp)

%find maximum value
k = max([Np,Dp]);
Np = Np/k;
Dp = Dp/k;

disp('New Polynomial Coefficients: ')
disp(Np)
disp(Dp)

% Comment on the value of Np(1). Why does it show up as zero. Try typing
% Np(1) into the command window and see what happens.

%% Section 6
% We're now ready to use the tf() command. Take a minute to read about its 
% functionality with command below. Be sure you have the Control Systems 
% Toolbox installed for this to work properly.

% doc tf
%-------------------------------------------------------------------------%
%                           To - Do                                       %
%-------------------------------------------------------------------------%
% Create a transfer function H using Np and Dp
H = tf(Np,Dp);
%-------------------------------------------------------------------------%
% You can now plot different responses for the transfer funcion H.
% In your report include a bode plot (bode(H)), step function (step(H)),
% and pole zero plot (pzmap(H)). You can place the code needed to generate
% these figure below. 
figure(1);
bode(H);
figure(2);
step(H);
figure(3);
pzmap(H);
% Comment on the shape of the bode plot and explain what you think it means

%-------------------------------------------------------------------------%
%                           To - Do                                       %
%-------------------------------------------------------------------------%

%-------------------------------------------------------------------------%
