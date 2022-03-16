%% Exercise 1
H = tf([1 3],[1 4 3]);
[p,z] = pzmap(H);
figure(1);
pzmap(H);
figure(2);
impulse(H);
%% Exercise 2
H = tf([1 -7 12],[1 3 1 -5]);
[p,z] = pzmap(H);
figure(1);
pzmap(H);
figure(2);
impulse(H);
%% Exercise 3
H = tf([1 -10 21],[1 5 9 5 0]);
[p,z] = pzmap(H);
figure(1);
pzmap(H);
figure(2);
impulse(H);
%% Exercise 4 - stable
H = tf([1 1 1 1],[1 1 1 0]);
[p,z] = pzmap(H);
figure(1);
pzmap(H);
figure(2);
impulse(H);
%% Exercise 5 - asymptotically
H = tf([1 1 1 1],[1 1 1 1]);
[p,z] = pzmap(H);
figure(1);
pzmap(H);
figure(2);
impulse(H);
%% Exercise 6 - unstable
H = tf([1 1 1 1],[1 1 1 -1]);
[p,z] = pzmap(H);
figure(1);
pzmap(H);
figure(2);
impulse(H);
%% Exercise 8
R = 40;
L = 0.003;
C = 0.000005
H = tf([1/(L*C)],[1 R/L 1/(L*C)]);
figure(1);
impulse(H);
figure(2);
step(H);

% Exercise 9
[p,z] = pzmap(H);
figure(3);
pzmap(H);

%% Exercise 10
R = 1;
L = 0.003;
C = 0.000005
H = tf([1/(L*C)],[1 R/L 1/(L*C)]);
figure(1);
impulse(H);
R = 2;
L = 0.003;
C = 0.000005
H = tf([1/(L*C)],[1 R/L 1/(L*C)]);
figure(2);
impulse(H);
R = 3;
L = 0.003;
C = 0.000005
H = tf([1/(L*C)],[1 R/L 1/(L*C)]);
figure(3);
impulse(H);
R = 10;
L = 0.003;
C = 0.000005
H = tf([1/(L*C)],[1 R/L 1/(L*C)]);
figure(4);
impulse(H);

%% Exercise 11
H = tf([1 -7 12],[1 1 0 -2]);
[p,z] = pzmap(H);
figure(1);
pzmap(H);

%% Exercise 13
H = tf([1 -7 12],[1 2 2]);
[p,z] = pzmap(H);
figure(1);
pzmap(H);
figure(2);
impulse(H);