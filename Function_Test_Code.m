% s = [1,2,3; 2,4,5; 3,5,6];
% T = Trans_mat(30)
% TS = T*s*T'

% z=[-.45, -.3, -.3, -.15, -.15, 0, 0, .15, .15, .3, .3, .45];
% Allstress = [206, 206, 206, 206, 346, 346, 346, 346, 206,206,206, 206; 
%             66.8, 66.8, 66.8, 66.8, 6.7, 6.7, 6.7, 6.7, 66.8,66.8,66.8, 66.8;
%             103.8, 103.8, -103.8, -103.8, 0, 0, 0, 0 -103.8,-103.8, 103.8 103.8];
% composite_stress_plot(z,Allstress)
clear all
 z_plot=[-.3, -.15, -.15, 0, 0, .15, .15, .3];
 z = [-.3, -.15, 0, .15, .3];
 theta = [0,90,90,0];
 numplies = 4;
 eps_xo = 0;
 eps_yo = 0;
 gamm_xyo = 0;
 kxo = 3.33;
 kyo = 0;
 kxyo = 0;
 E1 = 155e9;
 E2 = 12.1e9;
 v12 = .248;
 v21 = E2*v12/E1;
 G12 = 4.4e9;
 
 Allstress = allstress(E1, E2, v12, v21, G12, theta, eps_xo, eps_yo, gamm_xyo, kxo,kyo, kxyo, z, numplies);
 composite_stress_plot(z_plot,Allstress)
 
 T1 = Principal_Trans_mat(0);
 T2 = Principal_Trans_mat(90);
 Principal_1 = T1*Allstress(:,1);
 Principal_2 = T1*Allstress(:,2);
 Principal_3 = T2*Allstress(:,3);
 Principal_4 = T2*Allstress(:,4);
 Principal_5 = T2*Allstress(:,5);
 Principal_6 = T2*Allstress(:,6);
 Principal_7 = T1*Allstress(:,7);
 Principal_8 = T1*Allstress(:,8);
 
 pstress = [Principal_1,Principal_2,Principal_3,Principal_4,Principal_5,Principal_6,Principal_7,Principal_8];
 composite_stress_plot(z_plot,pstress);
