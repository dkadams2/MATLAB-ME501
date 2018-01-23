%Hmwk 1
%Derrik Adams
%1/19/18
clear all
%% 2.4
stress4 = [-100, 0,  -80; 0, 20,   0; -80,  0,  20];    
[directions4, ps4] = eig(stress4);
%a)
%from ps4
ps4
sigma1 = 60
sigma2 = 20
sigma3 = -140
%b)
oct_shear = 1/3*(((sigma1-sigma2)^2)+((sigma1-sigma3)^2)+((sigma2-sigma3)^2))^.5
%c)
tau_max = (sigma1-sigma3)/2
%d)
%% 2.6
%a)
stress6 = [4, 1,  2; 1, 6,  0; 2,  0, 8];
I1_6a = stress6(1,1)+stress6(2,2)+stress6(3,3) %Trace of stress
I2_6a = stress6(1,1)*stress6(2,2)+stress6(1,1)*stress6(3,3)+stress6(2,2)*stress6(3,3)...
    -stress6(1,2)^2-stress6(1,3)^2-stress6(2,3)^2
I3_6a = det(stress6)
%b)
%Rotate the stress matrix 
theta6 = 45 * pi/180;
rot_mat6 = [cos(theta6), sin(theta6), 0; -sin(theta6), cos(theta6), 0; 0, 0, 1];
rot_stress6 = rot_mat6*stress6*rot_mat6'
%c)
I1_6c = rot_stress6(1,1)+rot_stress6(2,2)+rot_stress6(3,3) %Trace of stress
I2_6c = rot_stress6(1,1)*rot_stress6(2,2)+rot_stress6(1,1)*rot_stress6(3,3)+rot_stress6(2,2)*rot_stress6(3,3)...
       -rot_stress6(1,2)^2-rot_stress6(1,3)^2-rot_stress6(2,3)^2
I3_6c = det(rot_stress6)
%% 2.17
stress17 = [90, 40, 0; 40, -10, 0; 0,  0,   0];
theta17 = pi/6;
rot_mat17 = [cos(theta17), sin(theta17), 0; -sin(theta17), cos(theta17), 0; 0, 0, 1];
rot_stress17 = rot_mat17'*stress17*rot_mat17;
sigmaxx = rot_stress17(1,1)
sigmayy = rot_stress17(2,2)
tauxy = rot_stress17(1,2)
