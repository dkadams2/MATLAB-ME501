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
E1 = Ef1*Vf+Em*Vm
Nu12 = Num*Vm+Nuf12*Vf
E2 = (Ef2*Em)/(Vm*Ef2+Vf*Em)
G12 = (Gf12*Gm)/(Vm*Gf12+Vf*Gm)

%% C2
%Using the same values as C1, plot them with varying Vf
Vf = 0:.1:1;
for i=1:length(Vf)
    Vm = 1-Vf(i);
    E1_plot(i)=Ef1*Vf(i)+Em*Vm; Nu12_plot(i)=Num*Vm+Nuf12*Vf(i);
    E2_plot(i)=(Ef2*Em)/(Vm*Ef2+Vf(i)*Em); G12_plot(i)=(Gf12*Gm)/(Vm*Gf12+Vf(i)*Gm);
end
figure(1)
subplot(4,1,1);plot(Vf,E1_plot);xlabel('Fiber Volume Fraction'); ylabel('E1');
subplot(4,1,2);plot(Vf,Nu12_plot);xlabel('Fiber Volume Fraction'); ylabel('v12');
subplot(4,1,3);plot(Vf,E2_plot);xlabel('Fiber Volume Fraction'); ylabel('E2');
subplot(4,1,4);plot(Vf,G12_plot);xlabel('Fiber Volume Fraction'); ylabel('G12');

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
deltaX_3 = 60*StrainMat_3(1) %Xf = 60+deltaX_3;
deltaY_3 = 60*StrainMat_3(2) %Yf = 60+deltaY_3;
deltaZ_3 = 60*StrainMat_3(3) %Zf = 60+deltaZ_3;

%% C4
%Use the same approach but with aluminum, which is isotropic
StressMat_4 = StressMat_3;
E1_4 = 72.4e9; E2_4 = E1_4; E3_4 = E1_4;
Nu23_4 = .3; Nu13_4 = Nu23_4;  Nu12_4 = Nu23_4;
G23_4 = E1_4/(2*(1+Nu23_4)); G13_4 = G23_4; G12_4 = G23_4;

%Calculate the compliance matrix(S)
S_4 = S_mat(E1_4, E2_4, E3_4, Nu23_4, Nu13_4, Nu12_4, G23_4, G13_4, G12_4);
StrainMat_4 = S_4*StressMat_4;

%Using Strain Matrix, calculate the changes in the x,y,z directions
deltaX_4 = 60*StrainMat_4(1) %Xf = 60+deltaX_4;
deltaY_4 = 60*StrainMat_4(2) %Yf = 60+deltaY_4;
deltaZ_4 = 60*StrainMat_4(3) %Zf = 60+deltaZ_4;

%% C5
%Properties
E1_5 = 155e9; E2_5 = 12.1e9; G23_5 = 3.2e9; G12_5 = 4.4e9;
Nu23_5 = .458; Nu12_5 = .248; G13_5 = G12_5; Nu13_5 = Nu12_5; E3_5 = E2_5;
length = .2; width = .1; thick = .0002; F = 4000;
sigma1_5 = F/(width*thick); %N/m^2
StressMat_5 = [sigma1_5; 0; 0; 0; 0; 0];

%Call function to create S matrix for this problem
S_5 = S_mat(E1_5, E2_5, E3_5, Nu23_5, Nu13_5, Nu12_5, G23_5, G13_5, G12_5);

%Calculate Strain Mat and get epsilon3 from it
StrainMat_5 = S_5*StressMat_5;
epsilon3_5 = StrainMat_5(3)

%% C6
%Define properties for this problem in Pa
E1_6 = 155e9; E2_6 = 12.1e6; G23_6 = 3.2e9; G12_6 = 4.4e9;
Nu23_6 = .458; Nu12_6 = .248; G13_6 = G12_6; Nu13_6 = Nu12_6; E3_6 = E2_6;
thick = .0005; eps_xo = 400e-6; eps_yo = 0; gamm_xyo = 0; kxo = 0; kyo = 0; kxyo = 0;
epso_mat = [eps_xo; eps_yo; gamm_xyo]; z = [-2*thick, -thick,0,thick, 2*thick];
Nu21_6 = E2_6*Nu12_6/E1_6;

%(a) Solve for strain components at interface locations (three interface
%locations)
for i = 1:(3)
eps_x(i) = eps_xo+z(i+1)*kxo; 
eps_y(i) = eps_yo+z(i+1)*kyo; 
gamm_xy(i) = gamm_xyo+z(i+1)*kxyo; 
end
%Strain vector for each interface
StrainVec_interface1 = [eps_x(1); eps_y(1); gamm_xy(1)]
StrainVec_interface2 = [eps_x(2); eps_y(2); gamm_xy(2)]
StrainVec_interface3 = [eps_x(3); eps_y(3); gamm_xy(3)]

