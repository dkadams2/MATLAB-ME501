 clear all
 z_plot=[-.00045, -.0003, -.0003, -.00015, -.00015, 0, 0, .00015, .00015, .0003, .0003, .00045];
 z = [-.00045, -.0003, -.00015, 0, .00015, .0003, .00045];
 theta = [30,-30, 0, 0, -30, 30];
 numplies = 6;
 eps_xo = .000001;
 eps_yo = 0;
 gamm_xyo = 0;
 kxo = 0;
 kyo = 0;
 kxyo = 0;
 E1 = 155e9;
 E2 = 12.1e9;
 v12 = .248;
 v21 = E2*v12/E1;
 G12 = 4.4e9;
 
 [Allstress,Allstrain,PrincipalStress,PrincipalStrain] = allstress(E1, E2, v12, v21, G12, theta, eps_xo, eps_yo, gamm_xyo, kxo,kyo, kxyo, z, numplies);
 figure(1)
 composite_stress_plot(z_plot,Allstress)
 figure(2)
 composite_stress_plot(z_plot,Allstrain)
 figure(3)
 composite_stress_plot(z_plot,PrincipalStress)
 figure(4)
 composite_stress_plot(z_plot,PrincipalStrain)
%  

