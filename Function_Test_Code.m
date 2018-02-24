 clear all
 z_plot=[-.0006, -.00045, -.00045, -.0003, -.0003, -.00015, -.00015, 0, 0, .00015, .00015, .0003, .0003, .00045, .00045, .0006];
 z = [-.0003, -.00015, 0, .00015, .0003];
 theta = [0, 90,90,0];
 numplies = 4;
 eps_xo = 0;
 eps_yo = 0;
 gamm_xyo = 0;
 kxo = 3.33;
 kyo = 3.33;
 kxyo = 0;
 E1 = 155e9;
 E2 = 12.1e9;
 v12 = .248;
 v21 = E2*v12/E1;
 G12 = 4.4e9;
 
 ABD = buildABD_mat(E1, E2, v12, v21, G12, z, theta, numplies);
 stress = [50400;1809;0;0;0;0];
 strain = inv(ABD)*stress
 
 [Allstress,Allstrain,PrincipalStress,PrincipalStrain] = allstress(E1, E2, v12, v21, G12, theta, eps_xo, eps_yo, gamm_xyo, kxo,kyo, kxyo, z, numplies);
 figure(1)
 composite_stress_plot(z_plot,Allstress)
 figure(2)
 composite_stress_plot(z_plot,Allstrain)
 figure(3)
 composite_stress_plot(z_plot,PrincipalStress)
 figure(4)
 composite_stress_plot(z_plot,PrincipalStrain)
 

