%Derrik Adams
%Homework 4 - Composites 7-10
%2/7/18
clear all

%% C7 - Compute ABD matrix for Example 2
%Create properties for graphite-reinforced composite
E1 = 155e9; E2 = 12.1e9; E3 = E2;
v23 = .458; v12 = .248; v21 = E2*v12/E1;
G12 = 4.4e9; G13 = G12; G23 = 3.2e9;

num_plies = 6;
ply_angles_7 = [30, -30, 0, 0, -30, 30];
z_7 = [-.45, -.3, -.15, 0, .15, .3, .45]; %in mm

%Call function to create ABD matrix (Pa-mm)
ABD_mat_7 = buildABD_mat(E1, E2, v12, v21, G12, z_7, ply_angles_7, num_plies)

%% C8 - Compute ABD matrix for Example 3
num_plies = 6;
ply_angles_8 = [30, -30, 0, 30, -30, 0];
z_8 = [-.45, -.3, -.15, 0, .15, .3, .45]; %in mm

%Call function to create ABD matrix (Pa-mm)
ABD_mat_8 = buildABD_mat(E1, E2, v12, v21, G12, z_8, ply_angles_8, num_plies)

%% C9 -  Calculate strains in Example 4
Stress_Res = [0; 0; 0; 12.84; 3.92; 2.8]; %Nm/m
num_plies = 6;
ply_angles_9 = [30, -30, 0, 0, -30, 30];
z_9 = [-.45, -.3, -.15, 0, .15, .3, .45]; %in mm

%Call function to create ABD matrix
ABD_mat_9 = buildABD_mat(E1, E2, v12, v21, G12, z_9, ply_angles_9, num_plies);

%Multiply given resultant stress vector by the inverse of the ABD to get
%strains
Strain_vec = inv(ABD_mat_9)*Stress_Res


