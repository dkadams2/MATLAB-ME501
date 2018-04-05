%ME 501 - HMWK Chapter 17
%Derrik Adams
%4/11/18

% General Formulas for A and B
% A = .25*(1/R1+1/R2+1/R1_prime+1/R2_prime)-.25*sqrt(((1/R1-1/R1_prime)+(1/R2-1/R2_prime))^2-4*(1/R1-1/R1_prime)*(1/R2-1/R2_prime)*(sin(alpha))^2);
% B = .25*(1/R1+1/R2+1/R1_prime+1/R2_prime)+.25*sqrt(((1/R1-1/R1_prime)+(1/R2-1/R2_prime))^2-4*(1/R1-1/R1_prime)*(1/R2-1/R2_prime)*(sin(alpha))^2);
%% 17.1
%Define values for this problem
R1_prime = .33; %m
R2 = .44; %m
alpha = 0;
P = 110e3; %N
E = 200e9; %Pa
v = .29; 

% R1 = infinity;
% R2_prime = infinity;

%Calculate the A and B values
A = .25*(1/R2+1/R1_prime)-.25*sqrt(((-1/R1_prime)+(1/R2))^2-4*(-1/R1_prime)*(1/R2)*(sin(alpha))^2);
B = .25*(1/R2+1/R1_prime)+.25*sqrt(((-1/R1_prime)+(1/R2))^2-4*(-1/R1_prime)*(1/R2)*(sin(alpha))^2);

BoverA = B/A;
Csig = .7; Ctau = .21; Cg = .205; Cb = .81;
delta = (1/(A+B))*((1-v^2)/E+(1-v^2)/E);
b = Cb*(P*delta)^(1/3);

sigma_max = -Csig*(b/delta);
tau_max = Ctau*(b/delta);
tau_oct = Cg*(b/delta);

%% 17.11
R1 = .025;
R1_prime = .025;
E1 = 200e9; v1 = .29;
E2 = 72e9; v2 = .33;
Y = 450e6;
%Calculate A and B
A = .25*(1/R1+1/R1_prime)-.25*sqrt(((1/R1-1/R1_prime))^2-4*(1/R1-1/R1_prime)*(0)*(sin(alpha))^2);
B = .25*(1/R1+1/R1_prime)+.25*sqrt(((1/R1-1/R1_prime))^2-4*(1/R1-1/R1_prime)*(0)*(sin(alpha))^2);

Cg = .198; Cb = .9;
delta = (1/(A+B))*((1-v1^2)/E1+(1-v2^2)/E2); 
Py = (1/delta)*((sqrt(2)*Y*delta)/(3*Cg*Cb))^3 ;
