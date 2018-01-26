%Derrik Adams
%1/31/18
%Composite Homework
clear all
%% C1
%Define given properties in GPa for moduli
Em = 4.62; Ef1 = 233; Ef2 = 23.1; Gf12 = 8.96; Gf23 = 8.27;
Num = .36; Nuf12 = .2; Nuf23 = .4; Vf = .6; Vm = 1-Vf;
Gm = Em/(2*(1+Num));
%Calculate the requested values using RoM
E1 = Ef1*Vf+Em*Vm;
Nu12 = Num*Vm+Nuf12*Vf;
E2 = (Ef2*Em)/(Vm*Ef2+Vf*Em);
G12 = (Gf12*Gm)/(Vm*Gf12+Vf*Gm);

%% C2
%Using the same values as C1, plot them with varying Vf
Vf = 0:.1:1;
for i=1:length(Vf)
    Vm = 1-Vf(i);
    E1_plot(i) = Ef1*Vf(i)+Em*Vm;
    Nu12_plot(i) = Num*Vm+Nuf12*Vf(i);
    E2_plot(i) = (Ef2*Em)/(Vm*Ef2+Vf(i)*Em);
    G12_plot(i) = (Gf12*Gm)/(Vm*Gf12+Vf(i)*Gm);
end
figure(1);subplot(4,1,1);plot(Vf,E1_plot);subplot(4,1,2);plot(Vf,Nu12_plot);
subplot(4,1,3);plot(Vf,E2_plot);subplot(4,1,4);plot(Vf,G12_plot);

%% C3
%Define properties for this problem in Pa
E1_3 = 155e9; E2_3 = 12.1e9; G23_3 = 3.2e9; G12_3 = 4.4e9;
Nu23_3 = .458; Nu12_3 = .248; G13_3 = G12_3; Nu13_3 = Nu12_3; E3_3 = E2_3;
sigma2_3 = 100e3/(60e-3*60e-3); %stress = f/a, in Pa
%Define the Stress Matrix resulting from the applied load
StressMat_3 = [0;sigma2_3;0;0;0;0];
%Call function to compute the compliance matrix(S)
S_3 = S_mat(E1_3, E2_3, E3_3, Nu23_3, Nu13_3, Nu12_3, G23_3, G13_3, G12_3);
StrainMat_3 = S_3*StressMat_3;
%Using Strain Matrix, calculate the changes in the x,y,z directions
deltaX_3 = 60*StrainMat_3(1); Xf = 60+deltaX_3;
deltaY_3 = 60*StrainMat_3(2); Yf = 60+deltaY_3;
deltaZ_3 = 60*StrainMat_3(3); Zf = 60+deltaZ_3;

%% C4
%Try using the same approach but with aluminum, which is isotropic
StressMat_4 = StressMat_3;
E1_4 = 72.4e9; E2_4 = E1_4; E3_4 = E1_4;
Nu23_4 = .3; Nu13_4 = Nu23_4;  Nu12_4 = Nu23_4;
G23_4 = E1_4/(2*(1+Nu23_4)); G13_4 = G23_4; G12_4 = G23_4;
%Calculate the compliance matrix(S)
S_4 = S_mat(E1_4, E2_4, E3_4, Nu23_4, Nu13_4, Nu12_4, G23_4, G13_4, G12_4);
StrainMat_4 = S_4*StressMat_4;
%Using Strain Matrix, calculate the changes in the x,y,z directions
deltaX_4 = 60*StrainMat_4(1); Xf = 60+deltaX_4;
deltaY_4 = 60*StrainMat_4(2); Yf = 60+deltaY_4;
deltaZ_4 = 60*StrainMat_4(3); Zf = 60+deltaZ_4;

%% C5

