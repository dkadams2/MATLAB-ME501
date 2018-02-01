%Function to build the ABD matrix
function [ABD_mat] = buildABD_mat(E1, E2, v12, v21, G12, z, ply_angles, num_plies)

%loop to get the Qbar matrices for each ply
for i=1:num_plies
theta = ply_angles(i);
Qbar(:,:,i) = Qbar_mat(E1, E2, v12, v21, G12, theta);
end

%Initialize A as zero, then use for loop to calculate the A portion of the
%ABBD matrix
A = 0;
for i = 1:num_plies
   A = Qbar(:,:,i)*((z(i+1)-(z(i))))+ A ;
end

%Initialize B as zero, then use for loop to calculate the B portion of the
%ABBD matrix
B = 0;
for i = 1:num_plies
   B = Qbar(:,:,i)*(((z(i+1))^2-((z(i)))^2))+ B ;
end

B = .5*B;

%Initialize  as zero, then use for loop to calculate the D portion of the
%ABBD matrix
D = 0;
for i = 1:num_plies
   D = Qbar(:,:,i)*(((z(i+1))^3-((z(i)))^3))+ D ;
end
D = (1/3)*D;

ABD_mat = [A, B; B, D];
end
