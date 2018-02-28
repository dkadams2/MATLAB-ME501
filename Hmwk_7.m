%Hmwk 7 - Chapter 6
%Derrik Adams
%2/28/18
clear all
%% 6-36
%Define variables
T = 100; %N*m
J = 1.789e-7; %m^4
Gtheta = T/J;
h = .0125; %m
b = .025; %m

%x and y will change depending on the point being evaluated. 
x = h/2; %A = h; B = h/2; C = 0
y = b/2; %A = 0; B = b/2; C = b

%Create the for loop for the summation
SigmaXZsum = 0;
SigmaYZsum = 0;

for n=1:2:5
    SigmaXZsum = SigmaXZsum + ((-1)^((n-1)/2)*cos(n*pi*x/(2*h))*sinh(n*pi*y/(2*h)))/(n^2*cosh(n*pi*b/(2*h)));
    SigmaYZsum = SigmaYZsum + ((-1)^((n-1)/2)*sin(n*pi*x/(2*h))*cosh(n*pi*y/(2*h)))/(n^2*cosh(n*pi*b/(2*h)));
end

SigmaXZ = (-16*Gtheta*h/(pi^2))*SigmaXZsum; %Pa
SigmaYZ = 2*Gtheta*x-(16*Gtheta*h/(pi^2))*SigmaYZsum; %Pa
