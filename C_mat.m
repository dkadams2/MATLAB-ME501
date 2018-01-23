%Function used to create the Stiffness (C) matrix
function [C] = C_mat(E1, E2, E3, v23, v13, v12, G23, G13, G12)

%Call the function to get the Compliance (S) matrix
S = S_mat(E1, E2, E3, v23, v13, v12, G23, G13, G12);

%Calculate the S constant value to be used for C values
S_const = -S(1,1)*S(2,2)*S(3,3)+S(1,1)*S(2,3)*S(2,3)+...
          S(2,2)*S(1,3)*S(1,3)-S(3,3)*S(1,2)*S(1,2)-...
          2*S(1,2)*S(2,3)*S(1,3);

%Create the C matrix values
C11 = (S(2,2)*S(3,3)-S(2,3)*S(2,3))/S_const;
C12 = (S(1,3)*S(2,3)-S(1,2)*S(3,3))/S_const;
C13 = (S(1,2)*S(2,3)-S(1,3)*S(2,2))/S_const;
C22 = (S(3,3)*S(1,1)-S(1,3)*S(1,3))/S_const;
C23 = (S(1,2)*S(1,3)-S(2,3)*S(1,1))/S_const;
C33 = (S(1,1)*S(2,2)-S(1,2)*S(1,2))/S_const;
C44 = 1/S(4,4);
C55 = 1/S(5,5);
C66 = 1/S(6,6);

%Create the C matrix
C = [C11, C12, C13,  0,     0,   0;
     C12, C22, C23,  0,     0,   0;
     C13, C23, C33,  0,     0,   0;
     0,    0,    0, C44,    0,   0;
     0,    0,    0,   0,  C55,   0;
     0,    0,    0,   0,    0,  C66];