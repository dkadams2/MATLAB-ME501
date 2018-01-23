%Function to compute the 6x6 Compliance (S) matrix
function [S] = S_mat(E1, E2, E3, v23, v13, v12, G23, G13, G12)

%Compute unknown variables
v21 = E2*v12/E1; 
v31 = E3*v13/E1;
v32 = E3*v23/E2;

%Compute S matrix values
S11 = 1/E1;
S12 = -v12/E1;
S13 = -v13/E1;
S22 = 1/E2;
S23 = -v23/E2;
S33 = 1/E3;
S44 = 1/G23;
S55 = 1/G13;
S66 = 1/G12;

%Create the S matrix
S = [S11, S12, S13,  0,     0,   0;
     S12, S22, S23,  0,     0,   0;
     S13, S23, S33,  0,     0,   0;
     0,    0,    0, S44,    0,   0;
     0,    0,    0,   0,  S55,   0;
     0,    0,    0,   0,    0,  S66];
end
