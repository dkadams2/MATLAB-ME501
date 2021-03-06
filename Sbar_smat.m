%Function to compute Sbar using the S matrix
function [Sbar] = Sbar_smat(E1, E2, E3, v23, v13, v12, G23, G13, G12, theta)
%Calculate the S matrix to use
Smat = S_mat(E1, E2, E3, v23, v13, v12, G23, G13, G12);

S11 = Smat(1,1); 
S12 = Smat(1,2);
S22 = Smat(2,2);
S66 = Smat(6,6);

s = sin(theta*pi/180);
c = cos(theta*pi/180);

Sbar11 = S11*c^4+(2*S12+S66)*s^2*c^2+S22*s^4;
Sbar12 = (S11+S22-S66)*s^2*c^2+S12*(s^4+c^4);
Sbar16 = (2*S11-2*S12-S66)*s*c^3-(2*S22-2*S12-S66)*s^3*c;
Sbar22 = S11*s^4+(2*S12+S66)*s^2*c^2+S22*c^4;
Sbar26 = (2*S11-2*S12-S66)*s^3*c-(2*S22-2*S12-S66)*s*c^3;
Sbar66 = 2*(2*S11+2*S22-4*S12-S66)*s^2*c^2+S66*(s^4+c^4);

Sbar = [Sbar11, Sbar12, Sbar16; Sbar12, Sbar22, Sbar26; Sbar16, Sbar26, Sbar66];
end