%(b) Solve for the stress in each layer and plot
%Solve for Qbar matrices
Qbar_0 = Qbar_mat(E1_6, E2_6, Nu12_6, Nu21_6, G12_6, 0);
Qbar_90 = Qbar_mat(E1_6, E2_6, Nu12_6, Nu21_6, G12_6, 90);

%Solve for the stresses in lamina 1 (0deg)
z = [-.001, -.0005];
for i = 1:2
    strain1 = [eps_xo+z(i)*kxo; eps_yo+z(i)*kyo; gamm_xyo+z(i)*kxyo];
    StrainValues1(:,i) = strain1;
    StressValues1(:,i) = Qbar_0*strain1;
end

%Solve for the stresses in lamina 2 (90deg)
z = [-.0005, 0];
for i = 1:2
    strain2 = [eps_xo+z(i)*kxo; eps_yo+z(i)*kyo; gamm_xyo+z(i)*kxyo];
    StrainValues2(:,i) = strain2;
    StressValues2(:,i) = Qbar_90*strain2;
end

%Solve for the stresses in lamina 3 (90deg)
z = [0, .0005];
for i = 1:2
    strain3 = [eps_xo+z(i)*kxo; eps_yo+z(i)*kyo; gamm_xyo+z(i)*kxyo];
    StrainValues3(:,i) = strain3;
    StressValues3(:,i) = Qbar_90*strain3;
end

%Solve for the stresses in lamina 4 (0deg)
z = [.0005, .001];
for i = 1:2
    strain4 = [eps_xo+z(i)*kxo; eps_yo+z(i)*kyo; gamm_xyo+z(i)*kxyo];
    StrainValues4(:,i) = strain4;
    StressValues4(:,i) = Qbar_0*strain4;
end

%Plot the stress values
AllStress = [StressValues1, StressValues2, StressValues3, StressValues4];
z = [-.001, -.0005, -.0005, 0, 0, .0005, .0005, .001];

figure(2)
subplot(3,1,1); plot(AllStress(1,:), z)
xlabel('Sigma X (Pa)'); ylabel('z thickness (mm)');
xlim([min(AllStress(1,:))-.1*max(AllStress(1,:)),max(AllStress(1,:))+.1*max(AllStress(1,:))]);

subplot(3,1,2); plot(AllStress(2,:), z)
xlabel('Sigma Y (Pa)'); ylabel('z thickness (mm)');
xlim([min(AllStress(2,:))-.1*max(AllStress(2,:)),max(AllStress(2,:))+.1*max(AllStress(2,:))]);

subplot(3,1,3); plot(AllStress(3,:), z)
xlabel('Sigma Z (Pa)'); ylabel('z thickness (mm)');
xlim([min(AllStress(3,:))-.1*max(AllStress(3,:)),max(AllStress(3,:))+.1*max(AllStress(3,:))]);

%(c) Compute strains in principal system
%Define the transformation matrix
theta1 = 0*pi/180;
theta2 = 90*pi/180;
Trans_mat0= [cos(theta1)^2, sin(theta1)^2, 2*sin(theta1)*cos(theta1);
             sin(theta1)^2, cos(theta1)^2, -2*cos(theta1)*sin(theta1);
             -cos(theta1)*sin(theta1), cos(theta1)*sin(theta1), cos(theta1)^2-sin(theta1)^2];
Trans_mat90 = [cos(theta2)^2, sin(theta2)^2, 2*sin(theta2)*cos(theta2);
             sin(theta2)^2, cos(theta2)^2, -2*cos(theta2)*sin(theta2);
             -cos(theta2)*sin(theta2), cos(theta2)*sin(theta2), cos(theta2)^2-sin(theta2)^2];
%Compute the Strains
for i=1:3
strain_0deg(:,i) = Trans_mat0*[eps_x(i); eps_y(i); gamm_xy(i)/2];
strain_90deg(:,i) = Trans_mat90*[eps_x(i); eps_y(i); gamm_xy(i)/2];
end
strain_0deg
strain_90deg

%(d) Compute stresses in principal system
Stress_0deg = Trans_mat0*StressValues1(:,1);
sigma1_0 = Stress_0deg(1)
sigma2_0 = Stress_0deg(2)
tau12_0 = Stress_0deg(3)

Stress_90deg = Trans_mat90*StressValues2(:,1);
sigma1_90 = Stress_90deg(1)
sigma2_90 = Stress_90deg(2)
tau12_90 = Stress_90deg(3)


